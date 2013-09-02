unit U_DM_Imagens;

interface

uses
  SysUtils, Classes, uniGUIClasses, uniImageList;

type
  TDM_Imagens = class(TDataModule)
    img_32: TUniImageList;
    img_16: TUniImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DM_Imagens: TDM_Imagens;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DM_Imagens: TDM_Imagens;
begin
  Result := TDM_Imagens(ID.GetModuleInstance(TDM_Imagens));
end;

initialization
  RegisterModuleClass(TDM_Imagens);

end.
