inherited FormCad_Contas: TFormCad_Contas
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Contas'
  ClientHeight = 393
  ClientWidth = 743
  ExplicitWidth = 759
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniStatusBar1: TUniStatusBar
    Top = 374
    Width = 743
    ExplicitTop = 374
    ExplicitWidth = 743
  end
  inherited UniToolBar1: TUniToolBar
    Width = 743
    ExplicitWidth = 743
  end
  inherited UniPageControl1: TUniPageControl
    Width = 743
    Height = 334
    ExplicitLeft = 8
    ExplicitTop = 44
    ExplicitWidth = 814
    ExplicitHeight = 334
    inherited Tab_Cadastro: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 735
      ExplicitHeight = 306
      inherited ScrollBox: TUniScrollBox
        Width = 735
        Height = 306
        ExplicitTop = -2
        ExplicitWidth = 806
        ExplicitHeight = 306
        object pn_flags: TUniPanel
          Left = 535
          Top = 0
          Width = 201
          Height = 238
          Hint = ''
          BorderStyle = ubsNone
          Caption = ''
          Color = clBtnFace
          TabOrder = 1
          object pn_flag: TUniPanel
            Left = 0
            Top = 0
            Width = 201
            Height = 102
            Hint = ''
            BorderStyle = ubsNone
            TitleVisible = True
            Title = 'Status da Conta'
            Caption = ''
            Collapsible = True
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 1
            object DB_Ativo: TUniDBCheckBox
              Left = 10
              Top = 10
              Width = 95
              Height = 17
              Hint = 'Indica se sua conta est'#225' ativa.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'ATIVO'
              DataSource = DS
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              Caption = 'Conta Ativa'
              ParentFont = False
              Font.Color = clGreen
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBCheckBox1: TUniDBCheckBox
              Left = 10
              Top = 40
              Width = 158
              Height = 17
              Hint = 'Indica se esta conta ira aparecer na tela dos saldos'
              ShowHint = True
              ParentShowHint = False
              DataField = 'VISIVEL_GRAFICOS'
              DataSource = DS
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              Caption = 'Visivel na tela de saldos'
              ParentFont = False
              Font.Color = clGreen
              Font.Style = [fsBold]
              TabOrder = 2
            end
          end
        end
        object pn_geral: TUniPanel
          Left = 0
          Top = 0
          Width = 529
          Height = 238
          Hint = ''
          BorderStyle = ubsNone
          Caption = ''
          Color = clBtnFace
          TabOrder = 2
          object pn_descricao: TUniPanel
            Left = 0
            Top = 0
            Width = 529
            Height = 69
            Hint = ''
            BorderStyle = ubsNone
            Caption = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 1
            object UniLabel1: TUniLabel
              Left = 11
              Top = 13
              Width = 97
              Height = 13
              Hint = ''
              Caption = 'Descri'#231#227'o da Conta:'
              TabOrder = 3
            end
            object DB_Descricao: TUniDBEdit
              Tag = 1
              Left = 122
              Top = 10
              Width = 351
              Height = 22
              Hint = ''
              DataField = 'NOME_CONTA'
              DataSource = DS
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 0
              Color = clWindow
            end
            object UniLabel2: TUniLabel
              Left = 11
              Top = 45
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'Tipo:'
              TabOrder = 4
            end
            object cmb_tipo: TUniComboBox
              Tag = 1
              Left = 122
              Top = 42
              Width = 140
              Height = 21
              Hint = 
                'BANCO'#13#10'Seria Todas as Suas Contas Banc'#225'rias.'#13#10#13#10'CARTEIRA'#13#10'Dinhei' +
                'ro em Caixa (Caixinha).'#13#10#13#10'INVESTIMENTO'#13#10'Uma conta de investimen' +
                'to geralmente '#233' utilizada para aplica'#231#245'es ou poupan'#231'a, para que ' +
                'tenha um controle diferenciado.'
              ShowHint = True
              ParentShowHint = False
              Style = csDropDown
              MaxLength = 0
              Text = 'CARTEIRA'
              Items.Strings = (
                'BANCO'
                'CARTEIRA'
                'CART'#195'O DE CR'#201'DITO'
                'INVESTIMENTO'
                'POUPAN'#199'A'
                'OUTROS')
              ItemIndex = -1
              TabOrder = 1
              RemoteQuery = False
              CharCase = ecNormal
              OnCloseUp = cmb_tipoCloseUp
              OnExit = cmb_tipoExit
            end
            object img_banco: TUniImage
              Left = 653
              Top = 1
              Width = 32
              Height = 32
              Hint = ''
              Center = False
              Stretch = False
              Proportional = False
              Transparent = False
            end
          end
          object pn_banco: TUniPanel
            Left = 0
            Top = 69
            Width = 529
            Height = 32
            Hint = ''
            BorderStyle = ubsNone
            Caption = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 2
            object UniLabel4: TUniLabel
              Left = 11
              Top = 10
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'Banco:'
              TabOrder = 1
            end
            object cmb_banco: TComboBoxYeni
              Tag = 0
              Left = 122
              Top = 5
              Width = 351
              Height = 21
              Hint = ''
              Style = csDropDown
              MaxLength = 0
              RemoteQuery = False
              TabOrder = 2
              OnExit = cmb_bancoExit
            end
          end
          object pn_saldo: TUniPanel
            Left = 0
            Top = 101
            Width = 529
            Height = 38
            Hint = ''
            BorderStyle = ubsNone
            Caption = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            TabOrder = 3
            object UniLabel6: TUniLabel
              Left = 11
              Top = 11
              Width = 77
              Height = 13
              Hint = ''
              Caption = 'Saldo da Conta:'
              TabOrder = 2
            end
            object spb_edita_saldo: TUniSpeedButton
              Left = 239
              Top = 7
              Width = 23
              Height = 22
              Hint = 'Ajustar Saldo.'
              ShowHint = True
              ParentShowHint = False
              AllowAllUp = False
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000120B0000120B000000010000350000003A6B9A00E8B9
                E800B672B200129BFF00787D6E003EB9FF00CCCCCC00327DC90080A4B50090D5
                FD0099DBF900538CD100FFFFFF00C990C9007FABD10029A6FF00596C7C004ECE
                FF00BE8BD300986ACA00B9B6AF004CAAEA00F2F0EB0093867A005F829D0032B9
                FF005FBBFF00AE7DCE0087877F0096BFDE00B9E3F400D5A6D2001F9CFF00426B
                9C008A8E84004A688400397DC5004FB1EB0051CFFF00326CA200BB7FB700807A
                720088E2FF009FE6FF004F94D90086898000D3D0CB001A9DFF0043BCFF003DB9
                FF00C38AD900958A810000000000000000000000000000000000000000000000
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
                0000000000000000000000000000000000000000000000000000060606060C0C
                0C0C0C0C0C0C0C0C0C0C10232C0B060C0C0C0C0C0C0C0C0C0C0C1808091A0006
                0C0C0C0C0C0C0C0C0C0C152B0A202000060C0C0C0C0C0C0C0C0C252A300F2020
                00060C0C0C0C0C0C0C0C0C2411310F202000060C0C0C0C0C0C0C0C0C2426050F
                202000060C0C0C0C0C0C0C0C0C2426050F202000060C0C0C0C0C0C0C0C0C2426
                050F202000060C0C0C0C0C0C0C0C0C2426050F202027060C0C0C0C0C0C0C0C0C
                2426310F030E29060C0C0C0C0C0C0C0C0C2411191D331404060C0C0C0C0C0C0C
                0C0C071E172E2202130C0C0C0C0C0C0C0C0C0C17162D0D281B0C0C0C0C0C0C0C
                0C0C0C0C1C011F120C0C0C0C0C0C0C0C0C0C0C0C0C32120C0C0C}
              Caption = ''
              ParentColor = False
              Color = clBtnFace
              OnClick = spb_edita_saldoClick
            end
            object edt_saldo: TUniDBEdit
              Left = 122
              Top = 7
              Width = 110
              Height = 22
              Hint = 'Saldo da Conta.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'SALDO'
              DataSource = DS
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 0
              Color = clWindow
              ClientEvents.ExtEvents.Strings = (
                
                  'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'   event: sen' +
                  'der.allowBlank=false; '#13#10'   event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
              OnExit = edt_saldoExit
            end
          end
        end
      end
    end
    inherited Tab_Consulta: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 735
      ExplicitHeight = 306
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 735
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
          OnKeyPress = edt_pesq_descricaoKeyPress
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
        Width = 735
        Height = 260
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
            FieldName = 'NOME_CONTA'
            Title.Caption = 'Descri'#231#227'o da Conta'
            Width = 200
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 80
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'NOME_BANCO'
            Title.Caption = 'Nome do Banco'
            Width = 170
            Visible = True
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'SALDO'
            Title.Caption = 'Saldo'
            Width = 100
            Visible = True
            Alignment = taRightJustify
            Expanded = False
            Sortable = True
          end
          item
            FieldName = 'IMG_ATIVO'
            Title.Caption = 'Ativo'
            Width = 50
            Visible = True
            Expanded = False
            ImageOptions.Visible = True
          end
          item
            FieldName = 'DAT_CADASTRO'
            Title.Caption = 'Cadastro'
            Width = 110
            Visible = True
            Expanded = False
            Sortable = True
          end>
      end
    end
  end
  inherited DS: TDataSource
    DataSet = ADQuery
    Left = 694
  end
  object ADQuery: TADQuery
    CachedUpdates = True
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT A.ID_CONTAS,'
      '                 A.ID_MASTER,'
      '                 A.ID_EMPRESA,'
      '                 A.NOME_CONTA,'
      '                 A.TIPO,'
      '                 A.ID_BANCOS,'
      '                 B.NOME_BANCO,'
      '                 A.SALDO,'
      '                 A.ATIVO,'
      '                 A.VISIVEL_GRAFICOS,   '
      '                 B.LOGO,'
      '                 A.DAT_CADASTRO,'
      '                 A.ID_USUARIO'
      '           FROM CONTAS       A,'
      '                BANCOS       B '
      '          WHERE A.ID_BANCOS  =  B.ID_BANCOS '
      '            AND A.TIPO       = '#39'BANCO'#39
      '            AND A.ID_MASTER  = :ID_MASTER'
      '            AND A.ID_EMPRESA = :ID_EMPRESA'
      '          UNION'
      '         SELECT A.ID_CONTAS,'
      '                A.ID_MASTER,'
      '                A.ID_EMPRESA,'
      '                A.NOME_CONTA,'
      '                A.TIPO,'
      '                A.ID_BANCOS,'
      '                '#39#39' NOME_BANCO,'
      '                A.SALDO,'
      '                A.ATIVO,'
      '                A.VISIVEL_GRAFICOS,'
      '                B.PARAMETRO_BLOB,'
      '                A.DAT_CADASTRO,'
      '                A.ID_USUARIO'
      '          FROM CONTAS       A,'
      '               PARAMETROS   B'
      '         WHERE A.TIPO       = '#39'CARTEIRA'#39
      '           AND B.MODULO     = '#39'CONTAS'#39
      '           AND B.TITULO     = '#39'IMAGEM PADRAO CARTEIRA'#39
      '           AND A.ID_MASTER  = :ID_MASTER'
      '           AND A.ID_EMPRESA = :ID_EMPRESA')
    Left = 658
    Top = 8
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
    object ADQueryID_CONTAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CONTAS'
      Origin = 'ID_CONTAS'
      ProviderFlags = [pfInKey]
    end
    object ADQueryID_MASTER: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_MASTER'
      Origin = 'ID_MASTER'
      ProviderFlags = []
    end
    object ADQueryID_EMPRESA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object ADQueryNOME_CONTA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CONTA'
      Origin = 'NOME_CONTA'
      ProviderFlags = []
      Size = 100
    end
    object ADQueryTIPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      Size = 45
    end
    object ADQueryID_BANCOS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_BANCOS'
      Origin = 'ID_BANCOS'
      ProviderFlags = []
    end
    object ADQueryNOME_BANCO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_BANCO'
      Origin = 'NOME_BANCO'
      ProviderFlags = []
      Size = 100
    end
    object ADQuerySALDO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      currency = True
      Precision = 12
      Size = 2
    end
    object ADQueryATIVO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object ADQueryVISIVEL_GRAFICOS: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VISIVEL_GRAFICOS'
      Origin = 'VISIVEL_GRAFICOS'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object ADQueryLOGO: TGraphicField
      AutoGenerateValue = arDefault
      FieldName = 'LOGO'
      Origin = 'LOGO'
      ProviderFlags = []
      BlobType = ftGraphic
      GraphicHeader = False
    end
    object ADQueryDAT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DAT_CADASTRO'
      Origin = 'DAT_CADASTRO'
      ProviderFlags = []
    end
    object ADQueryID_USUARIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = []
    end
    object ADQueryIMG_ATIVO: TStringField
      FieldKind = fkCalculated
      FieldName = 'IMG_ATIVO'
      OnGetText = ADQueryIMG_ATIVOGetText
      Size = 0
      Calculated = True
    end
  end
end
