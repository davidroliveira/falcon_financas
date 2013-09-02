inherited FormTransferencia_Saldo: TFormTransferencia_Saldo
  Caption = 'FormTransferencia_Saldo'
  ClientHeight = 400
  ClientWidth = 696
  ExplicitWidth = 712
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniStatusBar1: TUniStatusBar
    Top = 381
    Width = 696
    ExplicitTop = 381
    ExplicitWidth = 696
  end
  inherited UniToolBar1: TUniToolBar
    Width = 696
    ExplicitWidth = 696
  end
  inherited UniPageControl1: TUniPageControl
    Width = 696
    Height = 341
    ExplicitWidth = 696
    ExplicitHeight = 409
    inherited Tab_Cadastro: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 688
      ExplicitHeight = 313
      inherited ScrollBox: TUniScrollBox
        Width = 688
        Height = 313
        ExplicitTop = -2
        ExplicitWidth = 688
        ExplicitHeight = 313
        object cmb_conta_orig: TComboBoxYeni
          Tag = 1
          Left = 131
          Top = 23
          Width = 257
          Height = 23
          Hint = ''
          Style = csDropDown
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.allowBlank=false;'#13#10'  event: sender.emptyText='#39'Informe a Connt' +
              'a de Origem'#39';'#13#10#13#10'}')
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          MaxLength = 0
          ParentFont = False
          RemoteQuery = False
          TabOrder = 0
        end
        object cmb_conta_dest: TComboBoxYeni
          Tag = 1
          Left = 131
          Top = 55
          Width = 257
          Height = 23
          Hint = ''
          Style = csDropDown
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.allowBlank=false;'#13#10'  event: sender.emptyText='#39'Informe a Connt' +
              'a de Destino'#39';'#13#10'}')
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          MaxLength = 0
          ParentFont = False
          RemoteQuery = False
          TabOrder = 1
        end
        object UniLabel1: TUniLabel
          Left = 10
          Top = 29
          Width = 85
          Height = 13
          Hint = ''
          Caption = 'Conta de Origem:'
          TabOrder = 7
        end
        object UniLabel2: TUniLabel
          Left = 10
          Top = 58
          Width = 87
          Height = 13
          Hint = ''
          Caption = 'Conta de Destino:'
          TabOrder = 8
        end
        object UniDBDateTimePicker1: TUniDBDateTimePicker
          Tag = 1
          Left = 131
          Top = 86
          Width = 99
          Height = 21
          Hint = ''
          DateTime = 41508.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDate
          FirstDayOfWeek = dowLocaleDefault
          TabOrder = 2
          DataField = 'DAT_TRANSFERENCIA'
          DataSource = DS
        end
        object UniLabel4: TUniLabel
          Left = 10
          Top = 89
          Width = 111
          Height = 13
          Hint = ''
          Caption = 'Data de Transfer'#234'ncia:'
          TabOrder = 9
        end
        object DB_Agendado: TUniDBCheckBox
          Left = 245
          Top = 89
          Width = 97
          Height = 17
          Hint = 'Indica que a transfer'#234'ncia ir'#225' ser realizada em uma data futura.'
          ShowHint = True
          ParentShowHint = False
          DataField = 'AGENDADO'
          DataSource = DS
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          Caption = 'Agendado'
          TabOrder = 3
        end
        object DB_Motivo: TUniDBMemo
          Tag = 1
          Left = 131
          Top = 113
          Width = 357
          Height = 56
          Hint = ''
          DataField = 'HISTORICO'
          DataSource = DS
          TabOrder = 4
          Color = clWindow
        end
        object UniLabel5: TUniLabel
          Left = 10
          Top = 116
          Width = 105
          Height = 13
          Hint = ''
          Caption = 'Motivo Transfer'#234'ncia:'
          TabOrder = 10
        end
        object DB_Valor: TUniDBEdit
          Tag = 1
          Left = 131
          Top = 175
          Width = 121
          Height = 22
          Hint = ''
          DataField = 'VALOR'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          TabOrder = 5
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.allowBlank=false;'#13#10'  event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
          OnExit = DB_ValorExit
        end
        object UniLabel6: TUniLabel
          Left = 10
          Top = 178
          Width = 112
          Height = 13
          Hint = ''
          Caption = 'Valor da Transfer'#234'ncia:'
          TabOrder = 11
        end
      end
    end
    inherited Tab_Consulta: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 688
      ExplicitHeight = 313
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 688
        Height = 46
        Hint = ''
        Caption = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        object edt_pesq_descricao: TUniEdit
          Left = 113
          Top = 12
          Width = 256
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          TabOrder = 1
          Color = clWindow
        end
        object UniLabel3: TUniLabel
          Left = 10
          Top = 15
          Width = 97
          Height = 13
          Hint = ''
          Caption = 'Descri'#231#227'o da Conta:'
          TabOrder = 2
        end
        object bt_pesquisa: TUniBitBtn
          Left = 397
          Top = 11
          Width = 91
          Height = 25
          Hint = 'Pesquisar'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFEDEDEDF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFADBBC55F98C279A8C8E9EDEFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEBAC32D8C
            D12EB0FF4FB8F4ADC4D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFAFBAC22B8CD223A8FFAAE6FF65BEE8C4D9E8FFFFFFFFFFFF
            FFFFFFFBFBFBBEC3C9A4AFBAA4AFBAABB5BFE8E8E8B0BCC62C8CD124A8FFA8E4
            FF76C8ECBEDAEBFFFFFFFFFFFFFFFFFFD8D8DB7A9FBA64AEDA6EC1F06EC2F06A
            BAE86BA0C32D80BF28A9FFA6E2FF75C7EBB8D7EAFFFFFFFFFFFFFFFFFFE1E1E2
            689DC186D4F8C1D7C9E0CE9DE0D19CD8D2ACA2D9EB67B5E55FADDF7CCBF1B8D6
            E9FFFFFFFFFFFFFFFFFFFFFFFF85ABC58CD8FCDBC79AF9BD6AF5CD83FADA8FFF
            DF90FDCD80B6D9DA64B3E1A3BFD4FFFFFFFFFFFFFFFFFFFFFFFFC5CFD874BAE3
            C2D2C2F1B56AEBCA8CF1D38DF7E29CFDF0AAFFEA9EEAC88894D3EF92B4CDFFFF
            FFFFFFFFFFFFFFFFFFFFA9BED182CFF5D4B884F1CA98F1D8AAF2D596F6DE97FB
            E9A3FAE8A3F5C779AFD5D77AB5DBFFFFFFFFFFFFFFFFFFFFFFFFA8BFD389D4F7
            CFAE76F5D5AFF3DFBCF2D9A8F3D899F4D992F5DC97EEBD70B3D4D27FBADFFFFF
            FFFFFFFFFFFFFFFFFFFFB3C9DC88D0F3C4B287F2CCA2F9EEDCF2DBB6F1D7A6EF
            D092F2D089DDAE68AFD9DF84BBDEFFFFFFFFFFFFFFFFFFFFFFFFF6F8FB87C1E3
            B8DEDECC985CFAE2C9FCEEDBF7E4C5F4D5A3E3AB5EC2B69198D9F6B5CFE2FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFC5D9E88CD0F3C1D6C8C4995FD7A367D9A364D0
            9E5FC1B38CB2E8F686BDDFFAFAFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            B2D1E68ECFEEB4E5EEBED7CAC0D6C6BCDEDAA2E1FA8DC2E3F0F2F6FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFEE7DB9DF6EBCEA70BEEB6A
            B6E4A3C9E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Caption = 'Pesquisar'
          TabOrder = 3
          OnClick = bt_pesquisaClick
        end
      end
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 46
        Width = 688
        Height = 267
        Hint = ''
        DataSource = DS
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        WebOptions.LoadMask = True
        WebOptions.LoadMaskMsg = 'Carregando, Por Favor Aguarde...'
        HeaderTitleAlign = taLeftJustify
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Columns = <
          item
            FieldName = 'CONTA_ORIGEM'
            Title.Caption = 'Conta Origem'
            Width = 150
            Visible = True
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'CONTA_DESTINO'
            Title.Caption = 'Conta Destino'
            Width = 150
            Visible = True
            ReadOnly = True
            Expanded = False
          end
          item
            FieldName = 'DAT_TRANSFERENCIA'
            Title.Caption = 'Data Transfer'#234'ncia'
            Width = 100
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'IMG_AGENDADO'
            Title.Caption = 'Agendado'
            Width = 60
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'VALOR'
            Title.Caption = 'Valor Transferido'
            Width = 105
            Visible = True
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'DAT_CADASTRO'
            Title.Caption = 'Cadastro'
            Width = 100
            Visible = True
            Expanded = False
          end>
      end
    end
  end
  inherited DS: TDataSource
    DataSet = ADQuery
    Left = 654
  end
  object ADQuery: TADQuery
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT A.*,'
      '       B.NOME_CONTA CONTA_ORIGEM,'
      '       C.NOME_CONTA CONTA_DESTINO '
      '  FROM TRANSF_SALDO     A,'
      '       CONTAS           B,'
      '       CONTAS           C'
      ' WHERE A.ID_CONTAS_ORIG = B.ID_CONTAS'
      '   AND A.ID_CONTAS_DEST = C.ID_CONTAS'
      '   AND A.ID_MASTER      = :P00'
      '   AND A.ID_EMPRESA     = :P01'
      '   AND 1 = 0')
    Left = 616
    Top = 6
    ParamData = <
      item
        Name = 'P00'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'P01'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object ADQueryID_TRANSF_SALDO: TADAutoIncField
      FieldName = 'ID_TRANSF_SALDO'
      Origin = 'ID_TRANSF_SALDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADQueryID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
      Origin = 'ID_MASTER'
      Required = True
    end
    object ADQueryID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      Required = True
    end
    object ADQueryID_CONTAS_ORIG: TIntegerField
      FieldName = 'ID_CONTAS_ORIG'
      Origin = 'ID_CONTAS_ORIG'
      Required = True
    end
    object ADQueryID_CONTAS_DEST: TIntegerField
      FieldName = 'ID_CONTAS_DEST'
      Origin = 'ID_CONTAS_DEST'
      Required = True
    end
    object ADQueryDAT_TRANSFERENCIA: TDateField
      FieldName = 'DAT_TRANSFERENCIA'
      Origin = 'DAT_TRANSFERENCIA'
      Required = True
    end
    object ADQueryAGENDADO: TWideStringField
      FieldName = 'AGENDADO'
      Origin = 'AGENDADO'
      FixedChar = True
      Size = 1
    end
    object ADQueryHISTORICO: TWideStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 1000
    end
    object ADQueryVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object ADQueryDAT_CADASTRO: TDateTimeField
      FieldName = 'DAT_CADASTRO'
      Origin = 'DAT_CADASTRO'
      Required = True
    end
    object ADQueryID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object ADQueryCONTA_ORIGEM: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTA_ORIGEM'
      Origin = 'NOME_CONTA'
      ProviderFlags = []
      Size = 100
    end
    object ADQueryCONTA_DESTINO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTA_DESTINO'
      Origin = 'NOME_CONTA'
      ProviderFlags = []
      Size = 100
    end
    object ADQueryIMG_AGENDADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'IMG_AGENDADO'
      ProviderFlags = []
      Calculated = True
    end
  end
end
