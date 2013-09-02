unit ActiveHandleException;

interface

uses Forms, SysUtils, Classes, SqlExpr, uniGUIDialogs;

type
  TActiveHandleException = class
  private
    SQLQuery: TSQLQuery;
    form, caption, classe, unit_name, mensagem :string;
    procedure AppException(Sender: TObject; E: Exception);
  public
    constructor Create;
  end;

implementation

uses U_DM, uniGUIForm, uniGUIFrame, uniGUIApplication, MainModule;

{ TActiveHandleException }

procedure TActiveHandleException.AppException(Sender: TObject;
  E: Exception);
begin
{$I-}
  try
    SQLQuery:= TSQLQuery.Create(UniApplication);
    SQLQuery.SQLConnection:= DM.Conexao;

    if (TComponent(sender) is TUniForm) or (TComponent(sender) is TUniFrame) then
      begin
        form    := TUniForm(sender).Name;
        caption := TUniForm(sender).Caption
      end
    else
      begin
        form    := TUniForm(TComponent(sender).Owner).Name;
        caption := TUniForm(TComponent(sender).Owner).Caption;
      end;

    unit_name := e.UnitName;
    classe    := e.ClassName;
    mensagem  := e.Message;

    SQLQuery.SQL.Add('INSERT INTO LOG_ERROS                                     '+
                     '           (FORMULARIO,                                   '+
                     '            OBJETO,                                       '+
                     '            UNIT,                                         '+
                     '            CLASSE_UNIT,                                  '+
                     '            MENSAGEM,                                     '+
                     '            DAT_ERRO,                                     '+
                     '            IP,                                           '+
                     '            OS,                                           '+
                     '            NAVEGADOR,                                    '+
                     '            ID_USUARIO)                                   '+
                     '            VALUES                                        '+
                     '           (:P00, :P01, :P02, :P03, :P04, SYSDATE(), :P05 '+
                     '            :P06, :P07, :P08, :P09)                       ');
    SQLQuery.Params[00].AsString  := form;
    SQLQuery.Params[01].AsString  := 'Exception';
    SQLQuery.Params[02].AsString  := unit_name;
    SQLQuery.Params[03].AsString  := classe;
    SQLQuery.Params[04].AsString  := mensagem;
    SQLQuery.Params[05].AsString  := ID.ip;
    SQLQuery.Params[06].AsString  := ID.os;
    SQLQuery.Params[07].AsString  := ID.navegador;
    SQLQuery.Params[08].AsString  := ID.id_glo_usuario;

    SQLQuery.ExecSQL;

    ShowMessage(E.Message);
  finally
    FreeAndNil(SQLQuery);
  end;
{$I+}
end;

constructor TActiveHandleException.Create;
begin
  Application.OnException := AppException;
end;

var
  ActiveExcetion: TActiveHandleException;

initialization
  ActiveExcetion := TActiveHandleException.Create;

finalization
  ActiveExcetion.Free;

end.

