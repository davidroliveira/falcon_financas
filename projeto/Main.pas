unit Main;

interface

uses Windows, SysUtils, uniLabel, uniButton, uniBitBtn, uniGUIClasses,
     jpeg, Classes, Controls, uniGUIBaseClasses, uniImage, uniGUIForm,
     uniScreenMask, uniGUIApplication, uniGUITypes, uniEdit,
     uniGUIAbstractClasses, pngimage, uniMultiItem, uniComboBox,
     uniGUIFrame, uniGUIVars, Menus, uniMainMenu, uADCompClient;

type
  TFormLogin = class(TUniForm)
    UniImage2: TUniImage;
    edt_senha: TUniEdit;
    bt_conectar: TUniBitBtn;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    cmb_usuario: TUniComboBox;
    procedure UniLabel4Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure bt_conectarClick(Sender: TObject);
    procedure UniLabel5Click(Sender: TObject);
    procedure edt_senhaKeyPress(Sender: TObject; var Key: Char);
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;

    chave                                                                       : String;
  public
    { Public declarations }
  end;

function FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses
  MainModule, U_Cadastro, ServerModule,
  U_Funcao_valida_senha, U_Principal, U_Esqueci_Minha_Senha,
  U_Empresa_Conectar, U_Sessao, U_Global, U_Cookies, U_JS_Humane;

function FormLogin: TFormLogin;
begin
  Result := TFormLogin(ID.GetFormInstance(TFormLogin));
end;

procedure TFormLogin.bt_conectarClick(Sender: TObject);
begin
  if (cmb_usuario.Text <> EmptyStr) and (edt_senha.Text <> EmptyStr) then
    begin
      try
        {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
        Conexao := TADConnection.Create(Self);
        SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

        Transaction         := TADTransaction.Create(Self);
        SQLQuery            := TADQuery.Create(Self);

        Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

        RemoveAspas(TUniForm(Self));

        if validasenha(cmb_usuario.Text, edt_senha.Text, Conexao) then
          begin
            gravar_cookie('Falcon Financas - USUARIO', cmb_usuario.Text, 60);

            {Verificando se o Usuário possui mais que uma empresa Cadastrada}
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_EMPRESA,                                    '+
                             '       NOME                                           '+
                             '  FROM EMPRESAS                                       '+
                             ' WHERE ID_MASTER = '''+IntToStr(ID.id_glo_master)+''' ');
            SQLQuery.Open;
            if SQLQuery.RecordCount > 1 then
              begin
                FormEmpresa_Conectar.ShowModal;
                Exit;
              end;

            if SQLQuery.RecordCount = 1 then
              begin
                ID.id_glo_empresa   := SQLQuery.FieldByName('ID_EMPRESA').AsInteger;
                ID.nome_glo_empresa := SQLQuery.FieldByName('NOME').AsString;
                FormPrincipal.Show;
                FormLogin.Hide;
              end;
          end;

      finally
        Conexao.Close;
        FreeAndNil(Conexao);
        FreeAndNil(SQLQuery);
      end;
    end;

end;

procedure TFormLogin.edt_senhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      ScreenMask.Enabled  := True;
      bt_conectar.Click;
    end;

end;

procedure TFormLogin.UniFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
  If SameText( EventName, 'SessionClosed' ) Then
    Begin
      uniGUIApplication.UniSession.Terminate( );
      uniGUIApplication.UniSession.UniApplication.Terminate( );
    End;
end;

procedure TFormLogin.UniFormShow(Sender: TObject);
begin
  try
    ler_cookie_combo('Falcon Financas - USUARIO', TUniFrame(Self), cmb_usuario);

    if WebMode then
    begin
      if UniApplication.Parameters.Values['chave'] <> EmptyStr then
        begin
          try
            {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
            Conexao := TADConnection.Create(Self);
            SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

            Transaction         := TADTransaction.Create(Self);
            SQLQuery            := TADQuery.Create(Self);

            Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

            chave := UniApplication.Parameters.Values['chave'];

            {Remoção de Aspas Simples Chr(39)' Para Chr(44)´ SQL Inject ;)}
            chave := StringReplace(chave,Chr(39),'´',[rfReplaceAll]);

            {Realizando algumas Validações}
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT AUTENTICADO, DAT_AUTENTICADO FROM USUARIOS '+
                             ' WHERE CODIGO_AUTENTICADO = :P00                  ');
            SQLQuery.Params[00].AsString := chave;
            SQLQuery.Open;
            if SQLQuery.RowsAffected = 1 then
              begin
                if SQLQuery.FieldByName('AUTENTICADO').AsString = 'N' then
                  begin
                    SQLQuery.SQL.Clear;
                    SQLQuery.SQL.Add('UPDATE USUARIOS SET  AUTENTICADO = ''S'',         '+
                                     '                     DAT_AUTENTICADO = SYSDATE()  '+
                                     ' WHERE CODIGO_AUTENTICADO = :P00                  ');
                    SQLQuery.Params[00].AsString := chave;
                    SQLQuery.ExecSQL;

                    humane.success('Parabéns!<br><br> '+
                                   '<div> <p><img src=imagens/tick_blue.png align=left/> '+
                                   'Seu Cadastro foi ativado com Sucesso.</p> </div>',10000,True);
                 end;
              end;
          finally
            Conexao.Close;
            FreeAndNil(Conexao);
            FreeAndNil(SQLQuery);
          end;
        end;

      if UniApplication.Parameters.Values['usuario'] <> EmptyStr then
        begin
          cmb_usuario.Text  := UniApplication.Parameters.Values['usuario'];
        end;
    end;

    cmb_usuario.SetFocus;
  except
    on e:exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

procedure TFormLogin.UniLabel4Click(Sender: TObject);
begin
  FormCadastro.Show;
  FormLogin.Hide;
end;

procedure TFormLogin.UniLabel5Click(Sender: TObject);
begin
  FormEsqueci_Minha_Senha.Show;
  FormLogin.Hide;
end;

initialization
  RegisterMainFormClass(TFormLogin);

end.
