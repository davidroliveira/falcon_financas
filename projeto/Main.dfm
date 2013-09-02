object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Falcon Financas - Entrar'
  ClientHeight = 312
  ClientWidth = 377
  Color = clWhite
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = UniFormShow
  ClientEvents.ExtEvents.Strings = (
    
      '0-OnBeforerender=function window.OnBeforerender(sender)'#13#10'{'#13#10'  wi' +
      'ndow.onbeforeunload = function() '#13#10'  {'#13#10'      ajaxRequest(sender' +
      ', '#39'SessionClosed'#39', [] );'#13#10'      //alert("Sess'#227'o Finalizada com S' +
      'ucesso."); '#13#10'  };'#13#10'  '#13#10'}')
  MonitoredKeys.Keys = <>
  RTL = False
  OnAjaxEvent = UniFormAjaxEvent
  PixelsPerInch = 96
  TextHeight = 13
  object UniImage2: TUniImage
    Left = 8
    Top = 8
    Width = 362
    Height = 86
    Hint = ''
    Center = False
    AutoSize = True
    Stretch = False
    Proportional = False
    Url = '/imagens/Falcon Finan'#231'as Cloud.png'
    Transparent = False
  end
  object edt_senha: TUniEdit
    Left = 48
    Top = 168
    Width = 289
    Height = 28
    Hint = ''
    ScreenMask.WaitData = True
    ScreenMask.Message = 'Aplicando as Configura'#231#245'es de Acesso, Aguarde...'
    ScreenMask.Target = Owner
    PasswordChar = '*'
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    Text = 'v8n1g2a1'
    ParentFont = False
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 1
    Color = clWindow
    ClientEvents.ExtEvents.Strings = (
      
        'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
        'er.allowBlank=false;'#13#10'  '#13#10'  event: sender.emptyText='#39'Senha'#39';'#13#10'}')
    OnKeyPress = edt_senhaKeyPress
  end
  object bt_conectar: TUniBitBtn
    Left = 252
    Top = 209
    Width = 85
    Height = 25
    Hint = ''
    ScreenMask.Enabled = True
    ScreenMask.WaitData = True
    ScreenMask.Message = 'Realizando autentica'#231#227'o...'
    ScreenMask.Target = Owner
    Caption = 'Conectar'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 2
    OnClick = bt_conectarClick
  end
  object UniLabel3: TUniLabel
    Left = 48
    Top = 256
    Width = 139
    Height = 17
    Hint = ''
    Caption = 'N'#227'o Possui uma Conta?'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 4
  end
  object UniLabel4: TUniLabel
    Left = 204
    Top = 256
    Width = 81
    Height = 17
    Cursor = crHandPoint
    Hint = ''
    Caption = 'Inscreva-se J'#225
    ParentFont = False
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    TabOrder = 5
    OnClick = UniLabel4Click
  end
  object UniLabel5: TUniLabel
    Left = 48
    Top = 212
    Width = 121
    Height = 17
    Cursor = crHandPoint
    Hint = ''
    Caption = 'Esqueci minha senha'
    ParentFont = False
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    TabOrder = 6
    OnClick = UniLabel5Click
  end
  object UniLabel6: TUniLabel
    Left = 124
    Top = 278
    Width = 136
    Height = 17
    Hint = ''
    Caption = #169'2013 Falcon Sistemas'
    ParentFont = False
    Font.Color = clSilver
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 7
  end
  object cmb_usuario: TUniComboBox
    Left = 48
    Top = 124
    Width = 289
    Height = 28
    Hint = ''
    Style = csDropDown
    MaxLength = 0
    Text = 'marlonnardi@hotmail.com'
    ItemIndex = -1
    TabOrder = 0
    ClientEvents.ExtEvents.Strings = (
      
        'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   event: sen' +
        'der.allowBlank=false;'#13#10'   event: sender.emptyText='#39'Login (E-mail' +
        ')'#39';'#13#10'}')
    RemoteQuery = False
    CharCase = ecNormal
  end
end
