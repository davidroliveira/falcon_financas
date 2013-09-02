unit U_Transferencia_Saldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, U_Cad_Heranca, Data.DB, uniScrollBox, uniPanel,
  uniPageControl, uniToolBar, uniGUIBaseClasses, uniStatusBar, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniLabel, uniEdit,
  uniMultiItem, uniComboBox, ComboboxYeni, uniCheckBox, uniDBCheckBox,
  uniDateTimePicker, uniDBDateTimePicker, uniMemo, uniDBMemo, uniDBEdit;

type
  TFormTransferencia_Saldo = class(TFormCad_Heranca)
    ADQuery: TADQuery;
    ADQueryID_TRANSF_SALDO: TADAutoIncField;
    ADQueryID_MASTER: TIntegerField;
    ADQueryID_EMPRESA: TIntegerField;
    ADQueryID_CONTAS_ORIG: TIntegerField;
    ADQueryID_CONTAS_DEST: TIntegerField;
    ADQueryDAT_TRANSFERENCIA: TDateField;
    ADQueryAGENDADO: TWideStringField;
    ADQueryHISTORICO: TWideStringField;
    ADQueryVALOR: TBCDField;
    ADQueryDAT_CADASTRO: TDateTimeField;
    ADQueryID_USUARIO: TIntegerField;
    ADQueryCONTA_ORIGEM: TWideStringField;
    ADQueryCONTA_DESTINO: TWideStringField;
    UniPanel1: TUniPanel;
    edt_pesq_descricao: TUniEdit;
    UniLabel3: TUniLabel;
    bt_pesquisa: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    ADQueryIMG_AGENDADO: TStringField;
    cmb_conta_orig: TComboBoxYeni;
    cmb_conta_dest: TComboBoxYeni;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    DB_Agendado: TUniDBCheckBox;
    DB_Motivo: TUniDBMemo;
    UniLabel5: TUniLabel;
    DB_Valor: TUniDBEdit;
    UniLabel6: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure DSStateChange(Sender: TObject);
    procedure DB_ValorExit(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;
  public
    { Public declarations }
  end;

function FormTransferencia_Saldo: TFormTransferencia_Saldo;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, U_DM, U_Sessao, uniGUIFrame, U_Carrega_Combo,
  U_Global, U_Verifica_Campo_Null, U_JS_Humane;

function FormTransferencia_Saldo: TFormTransferencia_Saldo;
begin
  Result := TFormTransferencia_Saldo(ID.GetFormInstance(TFormTransferencia_Saldo));
end;

procedure TFormTransferencia_Saldo.bt_excluirClick(Sender: TObject);
var
  id  : Integer;
begin
  //inherited;
  MessageDlg('Deseja realmente excluir?', mtConfirmation, mbYesNo, procedure(Res: Integer)
  begin
    if Res = mrYes then
      begin
        try
          if Not DS.DataSet.IsEmpty then //se nao estiver vazio
            begin
              id  := DS.DataSet.FieldByName('ID_TRANSF_SALDO').AsInteger;

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('SELECT A.SALDO,                                         '+
                               '       B.VALOR,                                         '+
                               '       CASE WHEN (A.SALDO - B.VALOR) < 0 THEN           '+
                               '         ''SALDO INSUFICIENTE''                         '+
                               '       ELSE                                             '+
                               '         ''SALDO DISPONIVEL''                           '+
                               '       END VALIDACAO                                    '+
                               '  FROM CONTAS         A,                                '+
                               '       TRANSF_SALDO   B                                 '+
                               ' WHERE A.ID_CONTAS = B.ID_CONTAS_DEST                   '+
                               '   AND B.ID_TRANSF_SALDO = '''+IntToStr(id)+'''         ');
              SQLQuery.Open;
              if SQLQuery.Fields[2].AsString = 'SALDO INSUFICIENTE' then
                begin
                  ShowMessage('Saldo Insuficiente para realizar a Exclusão');
                  Exit;
                end;

              if Not(Transaction.Active) then
                Transaction.StartTransaction;

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('UPDATE CONTAS A SET A.SALDO = (A.SALDO + (SELECT B.VALOR FROM TRANSF_SALDO B                        '+
                               '                                                  WHERE A.ID_CONTAS = B.ID_CONTAS_ORIG              '+
                               '                                                    AND B.ID_TRANSF_SALDO = '''+IntToStr(id)+'''))  '+
                               '  WHERE EXISTS (SELECT ''X'' FROM TRANSF_SALDO B                                                    '+
                               '                 WHERE A.ID_CONTAS = B.ID_CONTAS_ORIG                                               '+
                               '                   AND B.ID_TRANSF_SALDO = '''+IntToStr(id)+''')                                    ');
              SQLQuery.ExecSQL;

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('UPDATE CONTAS A SET A.SALDO = (A.SALDO - (SELECT B.VALOR FROM TRANSF_SALDO B                        '+
                               '                                                  WHERE A.ID_CONTAS = B.ID_CONTAS_DEST              '+
                               '                                                    AND B.ID_TRANSF_SALDO = '''+IntToStr(id)+'''))  '+
                               ' WHERE EXISTS (SELECT ''X'' FROM TRANSF_SALDO B                                                     '+
                               '                WHERE A.ID_CONTAS = B.ID_CONTAS_DEST                                                '+
                               '                  AND B.ID_TRANSF_SALDO = '''+IntToStr(id)+''')                                     ');
              SQLQuery.ExecSQL;

              DS.DataSet.Delete;

              Conexao.Commit;
            end;
        except
          on e: exception do
            begin
              DS.DataSet.Cancel;
              Conexao.Rollback;
              if Copy(E.Message,0,59) = '[FireDAC][Phys][MySQL] Cannot delete or update a parent row' then
                begin
                  ShowMessage('Atenção!<br><br> '+
                              '<div> <p><img src="imagens\warning.png" align="left"/> Não é possivel excluir, o mesmo possui dependências com outros regitros!</p> </div> <br>');
                end
               else
                 RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
            end;
        end;
      end;
  end
  );
end;

procedure TFormTransferencia_Saldo.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  try
    with ADQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT A.*,                                                    ');
        SQL.Add('       B.NOME_CONTA CONTA_ORIGEM,                              ');
        SQL.Add('       C.NOME_CONTA CONTA_DESTINO                              ');
        SQL.Add('  FROM TRANSF_SALDO      A,                                    ');
        SQL.Add('       CONTAS            B,                                    ');
        SQL.Add('       CONTAS            C                                     ');
        SQL.Add(' WHERE A.ID_CONTAS_ORIG  = B.ID_CONTAS                         ');
        SQL.Add('   AND A.ID_CONTAS_DEST  = C.ID_CONTAS                         ');
        SQL.Add('   AND A.ID_MASTER       = B.ID_MASTER                         ');
        SQL.Add('   AND A.ID_EMPRESA      = B.ID_EMPRESA                        ');
        SQL.Add('   AND A.ID_MASTER       = C.ID_MASTER                         ');
        SQL.Add('   AND A.ID_EMPRESA      = C.ID_EMPRESA                        ');
        SQL.Add('   AND A.ID_MASTER       = '''+IntToStr(ID.id_glo_master)+'''  ');
        SQL.Add('   AND A.ID_EMPRESA      = '''+IntToStr(ID.id_glo_empresa)+''' ');
        if edt_pesq_descricao.Text <> EmptyStr then
        SQL.Add('   AND UPPER(DESCRICAO_DESPESA) LIKE UPPER(''%'+edt_pesq_descricao.Text+'%'')');
        SQL.Add(' ORDER BY A.DAT_CADASTRO DESC                                  ');
        Open;
      end;

    if DS.DataSet.IsEmpty then
      UniStatusBar1.Panels.Items[0].Text  := 'Sua pesquisa não retornou nenhuma informação!'
    else
      UniStatusBar1.Panels.Items[0].Text  := 'Pesquisa realizada com sucesso!';
  except
    on e:exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;

end;

procedure TFormTransferencia_Saldo.bt_salvarClick(Sender: TObject);
var
  id_conta_orig, id_conta_dest  : Integer;
  saldo                         : Real;
begin
  //inherited;
  if Verifica_Edit(TUniForm(Self)) then
    begin
      try
        RemoveAspas(TUniForm(Self));

        if DB_Valor.Field.AsFloat <= 0 then
          begin
            Application.MessageBox('Valor Para Transferência não informado!','Atenção', MB_OK+ MB_ICONINFORMATION);
            Exit;
          end;

        if (cmb_conta_orig.Text <> EmptyStr) and (cmb_conta_dest.Text <> EmptyStr) then
          begin
            if cmb_conta_orig.Value = cmb_conta_dest.Value then
              begin
                ShowMessage('A conta destino deve ser diferente da origem!');
                Exit;
              end;

            if Not(Transaction.Active) then
              Transaction.StartTransaction;

            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT SALDO FROM CONTAS                          '+
                             ' WHERE ID_CONTAS = '''+cmb_conta_orig.Value+'''   '+
                             '   AND ATIVO = ''S''                              ');
            SQLQuery.Open;
            if (SQLQuery.FieldByName('SALDO').AsFloat - DB_Valor.Field.AsFloat) < 0 then
              begin
                ShowMessage('Saldo Insuficiente para realizar esta Transferência!');
                UniStatusBar1.Panels.Items[1].Text:= 'Saldo Insuficiente.';
                Transaction.Rollback;
                Exit;
              end
            else
              begin
                SQLQuery.SQL.Clear;
                SQLQuery.SQL.Add('UPDATE CONTAS SET SALDO = (SALDO + :P00)      '+
                                 ' WHERE ID_CONTAS = :P01                       '+
                                 '   AND ATIVO = ''S''                          ');
                SQLQuery.Params[00].AsFloat   := DB_Valor.Field.AsFloat;
                SQLQuery.Params[01].AsString  := cmb_conta_dest.Value;
                SQLQuery.ExecSQL;

                SQLQuery.SQL.Clear;
                SQLQuery.SQL.Add('UPDATE CONTAS SET SALDO = (SALDO - :P00)      '+
                                 ' WHERE ID_CONTAS = :P01                       '+
                                 '   AND ATIVO = ''S''                          ');
                SQLQuery.Params[00].AsFloat   := DB_Valor.Field.AsFloat;
                SQLQuery.Params[01].AsString  := cmb_conta_orig.Value;
                SQLQuery.ExecSQL;

                DS.DataSet.FieldByName('ID_MASTER').AsInteger       := ID.id_glo_master;
                DS.DataSet.FieldByName('ID_EMPRESA').AsInteger      := ID.id_glo_empresa;
                DS.DataSet.FieldByName('ID_CONTAS_ORIG').AsString   := cmb_conta_orig.Value;
                DS.DataSet.FieldByName('ID_CONTAS_DEST').AsString   := cmb_conta_dest.Value;
                DS.DataSet.FieldByName('DAT_CADASTRO').AsDateTime   := data_atual_bd;
                DS.DataSet.FieldByName('ID_USUARIO').AsInteger      := ID.id_glo_usuario;

                DS.DataSet.FieldByName('CONTA_ORIGEM').AsString     := cmb_conta_orig.Text;
                DS.DataSet.FieldByName('CONTA_DESTINO').AsString    := cmb_conta_dest.Text;

                DS.DataSet.Post;

                Transaction.Commit;

                humane.success('<div> <img src= imagens/32/tick_blue.png </> '+
                           'Transferência de saldo efetuada com sucesso. </div>',2500,True);
                UniStatusBar1.Panels.Items[0].Text := 'Transferência de saldo efetuada com sucesso.';
              end;
          end;
      except
        on e: exception do
          begin
            DS.DataSet.Cancel;
            Transaction.Rollback;
            RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
          end;
      end;
    end;
end;

procedure TFormTransferencia_Saldo.DB_ValorExit(Sender: TObject);
begin
  inherited;
  FormataValor(TUniEdit(Sender));
end;

procedure TFormTransferencia_Saldo.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if DS.DataSet.State in [dsBrowse] then
    begin
      cmb_conta_orig.Text := DS.DataSet.FieldByName('CONTA_ORIGEM').AsString;
      cmb_conta_dest.Text := DS.DataSet.FieldByName('CONTA_DESTINO').AsString;
    end;
end;

procedure TFormTransferencia_Saldo.DSStateChange(Sender: TObject);
begin
  inherited;
  if DS.DataSet.State in [dsInsert] then
    begin
      DS.DataSet.FieldByName('HISTORICO').AsString            := 'Transferência entre Contas';
      DS.DataSet.FieldByName('DAT_TRANSFERENCIA').AsDateTime  := data_atual_bd;

      cmb_conta_orig.SetFocus;
    end;

  if DS.DataSet.State in [dsEdit] then
    begin
      ShowMessage('Operação não permitida. <br> '+
                  'Você pode excluir a transferência desejada.');
      DS.DataSet.Cancel;
      Exit;
    end;
end;

procedure TFormTransferencia_Saldo.UniFormCreate(Sender: TObject);
begin
  inherited;
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

  combo(TUniForm(Self),cmb_conta_orig,'CONTAS',Conexao);

  combo(TUniForm(Self),cmb_conta_dest,'CONTAS',Conexao);
end;

end.
