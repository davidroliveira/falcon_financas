unit U_Contas_a_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, uniScrollBox,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses, uniPanel,
  uniGUIClasses, uniGUIFrame, U_Cad_Heranca_Frame, uniImageList, uniStatusBar,
  uniPageControl, uniToolBar, uniGUIBaseClasses, uniBitBtn, uniBasicGrid,
  uniDBGrid, uniDBText, uniDBEdit, uniButton, uniSpeedButton, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniEdit, uniMultiItem, uniComboBox,
  ComboboxYeni, uniLabel, uniImage, uniRadioButton, U_Filtro_Calendario,
  uniCheckBox, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  uADCompDataSet, uADCompClient, Vcl.Menus, uniMainMenu, uniFileUpload, uniTimer,
  Data.DB;

type
  TFrameContas_a_Receber = class(TFrameCad_Heranca_Frame)
    pn_tipo: TUniPanel;
    rdb_tip_normal: TUniRadioButton;
    rdb_tip_recorrente: TUniRadioButton;
    rdb_tip_parcelado: TUniRadioButton;
    UniImage2: TUniImage;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    pn_principal: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    cmb_tipo_receita: TComboBoxYeni;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    cmb_cliente: TComboBoxYeni;
    UniLabel5: TUniLabel;
    lb_n_parcelas: TUniLabel;
    UniLabel7: TUniLabel;
    lb_forma_recebimento: TUniLabel;
    DB_Descricao: TUniDBEdit;
    DB_Data_Vencimento: TUniDBDateTimePicker;
    DB_Periodo: TUniDBComboBox;
    DB_Documento: TUniDBEdit;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    DB_Parcelas: TUniDBNumberEdit;
    DB_Valor: TUniDBEdit;
    DB_Parcela: TUniDBText;
    pn_inf_recebimento: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniBitBtn1: TUniBitBtn;
    bt_informacoes: TUniBitBtn;
    pn_inf_juros: TUniPanel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    DB_Val_Juros: TUniDBEdit;
    DB_Val_Desconto: TUniDBEdit;
    pn_inf_anexo: TUniPanel;
    UniDBGrid2: TUniDBGrid;
    bt_anexar_mais: TUniBitBtn;
    bt_excluir_anexo: TUniBitBtn;
    pn_meses: TUniPanel;
    pn_ano: TUniPanel;
    bt_ano_seguinte: TUniBitBtn;
    bt_ano_anterior: TUniBitBtn;
    lb_ano: TUniLabel;
    bt_set: TUniBitBtn;
    bt_mai: TUniBitBtn;
    bt_abr: TUniBitBtn;
    bt_mar: TUniBitBtn;
    bt_fev: TUniBitBtn;
    bt_jan: TUniBitBtn;
    bt_ago: TUniBitBtn;
    bt_dez: TUniBitBtn;
    bt_jul: TUniBitBtn;
    bt_jun: TUniBitBtn;
    bt_nov: TUniBitBtn;
    bt_out: TUniBitBtn;
    chk_filtros_avancados: TUniCheckBox;
    pn_filtros_avancados: TUniPanel;
    bt_pesquisa: TUniBitBtn;
    rdb_recebido: TUniRadioButton;
    rdb_a_receber: TUniRadioButton;
    UniRadioButton1: TUniRadioButton;
    data_inicial: TUniDateTimePicker;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    data_final: TUniDateTimePicker;
    edt_pesq_descricao: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel8: TUniLabel;
    edt_pesq_cliente: TUniEdit;
    edt_pesq_num_doc: TUniEdit;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    edt_pesq_tipo_receita: TUniEdit;
    dbg_pesquisa: TUniDBGrid;
    bt_receber: TUniToolButton;
    bt_anexar: TUniToolButton;
    ADQuery: TADQuery;
    ADQueryID_MASTER: TIntegerField;
    ADQueryID_EMPRESA: TIntegerField;
    ADQueryID_CRE_DOC: TADAutoIncField;
    ADQueryID_CRE_PAR: TIntegerField;
    ADQueryDESCRICAO_DOCUM: TWideStringField;
    ADQueryNUM_DOCUM: TWideStringField;
    ADQueryTIPO_DOCUM: TWideStringField;
    ADQueryTIPO_DOCUM_SITUACAO: TWideStringField;
    ADQueryPERIODO: TWideStringField;
    ADQueryNUM_PARCELAS: TWideStringField;
    ADQueryPARCELA: TIntegerField;
    ADQueryVAL_PARCELA: TBCDField;
    ADQueryVAL_JUROS: TBCDField;
    ADQueryID_TIPO_RECEITA: TIntegerField;
    ADQueryDESCRICAO_RECEITA: TWideStringField;
    ADQueryID_F_C: TIntegerField;
    ADQueryRAZAO_SOCIAL: TWideStringField;
    ADQueryDAT_VENCIMENTO: TDateField;
    ADQueryDAT_RECEBIMENTO: TDateField;
    ADQueryTIP_RECEBIMENTO: TWideStringField;
    ADQueryVAL_PAGO: TFMTBCDField;
    ADQueryIMG_STATUS: TStringField;
    ADQueryIMG_TIPO: TStringField;
    Timer: TUniTimer;
    FileUpload: TUniFileUpload;
    Popup: TUniPopupMenu;
    ExportaParaExcel1: TUniMenuItem;
    ADQueryRecebimento: TADQuery;
    DSRecebimento: TDataSource;
    ADQueryRecebimentoID_CRE_PAR_VALORES: TADAutoIncField;
    ADQueryRecebimentoDAT_RECEBIMENTO: TDateField;
    ADQueryRecebimentoVALOR: TBCDField;
    ADQueryRecebimentoTIPO: TWideStringField;
    ADQueryRecebimentoNOME_CONTA: TWideStringField;
    ADQueryRecebimentoNOME_BANCO: TWideStringField;
    ADQueryAnexo: TADQuery;
    ADQueryAnexoID_CAP_AD_ANEXO: TADAutoIncField;
    ADQueryAnexoNOME_ANEXO: TWideStringField;
    ADQueryAnexoANEXO: TBlobField;
    DSAnexo: TDataSource;
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure DB_ValorExit(Sender: TObject);
    procedure cmb_tipo_receitaClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure DB_ParcelasExit(Sender: TObject);
    procedure rdb_tip_normalClick(Sender: TObject);
    procedure CDSIMG_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure CDSIMG_TIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure chk_filtros_avancadosClick(Sender: TObject);
    procedure bt_janClick(Sender: TObject);
    procedure bt_ano_anteriorClick(Sender: TObject);
    procedure bt_ano_seguinteClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure cmb_clienteClick(Sender: TObject);
    procedure ADQueryIMG_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADQueryIMG_TIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_receberClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure bt_informacoesClick(Sender: TObject);
    procedure FileUploadCompleted(Sender: TObject; AStream: TFileStream);
    procedure bt_anexar_maisClick(Sender: TObject);
    procedure bt_excluir_anexoClick(Sender: TObject);
    procedure UniDBGrid2DblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure bt_anexarClick(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;

    pos_cds, mes, ano                                                           :Integer;
    pesquisa_avancada, nao_valida_edicao                                        :Boolean; //Indica se Foi Selecionada a Pesquisa Avançada

    Filtro                                                                      :TFiltro; //Utilizado Para controle do Mes e Ano Selecionado

    procedure atualiza_info_rec(id_cre_par: Integer);                           //Atualiza Os Valores Recebidos da PAR
    procedure atualiza_info_anexo(id_cre_doc :Integer);                         //Atualiza as Informações dos Anexos
    procedure status_rd_button;                                                 //Atualiza o Status do Rdb

    function documento_recebido(id_cre_par :Integer): Boolean;                  //Verifica se a Parcela Passado como Parâmetro está Recebida.
    function insere_anexo(id_cre_doc: Integer): String;                         //Insere Anexo

    procedure pesquisa(pesquisa_avancada:Boolean; mes, ano :Integer);           //Realiza a pesquisa Fixa(Ano/Mes) ou a pesquisa avançada.
  public
    { Public declarations }
  end;

implementation

uses U_Cad_Cliente_Fornecedor, U_Cad_Tipo_Receita, U_Global, U_Carrega_Combo,
  uniGUIForm, U_Sessao, U_DM, MainModule, U_Financeiro, U_JS_Humane,
  U_Verifica_Campo_Null, U_Confirmacao_Exclusao,
  U_Confirmacao_Pagamento_Recebimento, uniGUIApplication;

{$R *.dfm}

procedure TFrameContas_a_Receber.ADQueryIMG_STATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'A' then
    Text:= '<img src="../imagens/16/status_vermelho.png" />';
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'P' then
    Text:= '<img src="../imagens/16/status_amarelo.png" />';
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'T' then
    Text:= '<img src="../imagens/16/status_verde.png" />';
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = EmptyStr then
    Text:= '<img src="../imagens/16/new.png" />'
end;

procedure TFrameContas_a_Receber.ADQueryIMG_TIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'N' then
    Text:= '<img src="../imagens/16/status_grey_N.png" />';
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'R' then
    Text:= '<img src="../imagens/16/status_grey_R.png" />';
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'P' then
    Text:= '<img src="../imagens/16/status_grey_P.png" />'+'('+DS.DataSet.FieldByName('PARCELA').AsString+'/'+
                                                               DS.DataSet.FieldByName('NUM_PARCELAS').AsString+
                                                           ')';
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = EmptyStr then
    Text:= '<img src="../imagens/16/new.png" />'
end;

procedure TFrameContas_a_Receber.bt_anexarClick(Sender: TObject);
begin
  inherited;
  FileUpload.Execute;
end;

procedure TFrameContas_a_Receber.bt_anexar_maisClick(Sender: TObject);
begin
  inherited;
  FileUpload.Execute;
end;

procedure TFrameContas_a_Receber.bt_ano_anteriorClick(Sender: TObject);
begin
  inherited;
  lb_ano.Caption  := IntToStr(StrToInt(lb_ano.Caption) - 1);

  ano               := StrToInt(lb_ano.Caption);
  pesquisa_avancada := False;

  pesquisa(pesquisa_avancada,mes,ano);
end;

procedure TFrameContas_a_Receber.bt_ano_seguinteClick(Sender: TObject);
begin
  inherited;
  lb_ano.Caption  := IntToStr(StrToInt(lb_ano.Caption) + 1);

  ano               := StrToInt(lb_ano.Caption);
  pesquisa_avancada := False;

  pesquisa(pesquisa_avancada,mes,ano);
end;

procedure TFrameContas_a_Receber.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  if Transaction.Active then
    Transaction.Rollback;
end;

procedure TFrameContas_a_Receber.bt_excluirClick(Sender: TObject);
var
  tipo_docum  :String;
  Financeiro  :TFinanceiro;
  id_documento, id_parcela:Integer;
begin
  MessageDlg('Deseja realmente excluir?', mtConfirmation, mbYesNo, procedure(Res: Integer)
  begin
    if Res = mrYes then
      begin
        try
          if Not DS.DataSet.IsEmpty then
            begin
              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('SELECT TIPO_DOCUM FROM CRE_DOC                  '+
                               ' WHERE ID_MASTER     = :P00                     '+
                               '   AND ID_EMPRESA    = :P01                     '+
                               '   AND ID_CRE_DOC    = :P02                     ');
              SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
              SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
              SQLQuery.Params[02].AsInteger  := DS.DataSet.FieldByName('ID_CRE_DOC').AsInteger;
              SQLQuery.Open;

              tipo_docum  := SQLQuery.Fields[0].AsString;
              id_documento:= DS.DataSet.FieldByName('ID_CRE_DOC').AsInteger;
              id_parcela  := DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger;

              if tipo_docum = 'R' then //Parcelas Recorrentes
                begin
                  FormConfirmacao_Exclusao.ShowModal;
                  FormConfirmacao_Exclusao.exclusao_parcela_recorrente(id_documento, id_parcela,'CRE');
                  Timer.Enabled := True;

                  Exit;
                end;
              if (tipo_docum = 'N') or (tipo_docum = 'P') then //Parcelas Normais e Parceladas
                begin
                  if Not(Transaction.Active) then
                    Transaction.StartTransaction;

                  Financeiro  := exclusao_par(id_documento, id_parcela,0,tipo_docum,Conexao);

                  if Financeiro.Alerta then
                    Exit;

                  if Financeiro.Erro then
                    raise Exception.Create(Financeiro.Msg_Erro);
                end;

             DS.DataSet.Delete;
             Transaction.Commit;

             UniStatusBar1.Panels.Items[0].Text:= 'Exclusão efetuada com Sucesso.';
             humane.success('<div> <p><img src= imagens/32/empty.png </> '+
                            'Exclusão efetuada com Sucesso.</p> </div>',2500,True);
           end
          else
            UniStatusBar1.Panels.Items[0].Text:= 'Não existem registros para serem excluidos!';
         except
           on e: exception do
             begin
               DS.DataSet.Cancel;
               Transaction.Rollback;
               if Copy(E.Message,0,59) = '[FireDAC][Phys][MySQL] Cannot delete or update a parent row' then
                begin
                  ShowMessage('Atenção!<br><br> '+
                              '<div> <p><img src="imagens\warning.png" align="left"/> Não é possivel excluir, o mesmo possui dependências com outros regitros!</p> </div>');
                end
               else
                 RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);

               UniStatusBar1.Panels.Items[0].Text:='Exclusão Cancelada!';
               Exit;
             end;
         end;
      end;
  end
  );

