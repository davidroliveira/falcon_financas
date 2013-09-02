object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Seja Bem Vindo ao Falcon Finan'#231'as.'
  ClientHeight = 264
  ClientWidth = 408
  Color = clWhite
  OldCreateOrder = False
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object pn_mensagem: TUniPanel
    Left = 0
    Top = 180
    Width = 408
    Height = 84
    Hint = ''
    Caption = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    Color = clMenuHighlight
    TabOrder = 0
    object UniLabel4: TUniLabel
      Left = 8
      Top = 8
      Width = 249
      Height = 23
      Hint = ''
      Caption = 'Cadastro efetuado com Sucesso!'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -17
      Font.Name = 'Segoe UI'
      TabOrder = 1
    end
    object UniLabel5: TUniLabel
      Left = 8
      Top = 36
      Width = 317
      Height = 20
      Hint = ''
      Caption = 'Foi enviado para seu e-mail a confirma'#231#227'o para'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      TabOrder = 2
    end
    object UniLabel6: TUniLabel
      Left = 8
      Top = 58
      Width = 143
      Height = 20
      Hint = ''
      Caption = 'utiliza'#231#227'o do sistema.'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      TabOrder = 3
    end
  end
  object pn_cadastro: TUniPanel
    Left = 0
    Top = 0
    Width = 408
    Height = 267
    Hint = ''
    Caption = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clWhite
    TabOrder = 1
    object UniLabel1: TUniLabel
      Left = 8
      Top = 16
      Width = 212
      Height = 13
      Hint = ''
      Caption = 'Informe seu e-mail para realizar o Cadastro:'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      TabOrder = 1
    end
    object edt_email: TUniEdit
      Tag = 1
      Left = 8
      Top = 32
      Width = 353
      Height = 28
      Hint = ''
      PasswordChar = #0
      CharCase = ecLowerCase
      MaxLength = 0
      CharEOL = #0
      Text = ''
      TabOrder = 2
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
          'er.allowBlank=false;'#13#10'}')
      OnExit = edt_emailExit
    end
    object UniLabel3: TUniLabel
      Left = 8
      Top = 69
      Width = 79
      Height = 13
      Hint = ''
      Caption = 'Nome Completo:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 3
    end
    object edt_nome: TUniEdit
      Tag = 1
      Left = 8
      Top = 84
      Width = 353
      Height = 28
      Hint = ''
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = ''
      TabOrder = 4
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
          'er.allowBlank=false;'#13#10'}')
      OnExit = edt_nomeExit
    end
    object UniLabel2: TUniLabel
      Left = 8
      Top = 123
      Width = 207
      Height = 13
      Hint = ''
      Caption = 'Senha(Ser'#225' utilizada no Login do sistema.):'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 5
    end
    object edt_senha: TUniEdit
      Tag = 1
      Left = 8
      Top = 142
      Width = 207
      Height = 28
      Hint = ''
      PasswordChar = '*'
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = ''
      TabOrder = 6
      Color = clWhite
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
          'er.allowBlank=false;'#13#10'}')
      OnChange = edt_senhaChange
    end
    object bt_cadastrar: TUniBitBtn
      Left = 312
      Top = 232
      Width = 89
      Height = 25
      Hint = ''
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Realizando Cadastro...'
      ScreenMask.Target = Owner
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B00000001000049000000007C3300E4A4
        6B00CC9E630000C58300FFFCE800DCC099003AE7C0003D925300FFC2930000A7
        7600FFEBC900D8A167006AE6CE00E6C59900439E7300CCCCCC00FFFFFF00FFE6
        BD00E9BC8C0000D59F00FFF8DD00F6D9AF0093E8D800FFDDB40054D8C200DAB6
        840000B77E00CDC4B7005AB2810000824100FFFFF70000C89900DDDDDD004AE7
        D200F7E4C50052A86F0080E3D50000E4A500F3BE8C00D2C6BB0000813A005CE5
        CC00FFE9C5004A92530000C7970000AF7C00008C4200FFF9E800E6CAA100D2A1
        6600FFFFED00DEBA870070E1D400E9C3950000CC990000BE800000A07800007E
        3700E5A97700CDA67100EBCB9E0090ECDF005BDEC40055A97100FFF0CE0000D9
        A100DDB684004AE6D600429452004A9F760000BB7F0000884700000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000101010101010
        101010100F0F201010101010101010101010101047030E1010100F1B1B1B1B1B
        1B27272747253745270F3B020202020B074747471D4141462B3A021E32323232
        28061313131313131A2B023230221404390C1F1F1F1F1F1F2947020404190D2F
        393D212121162C3E2D2B022F401E421407393939392418091C01022F0A0A1035
        121010082834383F1E31022F2A2A3C421040401000382340320202042A15331E
        2A2A2A2A1026172A320202321742321111111111113242173202021E12141717
        17171717171714121E0202101E1E1E1E1E1E1E1E1E1E1E1E1E02050202020202
        0202020202020202021910101010101010101010101010101010}
      Caption = 'Cadastrar'
      TabOrder = 7
      OnClick = bt_cadastrarClick
    end
    object UniLabel7: TUniLabel
      Left = 8
      Top = 178
      Width = 77
      Height = 13
      Hint = ''
      Caption = 'Repita a Senha:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 8
    end
    object edt_senha_repete: TUniEdit
      Tag = 1
      Left = 8
      Top = 195
      Width = 207
      Height = 28
      Hint = ''
      PasswordChar = '*'
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = ''
      TabOrder = 9
      Color = clWhite
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
          'er.allowBlank=false;'#13#10'}')
      OnChange = edt_senha_repeteChange
    end
    object img1: TUniImage
      Left = 368
      Top = 28
      Width = 32
      Height = 32
      Hint = ''
      Visible = False
      Center = False
      Stretch = False
      Proportional = False
      Url = '/imagens/32/tick_blue.png'
      Transparent = False
    end
    object img2: TUniImage
      Left = 368
      Top = 84
      Width = 32
      Height = 32
      Hint = ''
      Visible = False
      Center = False
      Stretch = False
      Proportional = False
      Url = '/imagens/32/tick_blue.png'
      Transparent = False
    end
    object img3: TUniImage
      Left = 221
      Top = 138
      Width = 32
      Height = 32
      Hint = ''
      Visible = False
      Center = False
      Stretch = False
      Proportional = False
      Url = '/imagens/32/tick_blue.png'
      Transparent = False
    end
    object img4: TUniImage
      Left = 221
      Top = 191
      Width = 32
      Height = 32
      Hint = ''
      Visible = False
      Center = False
      Stretch = False
      Proportional = False
      Url = '/imagens/32/tick_blue.png'
      Transparent = False
    end
    object chk_termos_de_uso: TUniCheckBox
      Left = 8
      Top = 240
      Width = 160
      Height = 17
      Hint = ''
      Checked = False
      Caption = 'Sim, eu concordo com os '
      TabOrder = 14
    end
    object lb_termos_de_uso: TUniLabel
      Left = 169
      Top = 240
      Width = 83
      Height = 14
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Termos de Uso'
      ParentFont = False
      Font.Color = clMenuHighlight
      Font.Height = -12
      Font.Style = [fsUnderline]
      TabOrder = 15
      OnClick = lb_termos_de_usoClick
    end
  end
end
