unit U_Cad_Cliente_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  U_Cad_Heranca, FMTBcd, uniImageList, uniScreenMask, DBClient, DB, uniScrollBox,
  uniToolBar, uniGUIBaseClasses, uniStatusBar, uniCheckBox, uniDBCheckBox,
  uniEdit, uniDBEdit, uniLabel, StdCtrls, uniMultiItem, uniComboBox,
  uniDBComboBox, uniMemo, uniRadioButton, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniDBMemo, uniGUIFrame, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet, uniPanel, uniPageControl, uADCompClient;

type
  TFormCad_Cliente_Fornecedor = class(TFormCad_Heranca)
    UniPanel1: TUniPanel;
    UniLabel11: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edt_pesq_nome: TUniEdit;
    chk_pesq_fornecedor: TUniCheckBox;
    chk_pesq_cliente: TUniCheckBox;
    edt_pesq_cpf_cnpj: TUniEdit;
    UniLabel13: TUniLabel;
    pn_classificacao: TUniPanel;
    UniLabel1: TUniLabel;
    chk_fornecedor: TUniDBCheckBox;
    chk_cliente: TUniDBCheckBox;
    UniLabel2: TUniLabel;
    rdb_pessoa_fisica: TUniRadioButton;
    rdb_pessoa_juridica: TUniRadioButton;
    pn_principal: TUniPanel;
    DB_Nome: TUniDBEdit;
    DB_Ativo: TUniDBCheckBox;
    UniLabel3: TUniLabel;
    pn_inf_adicional: TUniPanel;
    UniLabel4: TUniLabel;
    cmb_estado: TUniDBComboBox;
    DB_Fone: TUniDBEdit;
    DB_Email: TUniDBEdit;
    DB_Cidade: TUniDBEdit;
    DB_Endereco: TUniDBEdit;
    DB_Cep: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    memo_observacao: TUniDBMemo;
    UniLabel12: TUniLabel;
    DB_CPF_CNPJ: TUniDBEdit;
    UniLabel14: TUniLabel;
    DB_Razao_Social: TUniDBEdit;
    ADQuery: TADQuery;
    ADQueryID_F_C: TADAutoIncField;
    ADQueryID_MASTER: TIntegerField;
    ADQueryNOME: TWideStringField;
    ADQueryRAZAO_SOCIAL: TWideStringField;
    ADQueryTIPO: TWideStringField;
    ADQueryATIVO: TWideStringField;
    ADQueryFONE: TWideStringField;
    ADQueryEMAIL: TWideStringField;
    ADQueryFORNECEDOR: TWideStringField;
    ADQueryCLIENTE: TWideStringField;
    ADQueryCPF_CNPJ: TWideStringField;
    ADQueryENDERECO: TWideStringField;
    ADQueryCIDADE: TWideStringField;
    ADQueryESTADO: TWideStringField;
    ADQueryCEP: TWideStringField;
    ADQueryOBSERVACAO: TWideStringField;
    ADQueryDAT_CADASTRO: TDateTimeField;
    ADQueryID_USUARIO: TIntegerField;
    ADQueryIMG_FORNECEDOR: TStringField;
    ADQueryIMG_CLIENTE: TStringField;
    ADQueryIMG_ATIVO: TStringField;
    bt_pesquisa: TUniBitBtn;
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure DB_CPF_CNPJExit(Sender: TObject);
    procedure UniDBGrid1DblClick(Sender: TObject);
    procedure edt_pesq_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure DB_CepExit(Sender: TObject);
    procedure DB_FoneExit(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure DB_NomeExit(Sender: TObject);
    procedure ADQueryIMG_FORNECEDORGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADQueryIMG_CLIENTEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADQueryIMG_ATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;
  public
    { Public declarations }
  end;

function FormCad_Cliente_Fornecedor: TFormCad_Cliente_Fornecedor;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, U_Global, U_Verifica_Campo_Null,
  U_Sessao, U_JS_Humane, U_DM;

function FormCad_Cliente_Fornecedor: TFormCad_Cliente_Fornecedor;
begin
  Result := TFormCad_Cliente_Fornecedor(ID.GetFormInstance(TFormCad_Cliente_Fornecedor));
end;

procedure TFormCad_Cliente_Fornecedor.ADQueryIMG_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('ATIVO').AsString = 'S' then
      Text:= '<img src="../imagens/16/tick.png" />';
  if DS.DataSet.FieldByName('ATIVO').AsString = 'N' then
    Text:= '<img src="../imagens/16/cross.png" />'

  //<div align="center" style="width:100%;background-color:#EDEDEB;color:#9C3894;">Month</div>
end;

procedure TFormCad_Cliente_Fornecedor.ADQueryIMG_CLIENTEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('CLIENTE').AsString = 'S' then
    Text:= '<img src="../imagens/16/thumb_up.png" />';
end;

procedure TFormCad_Cliente_Fornecedor.ADQueryIMG_FORNECEDORGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('FORNECEDOR').AsString = 'S' then
    Text:= '<img src="../imagens/16/thumb_up.png" />';
end;

procedure TFormCad_Cliente_Fornecedor.bt_excluirClick(Sender: TObject);
begin
//inherited;
   MessageDlg('Deseja realmente excluir?', mtConfirmation, mbYesNo, procedure(Res: Integer)
  begin
    if Res = mrYes then
      begin
        try
          if Not DS.DataSet.IsEmpty then //se nao estiver vazio
           begin
             SQLQuery.SQL.Clear;
             SQLQuery.SQL.Add('DELETE FROM FORNECEDOR_CLIENTE                          '+
                              ' WHERE ID_MASTER                   = :P00               '+
                              '   AND ID_F_C                      = :P01               ');
             SQLQuery.Params[00].AsInteger := ID.id_glo_master;
             SQLQuery.Params[01].AsString  := DS.DataSet.FieldByName('ID_F_C').AsString;
             SQLQuery.ExecSQL;

             DS.DataSet.Delete;

             UniStatusBar1.Panels.Items[0].Text:= 'Exclusão efetuada com sucesso.'
           end
          else
            UniStatusBar1.Panels.Items[0].Text:= 'Não existem registros para serem excluidos!';
         except
           on e: exception do
             begin
               DS.DataSet.Cancel;
               if Copy(e.Message,1,36) = 'Cannot delete or update a parent row' then
                begin
                  ShowMessage('Não é possivel excluir, o mesmo possui dependências com outros regitros!');
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

procedure TFormCad_Cliente_Fornecedor.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  try
    with ADQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ID_F_C,                                                      ');
        SQL.Add('       ID_MASTER,                                                   ');
        SQL.Add('       NOME,                                                        ');
        SQL.Add('       RAZAO_SOCIAL,                                                ');
        SQL.Add('       TIPO,                                                        ');
        SQL.Add('       ATIVO,                                                       ');
        SQL.Add('       FONE,                                                        ');
        SQL.Add('       EMAIL,                                                       ');
        SQL.Add('       FORNECEDOR,                                                  ');
        SQL.Add('       CLIENTE,                                                     ');
        SQL.Add('       CPF_CNPJ,                                                    ');
        SQL.Add('       ENDERECO,                                                    ');
        SQL.Add('       CIDADE,                                                      ');
        SQL.Add('       ESTADO,                                                      ');
        SQL.Add('       CEP,                                                         ');
        SQL.Add('       OBSERVACAO,                                                  ');
        SQL.Add('       DAT_CADASTRO,                                                ');
        SQL.Add('       ID_USUARIO                                                   ');
        SQL.Add('  FROM FORNECEDOR_CLIENTE                                           ');
        SQL.Add(' WHERE ID_MASTER = '''+IntToStr(ID.id_glo_master)+'''               ');
        if edt_pesq_nome.Text <> EmptyStr then
        SQL.Add('   AND UPPER(NOME) LIKE UPPER(''%'+edt_pesq_nome.Text+'%'')         ');
        if edt_pesq_cpf_cnpj.Text <> EmptyStr then
        SQL.Add('   AND CPF_CNPJ LIKE ''%'+edt_pesq_cpf_cnpj.Text+'%''               ');
        if Not(chk_pesq_fornecedor.Checked) or Not(chk_pesq_cliente.Checked) then
          begin
            if chk_pesq_fornecedor.Checked then
            SQL.Add('   AND FORNECEDOR = ''S''                                       ');
            if chk_pesq_cliente.Checked then
            SQL.Add('   AND CLIENTE = ''S''                                          ');
          end;

        Open;
      end;

  except
    on e:exception do
      begin
        RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
      end;
  end;
end;

procedure TFormCad_Cliente_Fornecedor.bt_salvarClick(Sender: TObject);
begin
  //inherited;

  {realizando as validações}
  if (((DS.DataSet.FieldByName('FORNECEDOR').AsString = 'N') or (DS.DataSet.FieldByName('FORNECEDOR').AsString = EmptyStr))
  and ((DS.DataSet.FieldByName('CLIENTE').AsString = 'N') or (DS.DataSet.FieldByName('CLIENTE').AsString = EmptyStr))) then
    begin
      ShowMessage('Falta Informar se é Cliente ou Fornecedor.');
      Exit;
    end;

  {Verificar aqui a Validação do CPF ou CNPJ}
  if DB_CPF_CNPJ.Text <> EmptyStr then
    begin
      if rdb_pessoa_fisica.Checked then
        begin
          if Not(Valida_CPF(DB_CPF_CNPJ.Text)) then
            begin
              ShowMessage('CPF Inválido!');
              Exit;
            end;

        end;
      if rdb_pessoa_juridica.Checked then
        begin
          if Not(Valida_CNPJ(DB_CPF_CNPJ.Text)) then
            begin
              ShowMessage('CNPJ Inválido!');
              Exit;
            end;
        end;
    end;

  if DB_Razao_Social.Text = EmptyStr then
    DB_Razao_Social.Text  := DB_Nome.Text;

  if Verifica_Edit(TUniForm(Self)) then
    begin
      try
        if Not(Transaction.Active) then
          Transaction.StartTransaction;

        RemoveAspas(TUniForm(Self));

        if DS.DataSet.State in [dsInsert] then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT COUNT(*) TOTAL FROM FORNECEDOR_CLIENTE           '+
                             ' WHERE ID_MASTER           = :P00                       '+
                             '   AND UPPER(RAZAO_SOCIAL) = UPPER(:P01)                ');
            SQLQuery.Params[00].AsInteger := ID.id_glo_master;
            SQLQuery.Params[01].AsString  := DB_Razao_Social.Text;
            SQLQuery.Open;
            if SQLQuery.Fields[0].AsInteger > 0 then
              begin
                ShowMessage('Fornecedor/Cliente já Cadastrado!');
                Exit;
              end;

            DS.DataSet.FieldByName('ID_F_C').AsInteger := gen_id('FORNECEDOR_CLIENTE',Conexao);

            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('INSERT INTO FORNECEDOR_CLIENTE                          '+
                             '          ( ID_MASTER,                                  '+
                             '            NOME,                                       '+
                             '            RAZAO_SOCIAL,                               '+
                             '            TIPO,                                       '+
                             '            ATIVO,                                      '+
                             '            FONE,                                       '+
                             '            EMAIL,                                      '+
                             '            FORNECEDOR,                                 '+
                             '            CLIENTE,                                    '+
                             '            CPF_CNPJ,                                   '+
                             '            ENDERECO,                                   '+
                             '            CIDADE,                                     '+
                             '            ESTADO,                                     '+
                             '            CEP,                                        '+
                             '            OBSERVACAO,                                 '+
                             '            DAT_CADASTRO,                               '+
                             '            ID_USUARIO )                                '+
                             '     VALUES                                             '+
                             '          ( :P00, :P01, :P02, :P03, :P04, :P05, :P06,   '+
                             '            :P07, :P08, :P09, :P10, :P11, :P12, :P13,   '+
                             '            :P14, SYSDATE(), :P15 )                           ');
            SQLQuery.Params[00].AsInteger   := ID.id_glo_master;
            SQLQuery.Params[01].AsString    := DB_Nome.Text;
            SQLQuery.Params[02].AsString    := DB_Razao_Social.Text;
            if rdb_pessoa_juridica.Checked then
              SQLQuery.Params[03].AsString  := 'J';
            if rdb_pessoa_fisica.Checked then
              SQLQuery.Params[03].AsString  := 'F';
            SQLQuery.Params[04].AsString    := DS.DataSet.FieldByName('ATIVO').AsString;
            SQLQuery.Params[05].AsString    := DB_Fone.Text;
            SQLQuery.Params[06].AsString    := DB_Email.Text;
            SQLQuery.Params[07].AsString    := DS.DataSet.FieldByName('FORNECEDOR').AsString;
            SQLQuery.Params[08].AsString    := DS.DataSet.FieldByName('CLIENTE').AsString;
            SQLQuery.Params[09].AsString    := DB_CPF_CNPJ.Text;
            SQLQuery.Params[10].AsString    := DB_Endereco.Text;
            SQLQuery.Params[11].AsString    := DB_Cidade.Text;
            SQLQuery.Params[12].AsString    := cmb_estado.Text;
            SQLQuery.Params[13].AsString    := DB_Cep.Text;
            SQLQuery.Params[14].AsString    := memo_observacao.Text;
            SQLQuery.Params[15].AsInteger   := ID.id_glo_usuario;
            SQLQuery.ExecSQL;

            DS.DataSet.Post;

            Transaction.Commit;

            humane.success('<div> <img src= imagens/32/tick_blue.png </> '+
                           'Registro Incluído com sucesso. </div>',2500,True);
            UniStatusBar1.Panels.Items[0].Text := 'Registro Incluído com sucesso.';
          end;

        if DS.DataSet.State in [dsEdit] then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('UPDATE FORNECEDOR_CLIENTE SET NOME         = :P00, '+
                             '                              RAZAO_SOCIAL = :P01, '+
                             '                              TIPO         = :P02, '+
                             '                              ATIVO        = :P03, '+
                             '                              FONE         = :P04, '+
                             '                              EMAIL        = :P05, '+
                             '                              FORNECEDOR   = :P06, '+
                             '                              CLIENTE      = :P07, '+
                             '                              CPF_CNPJ     = :P08, '+
                             '                              ENDERECO     = :P09, '+
                             '                              CIDADE       = :P10, '+
                             '                              ESTADO       = :P11, '+
                             '                              CEP          = :P12, '+
                             '                              OBSERVACAO   = :P13  '+
                             ' WHERE ID_MASTER      = :P14                       '+
                             '   AND ID_F_C         = :P15                       ');
            SQLQuery.Params[00].AsString    := DB_Nome.Text;
            SQLQuery.Params[01].AsString    := DB_Razao_Social.Text;
            if rdb_pessoa_juridica.Checked then
              SQLQuery.Params[02].AsString  := 'J';
            if rdb_pessoa_fisica.Checked then
              SQLQuery.Params[02].AsString  := 'F';
            SQLQuery.Params[03].AsString    := DS.DataSet.FieldByName('ATIVO').AsString;
            SQLQuery.Params[04].AsString    := DB_Fone.Text;
            SQLQuery.Params[05].AsString    := DB_Email.Text;
            SQLQuery.Params[06].AsString    := DS.DataSet.FieldByName('FORNECEDOR').AsString;
            SQLQuery.Params[07].AsString    := DS.DataSet.FieldByName('CLIENTE').AsString;
            SQLQuery.Params[08].AsString    := DB_CPF_CNPJ.Text;
            SQLQuery.Params[09].AsString    := DB_Endereco.Text;
            SQLQuery.Params[10].AsString    := DB_Cidade.Text;
            SQLQuery.Params[11].AsString    := cmb_estado.Text;
            SQLQuery.Params[12].AsString    := DB_Cep.Text;
            SQLQuery.Params[13].AsString    :=  memo_observacao.Text;
            SQLQuery.Params[14].AsInteger   := ID.id_glo_master;
            SQLQuery.Params[15].AsString    := DS.DataSet.FieldByName('ID_F_C').AsString;
            SQLQuery.ExecSQL;

            DS.DataSet.Post;

            Transaction.Commit;

            humane.success('<div> <img src= imagens/32/tick_blue.png </> '+
                           'Registro alterado com sucesso. </div>',2500,True);
            UniStatusBar1.Panels.Items[0].Text := 'Registro alterado com sucesso.';
          end;
      except
        on e: exception do
          begin
            Transaction.Rollback;
            DS.DataSet.Cancel;
            RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);
          end;
      end;
    end;
end;

procedure TFormCad_Cliente_Fornecedor.DB_CepExit(Sender: TObject);
begin
  inherited;
  FormataCEP(TUniEdit(DB_Cep));
end;

procedure TFormCad_Cliente_Fornecedor.DB_CPF_CNPJExit(Sender: TObject);
begin
  inherited;
  FormataCPF_CNPJ(TUniEdit(DB_CPF_CNPJ));
end;

procedure TFormCad_Cliente_Fornecedor.DB_FoneExit(Sender: TObject);
begin
  inherited;
  FormataTelefone(TUniEdit(DB_Fone));
end;

procedure TFormCad_Cliente_Fornecedor.DB_NomeExit(Sender: TObject);
begin
  inherited;
  if DB_Razao_Social.Text = EmptyStr then
    DS.DataSet.FieldByName('RAZAO_SOCIAL').AsString := DB_Nome.Text;

end;

procedure TFormCad_Cliente_Fornecedor.DSStateChange(Sender: TObject);
begin
  inherited;
  if DS.DataSet.State in [dsInsert] then
    begin
      DS.DataSet.FieldByName('ATIVO').AsString       := 'S';
      DS.DataSet.FieldByName('CLIENTE').AsString     := 'S';
      DS.DataSet.FieldByName('FORNECEDOR').AsString  := 'S';

      DB_Nome.SetFocus;
    end;
end;

procedure TFormCad_Cliente_Fornecedor.edt_pesq_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    bt_pesquisa.Click;
end;

procedure TFormCad_Cliente_Fornecedor.UniDBGrid1ColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
begin
  inherited;
  if Direction then
    (DS.DataSet as TADQuery).IndexFieldNames  := Column.FieldName+':A'
  else
    (DS.DataSet as TADQuery).IndexFieldNames  := Column.FieldName+':D';
end;

procedure TFormCad_Cliente_Fornecedor.UniDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  UniPageControl1.ActivePage  := Tab_Cadastro;
  DS.DataSet.Edit;
end;

procedure TFormCad_Cliente_Fornecedor.UniFormCreate(Sender: TObject);
begin
  inherited;
  {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

  ADQuery.Params[00].AsInteger  := ID.id_glo_master;
  //ADQuery.Params[01].AsString  := ID.id_glo_empresa;
end;

procedure TFormCad_Cliente_Fornecedor.UniFormShow(Sender: TObject);
begin
  inherited;
  //if pn_inf_adicional.Collapsible then UniSession.AddJS(pn_inf_adicional.JSName+'.collapse();');
end;

end.