end;

procedure TFrameContas_a_Receber.bt_excluir_anexoClick(Sender: TObject);
begin
  inherited;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('DELETE FROM CRE_DOC_ANEXO            '+
                   ' WHERE ID_MASTER         = :P00      '+
                   '   AND ID_EMPRESA        = :P01      '+
                   '   AND ID_CRE_DOC_ANEXO  = :P02      ');
  SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
  SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
  SQLQuery.Params[02].AsInteger  := DSAnexo.DataSet.FieldByName('ID_CRE_DOC_ANEXO').AsInteger;
  SQLQuery.ExecSQL;

  if Not(DSAnexo.DataSet.isEmpty) then
    DSAnexo.DataSet.Delete;
end;

procedure TFrameContas_a_Receber.bt_informacoesClick(Sender: TObject);
begin
  inherited;
  if pn_inf_juros.Visible then
    pn_inf_juros.Visible  := False
  else
    pn_inf_juros.Visible  := True;
end;

procedure TFrameContas_a_Receber.bt_janClick(Sender: TObject);
begin
  inherited;
  Filtro  := controles(TUniFrame(Self),pn_meses,TUniBitBtn(Sender),lb_ano);

  mes               := Filtro.mes;
  ano               := Filtro.ano;
  pesquisa_avancada := False;

  pesquisa(pesquisa_avancada,mes,ano);
