unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils;

type
  TID = class(TUniGUIMainModule)
  private
    { Private declarations }

  public
    { Public declarations }

    {Variaveis Global por Sessão}
    id_glo_usuario, id_glo_master, id_glo_empresa                               :Integer;
    nome_glo_usuario, email_glo_usuario, nome_glo_empresa, captcha, ip,
    navegador, os                                                               : String;

    {Variáveis Para Controle de Atulização das Telas}
    alt_inf_pag, alt_inf_rec                                                    : Boolean;
  end;

function ID: TID;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function ID: TID;
begin
  Result := TID(UniApplication.UniMainModule)
end;

initialization
  RegisterMainModuleClass(TID);
end.
