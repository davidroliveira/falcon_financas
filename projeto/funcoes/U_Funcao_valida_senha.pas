{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Funcao_valida_senha;

interface

uses
  Forms, SysUtils, uniGUIApplication, uniGUIDialogs, uADCompClient;

function validasenha(usuario, senha: string; Conexao: TADConnection): Boolean;

implementation

uses
  SqlExpr, U_DM, U_Principal, MainModule, U_Sessao;

function validasenha(usuario, senha: string; Conexao: TADConnection): Boolean;
var
  SQLQuery  : TADQuery;
begin
  Result:= False;

  if (usuario <> EmptyStr) and (senha <> EmptyStr) then
    begin
      try

        SQLQuery := TADQuery.Create(Nil);
        SQLQuery.Connection := Conexao;

        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT MD5('''+senha+''') SENHA_INFORMADA,         '+
                         '       SENHA,                                      '+
                         '       AUTENTICADO,                                '+
                         '       ID_USUARIO,                                 '+
                         '       NOME,                                       '+
                         '       EMAIL,                                      '+
                         '       ID_MASTER                                   '+
                         '  FROM USUARIOS                                    '+
                         ' WHERE EMAIL = '''+usuario+'''                     ');
        SQLQuery.Open;

        if SQLQuery.RecordCount = 1 then
          begin
            if SQLQuery.FieldByName('AUTENTICADO').AsString = 'N' then
              begin
                Showmessage('Seu Cadastro não foi confirmado, você recebeu o Link de confirmação em seu e-mail. '+#13#13+
                            'Para receber novamente a Ativação do Cadastro clique em "Esqueci minha senha".');
                Exit;
              end;

            if SQLQuery.FieldByName('SENHA_INFORMADA').AsString = SQLQuery.FieldByName('SENHA').AsString then
              begin
                ID.id_glo_usuario   := SQLQuery.FieldByName('ID_USUARIO').AsInteger;
                ID.id_glo_master    := SQLQuery.FieldByName('ID_MASTER').AsInteger;
                ID.nome_glo_usuario := SQLQuery.FieldByName('NOME').AsString;
                ID.email_glo_usuario:= SQLQuery.FieldByName('EMAIL').AsString;

                Result := True;
                Exit;
              end
            else
              begin
                ShowMessage('Usuário ou senha inválido!');
                Exit;
              end;
          end
        else
          begin
            ShowMessage('Usuário Não Cadastrado!');
            Exit;
          end;

      finally
        FreeAndNil(SQLQuery);
      end;
    end;

end;

end.