end;

procedure TFrameContas_a_Receber.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  Filtro  := controles_remove_filtro(TUniFrame(Self),pn_meses);

  mes               := Filtro.mes;
  ano               := Filtro.ano;

  pesquisa_avancada := True;
  pesquisa(pesquisa_avancada,mes,ano);
end;

procedure TFrameContas_a_Receber.bt_receberClick(Sender: TObject);
begin
  inherited;
  FormConfirmacao_Pagamento_Recebimento.ShowModal;
  FormConfirmacao_Pagamento_Recebimento.pagamento(DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger,'CRE', Conexao);
  Timer.Enabled := True;
end;

procedure TFrameContas_a_Receber.bt_salvarClick(Sender: TObject);
var
  id_documento, id_parcela                                                      :Integer;
  Financeiro                                                                    :TFinanceiro;
  des_docum, docum, tipo, periodo, parcelas, id_tip_receita,
  id_cliente                                                                    :String;
  valor, valor_juros, valor_desconto                                            :Real;
  vencimento                                                                    :Tdate;
begin
  //inherited;
  if Verifica_Edit(TUniForm(Self)) then
    begin
      try
        if Not(Transaction.Active) then
          Transaction.StartTransaction;

        RemoveAspas(TUniForm(Self));

        des_docum       := DB_Descricao.Text;
        docum           := DB_Documento.Text;
        id_tip_receita  := cmb_tipo_receita.Value;
        id_cliente      := cmb_cliente.Value;
        vencimento      := DB_Data_Vencimento.Field.AsDateTime;
        valor           := DB_Valor.Field.AsFloat;
        id_documento    := DS.DataSet.FieldByName('ID_CRE_DOC').AsInteger;
        id_parcela      := DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger;

        {Simulando CDS}
        DS.DataSet.FieldByName('ID_TIPO_RECEITA').AsString   := id_tip_receita;
        DS.DataSet.FieldByName('DESCRICAO_RECEITA').AsString := cmb_tipo_receita.Text;
        DS.DataSet.FieldByName('ID_F_C').AsString            := id_cliente;
        DS.DataSet.FieldByName('RAZAO_SOCIAL').AsString      := cmb_cliente.Text;

        if rdb_tip_normal.Checked then
          begin
            tipo                                      := 'N';
            DS.DataSet.FieldByName('TIPO_DOCUM').AsString    := 'N';
            periodo                                   := EmptyStr;
            parcelas                                  := '0';
          end;
        if rdb_tip_recorrente.Checked then
          begin
            if DB_Periodo.Text = EmptyStr then
              begin
                ShowMessage('Periodo Não Informado!');
                Exit;
              end;
            tipo                                      := 'R';
            DS.DataSet.FieldByName('TIPO_DOCUM').AsString    := 'R';
            periodo                                   := DB_Periodo.Text;
            parcelas                                  := '0';
          end;
        if rdb_tip_parcelado.Checked then
          begin
            if DB_Periodo.Text = EmptyStr then
              begin
                ShowMessage('Periodo Não Informado!');
                Exit;
              end;
            if DB_Parcelas.Text = EmptyStr then
              begin
                ShowMessage('Número de Parcelas Não Informado!');
                Exit;
              end;
            tipo                                      := 'P';
            DS.DataSet.FieldByName('TIPO_DOCUM').AsString    := 'P';
            periodo                                   := DB_Periodo.Text;
            parcelas                                  := DB_Parcelas.Text;
          end;

        if DS.DataSet.State in [dsInsert] then
          begin

            Financeiro := inclui_cre_par(des_docum, docum, tipo, periodo, parcelas, id_tip_receita, id_cliente, valor, vencimento, Conexao);

            if Financeiro.Erro then
              raise Exception.Create(Financeiro.Msg_Erro);

            DS.DataSet.FieldByName('ID_CRE_DOC').AsString := Financeiro.documento;
            DS.DataSet.FieldByName('ID_CRE_PAR').AsString := Financeiro.parcela;

            insere_anexo(StrToInt(Financeiro.documento));

            Transaction.Commit;
            DS.DataSet.Post;

            UniStatusBar1.Panels.Items[0].Text := 'Registro incluído com Sucesso.';
            humane.success('<div> <img src= imagens/32/tick_blue.png </> '+
                           'Registro incluído com Sucesso. </div>',2500,True);
          end;

        if DS.DataSet.State in [dsEdit] then
          begin

            valor_juros     := DB_Val_Juros.Field.AsFloat;
            //valor_desconto  := DB_Val_Desconto.Field.AsFloat;

            Financeiro := altera_doc_par(id_documento, id_parcela, des_docum, docum, tipo, periodo, parcelas, id_tip_receita, id_cliente, valor, valor_juros, vencimento, Conexao);

            if Financeiro.Erro then
              raise Exception.Create(Financeiro.Msg_Erro);

            insere_anexo(id_documento);

            Transaction.Commit;
            DS.DataSet.Post;

            UniStatusBar1.Panels.Items[0].Text := 'Registro Alterado com Sucesso.';
            humane.success('<div> <img src= imagens/32/tick_blue.png </> '+
                           'Registro alterado com Sucesso. </div>',2500,True);
          end;

      except
        on e: exception do
          begin
            Transaction.Rollback;
            RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
          end;
      end;
    end;

