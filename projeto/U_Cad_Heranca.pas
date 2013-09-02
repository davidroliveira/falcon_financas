unit U_Cad_Heranca;

interface

uses
  FMTBcd, uniGUIClasses, uniImageList, uniGUIFrame, Data.DB,
  uniScrollBox, uniPanel, uniPageControl, uniToolBar, Classes, Controls,
  uniGUIBaseClasses, uniStatusBar, uniGUIForm, Windows, SysUtils, Dialogs;

type
  TFormCad_Heranca = class(TUniForm)
    DS: TDataSource;
    UniStatusBar1: TUniStatusBar;
    UniToolBar1: TUniToolBar;
    bt_incluir: TUniToolButton;
    bt_editar: TUniToolButton;
    bt_excluir: TUniToolButton;
    bt_salvar: TUniToolButton;
    bt_cancelar: TUniToolButton;
    UniPageControl1: TUniPageControl;
    Tab_Cadastro: TUniTabSheet;
    Tab_Consulta: TUniTabSheet;
    ScrollBox: TUniScrollBox;
    bt_pesquisar: TUniToolButton;
    bt_anterior: TUniToolButton;
    bt_proximo: TUniToolButton;
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_pesquisarClick(Sender: TObject);
    procedure bt_incluirClick(Sender: TObject);
    procedure bt_editarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure bt_proximoClick(Sender: TObject);
    procedure bt_anteriorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormCad_Heranca: TFormCad_Heranca;

implementation

{$R *.dfm}

uses
  U_Verifica_Campo_Null, U_Global, MainModule, U_JS_Humane, U_Sessao,
  U_DM_Imagens;

function FormCad_Heranca: TFormCad_Heranca;
begin
  Result := TFormCad_Heranca(ID.GetFormInstance(TFormCad_Heranca));
end;

procedure TFormCad_Heranca.DSDataChange(Sender: TObject; Field: TField);
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

procedure TFormCad_Heranca.DSStateChange(Sender: TObject);
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

procedure TFormCad_Heranca.UniFormCreate(Sender: TObject);
begin
  UniPageControl1.ActivePage  := Tab_Consulta;
end;

procedure TFormCad_Heranca.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Bloquear o Alt+F4}
  if (Key = VK_F4) then
    Key := 0;

  {Fechar a tela no ESC}
  if DS.DataSet.State in [dsInactive, dsBrowse] then
    begin
      if (Key = VK_ESCAPE ) then
        Close;
    end;

end;

procedure TFormCad_Heranca.UniFormShow(Sender: TObject);
begin
  //CriaLogAcesso(String(TUniForm(Name)));

  if Not DS.DataSet.Active then //se nao estiver ativo
     DS.DataSet.Open;
end;

procedure TFormCad_Heranca.bt_incluirClick(Sender: TObject);
begin
  if Not DS.DataSet.Active then //se nao estiver ativo
    DS.DataSet.Open;
  DS.DataSet.Insert;
end;

procedure TFormCad_Heranca.bt_pesquisarClick(Sender: TObject);
begin
  UniPageControl1.ActivePage  := Tab_Consulta;
end;

procedure TFormCad_Heranca.bt_proximoClick(Sender: TObject);
begin
  if Not(DS.DataSet.Active) then
    DS.DataSet.Open;
  DS.DataSet.Next;
end;

procedure TFormCad_Heranca.bt_salvarClick(Sender: TObject);
var
  State : TDataSetState;
begin
  try
    {Pega a situação do DataSet}
    State := DS.DataSet.State;

    {esta função verifica se o campo obrigatório esta preenchido}
    if Verifica_Edit(TUniForm(Self)) then
      begin

        DS.DataSet.Post;

        UniStatusBar1.Panels.Items[0].Text:= 'Registro Gravado com Sucesso.';
        humane.success('<div> <p><img src= imagens/32/tick_blue.png align=left </> '+
                       'Registro Gravado com Sucesso.</p> </div>',2500,True);


        {Atualiza as informações do DataSet}
        DS.DataSet.Refresh;

        {Recebe a o ultimo registro que foi incluido}
        if (State in [dsInsert]) and (Not(DS.DataSet.IsEmpty)) then
          DS.DataSet.Last;

      end;

  except
    on e: exception do
    ShowMessage('Inconsistência encontrada, o mesmo pode já estar cadastrado ou possui '+
                'campos obrigatórios nao preenchidos!' +#13+ 'Mensagem Original:'+ e.Message);
  end;
end;

procedure TFormCad_Heranca.bt_anteriorClick(Sender: TObject);
begin
  if Not(DS.DataSet.Active) then
    DS.DataSet.Open;
  DS.DataSet.Prior;
end;

procedure TFormCad_Heranca.bt_cancelarClick(Sender: TObject);
begin
  DS.DataSet.Cancel;
  UniStatusBar1.Panels.Items[0].Text:='Processo cancelado.';
end;

procedure TFormCad_Heranca.bt_editarClick(Sender: TObject);
begin
  if DS.DataSet.Active then
   begin
    DS.DataSet.Edit;
    UniStatusBar1.Panels.Items[0].Text  := 'Alterando...';
    UniPageControl1.ActivePage          := Tab_Cadastro;
   end;
end;

procedure TFormCad_Heranca.bt_excluirClick(Sender: TObject);
begin
  MessageDlg('Deseja realmente excluir?', mtConfirmation, mbYesNo, procedure(Res: Integer)
  begin
    if Res = mrYes then
      begin
        try
          if Not DS.DataSet.IsEmpty then //se nao estiver vazio
           begin
             DS.DataSet.Delete;

             DS.DataSet.Post;

             humane.success('<div> <p><img src= imagens/32/empty.png align=left/> '+
                            'Exclusão efetuada com Sucesso.</p> </div>',2500,True);
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
                  ShowMessage('Não é possivel excluir, o mesmo possui dependências com outros regitros! ');
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

end.
