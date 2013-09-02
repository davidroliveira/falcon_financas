unit U_Cad_Heranca_Frame;

interface

uses
  FMTBcd, DB, DBClient, uniGUIClasses, uniImageList,
  uniStatusBar, uniScrollBox, uniPanel, uniPageControl, uniToolBar, Classes,
  Controls, uniGUIBaseClasses, uniGUIFrame, Dialogs, SysUtils, uniGUIForm;

type
  TFrameCad_Heranca_Frame = class(TUniFrame)
    UniToolBar1: TUniToolBar;
    bt_incluir: TUniToolButton;
    bt_editar: TUniToolButton;
    bt_excluir: TUniToolButton;
    bt_salvar: TUniToolButton;
    bt_cancelar: TUniToolButton;
    DS: TDataSource;
    UniPageControl1: TUniPageControl;
    Tab_Cadastro: TUniTabSheet;
    Tab_Consulta: TUniTabSheet;
    UniStatusBar1: TUniStatusBar;
    ScrollBox: TUniScrollBox;
    bt_pesquisar: TUniToolButton;
    bt_anterior: TUniToolButton;
    bt_proximo: TUniToolButton;
    procedure bt_incluirClick(Sender: TObject);
    procedure bt_editarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure UniFrameCreate(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure bt_pesquisarClick(Sender: TObject);
    procedure bt_anteriorClick(Sender: TObject);
    procedure bt_proximoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses U_Verifica_Campo_Null, U_Global, U_JS_Humane, U_Sessao, U_DM_Imagens;

{$R *.dfm}

procedure TFrameCad_Heranca_Frame.bt_anteriorClick(Sender: TObject);
begin
  if Not(DS.DataSet.Active) then
    DS.DataSet.Open;
  DS.DataSet.Prior;
end;

procedure TFrameCad_Heranca_Frame.bt_cancelarClick(Sender: TObject);
begin
  DS.DataSet.Cancel;
  UniStatusBar1.Panels.Items[0].Text:='Processo cancelado.';
end;

procedure TFrameCad_Heranca_Frame.bt_editarClick(Sender: TObject);
begin
  if Not(DS.DataSet.Active) then //se nao estiver ativo
    DS.DataSet.Open;

  if DS.DataSet.Active then
   begin
    DS.DataSet.Edit;
    UniStatusBar1.Panels.Items[0].Text  := 'Alterando...';
    UniPageControl1.ActivePage          := Tab_Cadastro;
   end;
end;

procedure TFrameCad_Heranca_Frame.bt_excluirClick(Sender: TObject);
begin
  MessageDlg('Deseja realmente excluir?', mtConfirmation, mbYesNo, procedure(Res: Integer)
  begin
    if Res = mrYes then
      begin
        try
          if Not DS.DataSet.IsEmpty then //se nao estiver vazio
           begin
             DS.DataSet.Delete;

             UniStatusBar1.Panels.Items[0].Text:= 'Exclus�o efetuada com Sucesso.';
             humane.success('<div> <p><img src= imagens/32/empty.png align=left/> '+
                            'Exclus�o efetuada com Sucesso.</p> </div>',2500,True);
           end
          else
            UniStatusBar1.Panels.Items[0].Text:= 'N�o existem registros para serem excluidos!';
         except
           on e: exception do
             begin
               DS.DataSet.Cancel;
               if Copy(e.Message,1,36) = 'Cannot delete or update a parent row' then
                begin
                  ShowMessage('N�o � possivel excluir, o mesmo possui depend�ncias com outros regitros! ');
                end
               else
                 RelatorioErro(String(TUniFrame(Self).Name),String(TUniFrame(Sender).Name),e.UnitName,e.ClassName,e.Message);

               UniStatusBar1.Panels.Items[0].Text:='Exclus�o Cancelada!';
               Exit;
             end;
         end;
      end;
  end
  );
end;

procedure TFrameCad_Heranca_Frame.bt_incluirClick(Sender: TObject);
begin
  if Not DS.DataSet.Active then //se nao estiver ativo
    DS.DataSet.Open;
  DS.DataSet.Insert;
end;

procedure TFrameCad_Heranca_Frame.bt_salvarClick(Sender: TObject);
var
  State : TDataSetState;
begin
  try
    {Pega a situa��o do CDS}
    State := DS.DataSet.State;

    {esta fun��o verifica se o campo � de preenchimento obrigat�rio}
    if Verifica_Edit(TUniForm(Self)) then
      begin
        DS.DataSet.Post;

        UniStatusBar1.Panels.Items[0].Text:= 'Registro gravado com sucesso.';
        humane.success('<div> <p><img src= imagens/32/tick_blue.png align=left/> '+
                       'Registro gravado com sucesso.</p> </div>',2500,True);

        {Atualiza as informa��es do DataSet}
        DS.DataSet.Refresh;

        {Recebe a o ultimo registro que foi incluido}
        if (State in [dsInsert]) and (Not(DS.DataSet.IsEmpty)) then
          DS.DataSet.Last;

      end;

  except
    on e: exception do
    ShowMessage('Inconsist�ncia encontrada, o mesmo pode j� estar cadastrado ou possui '+
                'campos obrigat�rios nao preenchidos!' +#13+ 'Mensagem Original:'+ e.Message);
  end;

end;

procedure TFrameCad_Heranca_Frame.DSDataChange(Sender: TObject; Field: TField);
begin
  if DS.DataSet.State in [dsInsert, dsEdit] then
    begin
      bt_incluir.Visible          := False;
      bt_editar.Visible           := False;
      bt_excluir.Visible          := False;
      bt_salvar.Visible           := True;
      bt_cancelar.Visible         := True;
      bt_pesquisar.Visible        := False;
      bt_anterior.Visible         := False;
      bt_proximo.Visible          := False;
      Tab_Cadastro.Enabled        := True;
      Tab_Consulta.Enabled        := False;
      //ScrollBox.Enabled           := True;
    end
  else
    begin
      bt_incluir.Visible          := True;
      if Not(DS.DataSet.IsEmpty) then
        begin
          bt_editar.Visible       := True;
          bt_excluir.Visible      := True;
          bt_anterior.Visible     := True;
          bt_proximo.Visible      := True;
        end;
      bt_pesquisar.Visible        := True;
      bt_salvar.Visible           := False;
      bt_cancelar.Visible         := False;
      Tab_Cadastro.Enabled        := True;
      Tab_Consulta.Enabled        := True;
      //ScrollBox.Enabled           := False;
    end;
end;

procedure TFrameCad_Heranca_Frame.DSStateChange(Sender: TObject);
begin
  if DS.DataSet.Active then
    begin
      if DS.DataSet.State in [dsInsert] then
        begin
          UniPageControl1.ActivePage := Tab_Cadastro;

          UniStatusBar1.Panels.Items[0].Text:= 'Incluindo...';
        end;

      if DS.DataSet.State in [dsEdit] then
        begin
          UniStatusBar1.Panels.Items[0].Text:= 'Alterando...';

          UniPageControl1.ActivePage := Tab_Cadastro;
        end;
    end;
end;

procedure TFrameCad_Heranca_Frame.UniFrameCreate(Sender: TObject);
begin
  UniPageControl1.ActivePage  := Tab_Consulta;
end;

procedure TFrameCad_Heranca_Frame.bt_pesquisarClick(Sender: TObject);
begin
  UniPageControl1.ActivePage  := Tab_Consulta;
end;

procedure TFrameCad_Heranca_Frame.bt_proximoClick(Sender: TObject);
begin
  if Not(DS.DataSet.Active) then
    DS.DataSet.Open;
  DS.DataSet.Next;
end;

end.
