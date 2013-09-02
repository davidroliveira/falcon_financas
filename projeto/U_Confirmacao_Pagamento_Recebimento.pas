unit U_Confirmacao_Pagamento_Recebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, uniGUIFrame,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniDateTimePicker, uniButton, uniBitBtn, uniLabel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit, uniMultiItem, uniComboBox, ComboboxYeni,
  uniImage, FMTBcd, DB, DBClient, uniPanel, uniGUIApplication, uADCompClient,
  uADPhysMySQL, uADCompGUIx, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet;

type
  TFormConfirmacao_Pagamento_Recebimento = class(TUniForm)
    pn_principal: TUniPanel;
    pn_juros: TUniPanel;
    pn_detalhes: TUniPanel;
    edt_data: TUniDateTimePicker;
    lb_data: TUniLabel;
    cmb_forma: TComboBoxYeni;
    lb_forma: TUniLabel;
    lb_valor: TUniLabel;
    bt_incluir: TUniBitBtn;
    lb_multa: TUniLabel;
    lb_juros: TUniLabel;
    lb_desconto: TUniLabel;
    dbg: TUniDBGrid;
    lb_saldo: TUniLabel;
    lb_valor_saldo: TUniLabel;
    lb_tot_valor: TUniLabel;
    lb_tot_valor_saldo: TUniLabel;
    DS: TDataSource;
    bt_informacoes: TUniBitBtn;
    edt_valor: TUniEdit;
    edt_val_multa: TUniEdit;
    edt_val_juros: TUniEdit;
    edt_val_desconto: TUniEdit;
    bt_excluir: TUniBitBtn;
    pn_conf_pag: TUniPanel;
    bt_confirmar: TUniBitBtn;
    ADQuery: TADQuery;
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure bt_informacoesClick(Sender: TObject);
    procedure bt_incluirClick(Sender: TObject);
    procedure bt_confirmarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure edt_valorExit(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    SQLQuery                                                                    :TADQuery;
    Conexao_Local                                                               :TADConnection;

    parcela                                                                     :Integer;
    var_modulo                                                                  :String;
    valor_saldo, valor                                                          :Real;
    procedure atualiza_totais;
  public
    { Public declarations }
    function pagamento(id_parcela :Integer; modulo: String; Conexao :TADConnection): String;            {Função que recebe a PARCELA/MODULO de uma fonte externa e repassa os valore para variaveis locais}

  end;

function FormConfirmacao_Pagamento_Recebimento: TFormConfirmacao_Pagamento_Recebimento;

implementation

{$R *.dfm}

uses
  MainModule, U_Sessao, U_Global, U_DM, U_Carrega_Combo,
  U_Financeiro, U_Verifica_Campo_Null, U_Contas_a_Pagar;

function FormConfirmacao_Pagamento_Recebimento: TFormConfirmacao_Pagamento_Recebimento;
begin
  Result := TFormConfirmacao_Pagamento_Recebimento(ID.GetFormInstance(TFormConfirmacao_Pagamento_Recebimento));
end;

procedure TFormConfirmacao_Pagamento_Recebimento.bt_confirmarClick(Sender: TObject);
begin
  try
    if var_modulo = 'CAP' then
      begin
        with SQLQuery do
          begin
            SQL.Clear;
            SQL.Add('UPDATE CAP_AP SET VAL_JUROS     = :P00,                 ');
            SQL.Add('                  VAL_MULTA     = :P01,                 ');
            SQL.Add('                  VAL_DESCONTO  = :P02                  ');
            SQL.Add(' WHERE ID_MASTER     = :P03                             ');
            SQL.Add('   AND ID_EMPRESA    = :P04                             ');
            SQL.Add('   AND ID_CAP_AP     = :P05                             ');
            Params[00].AsFloat   := StrToFloat(edt_val_juros.Text);
            Params[01].AsFloat   := StrToFloat(edt_val_multa.Text);
            Params[02].AsFloat   := StrToFloat(edt_val_desconto.Text);
            Params[03].AsInteger := ID.id_glo_master;
            Params[04].AsInteger := ID.id_glo_empresa;
            Params[05].AsInteger := DS.DataSet.FieldByName('ID_CAP_AP').AsInteger;
            ExecSQL;
          end;
      end;

    if var_modulo = 'CRE' then
      begin
        with SQLQuery do
          begin
            SQL.Clear;
            SQL.Add('UPDATE CRE_PAR SET VAL_JUROS     = :P00                 ');
            SQL.Add(' WHERE ID_MASTER     = :P01                             ');
            SQL.Add('   AND ID_EMPRESA    = :P02                             ');
            SQL.Add('   AND ID_CRE_PAR    = :P03                             ');
            Params[00].AsFloat   := StrToFloat(edt_val_juros.Text);
            Params[01].AsInteger := ID.id_glo_master;
            Params[02].AsInteger := ID.id_glo_empresa;
            Params[03].AsInteger := DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger;
            ExecSQL;
          end;
      end;

    Close;
  except
    on e: exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.bt_excluirClick(
  Sender: TObject);
var
  Financeiro                                                                    :TFinanceiro;
  id_parcela, id_parcela_valor                                                  :Integer;
begin
  try

    if var_modulo = 'CAP' then
      begin
        id_parcela_valor := DS.DataSet.FieldByName('ID_CAP_AP_VALORES').AsInteger;
        id_parcela       := DS.DataSet.FieldByName('ID_CAP_AP').AsInteger;

        Financeiro  := remove_baixa_ap(id_parcela_valor, id_parcela, Conexao_Local);
      end;

    if var_modulo = 'CRE' then
      begin
        id_parcela_valor := DS.DataSet.FieldByName('ID_CRE_PAR_VALORES').AsInteger;
        id_parcela       := DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger;

        Financeiro  := remove_baixa_par(id_parcela_valor, id_parcela, Conexao_Local);
      end;

    if Financeiro.Erro then
      raise Exception.Create(Financeiro.Msg_Erro);

    if Not(Financeiro.Alerta) then
      begin
        DS.DataSet.Close;
        (DS.DataSet as TADQuery).Params[00].AsInteger  := ID.id_glo_master;
        (DS.DataSet as TADQuery).Params[01].AsInteger  := ID.id_glo_empresa;
        (DS.DataSet as TADQuery).Params[02].AsInteger  := parcela;
        DS.DataSet.Open;

        atualiza_totais;
      end;

  except
    on e: exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.bt_incluirClick(
  Sender: TObject);
var
  Financeiro                                                                    :TFinanceiro;
  id_contas                                                                     :Integer;
  valor, valor_juros, valor_multa, valor_desconto                               :Real;
  data                                                                          :Tdate;
begin
  try
    if cmb_forma.Text = EmptyStr then
      begin
        ShowMessage(lb_forma.Caption+' Não Informada.');
        Exit;
      end;

    if Verifica_Edit(TUniForm(Self)) then
      begin
        if var_modulo = 'CAP' then
          begin
            id_contas       := StrToInt(cmb_forma.Value);
            valor           := StrToFloat(edt_valor.Text);
            valor_juros     := StrToFloat(edt_val_juros.Text);
            valor_multa     := StrToFloat(edt_val_multa.Text);
            valor_desconto  := StrToFloat(edt_val_desconto.Text);
            data            := edt_data.DateTime;

            Financeiro  := baixa_ap(parcela,id_contas,valor,valor_juros,valor_multa,valor_desconto,data,Conexao_Local);
          end;

        if var_modulo = 'CRE' then
          begin
            id_contas       := StrToInt(cmb_forma.Value);
            valor           := StrToFloat(edt_valor.Text);
            valor_juros     := StrToFloat(edt_val_juros.Text);
            data            := edt_data.DateTime;

            Financeiro  := baixa_par(parcela,id_contas,valor,valor_juros,data,Conexao_Local);
          end;

        if Financeiro.Erro then
          raise Exception.Create(Financeiro.Msg_Erro);

        if Not(Financeiro.Alerta) then
          begin
            DS.DataSet.Close;
            (DS.DataSet as TADQuery).Params[00].AsInteger  := ID.id_glo_master;
            (DS.DataSet as TADQuery).Params[01].AsInteger  := ID.id_glo_empresa;
            (DS.DataSet as TADQuery).Params[02].AsInteger  := parcela;
            DS.DataSet.Open;

            atualiza_totais;
          end;
      end;

  except
    on e: exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.bt_informacoesClick(Sender: TObject);
begin
  if pn_juros.Visible then
    begin
      pn_juros.Visible                    := False;
      Self.Height := 260;
      Exit;
    end;
  if Not(pn_juros.Visible) then
    begin
      pn_juros.Visible                    := True;
      Self.Height := 310;
      Exit;
    end;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.DSDataChange(Sender: TObject;
  Field: TField);
begin
  if Not(DS.DataSet.State in [dsInsert, dsEdit]) then
    begin
      if Not(DS.DataSet.IsEmpty) then
        bt_excluir.Visible  := True;

    end;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.edt_valorExit(Sender: TObject);
begin
  FormataValor(TUniEdit(Sender));
end;

function TFormConfirmacao_Pagamento_Recebimento.pagamento(id_parcela:Integer; modulo: String; Conexao :TADConnection): String;
begin
  try
    SQLQuery          := TADQuery.Create(Self);
    Conexao_Local     := Conexao;

    Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

    edt_data.DateTime := Now;

    parcela           := id_parcela;
    var_modulo        := modulo;

    {Carrega as Fontes de Pagamento/Recebimento}
    combo(TUniForm(Self),cmb_forma,'CONTAS',Conexao);

    if var_modulo = 'CAP' then
      begin
        Self.Caption              := 'Pagamento';

        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT COUNT(*) FROM CAP_AP      A                '+
                         ' WHERE A.ID_MASTER               = :P00           '+
                         '   AND A.ID_EMPRESA              = :P01           '+
                         '   AND A.ID_CAP_AP               = :P02           '+
                         '   AND A.TIP_PAGAMENTO           = ''T''          ');
        SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
        SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
        SQLQuery.Params[02].AsInteger  := parcela;
        SQLQuery.Open;
        if SQLQuery.Fields[0].AsInteger = 1 then
          begin
            ShowMessage('Atenção!<br><br>'+
                        'Este Documento já está Pago. Favor Consultar novamente.');
            Self.Close;
            Exit;
          end;

        ADQuery.SQL.Clear;
        ADQuery.SQL.Add('SELECT B.ID_CAP_AP_VALORES,                                             '+
                        '       A.ID_CAP_AP,                                                     '+
                        '       A.TIP_PAGAMENTO,                                                 '+
                        '       A.DAT_VENCIMENTO,                                                '+
                        '       B.DAT_PAGAMENTO,                                                 '+
                        '       C.TIPO,                                                          '+
                        '       A.VAL_PARCELA            VALOR_TOTAL,                            '+
                        '       B.VALOR                  VALOR_PAGO,                             '+
                        '       IFNULL(A.VAL_JUROS,0)    VALOR_JUROS,                            '+
                        '       IFNULL(A.VAL_MULTA,0)    VALOR_MULTA,                            '+
                        '       IFNULL(A.VAL_DESCONTO,0) VALOR_DESCONTO                          '+
                        '  FROM CAP_AP                       A                                   '+
                        '  LEFT OUTER JOIN CAP_AP_VALORES    B ON A.ID_MASTER  = B.ID_MASTER     '+
                        '                                     AND A.ID_EMPRESA = B.ID_EMPRESA    '+
                        '                                     AND A.ID_CAP_AP  = B.ID_CAP_AP     '+
                        '  LEFT OUTER JOIN CONTAS            C ON A.ID_MASTER  = C.ID_MASTER     '+
                        '                                     AND A.ID_EMPRESA = C.ID_EMPRESA    '+
                        '                                     AND B.ID_CONTAS  = C.ID_CONTAS     '+
                        ' WHERE A.ID_MASTER     = :ID_MASTER                                     '+
                        '   AND A.ID_EMPRESA    = :ID_EMPRESA                                    '+
                        '   AND A.ID_CAP_AP     = :ID_CAP_AP                                     ');

        lb_data.Caption           := 'Data de Pagamento:';
        lb_forma.Caption          := 'Forma de Pagamento:';
        lb_valor.Caption          := 'Valor Pago:';
        lb_saldo.Caption          := 'Saldo à Pagar:';
        lb_tot_valor.Caption      := 'Valor Pago:';

        bt_incluir.Hint           := 'Incluir Pagamento';
        bt_informacoes.Hint       := 'Informar Descontos, Juros ou Multas';
        bt_excluir.Hint           := 'Excluir Pagamento';
        bt_confirmar.Hint         := 'Confirma o Pagamento';

        lb_desconto.Visible       := True;
        lb_multa.Visible          := True;
        edt_val_desconto.Visible  := True;
        edt_val_multa.Visible     := True;

        DS.DataSet.Close;
        (DS.DataSet as TADQuery).Params[00].AsInteger  := ID.id_glo_master;
        (DS.DataSet as TADQuery).Params[01].AsInteger  := ID.id_glo_empresa;
        (DS.DataSet as TADQuery).Params[02].AsInteger  := parcela;
        DS.DataSet.Open;

        (DS.DataSet.FieldByName('VALOR_TOTAL') as TBCDField).currency       := True;
        (DS.DataSet.FieldByName('VALOR_PAGO') as TBCDField).currency        := True;
        (DS.DataSet.FieldByName('VALOR_JUROS') as TBCDField).currency       := True;
        (DS.DataSet.FieldByName('VALOR_MULTA') as TBCDField).currency       := True;
        (DS.DataSet.FieldByName('VALOR_DESCONTO') as TBCDField).currency    := True;

        dbg.Columns[0].FieldName      := 'DAT_PAGAMENTO';
        dbg.Columns[0].Title.Caption  := 'Data Pagamento';
        dbg.Columns[1].Title.Caption  := 'Forma de Pagamento';
        dbg.Columns[2].Title.Caption  := 'Valor Pago';

        edt_val_juros.Text        := DS.DataSet.FieldByName('VALOR_JUROS').AsString;
        edt_val_desconto.Text     := DS.DataSet.FieldByName('VALOR_DESCONTO').AsString;
        edt_val_multa.Text        := DS.DataSet.FieldByName('VALOR_MULTA').AsString;
      end;

    if var_modulo = 'CRE' then
      begin
        Self.Caption              := 'Recebimento';

        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT COUNT(*) FROM CRE_PAR     A                '+
                         ' WHERE A.ID_MASTER               = :P00           '+
                         '   AND A.ID_EMPRESA              = :P01           '+
                         '   AND A.ID_CRE_PAR              = :P02           '+
                         '   AND A.TIP_RECEBIMENTO         = ''T''          ');
        SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
        SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
        SQLQuery.Params[02].AsInteger  := parcela;
        SQLQuery.Open;
        if SQLQuery.Fields[0].AsInteger = 1 then
          begin
            ShowMessage('Atenção!<br><br>'+
                        'Este Documento já foi recebido. Favor Consultar novamente.');
            Self.Close;
            Exit;
          end;

        ADQuery.SQL.Clear;
        ADQuery.SQL.Add('SELECT B.ID_CRE_PAR_VALORES,                                           '+
                        '       A.ID_CRE_PAR,                                                   '+
                        '       A.TIP_RECEBIMENTO,                                              '+
                        '       A.DAT_VENCIMENTO,                                               '+
                        '       B.DAT_RECEBIMENTO,                                              '+
                        '       C.TIPO,                                                         '+
                        '       A.VAL_PARCELA            VALOR_TOTAL,                           '+
                        '       B.VALOR                  VALOR_PAGO,                            '+
                        '       IFNULL(A.VAL_JUROS,0)    VALOR_JUROS                            '+
                        '  FROM CRE_PAR                      A                                  '+
                        '  LEFT OUTER JOIN CRE_PAR_VALORES   B ON A.ID_MASTER  = B.ID_MASTER    '+
                        '                                     AND A.ID_EMPRESA = B.ID_EMPRESA   '+
                        '                                     AND A.ID_CRE_PAR = B.ID_CRE_PAR   '+
                        '  LEFT OUTER JOIN CONTAS            C ON A.ID_MASTER  = C.ID_MASTER    '+
                        '                                     AND A.ID_EMPRESA = C.ID_EMPRESA   '+
                        '                                     AND B.ID_CONTAS  = C.ID_CONTAS    '+
                        ' WHERE A.ID_MASTER     = :ID_MASTER                                    '+
                        '   AND A.ID_EMPRESA    = :ID_EMPRESA                                   '+
                        '   AND A.ID_CRE_PAR    = :ID_CRE_PAR                                   ');

        lb_data.Caption           := 'Data de Recebimento:';
        lb_forma.Caption          := 'Forma de Recebimento:';
        lb_valor.Caption          := 'Valor Recebido:';
        lb_saldo.Caption          := 'Saldo à Receber:';
        lb_tot_valor.Caption      := 'Valor Recebido:';

        bt_incluir.Hint           := 'Incluir Recebimento';
        bt_informacoes.Hint       := 'Informar Juros';
        bt_excluir.Hint           := 'Excluir Recebimento';
        bt_confirmar.Hint         := 'Confirma o Recebimento';

        lb_desconto.Visible       := False;
        lb_multa.Visible          := False;
        edt_val_desconto.Visible  := False;
        edt_val_multa.Visible     := False;

        DS.DataSet.Close;
        (DS.DataSet as TADQuery).Params[00].AsInteger  := ID.id_glo_master;
        (DS.DataSet as TADQuery).Params[01].AsInteger  := ID.id_glo_empresa;
        (DS.DataSet as TADQuery).Params[02].AsInteger  := parcela;
        DS.DataSet.Open;

        (DS.DataSet.FieldByName('VALOR_TOTAL') as TBCDField).currency     := True;
        (DS.DataSet.FieldByName('VALOR_PAGO') as TBCDField).currency      := True;
        (DS.DataSet.FieldByName('VALOR_JUROS') as TBCDField).currency     := True;

        dbg.Columns[0].FieldName      := 'DAT_RECEBIMENTO';
        dbg.Columns[0].Title.Caption  := 'Data Recebimento';
        dbg.Columns[1].Title.Caption  := 'Forma de Recebimento';
        dbg.Columns[2].Title.Caption  := 'Valor Recebido';

        edt_val_juros.Text        := DS.DataSet.FieldByName('VALOR_JUROS').AsString;
      end;

    atualiza_totais;
  except
    on e: exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),var_modulo,e.UnitName,e.ClassName,e.Message);
      end;
  end;

end;

procedure TFormConfirmacao_Pagamento_Recebimento.UniFormDestroy(Sender: TObject);
begin
  if var_modulo = 'CAP' then
    ID.alt_inf_pag  := True;
  if var_modulo = 'CRE' then
    ID.alt_inf_rec  := True;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.UniFormShow(Sender: TObject);
begin
  Self.Height := 260;
end;

procedure TFormConfirmacao_Pagamento_Recebimento.atualiza_totais;
begin
  valor_saldo   := 0;
  valor         := 0;

  DS.DataSet.First;
  while Not(DS.DataSet.Eof) do
    begin
      valor  := valor + DS.DataSet.FieldByName('VALOR_PAGO').AsFloat;
      DS.DataSet.Next
    end;

  valor_saldo := (DS.DataSet.FieldByName('VALOR_TOTAL').AsFloat - valor);

  lb_valor_saldo.Caption      := FormatFloat('R$ ###,##,0.00', valor_saldo);
  lb_tot_valor_saldo.Caption  := FormatFloat('R$ ###,##,0.00', valor);
end;

end.
