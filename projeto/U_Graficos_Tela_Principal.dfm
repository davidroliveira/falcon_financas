object FrameGraficos_Tela_Principal: TFrameGraficos_Tela_Principal
  Left = 0
  Top = 0
  Width = 1268
  Height = 842
  Color = clWhite
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
  object UniPanel2: TUniPanel
    Left = 56
    Top = 3
    Width = 1145
    Height = 806
    Hint = ''
    BorderStyle = ubsNone
    Caption = 'UniPanel2'
    Color = clActiveCaption
    TabOrder = 0
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 1040
      Height = 806
      Hint = ''
      BorderStyle = ubsNone
      Caption = 'UniPanel1'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Color = clWhite
      TabOrder = 1
      object pn_drag: TUniPanel
        Left = 464
        Top = 381
        Width = 368
        Height = 344
        Hint = ''
        BorderStyle = ubsNone
        TitleVisible = True
        Title = 'Portal Beta V 1.0.0.0.0'
        Caption = 'pn_drag'
        Collapsible = True
        Color = clWhite
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   sender.dra' +
            'ggable = true;'#13#10'   sender.resizable = true;'#13#10'   sender.margin = ' +
            ' '#39'10 5 3 10'#39' ;'#13#10'}')
        object UniChart1: TUniChart
          Left = 32
          Top = 56
          Width = 288
          Height = 240
          Hint = ''
          Title.Text.Strings = (
            'TUniChart')
          Legend.Font.Color = clBlack
          Legend.Font.Name = 'Arial'
          Legend.Font.Quality = fqProof
        end
      end
      object UniCalendarPanel1: TUniCalendarPanel
        Left = 22
        Top = 401
        Width = 369
        Height = 344
        Hint = ''
        DayText = 'Dia'
        MonthText = 'Mes'
        TodayText = 'Hoje'
        WeekText = 'Semana'
        Calendars = <
          item
            CalendarId = 1
            Title = 'Calendar-1'
          end>
        StartDate = 41515.000000000000000000
        BorderStyle = ubsDefault
      end
      object UniPanel7: TUniPanel
        Left = 576
        Top = 15
        Width = 368
        Height = 344
        Hint = ''
        BorderStyle = ubsFrameRaised
        TitleVisible = True
        Title = 'Portal Beta V 1.0.0.0.0'
        Caption = 'pn_drag'
        Collapsible = True
        Color = clWhite
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   //sender.d' +
            'raggable = true;'#13#10'   //sender.resizable = true;'#13#10'   //sender.mar' +
            'gin =  '#39'10 5 3 10'#39' ;'#13#10'}')
        object UniChart2: TUniChart
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 362
          Height = 338
          Hint = ''
          Title.Text.Strings = (
            'TUniChart')
          Legend.Font.Color = clBlack
          Legend.Font.Name = 'Arial'
          Legend.Font.Quality = fqProof
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ExplicitLeft = 7
          ExplicitTop = 4
          ExplicitWidth = 356
          ExplicitHeight = 304
          object Series1: TUniBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.ShapeStyle = fosRoundRectangle
            Marks.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {
              000C0000000000000000DC89400000000000408A400000000000D08B40000000
              0000048F400000000000DC8E4000000000009A90400000000000C06B40000000
              0000C6AB400000000000006D400000000000207440000000000040A940000000
              000026A240}
          end
          object Series2: TUniBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.ShapeStyle = fosRoundRectangle
            Marks.Visible = True
            Emboss.Color = 8487297
            Shadow.Color = 8487297
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {
              000C000000000000000099714000000000801872400000000000E87740000000
              00008E7C4000000000800E7C400000000080B57F40000000000066A840000000
              0000A494400000000000C497400000000000888140000000000013B640000000
              0000804940}
          end
        end
      end
      object pn_drag_saldos: TUniPanel
        Left = 23
        Top = 15
        Width = 368
        Height = 344
        Hint = ''
        BorderStyle = ubsFrameLowered
        TitleVisible = True
        Title = 'Saldo das Contas'
        Caption = ''
        Collapsible = True
        Color = clWhite
        TabOrder = 4
        ClientEvents.ExtEvents.Strings = (
          
            'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   sender.dra' +
            'ggable = true;'#13#10'   sender.resizable = true;'#13#10'   sender.margin = ' +
            ' '#39'10 5 3 10'#39' ;'#13#10'}')
        object UniLabel1: TUniLabel
          Left = 61
          Top = 144
          Width = 58
          Height = 16
          Hint = ''
          Caption = 'Total (R$)'
          ParentFont = False
          Font.Height = -13
          TabOrder = 1
        end
        object lb_saldo: TUniLabel
          Left = 32
          Top = 167
          Width = 118
          Height = 19
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'R$ 0,00'
          ParentFont = False
          Font.Color = clHighlight
          Font.Height = -16
          TabOrder = 2
        end
        object pn_saldo: TUniPanel
          Left = 178
          Top = 2
          Width = 190
          Height = 340
          Hint = ''
          BorderStyle = ubsNone
          TitleAlign = taRightJustify
          TitlePosition = tpRight
          Title = 'Saldo das Contas'
          Caption = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          Color = clWhite
          TabOrder = 3
          object UniPanel4: TUniPanel
            Left = 0
            Top = 0
            Width = 190
            Height = 50
            Hint = ''
            BorderStyle = ubsNone
            Caption = 'Saldo das Contas'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clWhite
            TabOrder = 1
          end
        end
      end
      object UniBitBtn1: TUniBitBtn
        Left = 419
        Top = 19
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'UniBitBtn1'
        TabOrder = 5
        OnClick = UniBitBtn1Click
      end
    end
  end
end