end;

procedure TFrameContas_a_Receber.CDSIMG_STATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'A' then
    Text:= '<img src="../imagens/16/status_vermelho.png" />';
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'P' then
    Text:= '<img src="../imagens/16/status_amarelo.png" />';
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'T' then
    Text:= '<img src="../imagens/16/status_verde.png" />';
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = EmptyStr then
    Text:= '<img src="../imagens/16/new.png" />'
end;

procedure TFrameContas_a_Receber.CDSIMG_TIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'N' then
    Text:= '<img src="../imagens/16/status_grey_N.png" />';
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'R' then
    Text:= '<img src="../imagens/16/status_grey_R.png" />';
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'P' then
    Text:= '<img src="../imagens/16/status_grey_P.png" />'+DS.DataSet.FieldByName('PARCELA').AsString;
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = EmptyStr then
    Text:= '<img src="../imagens/16/new.png" />'
end;

procedure TFrameContas_a_Receber.chk_filtros_avancadosClick(Sender: TObject);
begin
  inherited;
  pn_filtros_avancados.Visible:= chk_filtros_avancados.Checked;
end;

procedure TFrameContas_a_Receber.cmb_clienteClick(Sender: TObject);
begin
  inherited;
  DS.DataSet.Edit;
end;

procedure TFrameContas_a_Receber.cmb_tipo_receitaClick(Sender: TObject);
begin
  inherited;
  DS.DataSet.Edit;
