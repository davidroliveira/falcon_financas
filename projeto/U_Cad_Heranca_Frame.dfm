object FrameCad_Heranca_Frame: TFrameCad_Heranca_Frame
  Left = 0
  Top = 0
  Width = 664
  Height = 382
  OnCreate = UniFrameCreate
  Align = alNone
  Anchors = [akLeft, akTop]
  ShowHint = False
  Visible = True
  TabOrder = 0
  ParentColor = False
  ParentFont = True
  ParentBackground = False
  ParentRTL = False
  RTL = False
  object UniToolBar1: TUniToolBar
    Left = 0
    Top = 0
    Width = 664
    Height = 40
    Hint = ''
    ButtonHeight = 38
    ButtonWidth = 39
    Images = DM_Imagens.img_32
    BorderWidth = 0
    Anchors = [akLeft, akTop, akRight]
    Align = alTop
    TabOrder = 0
    object bt_incluir: TUniToolButton
      Left = 0
      Top = 0
      Hint = 'Incluir'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processando Inclus'#227'o...'
      ScreenMask.Target = UniPageControl1
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 5
      Caption = 'bt_incluir'
      OnClick = bt_incluirClick
    end
    object bt_editar: TUniToolButton
      Left = 39
      Top = 0
      Hint = 'Editar'
      Visible = False
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processando Edi'#231#227'o...'
      ScreenMask.Target = UniPageControl1
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 4
      Caption = 'bt_editar'
      OnClick = bt_editarClick
    end
    object bt_excluir: TUniToolButton
      Left = 78
      Top = 0
      Hint = 'Excluir'
      Visible = False
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processando Exclus'#227'o...'
      ScreenMask.Target = UniPageControl1
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 6
      Caption = 'bt_excluir'
      OnClick = bt_excluirClick
    end
    object bt_salvar: TUniToolButton
      Left = 117
      Top = 0
      Hint = 'Salvar'
      Visible = False
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Salvando...'
      ScreenMask.Target = UniPageControl1
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 2
      Caption = 'bt_salvar'
      OnClick = bt_salvarClick
    end
    object bt_cancelar: TUniToolButton
      Left = 156
      Top = 0
      Hint = 'Cancelar'
      Visible = False
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processando Cancelamento...'
      ScreenMask.Target = UniPageControl1
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 1
      Caption = 'bt_cancelar'
      OnClick = bt_cancelarClick
    end
    object bt_pesquisar: TUniToolButton
      Left = 195
      Top = 0
      Hint = 'Pesquisa'
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 3
      Caption = 'bt_pesquisar'
      OnClick = bt_pesquisarClick
    end
    object bt_anterior: TUniToolButton
      Left = 234
      Top = 0
      Hint = 'Item Anterior'
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 8
      Caption = 'bt_anterior'
      OnClick = bt_anteriorClick
    end
    object bt_proximo: TUniToolButton
      Left = 273
      Top = 0
      Hint = 'Pr'#243'ximo Item'
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 7
      Caption = 'bt_proximo'
      OnClick = bt_proximoClick
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 40
    Width = 664
    Height = 323
    Hint = ''
    ActivePage = Tab_Cadastro
    TabOrder = 1
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    object Tab_Cadastro: TUniTabSheet
      Hint = ''
      Caption = 'Cadastro'
      object ScrollBox: TUniScrollBox
        Left = 0
        Top = 0
        Width = 656
        Height = 295
        Hint = ''
        AutoScroll = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = ubsNone
        TabOrder = 0
        ParentColor = False
        Color = clBtnFace
      end
    end
    object Tab_Consulta: TUniTabSheet
      Hint = ''
      Caption = 'Consulta'
    end
  end
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 363
    Width = 664
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 50
      end>
    SizeGrip = True
    Font.Color = clBtnText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clBtnFace
  end
  object DS: TDataSource
    OnStateChange = DSStateChange
    OnDataChange = DSDataChange
    Left = 627
    Top = 8
  end
end
