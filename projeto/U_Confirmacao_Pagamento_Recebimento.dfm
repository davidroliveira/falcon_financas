object FormConfirmacao_Pagamento_Recebimento: TFormConfirmacao_Pagamento_Recebimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pagamento'
  ClientHeight = 280
  ClientWidth = 530
  Color = clBtnFace
  OldCreateOrder = False
  OnDestroy = UniFormDestroy
  OnShow = UniFormShow
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object pn_principal: TUniPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 56
    Hint = ''
    Caption = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 0
    object edt_data: TUniDateTimePicker
      Tag = 1
      Left = 8
      Top = 24
      Width = 110
      Height = 21
      Hint = ''
      DateTime = 41378.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDate
      FirstDayOfWeek = dowLocaleDefault
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
          'er.allowBlank=false; '#13#10'}')
    end
    object lb_data: TUniLabel
      Left = 8
      Top = 9
      Width = 99
      Height = 13
      Hint = ''
      Caption = 'Data de Pagamento:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 2
    end
    object cmb_forma: TComboBoxYeni
      Tag = 1
      Left = 128
      Top = 24
      Width = 187
      Height = 21
      Hint = ''
      Style = csDropDown
      MaxLength = 0
      RemoteQuery = False
      TabOrder = 3
    end
    object lb_forma: TUniLabel
      Left = 128
      Top = 9
      Width = 106
      Height = 13
      Hint = ''
      Caption = 'Forma de Pagamento:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 4
    end
    object lb_valor: TUniLabel
      Left = 322
      Top = 9
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'Valor Pago:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 5
    end
    object bt_incluir: TUniBitBtn
      Left = 418
      Top = 20
      Width = 71
      Height = 25
      Hint = 'Incluir Pagamento'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFF5F5F5DADADACCCCCCCCCCCCCCCCCCCCCCCCDADADAF5F5F5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDA3C0B3369D6E008C4B00
        8B4A008B4A008C4B369D6EA3C0B3E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E1E1E144A27700905001A16900AA7600AB7700AB7700AA7601A16900905055A8
        82E1E1E1FFFFFFFFFFFFFFFFFFF5F5F555A88200915202AC7700C38C00D69918
        DEA818DEA800D69900C38C01AB7600925355A882F5F5F5FFFFFFFFFFFFAECABE
        0090510FB48302D29900D69B00D193FFFFFFFFFFFF00D19300D69B00D19801AB
        76009050AECBBEFFFFFFFFFFFF369D6C16AB7811C99700D49A00D29700CD8EFF
        FFFFFFFFFF00CD8E00D29700D59B00C18C01A169369E6EFFFFFFFFFFFF008A48
        38C49C00D19800CD9200CB8E00C787FFFFFFFFFFFF00C78700CB8E00CE9300D0
        9A00AB76008C4BFFFFFFFFFFFF00894651D2AF12D4A3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00CF9700AD78008B4AFFFFFFFFFFFF008845
        66DDBE10D0A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00CD
        9700AD78008B4AFFFFFFFFFFFF00884676E0C500CA9800C59000C48E00C187FF
        FFFFFFFFFF00C18700C48E00C79300CB9900AB76008C4BFFFFFFFFFFFF41A675
        59C9A449DEBC00C79400C79400C38EFFFFFFFFFFFF00C38E00C89600CB9A06C1
        9000A16840A878FFFFFFFFFFFFCCE8DB0A9458ADF8E918D0A700C49400C290FF
        FFFFFFFFFF00C39100C79905C89B18B787009050CCE8DBFFFFFFFFFFFFFFFFFF
        55B185199C63BCFFF75DE4C900C39700BF9000C09100C49822CAA231C2970393
        556ABC96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6ABB940E965974D5B69FF3E092
        EFDA79E5CA5DD6B52EB58603915255B288FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFCCE8DB44A87700874400874300874400894644AA7ACCE8DBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = ''
      TabOrder = 6
      OnClick = bt_incluirClick
    end
    object bt_informacoes: TUniBitBtn
      Left = 495
      Top = 20
      Width = 30
      Height = 25
      Hint = 'Informar Descontos, Juros ou Multas.'
      ShowHint = True
      ParentShowHint = False
      Caption = '...'
      TabOrder = 7
      OnClick = bt_informacoesClick
    end
    object edt_valor: TUniEdit
      Left = 322
      Top = 23
      Width = 91
      Hint = ''
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = ''
      TabOrder = 8
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   event: sen' +
          'der.allowBlank=false; '#13#10'   event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
      OnExit = edt_valorExit
    end
  end
  object pn_juros: TUniPanel
    Left = 0
    Top = 56
    Width = 530
    Height = 49
    Hint = ''
    Visible = False
    Caption = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 1
    object lb_multa: TUniLabel
      Left = 226
      Top = 5
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Valor de Multa:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 1
    end
    object lb_juros: TUniLabel
      Left = 8
      Top = 5
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Valor de Juros:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 2
    end
    object lb_desconto: TUniLabel
      Left = 118
      Top = 5
      Width = 91
      Height = 13
      Hint = ''
      Caption = 'Valor de Desconto:'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 3
    end
    object edt_val_multa: TUniEdit
      Left = 226
      Top = 21
      Width = 91
      Hint = ''
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = '0'
      TabOrder = 4
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   event: sen' +
          'der.allowBlank=false; '#13#10'   event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
      OnExit = edt_valorExit
    end
    object edt_val_juros: TUniEdit
      Left = 8
      Top = 21
      Width = 91
      Hint = ''
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = '0'
      TabOrder = 5
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   event: sen' +
          'der.allowBlank=false; '#13#10'   event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
      OnExit = edt_valorExit
    end
    object edt_val_desconto: TUniEdit
      Left = 118
      Top = 21
      Width = 91
      Hint = ''
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      Text = '0'
      TabOrder = 6
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   event: sen' +
          'der.allowBlank=false; '#13#10'   event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
      OnExit = edt_valorExit
    end
  end
  object pn_detalhes: TUniPanel
    Left = 0
    Top = 105
    Width = 530
    Height = 138
    Hint = ''
    Caption = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 2
    object dbg: TUniDBGrid
      Left = 8
      Top = 8
      Width = 481
      Height = 104
      Hint = ''
      DataSource = DS
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.LoadMask = True
      WebOptions.LoadMaskMsg = 'Carregando Pagamentos, Aguarde...'
      HeaderTitleAlign = taLeftJustify
      StripeRows = False
      TabOrder = 1
      Columns = <
        item
          FieldName = 'DAT_PAGAMENTO'
          Title.Caption = 'Data Pagamento'
          Width = 110
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'TIPO'
          Title.Caption = 'Forma de Pagamento'
          Width = 230
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'VALOR_PAGO'
          Title.Caption = 'Valor Pago'
          Width = 110
          Visible = True
          Alignment = taRightJustify
          Expanded = False
        end>
    end
    object lb_saldo: TUniLabel
      Left = 8
      Top = 116
      Width = 70
      Height = 13
      Hint = ''
      Caption = 'Saldo '#224' Pagar:'
      ParentFont = False
      Font.Color = clRed
      TabOrder = 2
    end
    object lb_valor_saldo: TUniLabel
      Left = 105
      Top = 116
      Width = 43
      Height = 14
      Hint = ''
      Caption = 'R$ 0,00'
      ParentFont = False
      Font.Color = clRed
      Font.Height = -12
      TabOrder = 3
    end
    object lb_tot_valor: TUniLabel
      Left = 340
      Top = 116
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'Valor Pago:'
      ParentFont = False
      Font.Color = clGreen
      TabOrder = 4
    end
    object lb_tot_valor_saldo: TUniLabel
      Left = 428
      Top = 116
      Width = 43
      Height = 14
      Hint = ''
      Alignment = taRightJustify
      Caption = 'R$ 0,00'
      ParentFont = False
      Font.Color = clGreen
      Font.Height = -12
      TabOrder = 5
    end
    object bt_excluir: TUniBitBtn
      Left = 495
      Top = 8
      Width = 30
      Height = 25
      Hint = 'Excluir Pagamento'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFE1E1E1CECECECCCCCCCCCCCCCCCCCCCECECEE1E1E1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1CCCCCC7079C63140C02B3BBE2B
        3ABE2B3BBE3140C07079C6CCCCCCF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1
        A1A5C92B3BBE4A5BE26175FC697DFF697CFF697DFF6175FC4A5BE22B3BBEA1A5
        C9F1F1F1FFFFFFFFFFFFFFFFFFA1A5C92F3FC2596DF66276FF6074FE5F73FE5F
        73FD5F73FE6074FE6276FF596DF62F3FC2A1A5C9FFFFFFFFFFFFE1E1E12C3CBF
        5669F45D71FC5B6FFA5A6EF95A6EF95A6EF95A6EF95A6EF95B6FFA5D71FC5669
        F42C3CBFE1E1E1FFFFFF717AC74256DE576DFB5369F85268F75267F75267F752
        67F75267F75267F75268F75369F8576DFB4256DE717AC7FFFFFF3242C04E64F4
        4C63F7425AF43E56F43D55F43D55F43D55F43D55F43D55F43E56F4425AF44C63
        F74E64F43242C0FFFFFF2C3CBF5369F83E56F3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF3E56F35369F82C3CBFFFFFFF2B3BBF6378F7
        334DF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF334D
        F06378F72B3BBFFFFFFF2A39BF8696F82F4BEEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF2F4BEE8696F82A39BFFFFFFF2F3EC1A1ACF4
        3852ED2D48EC2B46EB2A46EB2A46EB2A46EB2A46EB2A46EB2B46EB2D48EC3852
        EDA1ACF42F3EC1FFFFFF838CDB6F7CDD8494F52E4AE9334DE9354FEA3650EA36
        50EA3650EA354FEA334DE92E4AE98494F56F7CDD838CDBFFFFFFFFFFFF2737BF
        9AA7F07F90F3324CE92D49E7304CE8314CE8304CE82D49E7324CE97F90F39AA7
        F02737BFFFFFFFFFFFFFFFFFFFC5CAEE2F3FC397A3EF9EACF76075ED3E57E924
        41E53E57E96075ED9EACF797A3EF2F3FC3C5CAEEFFFFFFFFFFFFFFFFFFFFFFFF
        C5C9EE2737BF6A77DC9EA9F2AFBAF8AFBBF8AFBAF89EA9F26A77DC2737BFC5C9
        EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838CDB2F3EC22737BF27
        37BF2737BF2F3EC2838CDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = ''
      TabOrder = 6
      OnClick = bt_excluirClick
    end
  end
  object pn_conf_pag: TUniPanel
    Left = 0
    Top = 243
    Width = 530
    Height = 37
    Hint = ''
    Caption = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 3
    object bt_confirmar: TUniBitBtn
      Left = 377
      Top = 7
      Width = 112
      Height = 25
      Hint = 'Confirma o Pagamento'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B000000010000180000000085420091F8
        EE003CE9BD0000B79B00CCCCCC00FFFFFF000BE9AB005FF2D40000CC990072F3
        DB004EF0CD001DE9B00000C59B000089490083F4E4002DEBB9005EF2D40000D8
        9D003CEFC40000BD9B006BF7DE004FF0CB0042EFC50000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000050505050505
        050505050505050505050505050505040405050505050505050505050505040D
        0D04050505050505050505050504000606000405050505050505050504000611
        110600040505050505050504000B111111110B0004050505050504000F080808
        0808080F0004050505050D1208080802020808081200040505050D0A0C0C1500
        00150C0C0C15000405050500101000050500070C0C0C0700040505050D0D0505
        05050009131313070004050505050505050505000E030303090D050505050505
        05050505000E03030E0D05050505050505050505050001010005050505050505
        0505050505050D0D050505050505050505050505050505050505}
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = bt_confirmarClick
    end
  end
  object DS: TDataSource
    DataSet = ADQuery
    OnDataChange = DSDataChange
    Left = 250
    Top = 162
  end
  object ADQuery: TADQuery
    CachedUpdates = True
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT B.ID_CAP_AP_VALORES,'
      '       A.ID_CAP_AP,'
      '       A.TIP_PAGAMENTO,'
      '       A.DAT_VENCIMENTO,'
      '       B.DAT_PAGAMENTO,'
      '       C.TIPO,'
      '       A.VAL_PARCELA            VALOR_TOTAL,'
      '       B.VALOR                  VALOR_PAGO,'
      '       IFNULL(A.VAL_JUROS,0)    VALOR_JUROS,'
      '       IFNULL(A.VAL_MULTA,0)    VALOR_MULTA,'
      '       IFNULL(A.VAL_DESCONTO,0) VALOR_DESCONTO       '
      '  FROM CAP_AP                       A'
      
        '  LEFT OUTER JOIN CAP_AP_VALORES    B ON A.ID_MASTER  = B.ID_MAS' +
        'TER'
      
        '                                     AND A.ID_EMPRESA = B.ID_EMP' +
        'RESA'
      
        '                                     AND A.ID_CAP_AP  = B.ID_CAP' +
        '_AP'
      
        '  LEFT OUTER JOIN CONTAS            C ON A.ID_MASTER  = C.ID_MAS' +
        'TER'
      
        '                                     AND A.ID_EMPRESA = C.ID_EMP' +
        'RESA'
      
        '                                     AND B.ID_CONTAS  = C.ID_CON' +
        'TAS'
      ' WHERE A.ID_MASTER     = :ID_MASTER'
      '   AND A.ID_EMPRESA    = :ID_EMPRESA'
      '   AND A.ID_CAP_AP     = :ID_CAP_AP')
    Left = 200
    Top = 161
    ParamData = <
      item
        Name = 'ID_MASTER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'ID_CAP_AP'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
end
