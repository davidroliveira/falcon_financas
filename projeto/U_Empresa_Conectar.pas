unit U_Empresa_Conectar;

interface

uses uniGUIClasses, uniMultiItem, uniComboBox, ComboboxYeni, pngimage, uniImage,
     Classes, Controls, uniGUIBaseClasses, uniButton, uniBitBtn, uniGUIForm,
     uADCompClient;

type
  TFormEmpresa_Conectar = class(TUniForm)
    bt_confirmar: TUniBitBtn;
    UniImage1: TUniImage;
    cmb_empresa: TComboBoxYeni;
    procedure UniFormCreate(Sender: TObject);
    procedure bt_confirmarClick(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;
  public
    { Public declarations }
  end;

function FormEmpresa_Conectar: TFormEmpresa_Conectar;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, U_Sessao, U_Principal, uniGUIFrame, SysUtils;

function FormEmpresa_Conectar: TFormEmpresa_Conectar;
begin
  Result := TFormEmpresa_Conectar(ID.GetFormInstance(TFormEmpresa_Conectar));
end;

procedure TFormEmpresa_Conectar.bt_confirmarClick(Sender: TObject);
begin
  if cmb_empresa.Text <> EmptyStr then
    begin
      ID.id_glo_empresa   := Integer(cmb_empresa.Value);
      ID.nome_glo_empresa := String(cmb_empresa.Text);
      FormPrincipal.Show;
      FormEmpresa_Conectar.Close;
    end;
end;

procedure TFormEmpresa_Conectar.UniFormCreate(Sender: TObject);
begin
  {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('SELECT ID_EMPRESA,                                    '+
                   '       NOME                                           '+
                   '  FROM EMPRESAS                                       '+
                   ' WHERE ID_MASTER = '''+IntToStr(ID.id_glo_master)+''' ');
  SQLQuery.Open;

  SQLQuery.First;
  cmb_empresa.ClearAll;
  while Not(SQLQuery.Eof) do
    begin
      cmb_empresa.Items.Add(SQLQuery.FieldByName('NOME').AsString);
      cmb_empresa.ValueList.Add(SQLQuery.FieldByName('ID_EMPRESA').AsString);
      SQLQuery.Next;
    end;

  cmb_empresa.ItemIndex := 0;
  cmb_empresa.SetFocus;

end;

end.
