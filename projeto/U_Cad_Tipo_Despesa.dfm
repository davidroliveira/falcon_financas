inherited FormCad_Tipo_Despesa: TFormCad_Tipo_Despesa
  Caption = 'Tipo de Despesa'
  ClientWidth = 533
  ExplicitWidth = 549
  ExplicitHeight = 333
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniStatusBar1: TUniStatusBar
    Width = 533
    ExplicitWidth = 533
  end
  inherited UniToolBar1: TUniToolBar
    Width = 533
    ExplicitWidth = 533
  end
  inherited UniPageControl1: TUniPageControl
    Width = 533
    ExplicitWidth = 533
    inherited Tab_Cadastro: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 525
      ExplicitHeight = 208
      inherited ScrollBox: TUniScrollBox
        Left = 472
        Top = 176
        Width = 39
        Height = 32
        Align = alNone
        Anchors = [akLeft, akTop]
        ExplicitLeft = 472
        ExplicitTop = 176
        ExplicitWidth = 39
        ExplicitHeight = 32
      end
      object UniLabel2: TUniLabel
        Left = 3
        Top = 38
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Descri'#231#227'o:'
        TabOrder = 1
      end
      object DB_Descricao: TUniDBEdit
        Tag = 1
        Left = 66
        Top = 34
        Width = 334
        Height = 22
        Hint = ''
        DataField = 'DESCRICAO_DESPESA'
        DataSource = DS
        PasswordChar = #0
        CharCase = ecNormal
        MaxLength = 0
        CharEOL = #0
        TabOrder = 2
        Color = clWhite
      end
      object DB_Ativo: TUniDBCheckBox
        Left = 406
        Top = 37
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'ATIVO'
        DataSource = DS
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Caption = 'Ativo'
        ParentFont = False
        Font.Color = clGreen
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    inherited Tab_Consulta: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 525
      ExplicitHeight = 208
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 525
        Height = 46
        Hint = ''
        Caption = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        object edt_pesq_descricao: TUniEdit
          Left = 65
          Top = 11
          Width = 333
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          TabOrder = 1
          Color = clWindow
          OnKeyPress = edt_pesq_descricaoKeyPress
        end
        object UniLabel1: TUniLabel
          Left = 10
          Top = 15
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'Descri'#231#227'o:'
          TabOrder = 2
        end
        object bt_pesquisa: TUniBitBtn
          Left = 414
          Top = 9
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
        Width = 525
        Height = 162
        Hint = ''
        DataSource = DS
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        WebOptions.LoadMask = True
        WebOptions.LoadMaskMsg = 'Carregando, Por Favor Aguarde...'
        HeaderTitleAlign = taLeftJustify
        OnColumnSort = UniDBGrid1ColumnSort
        OnDblClick = UniDBGrid1DblClick
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Columns = <
          item
            FieldName = 'DESCRICAO_DESPESA'
            Title.Caption = 'Descri'#231#227'o Despesa'
            Width = 325
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'IMG_ATIVO'
            Title.Caption = 'Ativo'
            Width = 50
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'DAT_CADASTRO'
            Title.Caption = 'Cadastro'
            Width = 120
            Visible = True
            Expanded = False
            Sortable = True
          end>
      end
    end
  end
  inherited DS: TDataSource
    DataSet = ADQuery
    Left = 494
  end
  object ADQuery: TADQuery
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT * FROM TIPO_DESPESAS'
      ' WHERE ID_MASTER   = :ID_MASTER'
      '   AND ID_EMPRESA  = :ID_EMPRESA')
    Left = 456
    Top = 7
    ParamData = <
      item
        Name = 'ID_MASTER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object ADQueryID_TIPO_DESPESA: TADAutoIncField
      FieldName = 'ID_TIPO_DESPESA'
      Origin = 'ID_TIPO_DESPESA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Visible = False
    end
    object ADQueryID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
      Origin = 'ID_MASTER'
      Required = True
      Visible = False
    end
    object ADQueryID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      Required = True
      Visible = False
    end
    object ADQueryDESCRICAO_DESPESA: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Despesa'
      DisplayWidth = 45
      FieldName = 'DESCRICAO_DESPESA'
      Origin = 'DESCRICAO_DESPESA'
      Required = True
      Size = 100
    end
    object ADQueryATIVO: TWideStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object ADQueryIMG_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'IMG_ATIVO'
      OnGetText = ADQueryIMG_ATIVOGetText
      Calculated = True
    end
    object ADQueryDAT_CADASTRO: TDateTimeField
      DisplayLabel = 'Cadastro'
      DisplayWidth = 17
      FieldName = 'DAT_CADASTRO'
      Origin = 'DAT_CADASTRO'
      Required = True
    end
    object ADQueryID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
      Visible = False
    end
  end
end
