unit U_Confirmacao_Exclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniRadioGroup, uniLabel,
  uniGUIBaseClasses, uniPanel, uADCompClient;

type
  TFormConfirmacao_Exclusao = class(TUniForm)
    pn_inf: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniRadioGroup1: TUniRadioGroup;
    UniPanel1: TUniPanel;
    bt_confirmar: TUniBitBtn;
    UniLabel3: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure bt_confirmarClick(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;

    documento, parcela, tipo_exclusao                                           :Integer;
    var_modulo                                                                  :String;
  public
    { Public declarations }
    function exclusao_parcela_recorrente(id_documento, id_parcela :Integer; modulo:String): String;  {Função que recebe DOCUMENTO/PARCELA/MODULO de uma fonte externa e repassa os valore para variaveis locais}

  end;

function FormConfirmacao_Exclusao: TFormConfirmacao_Exclusao;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uniGUIFrame, U_Sessao, U_Global, U_Financeiro,
  U_JS_Humane;

function FormConfirmacao_Exclusao: TFormConfirmacao_Exclusao;
begin
  Result := TFormConfirmacao_Exclusao(ID.GetFormInstance(TFormConfirmacao_Exclusao));
end;

{ TFormContas_a_Pagar_Confirmacao }

procedure TFormConfirmacao_Exclusao.bt_confirmarClick(Sender: TObject);
var
  Financeiro                                                                    :TFinanceiro;
begin
  try
    if Not(Transaction.Active) then
      Transaction.StartTransaction;

    tipo_exclusao := UniRadioGroup1.ItemIndex;

    if var_modulo = 'CAP' then
      Financeiro  :=  exclusao_ap(documento, parcela, tipo_exclusao, 'R', Conexao);

    if var_modulo = 'CRE' then
      Financeiro  :=  exclusao_par(documento, parcela, tipo_exclusao, 'R', Conexao);

    if Financeiro.Erro then
      raise Exception.Create(Financeiro.Msg_Erro);

    if Not(Financeiro.Alerta) then
      begin

        Transaction.Commit;

        humane.success('<div> <p><img src= imagens/32/empty.png </> '+
                       'Exclusão efetuada com Sucesso.</p> </div>',2500,True);
      end
    else
      Transaction.Rollback;

    Close;
  except
    on e: exception do
      begin
        Transaction.Rollback;
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

function TFormConfirmacao_Exclusao.exclusao_parcela_recorrente(id_documento,
  id_parcela: Integer; modulo: String): String;
begin
  try

    parcela     := id_parcela;
    documento   := id_documento;
    var_modulo  := modulo;

    if var_modulo = 'CAP' then
      begin
        {Alterando Nome da Alteranativas conforme parâmetro}
        FormConfirmacao_Exclusao.UniRadioGroup1.Items[0] := 'Excluir Apenas esta Parcela, e não realizar nenhuma alteração nas demais.';
        FormConfirmacao_Exclusao.UniRadioGroup1.Items[1] := 'Excluir Esta Parcela, e Todas as Próximas parcelas ainda não pagas.';
        FormConfirmacao_Exclusao.UniRadioGroup1.Items[2] := 'Excluir Todas as Parcelas que ainda não foram pagas.';

        {Verificando se o Documento é Recorrente}
        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT COUNT(*) FROM CAP_AD      A                '+
                         ' WHERE A.ID_MASTER               = :P00           '+
                         '   AND A.ID_EMPRESA              = :P01           '+
                         '   AND A.ID_CAP_AD               = :P02           '+
                         '   AND A.TIPO_DOCUM              <> ''R''         ');
        SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
        SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
        SQLQuery.Params[02].AsInteger  := documento;
        SQLQuery.Open;
        if SQLQuery.Fields[0].AsInteger = 1 then
          begin
            ShowMessage('Atenção!<br><br>'+
                        'Este Documento não é Recorrente.');
            FormConfirmacao_Exclusao.Close;
            Exit;
          end;
      end;

    if var_modulo = 'CRE' then
      begin
        {Alterando Nome da Alteranativas conforme parâmetro}
        FormConfirmacao_Exclusao.UniRadioGroup1.Items[0] := 'Excluir Apenas esta Parcela, e não realizar nenhuma alteração nas demais.';
        FormConfirmacao_Exclusao.UniRadioGroup1.Items[1] := 'Excluir Esta Parcela, e Todas as Próximas parcelas ainda não recebidas.';
        FormConfirmacao_Exclusao.UniRadioGroup1.Items[2] := 'Excluir Todas as Parcelas que ainda não foram recebidas.';

        {Verificando se o Documento é Recorrente}
        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT COUNT(*) FROM CRE_DOC     A                '+
                         ' WHERE A.ID_MASTER               = :P00           '+
                         '   AND A.ID_EMPRESA              = :P01           '+
                         '   AND A.ID_CRE_DOC              = :P02           '+
                         '   AND A.TIPO_DOCUM              <> ''R''         ');
        SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
        SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
        SQLQuery.Params[02].AsInteger  := documento;
        SQLQuery.Open;
        if SQLQuery.Fields[0].AsInteger = 1 then
          begin
            ShowMessage('Atenção!<br><br>'+
                        'Este Documento não é Recorrente.');
            FormConfirmacao_Exclusao.Close;
            Exit;
          end;
      end;

  except
    on e: exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String('function parcela recorrente'),e.UnitName,e.ClassName,e.Message);
      end;
  end;

end;

procedure TFormConfirmacao_Exclusao.UniFormCreate(Sender: TObject);
begin
  {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);
end;

procedure TFormConfirmacao_Exclusao.UniFormDestroy(Sender: TObject);
begin
  if var_modulo = 'CAP' then
    ID.alt_inf_pag  := True;
  if var_modulo = 'CRE' then
    ID.alt_inf_rec  := True;
end;

end.
