unit U_Cad_Tipo_Despesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, uniGUIFrame,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  U_Cad_Heranca, FMTBcd, uniImageList, uniScreenMask, DBClient, DB, uniScrollBox,
  uniToolBar, uniGUIBaseClasses, uniStatusBar, uniBasicGrid, uniDBGrid, uniEdit,
  uniButton, uniBitBtn, uniCheckBox, uniDBCheckBox, uniDBEdit, uniLabel,
  uADCompClient, uADStanIntf, uniPanel, uniPageControl, uADCompDataSet,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager;

type
  TFormCad_Tipo_Despesa = class(TFormCad_Heranca)
    UniPanel1: TUniPanel;
    edt_pesq_descricao: TUniEdit;
    UniLabel1: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    UniLabel2: TUniLabel;
    DB_Descricao: TUniDBEdit;
    DB_Ativo: TUniDBCheckBox;
    ADQuery: TADQuery;
    ADQueryID_TIPO_DESPESA: TADAutoIncField;
    ADQueryID_MASTER: TIntegerField;
    ADQueryID_EMPRESA: TIntegerField;
    ADQueryDESCRICAO_DESPESA: TWideStringField;
    ADQueryATIVO: TWideStringField;
    ADQueryDAT_CADASTRO: TDateTimeField;
    ADQueryID_USUARIO: TIntegerField;
    ADQueryIMG_ATIVO: TStringField;
    bt_pesquisa: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure UniDBGrid1DblClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure ADQueryIMG_ATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniQueryIMG_ATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure edt_pesq_descricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;
  public
    { Public declarations }
  end;

function FormCad_Tipo_Despesa: TFormCad_Tipo_Despesa;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, U_Sessao, U_Global, U_Verifica_Campo_Null,
  U_JS_Humane, U_DM;

function FormCad_Tipo_Despesa: TFormCad_Tipo_Despesa;
begin
  Result := TFormCad_Tipo_Despesa(ID.GetFormInstance(TFormCad_Tipo_Despesa));
end;

procedure TFormCad_Tipo_Despesa.ADQueryIMG_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('ATIVO').AsString = 'S' then
    Text:= '<img src="../imagens/16/tick.png" />';
  if DS.DataSet.FieldByName('ATIVO').AsString = 'N' then
    Text:= '<img src="../imagens/16/cross.png" />'
end;

