inherited FormCad_Cliente_Fornecedor: TFormCad_Cliente_Fornecedor
  Caption = 'Clientes / Fornecedores'
  ClientHeight = 479
  ClientWidth = 774
  ExplicitWidth = 790
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniStatusBar1: TUniStatusBar
    Top = 460
    Width = 774
    ExplicitTop = 460
    ExplicitWidth = 774
  end
  inherited UniToolBar1: TUniToolBar
    Width = 774
    ExplicitWidth = 774
  end
  inherited UniPageControl1: TUniPageControl
    Width = 774
    Height = 420
    ActivePage = Tab_Consulta
    ExplicitWidth = 774
    ExplicitHeight = 420
    inherited Tab_Cadastro: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 766
      ExplicitHeight = 392
      inherited ScrollBox: TUniScrollBox
        Left = 719
        Top = 319
        Width = 38
        Height = 40
        Align = alNone
        Anchors = [akLeft, akTop]
        ExplicitLeft = 719
        ExplicitTop = 319
        ExplicitWidth = 38
        ExplicitHeight = 40
      end
      object pn_classificacao: TUniPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 41
        Hint = ''
        Caption = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        TabOrder = 1
        object UniLabel1: TUniLabel
          Left = 3
          Top = 3
          Width = 65
          Height = 13
          Hint = ''
          Caption = 'Classifica'#231#227'o:'
          ParentFont = False
          TabOrder = 5
        end
        object chk_fornecedor: TUniDBCheckBox
          Left = 82
          Top = 3
          Width = 97
          Height = 17
          Hint = ''
          DataField = 'FORNECEDOR'
          DataSource = DS
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          Caption = 'Fornecedor'
          ParentFont = False
          TabOrder = 2
        end
        object chk_cliente: TUniDBCheckBox
          Left = 82
          Top = 19
          Width = 97
          Height = 17
          Hint = ''
          DataField = 'CLIENTE'
          DataSource = DS
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          Caption = 'Cliente'
          ParentFont = False
          TabOrder = 3
        end
        object UniLabel2: TUniLabel
          Left = 234
          Top = 3
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'Pessoa:'
          ParentFont = False
          TabOrder = 6
        end
        object rdb_pessoa_fisica: TUniRadioButton
          Left = 277
          Top = 1
          Width = 114
          Height = 15
          Hint = ''
          Checked = True
          Caption = 'Fis'#237'ca'
          TabOrder = 4
          ParentFont = False
        end
        object rdb_pessoa_juridica: TUniRadioButton
          Left = 277
          Top = 16
          Width = 113
          Height = 16
          Hint = ''
          Checked = False
          Caption = 'Jurid'#237'ca'
          TabOrder = 0
          ParentFont = False
        end
      end
      object pn_principal: TUniPanel
        Left = 0
        Top = 41
        Width = 766
        Height = 56
        Hint = ''
        Caption = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 2
        object DB_Nome: TUniDBEdit
          Tag = 1
          Left = 71
          Top = 17
          Width = 355
          Height = 22
          Hint = ''
          DataField = 'NOME'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          TabOrder = 0
          Color = clWhite
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.allowBlank=false;'#13#10'}')
          OnExit = DB_NomeExit
        end
        object DB_Ativo: TUniDBCheckBox
          Left = 447
          Top = 20
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
          TabOrder = 1
        end
        object UniLabel3: TUniLabel
          Left = 3
          Top = 21
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Nome:'
          ParentFont = False
          TabOrder = 3
        end
      end
      object pn_inf_adicional: TUniPanel
        Left = 0
        Top = 97
        Width = 766
        Height = 295
        Hint = ''
        TitleVisible = True
        Title = 'Informa'#231#245'es adicionais'
        Caption = ''
        Collapsible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        TabOrder = 3
        object UniLabel4: TUniLabel
          Left = 332
          Top = 107
          Width = 37
          Height = 13
          Hint = ''
          Caption = 'Estado:'
          ParentFont = False
          TabOrder = 10
        end
        object cmb_estado: TUniDBComboBox
          Left = 372
          Top = 104
          Width = 54
          Height = 22
          Hint = ''
          DataField = 'ESTADO'
          DataSource = DS
          Style = csDropDownList
          MaxLength = 0
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MT'
            'MS'
            'PA'
            'PB'
            'PE'
            'PR'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SE'
            'SP'
            'TO')
          ItemIndex = -1
          ParentFont = False
          TabOrder = 4
        end
        object DB_Fone: TUniDBEdit
          Left = 71
          Top = 133
          Width = 122
          Height = 22
          Hint = 'Digite sem pontos ou tra'#231'os.'
          ShowHint = True
          ParentShowHint = False
          DataField = 'FONE'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          TabOrder = 6
          Color = clWhite
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.emptyText='#39'(000)0000-0000'#39';'#13#10'}')
          OnExit = DB_FoneExit
        end
        object DB_Email: TUniDBEdit
          Left = 71
          Top = 164
          Width = 355
          Height = 22
          Hint = ''
          DataField = 'EMAIL'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecLowerCase
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsUnderline]
          TabOrder = 7
          Color = clWhite
        end
        object DB_Cidade: TUniDBEdit
          Left = 71
          Top = 103
          Width = 244
          Height = 22
          Hint = ''
          DataField = 'CIDADE'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          TabOrder = 3
          Color = clWhite
        end
        object DB_Endereco: TUniDBEdit
          Left = 71
          Top = 74
          Width = 355
          Height = 22
          Hint = ''
          DataField = 'ENDERECO'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          TabOrder = 2
          Color = clWhite
        end
        object DB_Cep: TUniDBEdit
          Left = 476
          Top = 103
          Width = 91
          Height = 22
          Hint = 'Digite sem pontos ou tra'#231'os.'
          ShowHint = True
          ParentShowHint = False
          DataField = 'CEP'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Alignment = taRightJustify
          ParentFont = False
          TabOrder = 5
          Color = clWhite
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.emptyText='#39'00000-000'#39';'#13#10'}')
          OnExit = DB_CepExit
        end
        object UniLabel5: TUniLabel
          Left = 3
          Top = 79
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Endere'#231'o:'
          ParentFont = False
          TabOrder = 11
        end
        object UniLabel6: TUniLabel
          Left = 3
          Top = 107
          Width = 37
          Height = 13
          Hint = ''
          Caption = 'Cidade:'
          ParentFont = False
          TabOrder = 12
        end
        object UniLabel7: TUniLabel
          Left = 447
          Top = 107
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'CEP:'
          ParentFont = False
          TabOrder = 13
        end
        object UniLabel8: TUniLabel
          Left = 3
          Top = 135
          Width = 28
          Height = 13
          Hint = ''
          Caption = 'Fone:'
          ParentFont = False
          TabOrder = 14
        end
        object UniLabel9: TUniLabel
          Left = 3
          Top = 166
          Width = 32
          Height = 13
          Hint = ''
          Caption = 'E-mail:'
          ParentFont = False
          TabOrder = 15
        end
        object UniLabel10: TUniLabel
          Left = 3
          Top = 195
          Width = 62
          Height = 13
          Hint = ''
          Caption = 'Observa'#231#227'o:'
          ParentFont = False
          TabOrder = 16
        end
        object memo_observacao: TUniDBMemo
          Left = 71
          Top = 194
          Width = 496
          Height = 57
          Hint = ''
          DataField = 'OBSERVACAO'
          DataSource = DS
          ParentFont = False
          TabOrder = 8
          Color = clWindow
        end
        object UniLabel12: TUniLabel
          Left = 3
          Top = 50
          Width = 58
          Height = 13
          Hint = ''
          Caption = 'CPF / CNPJ:'
          ParentFont = False
          TabOrder = 17
        end
        object DB_CPF_CNPJ: TUniDBEdit
          Left = 71
          Top = 45
          Width = 121
          Height = 22
          Hint = 'Digite sem pontos ou tra'#231'os.'
          ShowHint = True
          ParentShowHint = False
          DataField = 'CPF_CNPJ'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          TabOrder = 1
          Color = clWindow
          OnExit = DB_CPF_CNPJExit
        end
        object UniLabel14: TUniLabel
          Left = 3
          Top = 19
          Width = 64
          Height = 13
          Hint = ''
          Caption = 'Raz'#227'o Social:'
          ParentFont = False
          TabOrder = 18
        end
        object DB_Razao_Social: TUniDBEdit
          Tag = 1
          Left = 71
          Top = 17
          Width = 355
          Height = 22
          Hint = ''
          DataField = 'RAZAO_SOCIAL'
          DataSource = DS
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          ParentFont = False
          TabOrder = 0
          Color = clWhite
          ClientEvents.ExtEvents.Strings = (
            
              'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
              'er.allowBlank=false;'#13#10'}')
        end
      end
    end
    inherited Tab_Consulta: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 766
      ExplicitHeight = 392
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 46
        Hint = ''
        Caption = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        object UniLabel11: TUniLabel
          Left = 10
          Top = 15
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Nome:'
          ParentFont = False
          Font.Name = 'Segoe UI'
          TabOrder = 5
        end
        object edt_pesq_nome: TUniEdit
          Left = 66
          Top = 11
          Width = 248
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          ParentFont = False
          Font.Name = 'Segoe UI'
          TabOrder = 0
          Color = clWindow
          OnKeyPress = edt_pesq_nomeKeyPress
        end
        object chk_pesq_fornecedor: TUniCheckBox
          Left = 540
          Top = 4
          Width = 93
          Height = 15
          Hint = ''
          Checked = True
          Caption = 'Fornecedor'
          ParentFont = False
          Font.Name = 'Segoe UI'
          TabOrder = 2
        end
        object chk_pesq_cliente: TUniCheckBox
          Left = 540
          Top = 25
          Width = 77
          Height = 15
          Hint = ''
          Checked = True
          Caption = 'Cliente'
          ParentFont = False
          Font.Name = 'Segoe UI'
          TabOrder = 3
        end
        object edt_pesq_cpf_cnpj: TUniEdit
          Left = 396
          Top = 11
          Width = 131
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          ParentFont = False
          Font.Name = 'Segoe UI'
          TabOrder = 1
          Color = clWindow
          OnKeyPress = edt_pesq_nomeKeyPress
        end
        object UniLabel13: TUniLabel
          Left = 331
          Top = 15
          Width = 57
          Height = 13
          Hint = ''
          Caption = 'CPF / CNPJ:'
          ParentFont = False
          Font.Name = 'Segoe UI'
          TabOrder = 6
        end
        object bt_pesquisa: TUniBitBtn
          Left = 644
          Top = 10
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
          TabOrder = 7
          OnClick = bt_pesquisaClick
        end
      end
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 46
        Width = 766
        Height = 346
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
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 175
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'RAZAO_SOCIAL'
            Title.Caption = 'Raz'#227'o Social'
            Width = 175
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'IMG_ATIVO'
            Title.Caption = 'Ativo'
            Width = 50
            Visible = True
            Alignment = taCenter
            Expanded = False
          end
          item
            FieldName = 'IMG_FORNECEDOR'
            Title.Caption = 'Fornecedor'
            Width = 65
            Visible = True
            Alignment = taCenter
            Expanded = False
          end
          item
            FieldName = 'IMG_CLIENTE'
            Title.Caption = 'Cliente'
            Width = 65
            Visible = True
            Alignment = taCenter
            Expanded = False
          end
          item
            FieldName = 'CPF_CNPJ'
            Title.Caption = 'CPF/CNPJ'
            Width = 90
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'ENDERECO'
            Title.Caption = 'Endere'#231'o'
            Width = 184
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade'
            Width = 184
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'ESTADO'
            Title.Caption = 'Estado'
            Width = 46
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'CEP'
            Title.Caption = 'CEP'
            Width = 70
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'FONE'
            Title.Caption = 'Fone'
            Width = 88
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'DAT_CADASTRO'
            Title.Caption = 'Cadastro'
            Width = 106
            Visible = True
            Expanded = False
            Sortable = True
          end>
      end
    end
  end
  inherited DS: TDataSource
    DataSet = ADQuery
    Left = 734
  end
  object ADQuery: TADQuery
    CachedUpdates = True
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT ID_F_C,'
      '       ID_MASTER,'
      '       NOME,'
      '       RAZAO_SOCIAL,'
      '       TIPO,'
      '       ATIVO,'
      '       FONE,'
      '       EMAIL,'
      '       FORNECEDOR,'
      '       CLIENTE,'
      '       CPF_CNPJ,'
      '       ENDERECO,'
      '       CIDADE,'
      '       ESTADO,'
      '       CEP,'
      '       OBSERVACAO,'
      '       DAT_CADASTRO,'
      '       ID_USUARIO'
      '  FROM FORNECEDOR_CLIENTE'
      ' WHERE ID_MASTER = :ID_MASTER')
    Left = 696
    Top = 7
    ParamData = <
      item
        Name = 'ID_MASTER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object ADQueryID_F_C: TADAutoIncField
      FieldName = 'ID_F_C'
      Origin = 'ID_F_C'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      IdentityInsert = True
    end
    object ADQueryID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
      Origin = 'ID_MASTER'
      Visible = False
    end
    object ADQueryNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object ADQueryRAZAO_SOCIAL: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 30
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 100
    end
    object ADQueryTIPO: TWideStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object ADQueryATIVO: TWideStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object ADQueryIMG_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'IMG_ATIVO'
      OnGetText = ADQueryIMG_ATIVOGetText
      Calculated = True
    end
    object ADQueryEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Visible = False
      Size = 100
    end
    object ADQueryFORNECEDOR: TWideStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object ADQueryCLIENTE: TWideStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object ADQueryIMG_FORNECEDOR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'IMG_FORNECEDOR'
      OnGetText = ADQueryIMG_FORNECEDORGetText
      Calculated = True
    end
    object ADQueryIMG_CLIENTE: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cliente'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'IMG_CLIENTE'
      OnGetText = ADQueryIMG_CLIENTEGetText
      Calculated = True
    end
    object ADQueryCPF_CNPJ: TWideStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 15
    end
    object ADQueryENDERECO: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 30
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object ADQueryCIDADE: TWideStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 30
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 75
    end
    object ADQueryESTADO: TWideStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 7
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object ADQueryCEP: TWideStringField
      DisplayWidth = 11
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000-000;1;_'
      FixedChar = True
      Size = 9
    end
    object ADQueryFONE: TWideStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Origin = 'FONE'
      FixedChar = True
      Size = 14
    end
    object ADQueryOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Visible = False
      Size = 500
    end
    object ADQueryDAT_CADASTRO: TDateTimeField
      DisplayLabel = 'Cadastro'
      DisplayWidth = 17
      FieldName = 'DAT_CADASTRO'
      Origin = 'DAT_CADASTRO'
    end
    object ADQueryID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Visible = False
    end
  end
end
