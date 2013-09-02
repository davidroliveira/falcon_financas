{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Envia_Email;

interface

uses
  Forms, Windows, Classes, StdCtrls, IdSMTP, IdMessage,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSASL;

var
  IdSMTP1       : TIdSMTP;
  IdMessage     : TIdMessage;
  idSSLv        : TIdSSLIOHandlerSocketOpenSSL;

function EnviaEmail(DeNome, remetente, Para, CCPara, CCO, Assunto, formato, Corpo: String; Anexo: TStringList): Boolean;

implementation

uses
  IdText, IdAttachmentFile, SysUtils, Dialogs, SqlExpr, U_DM, MainModule;

function EnviaEmail(DeNome, remetente, Para, CCPara, CCO, Assunto, formato, Corpo:string; Anexo: TStringList): Boolean;
var
  HostSmtp,Porta,Usuario,Senha,Email,Protocolo: string;
  SQLQuery            : TSQLQuery;
  I,ReadTime          : Integer;
  Autenticacao,TLS    : Boolean;
  LTextPart           : TIdText;
begin
    Result                        := False;

    {:: Busca as configurações do Servidor de e-mail ::}
    SQLQuery := TSQLQuery.Create(Nil);
    SQLQuery.SQLConnection := DM.Conexao;

    SQLQuery.SQL.Clear;
    SQLQuery.SQL.Add('SELECT SMTP,EMAIL,USUARIO,SENHA,PORTA,AUTENTICACAO,READTIME,PROTOCOLO,TLS FROM CONFIG_EMAIL WHERE PRINCIPAL = ''S'' ');
    SQLQuery.Open;
    if SQLQuery.Fields[0].AsString = EmptyStr then
      begin
        Result                        := False;
        Exit;
      end;
    HostSmtp    := Trim(SQLQuery.FieldByName('SMTP').AsString);
    Porta       := Trim(SQLQuery.FieldByName('PORTA').AsString);
    Autenticacao:= SQLQuery.FieldByName('AUTENTICACAO').AsString='S';
    TLS         := SQLQuery.FieldByName('TLS').AsString='S';
    Email       := Trim(remetente);
    Usuario     := Trim(SQLQuery.FieldByName('USUARIO').AsString);
    Senha       := Trim(SQLQuery.FieldByName('SENHA').AsString);
    ReadTime    := SQLQuery.FieldByName('READTIME').AsInteger;
    Protocolo   := Trim(SQLQuery.FieldByName('PROTOCOLO').AsString);

    if protocolo = 'SMTP' then
      begin
        {:: Cria a Estrutura da Mensagem ::}
        if IdMessage = Nil then
          IdMessage := TIdMessage.Create(nil);

        with IdMessage do
          begin
            Clear;
            IsEncoded       := True;
            Encoding        := meMIME;                // meDefault;
            ConvertPreamble := True;
            Priority        := mpHighest;             // Low=baixo / High=alto / mpHighest=urgente
            CharSet         := 'utf-8';
            Date            := Now;
            Subject         := Assunto;

            {:: Define o Remetente e Destinatário ::}
            From.Address              := Email;     // ou '[EMAIL PROTECTED]'
            From.Name                 := DeNome;
            ReplyTo.EMailAddresses    := Email;
            Recipients.EMailAddresses := Trim(Para);
            CCList.EMailAddresses     := Trim(CCPara);
            BccList.EMailAddresses    := Trim(CCO);
          end;

        {:: Cria o Corpo da Mensagem ::}
        LTextPart             :=TIdText.Create(IdMessage.MessageParts);
        LTextPart.Body.Text   :=Corpo;
        LTextPart.ContentType :=formato;

        {:: Adiciona Anexo ::}
        if Anexo.Count > 0 then
          begin
            for I := 0 to Anexo.Count - 1 do
              begin
                TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(Anexo[I]));
              end;
          end;

        {:: Cria Caso Necessario a Conexão com o Servidor de e-mail ::}
        if IdSMTP1 = Nil then
          begin
            IdSMTP1 := TIdSMTP.Create(nil);
            with IdSMTP1 do
              begin
                if Autenticacao then
                  AuthType  := satDefault
                else
                  AuthType  := satNone;

                if idSSLv = Nil then
                  idSSLv := TIdSSLIOHandlerSocketOpenSSL.Create();

                if TLS then
                  begin
                    idSSLv.SSLOptions.Method := sslvTLSv1;
                    idSSLv.SSLOptions.Mode   := sslmClient;
                    IOHandler                := idSSLv;
                    UseTLS                   := utUseExplicitTLS;
                  end
                else
                  begin
                    IOHandler := nil;
                    UseTLS    := utNoTLSSupport;
                  end;

                if pos('hotmail', LowerCase(Email)) > 0 then
                  begin
                    idSSLv.SSLOptions.Method := sslvTLSv1;
                    idSSLv.SSLOptions.Mode   := sslmClient;
                    IOHandler                := idSSLv;
                    UseTLS                   := utUseExplicitTLS;
                  end;

                ReadTimeout := ReadTime * 1000;       // Leitura da Conexão em segundos!  1000 = 1 segundo
                Host        := Trim(HostSmtp);        // 'smtp.dominio.com.br';
                Port        := StrToInt(Trim(Porta)); // padrão seria 25 ou autenticada 465;
                UserName    := Trim(Usuario);         // 'usuario';
                Password    := Trim(Senha);           // 'senha';

                try
                  Connect;
                  Authenticate;
                except
                  on E: Exception do
                  begin
                    Result                        := False;
                    FreeAndNil(IdSMTP1);
                    FreeAndNil(IdSSLv);
                    FreeAndNil(IdMessage);
                    Exit;
                  end;
                end;
              end;
          end;

        {Envia E-mail}
        with IdSMTP1 do
          begin
            Try
              Send(IdMessage);
              Result                        := True;
            Except
              on e:exception do
                begin
                  if (e.Message <> 'Connection Closed Gracefully.') and (e.Message <> 'Read timed out.') then
                    begin
                      Result := False;
                    end;
                  if (e.Message = 'Connection Closed Gracefully.') then
                      Result := False;
                  //if (e.Message = 'Read timed out.') then
                  //    Result := True; //Esta recebendo True, por que mesmo aprentando erro no "Send", a mensagem é enviada.

                  FreeAndNil(IdSMTP1);
                  FreeAndNil(IdSSLv);
                  FreeAndNil(IdMessage);
                end;
            end;
          end;
      end;

      FreeAndNil(SQLQuery);
  end;
end.
