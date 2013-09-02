unit U_Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit, uniGUIBaseClasses,
  uniLabel, uniScreenMask, uniPanel, uniImage, uniCheckBox, uniGUIFrame,
  uniDBEdit, uADCompClient;

type
  TFormCadastro = class(TUniForm)
    pn_mensagem: TUniPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    pn_cadastro: TUniPanel;
    UniLabel1: TUniLabel;
    edt_email: TUniEdit;
    UniLabel3: TUniLabel;
    edt_nome: TUniEdit;
    UniLabel2: TUniLabel;
    edt_senha: TUniEdit;
    bt_cadastrar: TUniBitBtn;
    UniLabel7: TUniLabel;
    edt_senha_repete: TUniEdit;
    img1: TUniImage;
    img2: TUniImage;
    img3: TUniImage;
    img4: TUniImage;
    chk_termos_de_uso: TUniCheckBox;
    lb_termos_de_uso: TUniLabel;
    procedure bt_cadastrarClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure edt_senha_repeteChange(Sender: TObject);
    procedure edt_senhaChange(Sender: TObject);
    procedure lb_termos_de_usoClick(Sender: TObject);
    procedure edt_emailExit(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;

    id_usuario, id_master                                                       :Integer;
    chave_acesso, senha, email, corpo_auxiliar, corpo_padrao, Corpo, link       :String;
    Anexo                                                                       :TStringList;

  public
    { Public declarations }
  end;

function FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, U_DM, U_Global,
  U_Funcao_Versao, U_Sessao, U_Verifica_Campo_Null, U_Grava_Email,
  U_Pagina_Web, ServerModule, U_JS_Humane;

function FormCadastro: TFormCadastro;
begin
  Result := TFormCadastro(ID.GetFormInstance(TFormCadastro));
end;

procedure TFormCadastro.bt_cadastrarClick(Sender: TObject);
begin
  if Verifica_Edit(TUniForm(Self)) then
    begin

      FormCadastro.Height := 292;

      RemoveAspas(TUniForm(Self));

      if Length(edt_senha.Text) <= 4 then
        begin
          ShowMessage('A Senha não atende os requisitos mínimos de Segurança (5 Caracteres)!');
          Exit;
        end;

      if Not(ValidaEmail(edt_email.Text)) then
        begin
          ShowMessage('E-mail inválido!');
          Exit;
        end;

      if edt_senha.Text <> edt_senha_repete.Text then
        begin
          ShowMessage('Senhas Não coincidem!');
          Exit;
        end;

      if Not(chk_termos_de_uso.Checked) then
        begin
          ShowMessage('Para Realizar o Cadastro, Você deve concordar com os Termos de Uso.');
          Exit;
        end;

      try
        try

          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT COUNT(*) FROM USUARIOS                         '+
                           ' WHERE EMAIL = '''+Trim(edt_email.Text)+'''           ');
          SQLQuery.Open;
          if SQLQuery.Fields[0].AsInteger > 0 then
            begin
              ShowMessage('Este e-mail já está em utilização, caso não lembre a senha clique em "Esqueci minha senha".');
              Exit;
            end;

          if Not(Transaction.Active)then
            Transaction.StartTransaction;

          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT MD5('+IntToStr(Random(999999999))+') FROM DUAL ');
          SQLQuery.Open;
          chave_acesso := SQLQuery.Fields[0].AsString;

          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT MD5('''+edt_senha.Text+''') FROM DUAL          ');
          SQLQuery.Open;
          senha := SQLQuery.Fields[0].AsString;

          id_usuario  := gen_id('USUARIOS', Conexao);

          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT IFNULL(MAX(ID_MASTER),0)+1 FROM USUARIOS       ');
          SQLQuery.Open;
          id_master := SQLQuery.Fields[0].AsInteger;

          {Criação do Usuário}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO USUARIOS (ID_USUARIO,                     '+
                           '                      ID_MASTER,                      '+
                           '                      EMAIL,                          '+
                           '                      NOME,                           '+
                           '                      SENHA,                          '+
                           '                      ADMINISTRADOR,                  '+
                           '                      CODIGO_AUTENTICADO,             '+
                           '                      AUTENTICADO)                    '+
                           '              VALUES (:P00, :P01, :P02, :P03, :P04, :P05, :P06, :P07)   ');
          SQLQuery.Params[00].AsInteger := id_usuario;
          SQLQuery.Params[01].AsInteger := id_master;
          SQLQuery.Params[02].AsString  := Trim(edt_email.Text);
          SQLQuery.Params[03].AsString  := Trim(edt_nome.Text);
          SQLQuery.Params[04].AsString  := senha;
          SQLQuery.Params[05].AsString  := 'S';
          SQLQuery.Params[06].AsString  := chave_acesso;
          SQLQuery.Params[07].AsString  := 'N';
          SQLQuery.ExecSQL;

          {Criação da Empresa}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO EMPRESAS (ID_MASTER,                      '+
                           '                      NOME,                           '+
                           '                      DAT_CADASTRO,                   '+
                           '                      ID_USUARIO)                     '+
                           '              VALUES (:P00, :P01, SYSDATE(), :P02)   ');
          SQLQuery.Params[00].AsInteger := id_master;
          SQLQuery.Params[01].AsString  := 'Minhas Finanças';
          SQLQuery.Params[02].AsInteger := id_usuario;
          SQLQuery.ExecSQL;

          {Envia e-mail de Criação do Usuário com o código de autenticação}

          {Cria a StringList}
          Anexo:= TStringList.Create;

          {E-mail do Usuário}
          email := edt_email.Text;

          {Carregando o HTML para envio}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT PARAMETRO_LONG FROM PARAMETROS                       '+
                           ' WHERE MODULO = ''GERAL''                                   '+
                           '   AND TITULO = ''HTML - LAYOUT - CONFIRMACAO DE CADASTRO'' ');
          SQLQuery.Open;
          corpo_auxiliar:= SQLQuery.Fields[0].AsString;

          link        :='<a href="http://localhost/?chave='+chave_acesso+'">Ativar Cadastro</a>';

          corpo_padrao:= StringReplace(corpo_auxiliar,'[TEXTO_CABECALHO]','Confirmação de Usuário',[rfIgnoreCase]);
          corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_1]','Parabéns, Seu Usu&aacute;rio foi Criado com Sucessso!',[rfIgnoreCase]);
          corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_MENSAGEM]','Para ativar seu Cadastro clique no Link abaixo:',[rfIgnoreCase]);
          corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_LINK]',link,[rfIgnoreCase]);
          corpo_padrao:= StringReplace(corpo_padrao,'[USUARIO]',edt_email.Text,[rfIgnoreCase]);
          corpo_padrao:= StringReplace(corpo_padrao,'[SENHA]',edt_senha.Text,[rfIgnoreCase]);

          Corpo := corpo_padrao;

          if GravaEmail('Cadastro','Falcon Finanças','smart@v-agro.com.br',''+email+'','','','Confirmação de Usuário - Falcon Finanças',Corpo,Anexo,Conexao) then
            begin
              Conexao.Commit;

              //FormCadastro.Height := 380;
              humane.success('Cadastro efetuado com sucesso!<br><br> '+
                             '<div> <p><img src= imagens/32/email.png align=left/> '+
                             'Foi enviado para seu e-mail a confirmação para utilização do sistema.</p> </div>',10000,True);
            end
          else
            Conexao.Rollback;

        finally
          FreeAndNil(Anexo);
        end;
      except
        on e:exception do
          begin
            RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
          end;

      end;
    end;

end;

procedure TFormCadastro.edt_emailExit(Sender: TObject);
begin
  img1.Visible  := ValidaEmail(edt_email.Text);
end;

procedure TFormCadastro.edt_nomeExit(Sender: TObject);
begin
  img2.Visible:= (TUniEdit(Sender).Text <> EmptyStr);
end;

procedure TFormCadastro.edt_senhaChange(Sender: TObject);
begin
  img3.Visible  := (Length(edt_senha.Text) > 4);
end;

procedure TFormCadastro.edt_senha_repeteChange(Sender: TObject);
begin
  img4.Visible:= (edt_senha_repete.Text = edt_senha.Text);
end;

procedure TFormCadastro.lb_termos_de_usoClick(Sender: TObject);
var
  pagina_web  : TFormPagina_Web;
begin
  pagina_web                := TFormPagina_Web.Create(UniApplication);
  pagina_web.url_frame.URL  := ID_ALL.FilesFolderURL+'contrato_falcon_financas.html';
  pagina_web.Caption        := 'Contrato | Falcon Finanças';
  pagina_web.ShowModal;
end;

procedure TFormCadastro.UniFormCreate(Sender: TObject);
begin
  {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);


  edt_email.SetFocus;
end;

procedure TFormCadastro.UniFormDestroy(Sender: TObject);
begin
  FormLogin.Show;
end;

end.