procedure TFormCad_Tipo_Despesa.bt_excluirClick(Sender: TObject);
begin
  //inherited;
  MessageDlg('Deseja realmente excluir?', mtConfirmation, mbYesNo, procedure(Res: Integer)
  begin
    if Res = mrYes then
      begin
        try
          if Not DS.DataSet.IsEmpty then
           begin
             DS.DataSet.Delete;

             UniStatusBar1.Panels.Items[0].Text:= 'Exclusão efetuada com Sucesso.';
             humane.success('<div> <p><img src= imagens/32/empty.png align=left/> '+
                            'Exclusão efetuada com Sucesso.</p> </div>',2500,True);
           end
          else
            UniStatusBar1.Panels.Items[0].Text:= 'Não existem registros para serem excluidos!';
         except
           on e: exception do
             begin
               DS.DataSet.Cancel;
               if Copy(E.Message,0,59) = '[FireDAC][Phys][MySQL] Cannot delete or update a parent row' then
                begin
                  ShowMessage('Atenção!<br><br> '+
                              '<div> <p><img src="imagens\warning.png" align="left"/> Não é possivel excluir, o mesmo possui dependências com outros regitros!</p> </div> <br>'+
                              'Você Pode Inativar este Item, Desmarcando a Opção "Ativo". ');
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

procedure TFormCad_Tipo_Despesa.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  try
    with ADQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM TIPO_DESPESAS                                          ');
        SQL.Add(' WHERE ID_MASTER  = '''+IntToStr(ID.id_glo_master)+'''               ');
        SQL.Add('   AND ID_EMPRESA = '''+IntToStr(ID.id_glo_empresa)+'''              ');
        if edt_pesq_descricao.Text <> EmptyStr then
        SQL.Add('   AND UPPER(DESCRICAO_DESPESA) LIKE UPPER(''%'+edt_pesq_descricao.Text+'%'')');
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

procedure TFormCad_Tipo_Despesa.bt_salvarClick(Sender: TObject);
begin
  //inherited;
  if Verifica_Edit(TUniForm(Self)) then
    begin
      try
        if Not(Transaction.Active) then
          Transaction.StartTransaction;

        RemoveAspas(TUniForm(Self));

        if DS.DataSet.State in [dsInsert] then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT COUNT(*) TOTAL FROM TIPO_DESPESAS                '+
                             ' WHERE ID_MASTER        = :P00                          '+
                             '   AND ID_EMPRESA       = :P01                          '+
                             '   AND UPPER(DESCRICAO_DESPESA) = UPPER(:P02)           ');
            SQLQuery.Params[00].AsInteger := ID.id_glo_master;
            SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
            SQLQuery.Params[02].AsString  := DB_Descricao.Text;
            SQLQuery.Open;
            if SQLQuery.Fields[0].AsInteger > 0 then
              begin
                ShowMessage('Tipo de Despesa já Cadastrado!');
                Exit;
              end;

            //DS.DataSet.FieldByName('ID_TIPO_DESPESA').AsInteger := gen_id('TIPO_DESPESAS',Conexao);
            DS.DataSet.FieldByName('ID_MASTER').AsInteger       := ID.id_glo_master;
            DS.DataSet.FieldByName('ID_EMPRESA').AsInteger      := ID.id_glo_empresa;
            DS.DataSet.FieldByName('DAT_CADASTRO').AsDateTime   := data_atual_bd;
            DS.DataSet.FieldByName('ID_USUARIO').AsInteger      := ID.id_glo_usuario;
            DS.DataSet.Post;

            Transaction.Commit;

            humane.success('<div> <img src= imagens/32/tick_blue.png </> '+
                           'Registro Incluído com sucesso. </div>',2500,True);
            UniStatusBar1.Panels.Items[0].Text := 'Registro Incluído com sucesso.';
          end;

        if DS.DataSet.State in [dsEdit] then
          begin
            DS.DataSet.Post;

            Transaction.Commit;

            UniStatusBar1.Panels.Items[0].Text := 'Registro alterado com sucesso.';
            humane.success('<div> <p><img src= imagens/32/tick_blue.png align=left/> '+
                           'Registro alterado com sucesso.</p> </div>',2500,True);
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

procedure TFormCad_Tipo_Despesa.DSStateChange(Sender: TObject);
begin
  inherited;
  if DS.DataSet.State in [dsInsert] then
    begin
      DS.DataSet.FieldByName('ATIVO').AsString:= 'S';
      DB_Descricao.SetFocus;
    end;
end;

procedure TFormCad_Tipo_Despesa.edt_pesq_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    bt_pesquisa.Click;
end;

procedure TFormCad_Tipo_Despesa.UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  inherited;
  if Direction then
    (DS.DataSet as TADQuery).IndexFieldNames  := Column.FieldName+':A'
  else
    (DS.DataSet as TADQuery).IndexFieldNames  := Column.FieldName+':D';
end;

procedure TFormCad_Tipo_Despesa.UniDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  DS.DataSet.Edit;
  UniPageControl1.ActivePage  := Tab_Cadastro;
  DB_Descricao.SetFocus;
end;

procedure TFormCad_Tipo_Despesa.UniFormCreate(Sender: TObject);
begin
  inherited;
  {Cria uma Nova Sessão no Banco de Dados (Utilizado pelas Transações)}
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

  ADQuery.Params[00].AsInteger  := ID.id_glo_master;
  ADQuery.Params[01].AsInteger  := ID.id_glo_empresa;
end;

procedure TFormCad_Tipo_Despesa.UniQueryIMG_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DS.DataSet.FieldByName('ATIVO').AsString = 'S' then
    Text:= '<img src="../imagens/16/tick.png" />';
  if DS.DataSet.FieldByName('ATIVO').AsString = 'N' then
    Text:= '<img src="../imagens/16/cross.png" />'
end;

end.
