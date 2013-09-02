unit ServerModule;

interface

uses
  SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uniGUIDialogs;

type
  TID_ALL = class(TUniGUIServerModule)
    procedure UniGUIServerModuleException(Sender: TUniGUIMainModule;
      AException: Exception; var Handled: Boolean);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function ID_ALL: TID_ALL;

implementation

{$R *.dfm}

uses
  UniGUIVars;

//1000    = 1 Segundo
//60000   = 1 Minuto
//3600000 = 1 Hora


function ID_ALL: TID_ALL;
begin
  Result:=TID_ALL(UniGUIServerInstance);
end;

procedure TID_ALL.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TID_ALL.UniGUIServerModuleException(Sender: TUniGUIMainModule;
  AException: Exception; var Handled: Boolean);
begin

  ShowMessage('ID ALL Exception -> '+AException.Message);
end;

initialization
  RegisterServerModuleClass(TID_ALL);
end.
