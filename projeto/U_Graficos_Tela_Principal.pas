unit U_Graficos_Tela_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, VCLTee.TeEngine, UniChart, uniButton, uniBitBtn, uniLabel,
  UniCalendarPanel, VCLTee.Series;

type
  TFrameGraficos_Tela_Principal = class(TUniFrame)
    UniPanel2: TUniPanel;
    UniPanel1: TUniPanel;
    pn_drag: TUniPanel;
    UniChart1: TUniChart;
    UniCalendarPanel1: TUniCalendarPanel;
    UniPanel7: TUniPanel;
    UniChart2: TUniChart;
    pn_drag_saldos: TUniPanel;
    UniLabel1: TUniLabel;
    lb_saldo: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    pn_saldo: TUniPanel;
    UniPanel4: TUniPanel;
    Series1: TUniBarSeries;
    Series2: TUniBarSeries;
    procedure UniBitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses U_DM, Vcl.Imaging.pngimage , U_Graficos;


procedure TFrameGraficos_Tela_Principal.UniBitBtn1Click(Sender: TObject);
begin
  atualiza_saldos(TUniFrame(Self), pn_saldo, lb_saldo);
end;


end.
