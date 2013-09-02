object FormMensagem: TFormMensagem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FormMensagem'
  ClientHeight = 277
  ClientWidth = 444
  Color = clBtnFace
  OldCreateOrder = False
  OnCreate = UniFormCreate
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object UniHTMLMemoMensagem: TUniHTMLMemo
    Left = 0
    Top = 141
    Width = 444
    Height = 106
    Hint = 'Caso queira descrever o erro fique a vontade.'
    ShowHint = True
    ParentShowHint = False
    Lines.Strings = (
      '')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clWindow
    TabOrder = 0
    ClientEvents.ExtEvents.Strings = (
      
        'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
        'er.emptyText='#39'Espa'#231'o utilizado para descri'#231#227'o adiconal do proble' +
        'ma.'#39';'#13#10'}')
  end
  object pn_mensagem: TUniPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 50
    Hint = ''
    Caption = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 1
    object UniImage1: TUniImage
      Left = 1
      Top = 1
      Width = 44
      Height = 48
      Hint = ''
      Center = False
      AutoSize = True
      Stretch = False
      Proportional = True
      Url = '/imagens/32/bug_error.png'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Transparent = False
    end
    object lb_mensagem_principal: TUniLabel
      Left = 51
      Top = 3
      Width = 169
      Height = 13
      Hint = ''
      Caption = 'Ocorreu um pequeno inconveninte.'
      TabOrder = 2
    end
    object UniLabel1: TUniLabel
      Left = 51
      Top = 18
      Width = 273
      Height = 13
      Hint = ''
      Caption = 'Nos informe sobre esta situa'#231#227'o, desde j'#225' agradecemos.'
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 51
      Top = 32
      Width = 335
      Height = 13
      Hint = ''
      Caption = 
        'somente assim conseguimos cada vez mais melhorar nossos produtos' +
        '.'
      TabOrder = 4
    end
  end
  object pn_enviar: TUniPanel
    Left = 0
    Top = 247
    Width = 444
    Height = 30
    Hint = ''
    Caption = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 2
    DesignSize = (
      444
      30)
    object bt_enviar: TUniBitBtn
      Left = 365
      Top = 2
      Width = 75
      Height = 25
      Hint = ''
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Montando relat'#243'rio para envio, Aguarde...'
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
      Caption = 'Enviar'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = bt_enviarClick
    end
  end
  object UniHTMLMemoErro: TUniHTMLMemo
    Left = 0
    Top = 50
    Width = 444
    Height = 91
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    Color = clWindow
    TabOrder = 3
    ShowToolbar = False
  end
end
