unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIForm, uniGUIBaseClasses,
  uniEdit, Menus, uniMainMenu, uniPanel, uniToolBar, uniPageControl, uniImageList,
  uniGUIClasses, uniGUIFrame, uniScreenMask, uniBitBtn, uniButton, uniSpeedButton,
  uniLabel, uniImage, pngimage;

type
  TFormPrincipal = class(TUniForm)
    Menu: TUniMainMenu;
    d1: TUniMenuItem;
    N1: TUniMenuItem;
    Sair1: TUniMenuItem;
    Financeiro1: TUniMenuItem;
    ContasaPagar1: TUniMenuItem;
    ContasaReceber1: TUniMenuItem;
    Cadastros1: TUniMenuItem;
    Contas1: TUniMenuItem;
    N2: TUniMenuItem;
    ransfernciadeSaldo1: TUniMenuItem;
    PageControl: TUniPageControl;
    Confirguraes1: TUniMenuItem;
    N3: TUniMenuItem;
    N4: TUniMenuItem;
    Usurios1: TUniMenuItem;
    Empresas1: TUniMenuItem;
    N5: TUniMenuItem;
    MovimentaoBancria1: TUniMenuItem;
    FluxodeCaixa1: TUniMenuItem;
    Relatrios1: TUniMenuItem;
    ContasaPagar2: TUniMenuItem;
    ContasaReceber2: TUniMenuItem;
    MudardeEmpresa1: TUniMenuItem;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniLabel1: TUniLabel;
    lb_navegador: TUniLabel;
    UniPanel3: TUniPanel;
    UniLabel2: TUniLabel;
    lb_usuario: TUniLabel;
    UniPanel4: TUniPanel;
    UniLabel3: TUniLabel;
    lb_os: TUniLabel;
    UniPanel5: TUniPanel;
    UniLabel4: TUniLabel;
    lb_empresa: TUniLabel;
    UniPanel6: TUniPanel;
    UniLabel5: TUniLabel;
    lb_ip: TUniLabel;
    UniImage1: TUniImage;
    UniImage2: TUniImage;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    UniImage5: TUniImage;
    FornecedorCliente1: TUniMenuItem;
    ipodeReceita1: TUniMenuItem;
    ipodeDespesa1: TUniMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure MudardeEmpresa1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure ipodeDespesa1Click(Sender: TObject);
    procedure ipodeReceita1Click(Sender: TObject);
    procedure FornecedorCliente1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ransfernciadeSaldo1Click(Sender: TObject);
  private
    { Private declarations }
    {Gerção de Formulários em Abas}
    procedure NovaAba(FormFrame: TFrame; Nome_Action: string; Fechar: Boolean);
    procedure FecharTodasAba;
    procedure CarregaInformacoesUsuario;
  public
    { Public declarations }
  end;

function FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, ServerModule, U_Cadastro,
  U_Cad_Heranca_Frame, U_Cad_Tipo_Receita, U_Empresa_Conectar, U_Contas_a_Pagar,
  U_Graficos_Tela_Principal, U_Contas, U_Cad_Tipo_Despesa,
  U_Cad_Cliente_Fornecedor, U_Contas_a_Receber, U_DM_Imagens,
  U_Transferencia_Saldo;

function FormPrincipal: TFormPrincipal;
begin
  Result := TFormPrincipal(ID.GetFormInstance(TFormPrincipal));
end;

procedure TFormPrincipal.Contas1Click(Sender: TObject);
begin
 FormCad_Contas.ShowModal;
end;

procedure TFormPrincipal.ContasaPagar1Click(Sender: TObject);
begin
  NovaAba(TFrame(TFrameContas_a_Pagar),'Contas a Pagar',True);
end;

procedure TFormPrincipal.ContasaReceber1Click(Sender: TObject);
begin
  NovaAba(TFrame(TFrameContas_a_Receber),'Contas a Receber',True);
end;

procedure TFormPrincipal.FornecedorCliente1Click(Sender: TObject);
begin
  FormCad_Cliente_Fornecedor.ShowModal;
end;

procedure TFormPrincipal.ipodeDespesa1Click(Sender: TObject);
begin
  FormCad_Tipo_Despesa.ShowModal;
end;

procedure TFormPrincipal.ipodeReceita1Click(Sender: TObject);
begin
  FormCad_Tipo_Receita.ShowModal;
end;

procedure TFormPrincipal.MudardeEmpresa1Click(Sender: TObject);
begin
  if PageControl.PageCount > 1 then
    ShowMessage('Para alterar a empresa conectada é necessário fechar todas a telas abertas.')
  else
    FormEmpresa_Conectar.ShowModal;

end;

procedure TFormPrincipal.NovaAba(FormFrame: TFrame;
  Nome_Action: string; Fechar: Boolean);
var
  TabSheet      :TUniTabSheet;
  FCurrentFrame :TUniFrame;
  I             :Integer;
begin

  PageControl.Visible:= True;

  {Verificando se a tela já está aberto e redireciona a ela}
  for I := 0 to PageControl.PageCount - 1 do
    with PageControl do
      if Pages[I].Caption = Nome_Action  then
        begin
          PageControl.ActivePageIndex := I;
          Exit;
        end;

  TabSheet              := TUniTabSheet.Create(Self);
  TabSheet.PageControl  := PageControl;
  TabSheet.Caption      := Nome_Action;
  TabSheet.Closable     := Fechar;

  FCurrentFrame:= TUniFrameClass(FormFrame).Create(Self);

  with FCurrentFrame do
    begin
      Align               := alClient;
      Parent              := TabSheet;
    end;

  Refresh;

  PageControl.ActivePage := TabSheet;
end;

procedure TFormPrincipal.ransfernciadeSaldo1Click(Sender: TObject);
begin
  FormTransferencia_Saldo.ShowModal;
end;

procedure TFormPrincipal.FecharTodasAba;
var
  I : Integer;
begin
  for  I := PageControl.PageCount -1 downto 0 do
    begin
      PageControl.Pages[I].Closable := True;
      PageControl.Pages[I].Destroy;
    end;


end;

procedure TFormPrincipal.CarregaInformacoesUsuario;
var
  C : TUniClientInfos;
begin
  ID.ip:= UniApplication.RemoteAddress;

  C:= UniApplication.ClientInfo;

  if ciIE in C then
    ID.navegador:= 'IE'
  else if ciFireFox in C then
    ID.navegador:= 'FireFox'
  else if ciOpera in C then
    ID.navegador:= 'Opera'
  else if ciSafari in C then
    ID.navegador:= 'Safari'
  else if ciChrome in C then
    ID.navegador:= 'Chrome';

  if ciLinux in C then
    ID.os:= 'Linux'
  else if ciWindows in C then
    ID.os:= 'Windows'
  else if ciMac in C then
    ID.os:= 'Mac';

  {:: Apresentando em Tela ::}
  lb_usuario.Caption    := ID.nome_glo_usuario;
  lb_empresa.Caption    := ID.nome_glo_empresa;
  lb_os.Caption         := ID.os;
  lb_navegador.Caption  := ID.navegador;
  lb_ip.Caption         := ID.ip;

end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  FecharTodasAba;

  Close;
  FormLogin.Close;
end;

procedure TFormPrincipal.UniFormShow(Sender: TObject);
begin
  CarregaInformacoesUsuario;
  NovaAba(TFrame(TFrameGraficos_Tela_Principal),'Gráficos Demonstrativos',False);
end;

end.