end;

procedure TFrameContas_a_Receber.DB_ParcelasExit(Sender: TObject);
begin
  inherited;
  if DB_Parcelas.Text <> EmptyStr then
    if DB_Parcelas.Field.AsInteger > 300 then
      begin
        DB_Parcelas.Field.AsInteger := 300;
        ShowMessage('Número Máximo de Parcelas Permitida é 300.');
      end;
end;

procedure TFrameContas_a_Receber.DB_ValorExit(Sender: TObject);
begin
  inherited;
  FormataValor(TUniEdit(Sender));
end;

function TFrameContas_a_Receber.documento_recebido(
  id_cre_par: Integer): Boolean;
begin
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('SELECT TIP_RECEBIMENTO FROM CRE_PAR  '+
                   ' WHERE ID_MASTER     = :P00          '+
                   '   AND ID_EMPRESA    = :P01          '+
                   '   AND ID_CRE_PAR    = :P02          ');
  SQLQuery.Params[00].AsInteger := ID.id_glo_master;
  SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
  SQLQuery.Params[02].AsInteger := id_cre_par;
  SQLQuery.Open;

  Result  := SQLQuery.FieldByName('TIP_RECEBIMENTO').AsString <> 'A';
end;

procedure TFrameContas_a_Receber.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if DS.DataSet.State in [dsInsert, dsEdit] then
    begin
      bt_anexar.Visible         := True;
      bt_receber.Visible        := False;
    end;

  if Not(DS.DataSet.State in [dsInsert, dsEdit]) then
    begin
      //cmb_tipo_despesa.Value    :=  DS.DataSet.FieldByName('ID_TIPO_DESPESA').AsString;
      cmb_tipo_receita.Text     :=  DS.DataSet.FieldByName('DESCRICAO_RECEITA').AsString;

      //cmb_fornecedor.Value      :=  DS.DataSet.FieldByName('ID_F_C').AsString;
      cmb_cliente.Text          :=  DS.DataSet.FieldByName('RAZAO_SOCIAL').AsString;

      rdb_tip_normal.Checked    :=  DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'N';
      rdb_tip_recorrente.Checked:=  DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'R';
      rdb_tip_parcelado.Checked :=  DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'P';

      bt_anexar.Visible         := False;
      bt_receber.Visible        := True;

      pn_tipo.Enabled           := False;
      DB_Periodo.Enabled        := False;
      DB_Parcelas.Enabled       := False;

      atualiza_info_anexo(DS.DataSet.FieldByName('ID_CRE_DOC').AsInteger);
      pn_inf_anexo.Visible      := Not(DSAnexo.DataSet.IsEmpty);
    end;

  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'A' then
    begin
      bt_receber.Visible        := True;
      pn_inf_recebimento.Visible:= False;
    end;
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'P' then
    begin
      bt_receber.Visible        := True;
      pn_inf_recebimento.Visible:= True;
      atualiza_info_rec(DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger);
    end;
  if DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString = 'T' then
    begin
      bt_receber.Visible        := False;
      pn_inf_recebimento.Visible:= True;
      atualiza_info_rec(DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger);
    end;

  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'N' then
    begin
      lb_forma_recebimento.Visible:= False;
      DB_Periodo.Visible          := False;
      lb_n_parcelas.Visible       := False;
      DB_Parcelas.Visible         := False;
    end;
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'R' then
    begin
      lb_forma_recebimento.Visible:= True;
      DB_Periodo.Visible          := True;
      lb_n_parcelas.Visible       := False;
      DB_Parcelas.Visible         := False;
    end;
  if DS.DataSet.FieldByName('TIPO_DOCUM').AsString = 'P' then
    begin
      lb_forma_recebimento.Visible:= True;
      DB_Periodo.Visible          := True;
      lb_n_parcelas.Visible       := True;
      DB_Parcelas.Visible         := True;
    end;

  if DS.DataSet.IsEmpty then
    begin
      bt_receber.Visible          := False;
      pn_inf_recebimento.Visible  := False;
    end;
end;

procedure TFrameContas_a_Receber.DSStateChange(Sender: TObject);
begin
  inherited;
  if DS.DataSet.State in [dsInsert] then
    begin
      cmb_tipo_receita.Text               := EmptyStr;
      cmb_cliente.Text                    := EmptyStr;
      DS.DataSet.FieldByName('NUM_DOCUM').AsString        := 'S/N';
      DS.DataSet.FieldByName('DAT_VENCIMENTO').AsDateTime := Now;

      pn_tipo.Enabled                     := True;
      pn_principal.Enabled                := True;
      DB_Periodo.Enabled                  := True;
      DB_Parcelas.Enabled                 := True;

      rdb_tip_normal.Checked              := True;
      rdb_tip_recorrente.Checked          := False;
      rdb_tip_parcelado.Checked           := False;

      pn_inf_recebimento.Visible          := False;
      pn_inf_anexo.Visible                := False;

      status_rd_button;

      atualiza_info_anexo(DS.DataSet.FieldByName('ID_CRE_DOC').AsInteger);

      DB_Descricao.SetFocus;
    end;

  if (DS.DataSet.State in [dsEdit]) and (Not(nao_valida_edicao)) then
    begin
      if documento_recebido(DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger) then
        begin
          ShowMessage('Para alterar este documento, é necessário excluir o recebimento existente.');
          DS.DataSet.Cancel;
          Exit;
        end;

      if Not(Transaction.Active) then
        Transaction.StartTransaction;

      cmb_tipo_receita.Value      := DS.DataSet.FieldByName('ID_TIPO_RECEITA').AsString;
      cmb_cliente.Value           := DS.DataSet.FieldByName('ID_F_C').AsString;

      UniPageControl1.ActivePage  := Tab_Cadastro;
    end;
