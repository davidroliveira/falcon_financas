unit U_DM;

interface

uses
  System.Classes, Data.DB, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADGUIxFormsWait, uADPhysMySQL, uADCompGUIx, uADCompClient,
  Data.DBXMySQL, Data.SqlExpr;

type
  TDM = class(TDataModule)
    ConexaoFiredac: TADConnection;
    WaitCursor: TADGUIxWaitCursor;
    MySQLDriverLink: TADPhysMySQLDriverLink;
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DM: TDM;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DM: TDM;
begin
  Result := TDM(ID.GetModuleInstance(TDM));
end;

initialization
  RegisterModuleClass(TDM);

end.
