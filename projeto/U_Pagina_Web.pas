unit U_Pagina_Web;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniHTMLFrame,
  uniURLFrame;

type
  TFormPagina_Web = class(TUniForm)
    url_frame: TUniURLFrame;
    URL_Status: TUniURLFrame;
    procedure url_frameFrameLoaded(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

function FormPagina_Web: TFormPagina_Web;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule;

function FormPagina_Web: TFormPagina_Web;
begin
  Result := TFormPagina_Web(ID.GetFormInstance(TFormPagina_Web));
end;

procedure TFormPagina_Web.url_frameFrameLoaded(Sender: TObject);
begin
  URL_Status.Visible  := False;
end;

end.
