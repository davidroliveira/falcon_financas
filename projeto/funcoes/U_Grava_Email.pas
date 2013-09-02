{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Grava_Email;

interface

uses
  Forms, Windows, Classes, StdCtrls, SqlExpr, SysUtils, uADCompClient;

function GravaEmail(departamento, DeNome, remetente, Para, CCPara, CCO, Assunto, Corpo: String; Anexo: TStringList; Conexao: TADConnection): Boolean;

implementation

uses
  DB;

function GravaEmail(departamento, DeNome, remetente, Para, CCPara, CCO, Assunto, Corpo: String; Anexo: TStringList; Conexao: TADConnection): Boolean;
var
  SQLQuery                                                                      : TADQuery;
  ID, I, J                                                                      : Integer;
  ArquivoAnexo                                                                  : String;
begin
  try
    SQLQuery := TADQuery.Create(Nil);
    SQLQuery.Connection := Conexao;

    SQLQuery.SQL.Clear;
    SQLQuery.SQL.Add('SELECT IFNULL(MAX(ID_ENVIO_EMAIL),0)+1 FROM ENVIO_EMAIL');
    SQLQuery.Open;
    ID  := SQLQuery.Fields[0].AsInteger;

    SQLQuery.SQL.Clear;
    SQLQuery.SQL.Add('INSERT INTO ENVIO_EMAIL                                    '+
                     '           (ID_ENVIO_EMAIL,                                '+
                     '            DEPARTAMENTO,                                  '+
                     '            NOME_REMETENTE,                                '+
                     '            EMAIL_REMETENTE,                               '+
                     '            EMAIL_PARA,                                    '+
                     '            EMAIL_CC_PARA,                                 '+
                     '            EMAIL_CCO,                                     '+
                     '            ASSUNTO,                                       '+
                     '            CORPO,                                         '+
                     '            STATUS,                                        '+
                     '            DATA_GRAVACAO,                                 '+
                     '            DATA_ENVIO,                                    '+
                     '            TENTATIVA_ENVIO)                               '+
                     '    VALUES (:P00, :P01, :P02, :P03, :P04, :P05, :P06, :P07,'+
                     '            :P08, :P09, SYSDATE(), NULL, :P10)                  ');
    SQLQuery.Params[00].AsInteger := ID;
    SQLQuery.Params[01].AsString  := departamento;
    SQLQuery.Params[02].AsString  := DeNome;
    SQLQuery.Params[03].AsString  := remetente;
    SQLQuery.Params[04].AsString  := Para;
    SQLQuery.Params[05].AsString  := CCPara;
    SQLQuery.Params[06].AsString  := CCO;
    SQLQuery.Params[07].AsString  := Assunto;
    SQLQuery.Params[08].AsMemo    := Corpo;
    SQLQuery.Params[09].AsString  := 'P';
    SQLQuery.Params[10].AsInteger := 0;
    SQLQuery.ExecSQL;

    {:: Verifica se Possui Anexo ::}
    if Anexo.Count > 0 then
      begin
        for I := 0 to Anexo.Count - 1 do
          begin

            {Lendo o Nome do Anexo}
            for J := 1 to Length(Anexo[I]) do
              begin
                if Copy(Anexo[I],Integer(Length(Anexo[I])-J),1) = '\' then
                  begin
                    ArquivoAnexo  := emptystr;
                    ArquivoAnexo  := Copy(Anexo[I],Integer(Length(Anexo[I])-J+1),(Integer(Length(Anexo[I])) - Integer(Length(Anexo[I])-J)) );
                    Break; //Sai do Laço de repetição
                  end;
              end;

            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('INSERT INTO ENVIO_EMAIL_ANEXO                     '+
                             '           (ID_ENVIO_EMAIL,                       '+
                             '            NOME_ANEXO,                           '+
                             '            ANEXO)                                '+
                             '    VALUES (:P00, :P01, :P02)                     ');
            SQLQuery.Params[00].AsInteger := ID;
            SQLQuery.Params[01].AsString  := ArquivoAnexo;
            SQLQuery.Params[02].LoadFromFile(Anexo[I], ftBlob);
            SQLQuery.ExecSQL;
            end;
      end;

    Result  := True;

  finally
    FreeAndNil(SQLQuery);
  end;
end;

end.
