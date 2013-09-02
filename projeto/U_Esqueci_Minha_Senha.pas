unit U_Esqueci_Minha_Senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, uniGUIFrame,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit, uniGUIBaseClasses,
  uniLabel, uniImage, uniScreenMask, uniSpeedButton, uADCompClient;

type
  TFormEsqueci_Minha_Senha = class(TUniForm)
    UniLabel1: TUniLabel;
    edt_email: TUniEdit;
    bt_recuperar_senha: TUniBitBtn;
    UniImage1: TUniImage;
    edt_codigo: TUniEdit;
    UniLabel2: TUniLabel;
    UniSpeedButton1: TUniSpeedButton;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure bt_recuperar_senhaClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;

    senha, chave_acesso, link :String;
  public
    { Public declarations }
  end;

function FormEsqueci_Minha_Senha: TFormEsqueci_Minha_Senha;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, U_DM, U_Global, U_Sessao, U_Grava_Email;

procedure TFormEsqueci_Minha_Senha.UniFormCreate(Sender: TObject);
begin
  {Cria uma Nova Sess�o no Banco de Dados (Utilizado pelas Transa��es)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);
end;

procedure TFormEsqueci_Minha_Senha.UniFormDestroy(Sender: TObject);
begin
  FormLogin.Show;
end;

procedure TFormEsqueci_Minha_Senha.UniFormShow(Sender: TObject);
begin
  ID.captcha := GeraImagem(TUniForm(Self),UniImage1);
end;

procedure TFormEsqueci_Minha_Senha.UniSpeedButton1Click(Sender: TObject);
begin
   ID.captcha := GeraImagem(TUniForm(Self),UniImage1);
end;

{:: Fun��es ::}
function FormEsqueci_Minha_Senha: TFormEsqueci_Minha_Senha;
begin
  Result := TFormEsqueci_Minha_Senha(ID.GetFormInstance(TFormEsqueci_Minha_Senha));
end;

procedure TFormEsqueci_Minha_Senha.bt_recuperar_senhaClick(Sender: TObject);
var
  I                                                   : Integer;
  Anexo                                               : TStringList;
  email, corpo, corpo_padrao, corpo_auxiliar          : String;
  cadastro_confirmado                                 : Boolean;
begin
  if (edt_email.Text <> EmptyStr) and (edt_codigo.Text <> EmptyStr) then
    begin
      {Remo��o de Aspas Simples em todos os TUniEdit Chr(39)' Para Chr(44)� SQL Inject ;)}
      RemoveAspas(TUniForm(Self));

      if ID.captcha = UpperCase(edt_codigo.Text) then
        begin
          {Verificando se o e-mail esta cadastrado}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT COUNT(*) FROM USUARIOS                         '+
                           ' WHERE EMAIL = '''+Trim(edt_email.Text)+'''           ');
           SQLQuery.Open;
          if SQLQuery.Fields[0].AsInteger = 0 then
            begin
              ShowMessage('E-mail n�o Cadastrado! '+#13#13+
                          'Para realizar o Cadastro Clique no Link "Inscreva-se J�".');
              Exit;
            end;

          try
            if Not(Transaction.Active) then
              Transaction.StartTransaction;

            {Gerando uma Nova Senha}
            senha := GeraSenha;

            {Altera Para Nova Senha}
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('UPDATE USUARIOS SET SENHA = MD5('''+senha+''') '+
                             ' WHERE EMAIL = '''+Trim(edt_email.Text)+'''                 ');
            SQLQuery.ExecSQL;

            {Cria a StringList}
            Anexo:= TStringList.Create;

            {E-mail do Usu�rio}
            email := edt_email.Text;

            {Carregando o HTML para envio}
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT PARAMETRO_LONG FROM PARAMETROS                       '+
                             ' WHERE MODULO = ''GERAL''                                   '+
                             '   AND TITULO = ''HTML - LAYOUT - CONFIRMACAO DE CADASTRO'' ');
            SQLQuery.Open;
            corpo_auxiliar:= SQLQuery.Fields[0].AsString;

            {Verificando se o e-mail foi Confirmado}
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT AUTENTICADO FROM USUARIOS                      '+
                             ' WHERE EMAIL = '''+Trim(edt_email.Text)+'''           ');
            SQLQuery.Open;
            cadastro_confirmado := SQLQuery.Fields[0].AsString = 'S';

            {Envia e-mail de Confirma��o do Usu�rio com a Senha Alterada}
            if Not(cadastro_confirmado) then
              begin

                {Altera Para Nova Chave de Acesso}
                SQLQuery.SQL.Clear;
                SQLQuery.SQL.Add('SELECT MD5('+IntToStr(Random(999999999))+') FROM DUAL ');
                SQLQuery.Open;
                chave_acesso := SQLQuery.Fields[0].AsString;

                SQLQuery.SQL.Clear;
                SQLQuery.SQL.Add('UPDATE USUARIOS SET CODIGO_AUTENTICADO = '''+chave_acesso+''' '+
                                 ' WHERE EMAIL = '''+Trim(edt_email.Text)+'''                   ');
                SQLQuery.ExecSQL;

                link        :='<a href="http://184.82.155.163/?chave='+chave_acesso+'">Ativar Cadastro</a>';

                corpo_padrao:= StringReplace(corpo_auxiliar,'[TEXTO_CABECALHO]','Confirma��o de Usu�rio',[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_1]','Parab�ns, Seu Usu�rio foi Criado com Sucessso!',[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_MENSAGEM]','Para ativar seu Cadastro clique no Link abaixo:',[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_LINK]',link,[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[USUARIO]',email,[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[SENHA]',senha,[rfIgnoreCase]);

                Corpo := corpo_padrao;

                if GravaEmail('Cadastro','Falcon Finan�as','smart@v-agro.com.br',''+email+'','','','Confirma��o de Usu�rio - Falcon Finan�as',Corpo,Anexo,Conexao) then
                  begin
                    Conexao.Commit;

                    ShowMessage('Seu Cadastro ainda n�o foi ativado! '+#13#13+
                                'Foi enviado novamente para seu E-mail a Ativa��o do Cadastro e uma Nova Senha.');
                  end
                else
                  Conexao.Rollback;
              end;

            {Envia e-mail de Altera��o de Senha}
            if cadastro_confirmado then
              begin
                corpo_padrao:= StringReplace(corpo_auxiliar,'[TEXTO_CABECALHO]','Recupera��o de Senha',[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_1]','Voc� solicitou a Altera��o de Senha.',[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_MENSAGEM]','Sua Nova senha de acesso agora � essa:',[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[TEXTO_LINK]',senha,[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[USUARIO]',email,[rfIgnoreCase]);
                corpo_padrao:= StringReplace(corpo_padrao,'[SENHA]',senha,[rfIgnoreCase]);

                Corpo := corpo_padrao;


                if GravaEmail('Cadastro','Falcon Finan�as','smart@v-agro.com.br',''+email+'','','','Recupera��o de Senha - Falcon Finan�as',Corpo,Anexo,Conexao) then
                  begin
                    Conexao.Commit;

                    ShowMessage('Foi encaminhado para seu e-mail uma Nova Senha de Acesso.');
                  end
                else
                  Conexao.Rollback;
              end;
          finally
            FreeAndNil(Anexo);
          end;
        end
      else
        begin
          ShowMessage('A Palavra Informada esta errada! '+#13#13+
                      'Digite Novamente.');
          ID.captcha := GeraImagem(TUniForm(Self),UniImage1);
          Exit;
        end;
    end;
end;

end.
