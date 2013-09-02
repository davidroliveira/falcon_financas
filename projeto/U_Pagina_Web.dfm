object FormPagina_Web: TFormPagina_Web
  Left = 0
  Top = 0
  Caption = 'P'#225'gina Web'
  ClientHeight = 618
  ClientWidth = 690
  Color = clBtnFace
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object url_frame: TUniURLFrame
    Left = 0
    Top = 57
    Width = 690
    Height = 561
    OnFrameLoaded = url_frameFrameLoaded
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ParentColor = False
    Color = clWindow
    ExplicitTop = 144
    ExplicitWidth = 733
    ExplicitHeight = 465
  end
  object URL_Status: TUniURLFrame
    Left = 0
    Top = 0
    Width = 690
    Height = 57
    HTML.Strings = (
      '<!DOCTYPE html>   '
      '<html>   '
      '<head>   '
      
        '    <meta http-equiv="content-type" content="text/html; charset=' +
        'UTF-8">   '
      '    <title> Falcon Finan'#231'as - Carregando</title>   '
      '    '
      '    '
      '    <style type='#39'text/css'#39'>   '
      '    /* Alinhamento do Corpo da P'#225'gina */'
      '    body {  '
      '        margin:0;  '
      '        padding:0;  '
      '        height:100%;  '
      '    }  '
      '    '
      '    #header  '
      '    {  '
      '        width: 100%;'
      '        background-color: #3399FF;  '
      '        height: 50px;  '
      '        color: White;  '
      '        text-align: center;  '
      '        position: relative;  '
      '        top:0px;  '
      '    }  '
      '    '
      '    div.fonte'
      '    {font-family:'#39'Segoe UI'#39', Tahoma, sans-serif; '
      '     margin:0px; '
      '     font-size:12pt;;'
      '    }  '
      '    </style>   '
      '  '
      '</head>   '
      '    <body>   '
      #9#9'<div id="header">   '
      #9#9#9'<div class="fonte"> Carregando, Aguarde... '
      #9#9#9'</div>'
      #9#9'</div>   '
      '    </body>   '
      '</html>  ')
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ParentColor = False
    Color = clWindow
    ExplicitWidth = 626
  end
end