end;

procedure TFrameContas_a_Receber.FileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  nome_arquivo :String;
begin
  {Conversão de Byte
  10 mb = 10485760 byte
  http://nutzmann.net/bitsandbytes.htm}
  if Not(DS.DataSet.State in [dsInsert, dsEdit]) then
    DS.DataSet.Edit;

  nome_arquivo       := ExtractFileName(FileUpload.FileName);

  if Not(DSAnexo.DataSet.Active) then
    DSAnexo.DataSet .Open;

  DSAnexo.DataSet.Insert;
  DSAnexo.DataSet.FieldByName('ID_CRE_DOC_ANEXO').AsString  := '0';
  DSAnexo.DataSet.FieldByName('NOME_ANEXO').AsString       := nome_arquivo;
  ADQueryAnexoANEXO.LoadFromStream(AStream);
  DSAnexo.DataSet.Post;

  pn_inf_anexo.Visible  :=  True;

end;

procedure TFrameContas_a_Receber.rdb_tip_normalClick(Sender: TObject);
begin
  inherited;
  status_rd_button;
end;

procedure TFrameContas_a_Receber.status_rd_button;
begin
    if rdb_tip_normal.Checked then
    begin
      lb_forma_recebimento.Visible:= False;
      DB_Periodo.Visible          := False;
      lb_n_parcelas.Visible       := False;
      DB_Parcelas.Visible         := False;
    end;
  if rdb_tip_recorrente.Checked then
    begin
      lb_forma_recebimento.Visible:= True;
      DB_Periodo.Visible          := True;
      lb_n_parcelas.Visible       := False;
      DB_Parcelas.Visible         := False;
    end;
  if rdb_tip_parcelado.Checked then
    begin
      lb_forma_recebimento.Visible:= True;
      DB_Periodo.Visible          := True;
      lb_n_parcelas.Visible       := True;
      DB_Parcelas.Visible         := True;
    end;
end;

procedure TFrameContas_a_Receber.TimerTimer(Sender: TObject);
begin
  inherited;
  if ID.alt_inf_rec then //Atualiza as Informações em Tela
    begin
      pesquisa(pesquisa_avancada,mes,ano);
      Timer.Enabled := False;
    end;
end;

procedure TFrameContas_a_Receber.UniBitBtn1Click(Sender: TObject);
var
  Financeiro                                                                    :TFinanceiro;
  id_cre_par, id_cre_par_valores                                                :Integer;
begin
  try
    if Not(Transaction.Active) then
      Transaction.StartTransaction;

    id_cre_par_valores := DSRecebimento.DataSet.FieldByName('ID_CRE_PAR_VALORES').AsInteger;
    id_cre_par         := DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger;

    Financeiro  := remove_baixa_par(id_cre_par_valores, id_cre_par, Conexao);

    if Financeiro.Erro then
      raise Exception.Create(Financeiro.Msg_Erro);

    if Not(Financeiro.Alerta) then
      begin
        atualiza_info_rec(DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger);

        nao_valida_edicao                                   := True;
        DS.DataSet.Edit;
        DS.DataSet.FieldByName('TIP_RECEBIMENTO').AsString  := Financeiro.tipo;
        DS.DataSet.FieldByName('VAL_PAGO').AsFloat          := Financeiro.saldo_parcela;
        nao_valida_edicao                                   := False;
      end;

  except
    on e: exception do
      begin
        Transaction.Rollback;
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;

end;

procedure TFrameContas_a_Receber.UniDBGrid2DblClick(Sender: TObject);
var
  arquivo       : TStream;
  nome_arquivo  : String;
begin
  inherited;
  try
    arquivo       := DSAnexo.DataSet.CreateBlobStream(DSAnexo.DataSet.FieldByName('ANEXO'), bmRead);
    nome_arquivo  := DSAnexo.DataSet.FieldByName('NOME_ANEXO').AsString;

    nome_arquivo  := StringReplace(nome_arquivo,'.xlsx','.xls',[rfIgnoreCase]);
    nome_arquivo  := StringReplace(nome_arquivo,'.docx','.doc',[rfIgnoreCase]);

    UniSession.SendStream(arquivo, nome_arquivo);
  finally
    FreeAndNil(arquivo);
  end;

end;

procedure TFrameContas_a_Receber.UniFrameCreate(Sender: TObject);
begin
  inherited;
  {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

  {Deixando os Filtro Pré Definidos}
  data_inicial.DateTime := data_atual_bd - 5;
  data_final.DateTime   := data_atual_bd + 25;
  mes                   := StrToInt(FormatDateTime('MM',data_atual_bd));
  ano                   := StrToInt(FormatDateTime('YYYY',data_atual_bd));
  lb_ano.Caption        := FormatDateTime('YYYY',data_atual_bd);
  pesquisa_avancada     := False;

  combo(TUniForm(Self),cmb_tipo_receita,'TIPO_RECEITA',Conexao);

  combo(TUniForm(Self),cmb_cliente,'CLIENTE',Conexao);

  pesquisa(pesquisa_avancada,mes,ano);

end;

procedure TFrameContas_a_Receber.UniSpeedButton1Click(Sender: TObject);
begin
  inherited;
  FormCad_Tipo_Receita.ShowModal;
end;

procedure TFrameContas_a_Receber.UniSpeedButton2Click(Sender: TObject);
begin
  inherited;
  FormCad_Cliente_Fornecedor.ShowModal;
end;

procedure TFrameContas_a_Receber.pesquisa(pesquisa_avancada: Boolean; mes,
  ano: Integer);
begin
  if Not(DS.DataSet.IsEmpty) then
    pos_cds := DS.DataSet.RecNo
  else
    pos_cds := 0;

  ID.alt_inf_rec  := False;

  try
    with ADQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT A.ID_MASTER,                                                  ');
        SQL.Add('       A.ID_EMPRESA,                                                 ');
        SQL.Add('       A.ID_CRE_DOC,                                                 ');
        SQL.Add('       B.ID_CRE_PAR,                                                 ');
        SQL.Add('       A.DESCRICAO_DOCUM,                                            ');
        SQL.Add('       A.NUM_DOCUM,                                                  ');
        SQL.Add('       A.TIPO_DOCUM,                                                 ');
        SQL.Add('       A.TIPO_DOCUM_SITUACAO,                                        ');
        SQL.Add('       A.PERIODO,                                                    ');
        SQL.Add('       A.NUM_PARCELAS,                                               ');
        SQL.Add('       B.PARCELA,                                                    ');
        SQL.Add('       B.VAL_PARCELA,                                                ');
        SQL.Add('       IFNULL(B.VAL_JUROS,0)    VAL_JUROS,                           ');
        SQL.Add('       B.ID_TIPO_RECEITA,                                            ');
        SQL.Add('       C.DESCRICAO_RECEITA,                                          ');
        SQL.Add('       B.ID_F_C,                                                     ');
        SQL.Add('       D.NOME RAZAO_SOCIAL,                                          ');
        SQL.Add('       B.DAT_VENCIMENTO,                                             ');
        SQL.Add('       B.DAT_RECEBIMENTO,                                            ');
        SQL.Add('       B.TIP_RECEBIMENTO,                                            ');
        SQL.Add('       (SELECT SUM(Y.VALOR) FROM CRE_PAR_VALORES Y                   ');
        SQL.Add('         WHERE A.ID_MASTER   = Y.ID_MASTER                           ');
        SQL.Add('           AND A.ID_EMPRESA  = Y.ID_EMPRESA                          ');
        SQL.Add('           AND B.ID_CRE_PAR  = Y.ID_CRE_PAR)VAL_PAGO                 ');
        SQL.Add('  FROM CRE_DOC               A,                                      ');
        SQL.Add('       CRE_PAR               B,                                      ');
        SQL.Add('       TIPO_RECEITAS         C,                                      ');
        SQL.Add('       FORNECEDOR_CLIENTE    D                                       ');
        SQL.Add(' WHERE A.ID_MASTER           = B.ID_MASTER                           ');
        SQL.Add('   AND A.ID_EMPRESA          = B.ID_EMPRESA                          ');
        SQL.Add('   AND A.ID_CRE_DOC          = B.ID_CRE_DOC                          ');
        SQL.Add('   AND B.ID_MASTER           = C.ID_MASTER                           ');
        SQL.Add('   AND B.ID_TIPO_RECEITA     = C.ID_TIPO_RECEITA                     ');
        SQL.Add('   AND B.ID_MASTER           = D.ID_MASTER                           ');
        SQL.Add('   AND B.ID_F_C              = D.ID_F_C                              ');
        SQL.Add('   AND A.ID_MASTER           = '''+IntToStr(ID.id_glo_master)+'''    ');
        SQL.Add('   AND A.ID_EMPRESA          = '''+IntToStr(ID.id_glo_empresa)+'''   ');

        if Not(pesquisa_avancada) then // Pesquisa Fixa
          begin
            SQL.Add(' AND MONTH(B.DAT_VENCIMENTO) = '''+IntToStr(mes)+'''             ');
            SQL.Add(' AND YEAR(B.DAT_VENCIMENTO) = '''+IntToStr(ano)+'''              ');

            SQL.Add(' ORDER BY B.DAT_VENCIMENTO  ');
          end;

        if pesquisa_avancada then // Pesquisa Avançada
          begin
            if rdb_recebido.Checked then
              begin
                SQL.Add(' AND B.TIP_RECEBIMENTO     IN (''P'',''T'')                     ');
                SQL.Add(' AND EXISTS (SELECT ''X'' FROM CRE_PAR_VALORES E                ');
                SQL.Add('              WHERE A.ID_MASTER           = E.ID_MASTER         ');
                SQL.Add('                AND A.ID_EMPRESA          = E.ID_EMPRESA        ');
                SQL.Add('                AND B.ID_CRE_PAR          = E.ID_CRE_PAR        ');
                SQL.Add('                AND E.DAT_RECEBIMENTO BETWEEN '''+FormatDateTime('yyyy-mm-dd',data_inicial.DateTime)+''' AND '''+FormatDateTime('yyyy-mm-dd',data_final.DateTime)+''') ');
              end;

            if rdb_a_receber.Checked then
              begin
                SQL.Add('   AND B.TIP_RECEBIMENTO       IN (''A'',''P'')                    ');
                SQL.Add('   AND B.DAT_VENCIMENTO BETWEEN '''+FormatDateTime('yyyy-mm-dd',data_inicial.DateTime)+''' AND '''+FormatDateTime('yyyy-mm-dd',data_final.DateTime)+''' ');
              end;

            if edt_pesq_descricao.Text <> EmptyStr then
              SQL.Add(' AND UPPER(A.DESCRICAO_DOCUM) LIKE UPPER(''%'+edt_pesq_descricao.Text+'%'') ');

            if edt_pesq_cliente.Text <> EmptyStr then
              SQL.Add(' AND UPPER(D.NOME) LIKE UPPER(''%'+edt_pesq_cliente.Text+'%'')  ');

            if edt_pesq_num_doc.Text <> EmptyStr then
              SQL.Add(' AND UPPER(A.NUM_DOCUM) LIKE UPPER(''%'+edt_pesq_num_doc.Text+'%'')  ');

            if edt_pesq_tipo_receita.Text <> EmptyStr then
              SQL.Add(' AND UPPER(C.DESCRICAO_RECEITA) LIKE UPPER(''%'+edt_pesq_tipo_receita.Text+'%'')  ');

            if rdb_a_receber.Checked then
              SQL.Add(' ORDER BY B.DAT_VENCIMENTO  ');

            if rdb_recebido.Checked then
              SQL.Add(' ORDER BY B.DAT_RECEBIMENTO  ');
          end;

        Open;
      end;


    if DS.DataSet.IsEmpty then
      UniStatusBar1.Panels.Items[0].Text  := 'Sua pesquisa não retornou nenhuma informação!'
    else
      begin
        UniStatusBar1.Panels.Items[0].Text  := 'Pesquisa realizada com sucesso!';

        mes := StrToInt(FormatDateTime('MM',DS.DataSet.FieldByName('DAT_VENCIMENTO').AsDateTime));
        ano := StrToInt(FormatDateTime('YYYY',DS.DataSet.FieldByName('DAT_VENCIMENTO').AsDateTime));
      end;

    if (pos_cds <> 0) and (DS.DataSet.RecordCount >= pos_cds) then
      DS.DataSet.RecNo := pos_cds;

    atualiza_info_rec(DS.DataSet.FieldByName('ID_CRE_PAR').AsInteger);
  except
    on e:exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),'função pesquisa',e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

function TFrameContas_a_Receber.insere_anexo(id_cre_doc: Integer): String;
var
  Arquivo   : TStream;
  SQLQuery  : TADQuery;
begin
  try
    SQLQuery := TADQuery.Create(Nil);
    SQLQuery.Connection:= Conexao;

    DSAnexo.DataSet.First;
    while Not(DSAnexo.DataSet.Eof) do
      begin
        if DSAnexo.DataSet.FieldByName('ID_CRE_DOC_ANEXO').AsInteger = 0 then
          begin
            Arquivo := DSAnexo.DataSet.CreateBlobStream(DSAnexo.DataSet.FieldByName('ANEXO'), bmRead);

            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('INSERT INTO CRE_DOC_ANEXO                   '+
                             '           (ID_MASTER,                      '+
                             '            ID_EMPRESA,                     '+
                             '            ID_CRE_DOC,                     '+
                             '            NOME_ANEXO,                     '+
                             '            ANEXO)                          '+
                             '    VALUES (:P00, :P01, :P02, :P03, :P04)   ');
            SQLQuery.Params[00].AsInteger := ID.id_glo_master;
            SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
            SQLQuery.Params[02].AsInteger := id_cre_doc;
            SQLQuery.Params[03].AsString  := DSAnexo.DataSet.FieldByName('NOME_ANEXO').AsString;
            SQLQuery.Params[04].LoadFromStream(Arquivo, ftBlob);
            SQLQuery.ExecSQL;
          end;

        DSAnexo.DataSet.Next;
      end;
  finally
    FreeAndNil(SQLQuery);
    FreeAndNil(Arquivo);
  end;

end;

procedure TFrameContas_a_Receber.atualiza_info_anexo(id_cre_doc: Integer);
begin
  DSAnexo.DataSet.Close;
  (DSAnexo.DataSet as TADQuery).Params[00].AsInteger  := ID.id_glo_master;
  (DSAnexo.DataSet as TADQuery).Params[01].AsInteger  := ID.id_glo_empresa;
  (DSAnexo.DataSet as TADQuery).Params[02].AsInteger  := id_cre_doc;
  DSAnexo.DataSet.Open;
end;

procedure TFrameContas_a_Receber.atualiza_info_rec(id_cre_par: Integer);
begin
  DSRecebimento.DataSet.Close;
  (DSRecebimento.DataSet as TADQuery).Params[00].AsInteger  := ID.id_glo_master;
  (DSRecebimento.DataSet as TADQuery).Params[01].AsInteger  := ID.id_glo_empresa;
  (DSRecebimento.DataSet as TADQuery).Params[02].AsInteger  := id_cre_par;
  DSRecebimento.DataSet.Open;
end;

end.
