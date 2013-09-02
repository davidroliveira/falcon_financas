inherited FrameContas_a_Receber: TFrameContas_a_Receber
  Width = 1287
  Height = 676
  ExplicitWidth = 1287
  ExplicitHeight = 676
  inherited UniToolBar1: TUniToolBar
    Width = 1287
    ExplicitWidth = 1287
    object bt_receber: TUniToolButton
      Left = 312
      Top = 0
      Hint = 'Realizar Recebimento'
      Visible = False
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processando...'
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 12
      Caption = 'bt_receber'
      OnClick = bt_receberClick
    end
    object bt_anexar: TUniToolButton
      Left = 351
      Top = 0
      Hint = 'Anexar arquivo'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processando...'
      ShowHint = True
      ParentShowHint = False
      ImageIndex = 9
      Caption = 'bt_anexar'
      OnClick = bt_anexarClick
    end
  end
  inherited UniPageControl1: TUniPageControl
    Width = 1287
    Height = 617
    ExplicitTop = 44
    ExplicitWidth = 1004
    ExplicitHeight = 617
    inherited Tab_Cadastro: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1279
      ExplicitHeight = 589
      inherited ScrollBox: TUniScrollBox
        Width = 1279
        Height = 589
        ExplicitLeft = 1
        ExplicitTop = -2
        ExplicitWidth = 996
        ExplicitHeight = 589
        object pn_tipo: TUniPanel
          Left = 0
          Top = 0
          Width = 1279
          Height = 35
          Hint = ''
          Caption = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          TabOrder = 1
          object rdb_tip_normal: TUniRadioButton
            Left = 7
            Top = 4
            Width = 73
            Height = 17
            Hint = 'Contas Normais Vencem apenas uma '#250'nica vez.'
            ShowHint = True
            ParentShowHint = False
            Checked = True
            Caption = 'Normal'
            TabOrder = 1
            ParentFont = False
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            OnClick = rdb_tip_normalClick
          end
          object rdb_tip_recorrente: TUniRadioButton
            Left = 112
            Top = 4
            Width = 91
            Height = 17
            Hint = 'Contas Recorrentes sempre ir'#227'o existir, ex: sal'#225'rio.'
            ShowHint = True
            ParentShowHint = False
            Checked = False
            Caption = 'Recorrente'
            TabOrder = 2
            ParentFont = False
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            OnClick = rdb_tip_normalClick
          end
          object rdb_tip_parcelado: TUniRadioButton
            Left = 241
            Top = 4
            Width = 86
            Height = 17
            Hint = 'Receitas Parceladas possuem um n'#250'mero fixo de vencimentos.'
            ShowHint = True
            ParentShowHint = False
            Checked = False
            Caption = 'Parcelada'
            TabOrder = 3
            ParentFont = False
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            OnClick = rdb_tip_normalClick
          end
          object UniImage2: TUniImage
            Left = 73
            Top = 8
            Width = 16
            Height = 16
            Hint = 'Contas Normais Vencem apenas uma '#250'nica vez.'
            ShowHint = True
            ParentShowHint = False
            Center = True
            Stretch = False
            Proportional = False
            Url = '/imagens/16/status_grey_N.png'
            Transparent = False
          end
          object UniImage3: TUniImage
            Left = 199
            Top = 8
            Width = 16
            Height = 16
            Hint = 
              'Contas Recorrentes sempre ir'#227'o existir, ex: conta de telefone, l' +
              'uz, mensalidade academia.'
            ShowHint = True
            ParentShowHint = False
            Center = True
            Stretch = False
            Proportional = False
            Url = '/imagens/16/status_grey_R.png'
            Transparent = False
          end
          object UniImage4: TUniImage
            Left = 321
            Top = 8
            Width = 16
            Height = 16
            Hint = 'Contas Parceladas possuem um n'#250'mero fixo de vencimentos.'
            ShowHint = True
            ParentShowHint = False
            Center = True
            Stretch = False
            Proportional = False
            Url = '/imagens/16/status_grey_P.png'
            Transparent = False
          end
        end
        object pn_principal: TUniPanel
          Left = 0
          Top = 35
          Width = 1279
          Height = 137
          Hint = ''
          Caption = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          TabOrder = 2
          object UniLabel1: TUniLabel
            Left = 7
            Top = 12
            Width = 54
            Height = 15
            Hint = ''
            Caption = 'Descri'#231#227'o:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 9
          end
          object UniLabel2: TUniLabel
            Left = 448
            Top = 12
            Width = 83
            Height = 15
            Hint = ''
            Caption = 'N'#186' Documento:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 10
          end
          object cmb_tipo_receita: TComboBoxYeni
            Tag = 1
            Left = 108
            Top = 71
            Width = 324
            Height = 23
            Hint = ''
            Style = csDropDown
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            MaxLength = 0
            ParentFont = False
            RemoteQuery = False
            TabOrder = 6
            OnClick = cmb_tipo_receitaClick
          end
          object UniLabel3: TUniLabel
            Left = 7
            Top = 71
            Width = 84
            Height = 15
            Hint = ''
            Caption = 'Tipo de Receita:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 11
          end
          object UniLabel4: TUniLabel
            Left = 7
            Top = 103
            Width = 40
            Height = 15
            Hint = ''
            Caption = 'Cliente:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 12
          end
          object cmb_cliente: TComboBoxYeni
            Tag = 1
            Left = 108
            Top = 100
            Width = 324
            Height = 23
            Hint = ''
            Style = csDropDown
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            MaxLength = 0
            ParentFont = False
            RemoteQuery = False
            TabOrder = 7
            OnClick = cmb_clienteClick
          end
          object UniLabel5: TUniLabel
            Left = 260
            Top = 42
            Width = 67
            Height = 15
            Hint = ''
            Caption = 'Vencimento:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 13
          end
          object lb_n_parcelas: TUniLabel
            Left = 653
            Top = 42
            Width = 63
            Height = 15
            Hint = ''
            Visible = False
            Caption = 'N'#186' Parcelas:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 14
          end
          object UniLabel7: TUniLabel
            Left = 7
            Top = 42
            Width = 30
            Height = 15
            Hint = ''
            Caption = 'Valor:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 15
          end
          object lb_forma_recebimento: TUniLabel
            Left = 448
            Top = 42
            Width = 44
            Height = 15
            Hint = ''
            Visible = False
            Caption = 'Periodo:'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 16
          end
          object DB_Descricao: TUniDBEdit
            Tag = 1
            Left = 108
            Top = 10
            Width = 324
            Height = 22
            Hint = ''
            DataField = 'DESCRICAO_DOCUM'
            DataSource = DS
            PasswordChar = #0
            CharCase = ecNormal
            MaxLength = 0
            CharEOL = #0
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 0
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
                'er.allowBlank=false;'#13#10'  event: sender.emptyText='#39'Defina um nome ' +
                'para sua receita...'#39';'#13#10'}')
          end
          object DB_Data_Vencimento: TUniDBDateTimePicker
            Left = 331
            Top = 39
            Width = 101
            Height = 22
            Hint = ''
            DateTime = 41305.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Kind = tUniDate
            FirstDayOfWeek = dowLocaleDefault
            TabOrder = 3
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            ParentColor = False
            Color = clWhite
            ClientEvents.ExtEvents.Strings = (
              
                'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
                'er.allowBlank=false;'#13#10'}')
            DataField = 'DAT_VENCIMENTO'
            DataSource = DS
          end
          object DB_Periodo: TUniDBComboBox
            Left = 535
            Top = 38
            Width = 104
            Height = 23
            Hint = ''
            Visible = False
            DataField = 'PERIODO'
            DataSource = DS
            Style = csDropDown
            MaxLength = 0
            Items.Strings = (
              'Semanal'
              'Quinzenal'
              'Mensal'
              'Trimestral'
              'Semestral'
              'Anual')
            ItemIndex = -1
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 4
          end
          object DB_Documento: TUniDBEdit
            Left = 536
            Top = 8
            Width = 103
            Height = 22
            Hint = ''
            DataField = 'NUM_DOCUM'
            DataSource = DS
            PasswordChar = #0
            CharCase = ecNormal
            MaxLength = 0
            CharEOL = #0
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            TabOrder = 1
            Color = clWindow
          end
          object UniSpeedButton1: TUniSpeedButton
            Left = 438
            Top = 70
            Width = 23
            Height = 22
            Hint = 'Realiza o Cadastro de Tipo de Despesa.'
            ScreenMask.Enabled = True
            ScreenMask.WaitData = True
            ScreenMask.Message = 'Carregando Tela Solicitada, Aguarde...'
            ShowHint = True
            ParentShowHint = False
            AllowAllUp = False
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
            ParentColor = False
            Color = clBtnFace
            OnClick = UniSpeedButton1Click
          end
          object UniSpeedButton2: TUniSpeedButton
            Left = 438
            Top = 101
            Width = 23
            Height = 22
            Hint = 'Realiza o Cadastro de Fornecedor.'
            ScreenMask.Enabled = True
            ScreenMask.WaitData = True
            ScreenMask.Message = 'Carregando Tela Solicitada, Aguarde...'
            ShowHint = True
            ParentShowHint = False
            AllowAllUp = False
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
            ParentColor = False
            Color = clBtnFace
            OnClick = UniSpeedButton2Click
          end
          object DB_Parcelas: TUniDBNumberEdit
            Left = 719
            Top = 39
            Width = 49
            Height = 22
            Hint = ''
            Visible = False
            DataField = 'NUM_PARCELAS'
            DataSource = DS
            MaxLength = 0
            CharEOL = #0
            TabOrder = 5
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
                'er.allowBlank=false;'#13#10'  event: sender.MaxValue=300; '#13#10'}')
            OnExit = DB_ParcelasExit
          end
          object DB_Valor: TUniDBEdit
            Tag = 1
            Left = 108
            Top = 38
            Width = 121
            Height = 22
            Hint = ''
            DataField = 'VAL_PARCELA'
            DataSource = DS
            PasswordChar = #0
            CharCase = ecNormal
            MaxLength = 0
            CharEOL = #0
            ParentFont = False
            Font.Color = clGreen
            Font.Style = [fsBold]
            TabOrder = 2
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
                'er.allowBlank=false; '#13#10'  event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
            OnExit = DB_ValorExit
          end
          object DB_Parcela: TUniDBText
            Left = 719
            Top = 63
            Width = 71
            Height = 13
            Hint = ''
            DataField = 'PARCELA'
            DataSource = DS
            ParentFont = False
            Font.Color = clHotLight
            Font.Style = [fsBold]
          end
        end
        object pn_inf_recebimento: TUniPanel
          Left = 0
          Top = 172
          Width = 1279
          Height = 129
          Hint = ''
          Visible = False
          TitleVisible = True
          Title = 'Informa'#231#245'es de Recebimento'
          Caption = ''
          Collapsible = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          TabOrder = 3
          object UniDBGrid1: TUniDBGrid
            Left = 5
            Top = 3
            Width = 659
            Height = 90
            Hint = ''
            DataSource = DSRecebimento
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            WebOptions.Paged = False
            WebOptions.LoadMask = True
            WebOptions.LoadMaskMsg = 'Carregando, Por Favor Aguarde...'
            HeaderTitleAlign = taLeftJustify
            StripeRows = False
            TabOrder = 1
            Columns = <
              item
                FieldName = 'DAT_RECEBIMENTO'
                Title.Caption = 'Recebimento'
                Width = 70
                Visible = True
                Expanded = False
              end
              item
                FieldName = 'VALOR'
                Title.Caption = 'Valor Recebido'
                Width = 100
                Visible = True
                Alignment = taRightJustify
                Expanded = False
              end
              item
                FieldName = 'TIPO'
                Title.Caption = 'Tipo'
                Width = 125
                Visible = True
                ReadOnly = True
                Expanded = False
              end
              item
                FieldName = 'NOME_CONTA'
                Title.Caption = 'Nome Conta'
                Width = 150
                Visible = True
                ReadOnly = True
                Expanded = False
              end
              item
                FieldName = 'NOME_BANCO'
                Title.Caption = 'Banco'
                Width = 185
                Visible = True
                ReadOnly = True
                Expanded = False
              end>
          end
          object UniBitBtn1: TUniBitBtn
            Left = 670
            Top = 3
            Width = 30
            Height = 25
            Hint = 'Excluir Recebimento'
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
            TabOrder = 2
            OnClick = UniBitBtn1Click
          end
          object bt_informacoes: TUniBitBtn
            Left = 670
            Top = 68
            Width = 30
            Height = 25
            Hint = 'Informar Descontos, Juros ou Multas.'
            ShowHint = True
            ParentShowHint = False
            Caption = '...'
            TabOrder = 3
            OnClick = bt_informacoesClick
          end
          object pn_inf_juros: TUniPanel
            Left = 715
            Top = 3
            Width = 188
            Height = 90
            Hint = ''
            Visible = False
            Caption = ''
            Color = clBtnFace
            TabOrder = 4
            object UniLabel14: TUniLabel
              Left = 28
              Top = 39
              Width = 72
              Height = 13
              Hint = ''
              Caption = 'Valor de Juros:'
              ParentFont = False
              Font.Color = clBlack
              TabOrder = 1
            end
            object UniLabel15: TUniLabel
              Left = 9
              Top = 66
              Width = 91
              Height = 13
              Hint = ''
              Caption = 'Valor de Desconto:'
              ParentFont = False
              Font.Color = clBlack
              TabOrder = 2
            end
            object DB_Val_Juros: TUniDBEdit
              Left = 106
              Top = 34
              Width = 76
              Height = 22
              Hint = ''
              DataField = 'VAL_JUROS'
              DataSource = DS
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 3
              Color = clWindow
              ClientEvents.ExtEvents.Strings = (
                
                  'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
                  'er.allowBlank=false; '#13#10'  event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
            end
            object DB_Val_Desconto: TUniDBEdit
              Left = 106
              Top = 62
              Width = 76
              Height = 22
              Hint = ''
              DataSource = DS
              PasswordChar = #0
              CharCase = ecNormal
              MaxLength = 0
              CharEOL = #0
              TabOrder = 4
              Color = clWindow
              ClientEvents.ExtEvents.Strings = (
                
                  'OnBeforerender=function OnBeforerender(sender)'#13#10'{'#13#10'  event: send' +
                  'er.allowBlank=false; '#13#10'  event: sender.emptyText='#39'R$ 0,00'#39';'#13#10'}')
            end
          end
        end
        object pn_inf_anexo: TUniPanel
          Left = 0
          Top = 301
          Width = 1279
          Height = 124
          Hint = ''
          Visible = False
          TitleVisible = True
          Title = 'Anexos'
          Caption = ''
          Collapsible = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          TabOrder = 4
          object UniDBGrid2: TUniDBGrid
            Left = 3
            Top = 6
            Width = 660
            Height = 92
            Cursor = crHandPoint
            Hint = 'Duplo Clique para baixar o anexo.'
            ScreenMask.Enabled = True
            ScreenMask.WaitData = True
            ScreenMask.Message = 'Carregando Anexos, Aguarde...'
            ScreenMask.Target = UniDBGrid2
            ShowHint = True
            ParentShowHint = False
            DataSource = DSAnexo
            Options = []
            ReadOnly = True
            WebOptions.Paged = False
            WebOptions.LoadMask = True
            WebOptions.LoadMaskMsg = 'Carregando, Por Favor Aguarde...'
            HeaderTitleAlign = taLeftJustify
            OnDblClick = UniDBGrid2DblClick
            StripeRows = False
            Font.Color = clHotLight
            ParentFont = False
            TabOrder = 1
            Columns = <
              item
                FieldName = 'NOME_ANEXO'
                Title.Caption = 'Anexo'
                Width = 300
                Visible = True
                Font.Color = clHotLight
                Expanded = False
              end>
          end
          object bt_anexar_mais: TUniBitBtn
            Left = 670
            Top = 3
            Width = 30
            Height = 25
            Hint = 'Anexar arquivo'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000120B0000120B00000001000018000000968A7D00FFFF
              FF00BCB7B2009D908400CBC4BD00AEA59D00D5D5D500E7E7E700BEB4AD00C4BD
              B5009D8E8300CCCCCC00B6ACA400A4968C00C8C1BB00D2CBC500DAD5D000C2B8
              B100A4998E00CFC9C4009E968C00C8C2BA00DED6D60000000000000000000000
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
              0000000000000000000000000000000000000000000000000000010101010106
              0B0B0B16010101010101010101010B0A000000140B0101010101010101060005
              0E0E0E0500060101010101010102000C01010109050301010101010101110001
              0B0B0B0115000101010101010109000B0000000B150001010101010101090012
              150908000E000101010101010109001100010900150001010101010101090009
              000109000E00010101010101010900090001130009000101010101010109000E
              0A01010111000101010101010113000E0A01010111000101010101010101010E
              030701070800010101010101010101090D0C0B02120C0101010101010101010F
              110D0A0A0A040101010101010101010110090909100101010101}
            Caption = ''
            TabOrder = 2
            OnClick = bt_anexar_maisClick
          end
          object bt_excluir_anexo: TUniBitBtn
            Left = 669
            Top = 70
            Width = 30
            Height = 25
            Hint = 'Excluir Anexo'
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
            TabOrder = 3
            OnClick = bt_excluir_anexoClick
          end
        end
      end
    end
    inherited Tab_Consulta: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1279
      ExplicitHeight = 589
      object pn_meses: TUniPanel
        Left = 0
        Top = 0
        Width = 1279
        Height = 42
        Hint = ''
        Caption = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        object pn_ano: TUniPanel
          Left = 1
          Top = 1
          Width = 118
          Height = 40
          Hint = ''
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          Color = clBtnFace
          TabOrder = 1
          object bt_ano_seguinte: TUniBitBtn
            Left = 90
            Top = 1
            Width = 25
            Height = 38
            Cursor = crHandPoint
            Hint = 'Ano Seguinte'
            ShowHint = True
            ParentShowHint = False
            Caption = '<img width="14" height="28" src="../imagens/next.png" />'
            TabOrder = 1
            OnClick = bt_ano_seguinteClick
          end
          object bt_ano_anterior: TUniBitBtn
            Left = 1
            Top = 1
            Width = 25
            Height = 38
            Cursor = crHandPoint
            Hint = 'Ano Anterior'
            ShowHint = True
            ParentShowHint = False
            Caption = '<img width="14" height="28" src="../imagens/previous.png" />'
            TabOrder = 2
            OnClick = bt_ano_anteriorClick
          end
          object lb_ano: TUniLabel
            Left = 33
            Top = 9
            Width = 48
            Height = 23
            Hint = ''
            Caption = '2013'
            ParentFont = False
            Font.Color = clHotLight
            Font.Height = -19
            Font.Style = [fsBold]
            TabOrder = 3
          end
        end
        object bt_set: TUniBitBtn
          Left = 478
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Setembro'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/setembro.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          OnClick = bt_janClick
        end
        object bt_mai: TUniBitBtn
          Left = 298
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Maio'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/maio.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 3
          OnClick = bt_janClick
        end
        object bt_abr: TUniBitBtn
          Left = 253
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Abril'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/abril.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 4
          OnClick = bt_janClick
        end
        object bt_mar: TUniBitBtn
          Left = 208
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Mar'#231'o'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/marco.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 5
          OnClick = bt_janClick
        end
        object bt_fev: TUniBitBtn
          Left = 163
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Fevereiro'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/fevereiro.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 6
          OnClick = bt_janClick
        end
        object bt_jan: TUniBitBtn
          Left = 118
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Janeiro'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/janeiro.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 7
          OnClick = bt_janClick
        end
        object bt_ago: TUniBitBtn
          Left = 433
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Agosto'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/agosto.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 8
          OnClick = bt_janClick
        end
        object bt_dez: TUniBitBtn
          Left = 613
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Dezembro'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/dezembro.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 9
          OnClick = bt_janClick
        end
        object bt_jul: TUniBitBtn
          Left = 388
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Julho'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/julho.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 10
          OnClick = bt_janClick
        end
        object bt_jun: TUniBitBtn
          Left = 343
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Junho'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/junho.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 11
          OnClick = bt_janClick
        end
        object bt_nov: TUniBitBtn
          Left = 568
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Novembro'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/novembro.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 12
          OnClick = bt_janClick
        end
        object bt_out: TUniBitBtn
          Left = 523
          Top = 1
          Width = 45
          Height = 40
          Hint = 'Outubro'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
          ShowHint = True
          ParentShowHint = False
          Caption = '<img width="32" height="32" src="../imagens/32/outubro.png" />'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 13
          OnClick = bt_janClick
        end
        object chk_filtros_avancados: TUniCheckBox
          Left = 675
          Top = 23
          Width = 116
          Height = 17
          Hint = ''
          Checked = False
          Caption = 'Filtros Avan'#231'ado'
          ParentFont = False
          Font.Color = clHotLight
          TabOrder = 14
          OnClick = chk_filtros_avancadosClick
        end
      end
      object pn_filtros_avancados: TUniPanel
        Left = 0
        Top = 42
        Width = 1279
        Height = 114
        Hint = ''
        Visible = False
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        ScreenMask.Message = 'Filtros Avan'#231'ados'
        ScreenMask.Target = Owner
        TitleVisible = True
        Title = 'Filtros Avan'#231'ados'
        Caption = ''
        Collapsible = True
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 1
        object bt_pesquisa: TUniBitBtn
          Left = 699
          Top = 36
          Width = 91
          Height = 25
          Hint = 'Pesquisar'
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Message = 'Realizando a Pesquisa Solicitada, Aguarde...'
          ScreenMask.Target = dbg_pesquisa
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
          TabOrder = 1
          OnClick = bt_pesquisaClick
        end
        object rdb_recebido: TUniRadioButton
          Left = 601
          Top = 13
          Width = 75
          Height = 17
          Hint = ''
          Checked = False
          Caption = 'Recebido'
          TabOrder = 2
        end
        object rdb_a_receber: TUniRadioButton
          Left = 601
          Top = 40
          Width = 75
          Height = 17
          Hint = ''
          Checked = True
          Caption = #192' Receber'
          TabOrder = 3
        end
        object UniRadioButton1: TUniRadioButton
          Left = 601
          Top = 66
          Width = 75
          Height = 17
          Hint = ''
          Checked = False
          Caption = 'Ambos'
          TabOrder = 4
        end
        object data_inicial: TUniDateTimePicker
          Left = 402
          Top = 41
          Width = 89
          Height = 21
          Hint = ''
          DateTime = 41254.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDate
          FirstDayOfWeek = dowLocaleDefault
          TabOrder = 5
          ParentColor = False
          Color = clWhite
        end
        object UniLabel9: TUniLabel
          Left = 402
          Top = 28
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Data Inicial'
          TabOrder = 6
        end
        object UniLabel10: TUniLabel
          Left = 498
          Top = 27
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Data Final'
          TabOrder = 7
        end
        object data_final: TUniDateTimePicker
          Left = 498
          Top = 41
          Width = 89
          Height = 21
          Hint = ''
          DateTime = 41254.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDate
          FirstDayOfWeek = dowLocaleDefault
          TabOrder = 8
          ParentColor = False
          Color = clWhite
        end
        object edt_pesq_descricao: TUniEdit
          Left = 4
          Top = 58
          Width = 180
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          TabOrder = 9
          Color = clWindow
        end
        object UniLabel6: TUniLabel
          Left = 4
          Top = 44
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Descri'#231#227'o'
          TabOrder = 10
        end
        object UniLabel8: TUniLabel
          Left = 207
          Top = 5
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Cliente'
          TabOrder = 11
        end
        object edt_pesq_cliente: TUniEdit
          Left = 207
          Top = 20
          Width = 180
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          TabOrder = 12
          Color = clWindow
        end
        object edt_pesq_num_doc: TUniEdit
          Left = 4
          Top = 20
          Width = 180
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          TabOrder = 13
          Color = clWindow
        end
        object UniLabel11: TUniLabel
          Left = 3
          Top = 4
          Width = 69
          Height = 13
          Hint = ''
          Caption = 'N'#186' Documento'
          TabOrder = 14
        end
        object UniLabel12: TUniLabel
          Left = 207
          Top = 44
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Tipo de Receita'
          TabOrder = 15
        end
        object edt_pesq_tipo_receita: TUniEdit
          Left = 207
          Top = 58
          Width = 180
          Hint = ''
          PasswordChar = #0
          CharCase = ecNormal
          MaxLength = 0
          CharEOL = #0
          Text = ''
          TabOrder = 16
          Color = clWindow
        end
      end
      object dbg_pesquisa: TUniDBGrid
        Left = 0
        Top = 156
        Width = 1279
        Height = 433
        Hint = ''
        DataSource = DS
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        WebOptions.LoadMask = True
        WebOptions.LoadMaskMsg = 'Carregando, Por Favor Aguarde...'
        Summary.Enabled = True
        HeaderTitleAlign = taLeftJustify
        StripeRows = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Columns = <
          item
            FieldName = 'IMG_STATUS'
            Title.Alignment = taCenter
            Title.Caption = '<img src="../imagens/16/indicador_bottom.png" />'
            Width = 40
            Visible = True
            Alignment = taCenter
            Expanded = False
          end
          item
            FieldName = 'DESCRICAO_DOCUM'
            Title.Caption = 'Descri'#231#227'o'
            Width = 214
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'DAT_VENCIMENTO'
            Title.Caption = 'Vencimento'
            Width = 70
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'VAL_PARCELA'
            Title.Caption = 'Valor a Receber'
            Width = 100
            Visible = True
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'VAL_PAGO'
            Title.Caption = 'Valor Recebido'
            Width = 100
            Visible = True
            Alignment = taRightJustify
            Expanded = False
          end
          item
            FieldName = 'DAT_RECEBIMENTO'
            Title.Caption = 'Recebimento'
            Width = 70
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'IMG_TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Width = 60
            Visible = True
            Alignment = taCenter
            Expanded = False
          end
          item
            FieldName = 'NUM_DOCUM'
            Title.Caption = 'N'#186' Documento'
            Width = 75
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'DESCRICAO_RECEITA'
            Title.Caption = 'Tipo de Receita'
            Width = 175
            Visible = True
            Expanded = False
          end
          item
            FieldName = 'RAZAO_SOCIAL'
            Title.Caption = 'Cliente'
            Width = 175
            Visible = True
            Expanded = False
          end>
      end
    end
  end
  inherited UniStatusBar1: TUniStatusBar
    Top = 657
    Width = 1287
    ExplicitTop = 657
    ExplicitWidth = 1287
  end
  inherited DS: TDataSource
    DataSet = ADQuery
    Left = 963
  end
  object ADQuery: TADQuery
    CachedUpdates = True
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT A.ID_MASTER,'
      '       A.ID_EMPRESA,'
      '       A.ID_CRE_DOC,'
      '       B.ID_CRE_PAR,'
      '       A.DESCRICAO_DOCUM,  '
      '       A.NUM_DOCUM,'
      '       A.TIPO_DOCUM,'
      '       A.TIPO_DOCUM_SITUACAO,'
      '       A.PERIODO,'
      '       A.NUM_PARCELAS,'
      '       B.PARCELA,'
      '       B.VAL_PARCELA,'
      '       IFNULL(B.VAL_JUROS,0)    VAL_JUROS,'
      '       B.ID_TIPO_RECEITA,'
      '       C.DESCRICAO_RECEITA,'
      '       B.ID_F_C,'
      '       D.NOME RAZAO_SOCIAL,'
      '       B.DAT_VENCIMENTO,'
      '       B.DAT_RECEBIMENTO,'
      '       B.TIP_RECEBIMENTO,'
      '       (SELECT SUM(Y.VALOR) FROM CRE_PAR_VALORES Y'
      '         WHERE A.ID_MASTER   = Y.ID_MASTER'
      '           AND A.ID_EMPRESA  = Y.ID_EMPRESA'
      '           AND B.ID_CRE_PAR  = Y.ID_CRE_PAR)VAL_PAGO '
      '  FROM CRE_DOC                A,'
      '       CRE_PAR                B,'
      '       TIPO_RECEITAS          C,'
      '       FORNECEDOR_CLIENTE     D        '
      ' WHERE A.ID_MASTER           = B.ID_MASTER'
      '   AND A.ID_EMPRESA          = B.ID_EMPRESA'
      '   AND A.ID_CRE_DOC          = B.ID_CRE_DOC'
      '   AND B.ID_MASTER           = C.ID_MASTER'
      '   AND B.ID_TIPO_RECEITA     = C.ID_TIPO_RECEITA'
      '   AND B.ID_MASTER           = D.ID_MASTER'
      '   AND B.ID_F_C              = D.ID_F_C'
      '   AND B.TIP_RECEBIMENTO    IN ('#39'A'#39','#39'P'#39')'
      '   AND A.ID_MASTER           = :ID_MASTER'
      '   AND A.ID_EMPRESA          = :ID_EMPRESA')
    Left = 928
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
    object ADQueryIMG_STATUS: TStringField
      DisplayLabel = '<img src="../imagens/16/indicador_bottom.png" />'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'IMG_STATUS'
      OnGetText = ADQueryIMG_STATUSGetText
      Calculated = True
    end
    object ADQueryID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
      Origin = 'ID_MASTER'
    end
    object ADQueryID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
    end
    object ADQueryID_CRE_DOC: TADAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'ID_CRE_DOC'
      Origin = 'ID_CRE_DOC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ServerAutoIncrement = False
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object ADQueryID_CRE_PAR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CRE_PAR'
      Origin = 'ID_CRE_PAR'
      ProviderFlags = []
    end
    object ADQueryDESCRICAO_DOCUM: TWideStringField
      FieldName = 'DESCRICAO_DOCUM'
      Origin = 'DESCRICAO_DOCUM'
      Size = 100
    end
    object ADQueryNUM_DOCUM: TWideStringField
      FieldName = 'NUM_DOCUM'
      Origin = 'NUM_DOCUM'
      Size = 9
    end
    object ADQueryTIPO_DOCUM: TWideStringField
      FieldName = 'TIPO_DOCUM'
      Origin = 'TIPO_DOCUM'
      Size = 45
    end
    object ADQueryTIPO_DOCUM_SITUACAO: TWideStringField
      FieldName = 'TIPO_DOCUM_SITUACAO'
      Origin = 'TIPO_DOCUM_SITUACAO'
      Size = 45
    end
    object ADQueryPERIODO: TWideStringField
      FieldName = 'PERIODO'
      Origin = 'PERIODO'
      Size = 45
    end
    object ADQueryNUM_PARCELAS: TWideStringField
      FieldName = 'NUM_PARCELAS'
      Origin = 'NUM_PARCELAS'
      Size = 45
    end
    object ADQueryPARCELA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      ProviderFlags = []
    end
    object ADQueryVAL_PARCELA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_PARCELA'
      Origin = 'VAL_PARCELA'
      ProviderFlags = []
      currency = True
      Precision = 12
      Size = 2
    end
    object ADQueryVAL_JUROS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_JUROS'
      Origin = 'VAL_JUROS'
      ProviderFlags = []
      currency = True
      Precision = 12
      Size = 2
    end
    object ADQueryID_TIPO_RECEITA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TIPO_RECEITA'
      Origin = 'ID_TIPO_RECEITA'
      ProviderFlags = []
    end
    object ADQueryDESCRICAO_RECEITA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_RECEITA'
      Origin = 'DESCRICAO_RECEITA'
      ProviderFlags = []
      Size = 100
    end
    object ADQueryID_F_C: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_F_C'
      Origin = 'ID_F_C'
      ProviderFlags = []
    end
    object ADQueryRAZAO_SOCIAL: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object ADQueryDAT_VENCIMENTO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DAT_VENCIMENTO'
      Origin = 'DAT_VENCIMENTO'
      ProviderFlags = []
    end
    object ADQueryDAT_RECEBIMENTO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DAT_RECEBIMENTO'
      Origin = 'DAT_RECEBIMENTO'
      ProviderFlags = []
    end
    object ADQueryIMG_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'IMG_TIPO'
      OnGetText = ADQueryIMG_TIPOGetText
      Calculated = True
    end
    object ADQueryTIP_RECEBIMENTO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIP_RECEBIMENTO'
      Origin = 'TIP_RECEBIMENTO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object ADQueryVAL_PAGO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_PAGO'
      Origin = 'VAL_PAGO'
      ProviderFlags = []
      currency = True
      Precision = 34
      Size = 2
    end
  end
  object Timer: TUniTimer
    OnTimer = TimerTimer
    Interval = 1000
    Enabled = False
    RunOnce = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      '   '
      '}')
    Left = 768
    Top = 8
  end
  object FileUpload: TUniFileUpload
    OnCompleted = FileUploadCompleted
    MaxAllowedSize = 10485760
    Title = 'Envio de Arquivos'
    Messages.Uploading = 'Enviando...'
    Messages.PleaseWait = 'Por Favor Aguarde...'
    Messages.Cancel = 'Cancela'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no Envio'
    Messages.Upload = 'Envia'
    Messages.NoFileError = 'Selecione o Arquivo'
    Left = 816
    Top = 8
  end
  object Popup: TUniPopupMenu
    Left = 864
    Top = 8
    object ExportaParaExcel1: TUniMenuItem
      Caption = 'Exporta Para Excel'
    end
  end
  object ADQueryRecebimento: TADQuery
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT A.ID_CRE_PAR_VALORES,'
      '       A.DAT_RECEBIMENTO,'
      '       A.VALOR,'
      '       B.TIPO,'
      '       B.NOME_CONTA,'
      '       C.NOME_BANCO'
      '  FROM CRE_PAR_VALORES    A'
      '  LEFT OUTER JOIN CONTAS  B ON  A.ID_MASTER        = B.ID_MASTER'
      
        '                            AND A.ID_EMPRESA       = B.ID_EMPRES' +
        'A'
      '                            AND A.ID_CONTAS        = B.ID_CONTAS'
      
        '  LEFT OUTER JOIN BANCOS  C ON  B.ID_BANCOS        = C.ID_BANCOS' +
        ' '
      ' WHERE A.ID_MASTER        = :P00'
      '   AND A.ID_EMPRESA       = :P01'
      '   AND A.ID_CRE_PAR       = :P02'
      ' ORDER BY A.DAT_RECEBIMENTO')
    Left = 284
    Top = 266
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
        Value = 1
      end
      item
        Name = 'P02'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object ADQueryRecebimentoID_CRE_PAR_VALORES: TADAutoIncField
      FieldName = 'ID_CRE_PAR_VALORES'
      Origin = 'ID_CRE_PAR_VALORES'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADQueryRecebimentoDAT_RECEBIMENTO: TDateField
      FieldName = 'DAT_RECEBIMENTO'
      Origin = 'DAT_RECEBIMENTO'
      Required = True
    end
    object ADQueryRecebimentoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      currency = True
      Precision = 12
      Size = 2
    end
    object ADQueryRecebimentoTIPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
    object ADQueryRecebimentoNOME_CONTA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CONTA'
      Origin = 'NOME_CONTA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ADQueryRecebimentoNOME_BANCO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_BANCO'
      Origin = 'NOME_BANCO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object DSRecebimento: TDataSource
    DataSet = ADQueryRecebimento
    Left = 386
    Top = 267
  end
  object ADQueryAnexo: TADQuery
    CachedUpdates = True
    Connection = DM.ConexaoFiredac
    SQL.Strings = (
      'SELECT * FROM CRE_DOC_ANEXO A'
      ' WHERE A.ID_MASTER        = :P00'
      '   AND A.ID_EMPRESA       = :P01'
      '   AND A.ID_CRE_DOC        = :P02')
    Left = 292
    Top = 397
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
      end
      item
        Name = 'P02'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object ADQueryAnexoID_CAP_AD_ANEXO: TADAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'ID_CRE_DOC_ANEXO'
      Origin = 'ID_CRE_DOC_ANEXO'
      ProviderFlags = [pfInUpdate]
      ServerAutoIncrement = False
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object ADQueryAnexoNOME_ANEXO: TWideStringField
      FieldName = 'NOME_ANEXO'
      Origin = 'NOME_ANEXO'
      ProviderFlags = []
      Size = 100
    end
    object ADQueryAnexoANEXO: TBlobField
      FieldName = 'ANEXO'
      Origin = 'ANEXO'
      ProviderFlags = []
    end
  end
  object DSAnexo: TDataSource
    DataSet = ADQueryAnexo
    Left = 360
    Top = 398
  end
end
