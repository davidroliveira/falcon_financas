object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Falcon Finan'#231'as - Gerenciador Financeiro'
  ClientHeight = 426
  ClientWidth = 939
  Color = clWhite
  Menu = Menu
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnShow = UniFormShow
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 939
    Height = 409
    Hint = ''
    ScreenMask.Enabled = True
    ScreenMask.WaitData = True
    ScreenMask.Message = 'Processando...'
    ScreenMask.Target = PageControl
    TabOrder = 0
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 409
    Width = 939
    Height = 17
    Hint = ''
    BorderStyle = ubsNone
    Caption = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 1
    object UniPanel2: TUniPanel
      Left = 583
      Top = 0
      Width = 160
      Height = 17
      Hint = ''
      BorderStyle = ubsNone
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Color = clBtnFace
      TabOrder = 1
      object UniLabel1: TUniLabel
        Left = 17
        Top = 1
        Width = 61
        Height = 15
        Hint = ''
        Caption = 'Navegador:'
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 1
      end
      object lb_navegador: TUniLabel
        Left = 81
        Top = 1
        Width = 56
        Height = 15
        Hint = ''
        Caption = 'navegador'
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 2
      end
      object UniImage4: TUniImage
        Left = 0
        Top = 0
        Width = 16
        Height = 16
        Hint = ''
        Center = False
        AutoSize = True
        Stretch = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C000002C54944415478DA95935D485361
          18C7FF67DF5FCA66149933ED030A2F0C2324CC900AD1C0D89CEB42F1A28B08BC
          A8DB6E240235CABC10A3AE8C70C8B474BAB4104B44529B7411A2819535A74EDD
          C7A94D4DE7D16DA7E7CCD89424E881E73DE73CEF7B7EEFF33CEFFF655EF6F606
          C29188968F46C163A7095F0C440C038661FC26A3F100F630C6D6DDCDD324FE65
          3E9F0FC3A3A36D6693A9E22F406757175F565A8A19D76C6C47DA103CBF9DC191
          CC0CB45AADA8ACA880D7EBC588C3D16E2E2D2DDF05E820000531EF760BA9C601
          3C0DE97A3DDA9EB7A3A8B0102929FBF093F5E1C398A3F3F215E3D51D001B014C
          5858F440246276B480476AEA414C4D8EC3E574526E3C8A0D6518EDEF417EB181
          49006C043099E0A53A850C62417A4869D0EA92503FCCE26EBF0BA1F508CD88A0
          5549C08823D581DAFCBA5D003FFB230E908A1924C9C438D9F811506DC272DD8E
          64A50E9F582FDC6B4FD1F2BA0D1E7FC692AF26EF501C100806633F0B5528A562
          D40ECEC2F2790303556720535A30BE50024EFC00332B93502BFBD0D2D784794F
          4E4D1CB0BCB21A0388290B8D420C45F5106ACA2FE062860261592D02612B586E
          0AEFBF3562DA6346FEF1C378D2399228E1D7DADA368052502AA9CE5B6FF0F046
          09F42A40AD336395B7616313F8B2780DEFBE3EC3D9A3E7607D559F008442A138
          40269712A01FF76ECE62355805FDC13268355D58A7252FC6B6B04C0D952B0631
          3DA94A00386E2B261E0120914AA0B9FD16C6220EEB5C3174AA091464E5628EBD
          8485400E66BCE7E159D6C2E70A278414A5BB209C7D4C4C2211EA07BFA3C1E147
          76D6098ACBC16DA950949D077D8A2326B4FB563B82CE603363B3DB7993C1B0E7
          1DC86D1AC31CB526354D4F500D32F7DB703AFD0EDA071AC0FAD2586F5DC129C6
          D2DA3AA456AB0BA2DBFAFD7394D407D242B25C840EB7143DE45C84B4C8CBA848
          09F880B3997D5CF988964E08CA3946AEC5FFD912F9A2F0F21B2C60372BFCB354
          390000000049454E44AE426082}
        Proportional = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        Transparent = False
      end
    end
    object UniPanel3: TUniPanel
      Left = 0
      Top = 0
      Width = 247
      Height = 17
      Hint = ''
      BorderStyle = ubsNone
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Color = clBtnFace
      TabOrder = 2
      object UniLabel2: TUniLabel
        Left = 17
        Top = 1
        Width = 43
        Height = 15
        Hint = ''
        Caption = 'Usu'#225'rio:'
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 1
      end
      object lb_usuario: TUniLabel
        Left = 63
        Top = 1
        Width = 39
        Height = 15
        Hint = ''
        Caption = 'usuario'
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 2
      end
      object UniImage1: TUniImage
        Left = 0
        Top = 0
        Width = 16
        Height = 16
        Hint = ''
        Center = False
        AutoSize = True
        Stretch = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C000002244944415478DA9DD15F485351
          1C07F0EF712B92BCE56A6DB8CA350775437B5986A1A5467FA482EAA187651043
          900822831C3D14118145588848FF2CCA1526F61011912F216948D234D6702BA1
          B5996D7373EDEE6E3837DADDE96E22645C69F47DF9C1EF777E1F0EE7104A29E6
          4308C9D673B50A3D916348A5CC57279214E17032B04446AB5AFB395766BE6047
          0A38B353315655A92C5528D4E0A2C088CD87688873DCFBC095E50498F7ADA295
          15C56014C588F0325847BE22E8FF81471F399213D054B382EA4A9428D96480BE
          9445606A1A5D1D3D786C8FE60634962FA59DEF7A919CF4830BF3482613B870F2
          2ABABFFCCA0D385186A796D79DC702DE10221C8F44228EB6CBB7EE5AECE95339
          019B591D7BBFE5F8670D9302CF4731EE4DC078F6A1461CF9FF09D475787AD6A9
          0B8DC6A25108CE27F04C4C22A6390C97C684095FB8B7EFF406E3A240ED757BD0
          B443B3A68255A2E8E72B38879FC1FDCD0D667D35D8A32D78EF08C132E49FEE37
          6F514902F5B7C768F3011D5E78F2D060C887960166E2713802B3E8F316E08856
          40E30307AC57B6114960FF352B6DD8ABC7C07701F23CA0ED6001622270E96D1A
          429A6097568E8BDD9FE0BC59230D949F1FA0F5BB59D87CB34809402A3DD7CF60
          72198161ED32B43FB7C17DA74E1A509B5ED23DDB376275E17264DBF32332F7C0
          E1C80CDE0C8F63AAEB9034C0549B9B886AEB0D81428E85FBD9889748D1E06873
          6CB0B57DB16F5C2916FD1F3B7F2773D825EEF092C0FFE4376E6319F03BB1123F
          0000000049454E44AE426082}
        Proportional = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        Transparent = False
      end
    end
    object UniPanel4: TUniPanel
      Left = 463
      Top = 0
      Width = 120
      Height = 17
      Hint = ''
      BorderStyle = ubsNone
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Color = clBtnFace
      TabOrder = 3
      object UniLabel3: TUniLabel
        Left = 16
        Top = 1
        Width = 18
        Height = 15
        Hint = ''
        Caption = 'OS:'
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 1
      end
      object lb_os: TUniLabel
        Left = 37
        Top = 1
        Width = 12
        Height = 15
        Hint = ''
        Caption = 'os'
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 2
      end
      object UniImage3: TUniImage
        Left = 0
        Top = 0
        Width = 16
        Height = 16
        Hint = ''
        Center = False
        AutoSize = True
        Stretch = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C0000035F4944415478DA7D934D6C5465
          18859FEFCE9DFF3FDB693B4C299D422D942AD669A98A1A881A223550C590802C
          DC18230B131312454D34041B586824444350A3716184B82006362DC6828D1153
          0A090DB475326D994EDB2999763AFD19EECC9DDE7BFD5A8D11179E7C67F79D93
          93F3BEAF187CAF857F43088BBB4583B0D3682EF883D7DC4AD15ECACF976A1F69
          6C8BDF18BA19F00814B707ACBFFFDF67609A5896F9CA7461F9EB488DCFBDF9D9
          66CCC914A58971E23336346D490B78784D75FBCE0A04AB6FF0DDD85F62CBC234
          0CABFAF11865519B144E509C48319871D0FAC25696279392E3E80D4F91B9D987
          5DA842594990E8DC21D308A91718CB8655BF7F1F738904DA6017DE4884F29087
          D2DC225AF0613CAD1D380A77489EFF86CFEBE644D0E945A4DEA9C7C0862E9CE8
          86CD0A85A7502B3652F6F4AB6447465084C053DF8639D6832BD787CDA6307A23
          CD575BD4BD650EDF8FE2B9CF06A4D8C1B93BBB58C2678537E92CCB120D5DC75E
          514B59FB09CC9E37C1154471F9C1E367B4EB377EDEDBC25C328178F1D4AFE896
          4A285CC3F1DFDB2C5B85177FC48950047AB140F90E299EEE9106014A398D8554
          9AFCF42C33AF1FA1F7DA69C44B277F91D1CD0355A1D017D5D5D1C07E571FEA4F
          1F1074A609AE71E36BEB60F1763FD944927973993F1AD790AEF6A15264766A02
          B1FB93CBD6D6A60DECDB564B220B6339989CD53850954274BF4FE0EE25F49AED
          9CF51DA1AAE9300E9B17A7EAC0E97230726B0871F074AF75A8BD8985F945FA53
          828648B96CDE4F460355183CBAD660A1E8E0CBAE1C3B63BB51ED0FA0E57572B3
          391666B32B097AACF5EB1FA4D26BF14C6380FC7C1653B1515761E7D68C97E925
          278669313CBAC863F53B994EE9E805A3981CCE1FFBF6C454B7E8F8F4B2156B6E
          452BEA1465F3957E07075BCBB830ACA0A0C9B802B7CB45DF4006FFC296C1EB57
          CCCE4BE732C3728792C77F68C8CA12AF5815A14AD6D5441136551A95D8B5C945
          5CF6E171AA64724B8C4EA4892797E87ABB65B3148E7FF47DE33D4531E5A45656
          105A9F3CF4F1F3E5F5B10FC3E188335ABB81D83A17FDF134438931F205AD981D
          193876F5CCE1EECEEFD65EB7847FF506FE3178F9542FE7DFDA5E2E8DA20FED79
          A331BAADE3A8DDEDDB58D2F2F1E4D50B476F5F3CB31A77CFC981EC1355ED98FC
          C780FB21EF943A49B7A49C037724EFF13FF813A2BF69E93AE814F90000000049
          454E44AE426082}
        Proportional = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        Transparent = False
      end
    end
    object UniPanel5: TUniPanel
      Left = 247
      Top = 0
      Width = 216
      Height = 17
      Hint = ''
      BorderStyle = ubsNone
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Color = clBtnFace
      TabOrder = 4
      object UniLabel4: TUniLabel
        Left = 16
        Top = 1
        Width = 48
        Height = 15
        Hint = ''
        Caption = 'Empresa:'
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 1
      end
      object lb_empresa: TUniLabel
        Left = 66
        Top = 1
        Width = 45
        Height = 15
        Hint = ''
        Caption = 'empresa'
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 2
      end
      object UniImage2: TUniImage
        Left = 0
        Top = 0
        Width = 16
        Height = 16
        Hint = ''
        Center = False
        AutoSize = True
        Stretch = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C000002C74944415478DA9D935D485361
          18C7FFE79CA116A659605664619B2EE7E685DA852175D345192869A49948891F
          2916F9B14D2D4513DDA616199A1F7D203634D250C8BAF02690BCC876317539DD
          920A4CF322F323F363E7BCBD9BE291C29B1E7878E0F03FBFF7FFBCCFFB30A051
          DBD6DBCD3BF8188110106C1F0C4D9661C049B89EBCE4E85842F5CE6FA87ADC4D
          0AAEC6C0C15311B32EFC3B9C60AA878403AA9FF4A0303596D904DC69EA22DAB4
          F318B04CC3F6C90E796020C66C3604C9649BD53A3E0ED9512922157ED0B5BCC4
          ED8C381150F6B093A8D3E260EC7D078984A52EFEF5E0143B1C0292A24FC0D0D2
          85D26BF122A0B4FE39055C80E5CB0F58ED7628E54118B18E21644B1DA6552E95
          4271780F05BC4059F6451170EB413BD1A427A0B36F80F6C86D7B070E9E47FCE9
          48E89B3B50919328028AEE1B49415A023E7F9F83C56A4368881C43162B540AB1
          9A47AC50C86538B2CF1BD52D1DA8BC912402B477DB883A2311AFDE0E82E3D86D
          1DF0BC8073A72260686A872E375904A86B5A893A3309D3B34B30D313C3550A98
          463E224C190CD330AD21C1F83064412875E2E7B3138646230CF92922205FFF94
          68B292F1A67F904E81A32901CB72AE69384582C0D3093868F2381315017D431B
          6A345744C04D5D2BD1645FC6ECFC6F570B358DAD9078788261252002FD717911
          F99929AE167CBC76405FFF0CF7B45B1CE4E93A49D1F538FC5CA44F99F0603D24
          30A53308381E8589F7FD086BA62E961DD41187DD9E0C2AEBBA50ABDD7807978A
          E57E1C7F6C0A7B0770C8F32CA24F16E2A0BF0CC305EEF0954661C6DE0F65F50A
          26BFDAD0D35785A9D5D7601722B1C68FEE37568C4E33A9154AE2AF12E8920858
          FAB50ABB791E0DE533182F0F8087F7012CCF7D4360C904B24A7C1114EE057737
          37ACADB098B4B278543CC430B9752AA713D7A210F03417C12F5481701B9BE5B4
          C973E07615D27EE9BD805B5F389AB53966D7A30FC37F063DD9F40736574CF0FB
          3F81C90000000049454E44AE426082}
        Proportional = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        Transparent = False
      end
    end
    object UniPanel6: TUniPanel
      Left = 743
      Top = 0
      Width = 152
      Height = 17
      Hint = ''
      BorderStyle = ubsNone
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Color = clBtnFace
      TabOrder = 5
      object UniLabel5: TUniLabel
        Left = 18
        Top = 1
        Width = 13
        Height = 15
        Hint = ''
        Caption = 'IP:'
        ParentFont = False
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 1
      end
      object lb_ip: TUniLabel
        Left = 34
        Top = 1
        Width = 10
        Height = 15
        Hint = ''
        Caption = 'ip'
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        TabOrder = 2
      end
      object UniImage5: TUniImage
        Left = 0
        Top = 0
        Width = 16
        Height = 16
        Hint = ''
        Center = False
        AutoSize = True
        Stretch = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C000002B64944415478DA75936B481451
          14C7FF7766C79D5D776D6D492C43B02094C00829118C72ED01215A9BF92510C9
          40A24FA13D91FC12420F6C7BB7496E659A3DACB54C21B0140AA3B4823EF8A52F
          3DC812515357F73133B733B35A62EE9D39739933737EE7DC73FF97D5D63F46AC
          A16A9A5F51D4224DE3F4C6E77C6110040693496C630B0138E78685230A3F52B1
          1B6A44FDEF1F511271CAFB002C5605914804A1B0C22BF7B9F176E02BE59C81CF
          3CD665A4A2EE466B14A0675BA88AC9A920AF2C77E3CBD07414C0A27E7D49A949
          323CBE36B093DE56BFAA6A4551089F93C6E801145533821805DBED762A5D269F
          8AD2C25C5CBC45809A4BF7F881F2ED10B80A612632DA832847EF9F46B3A2325C
          69E8C09EE21D5014058BAC1AAE363E01AB3EDFC42B4AB721ABF63B9C8916D86C
          122CB2046B9C00AB0858050E8968875C26DCB9DB8DE4E415045051B87935AE35
          FBC18E9F6BE4A5252E14F826B0C429C3668F83D56C82551260A160996960118E
          BD99613CF2BFC3E70DBB0800D42E0FE07A0BEDC2B1BADBDC5D908BB276460033
          12EC32B828828A80998A9768BD8954C9CED43174767EC41BB19896035C768FC3
          77FF21D8D1B337F9D6FCF538F8DA0ED92E2168324395CDD0BBC64361688120A6
          C643F0E64EA0EB453FB6B8F28C263A1D129AFD9D60874F37F0EC9C2C54F53BC1
          2950B059C0C820524B03D3E093D3088D07E1593B84DEDE3EB836E51880C50956
          B4B6BF04AB24407AE61A94E4ADA276536D5CFBA75A7DF39940B78896AE017C7A
          FF01F979D9A06D873DDE82A71D3D60FB4F78BACD96F88DBA936BBA915074080D
          C108D6751F9D972D4D42467A1AE5E130C74978F6FC9591632599430FA8BED0D4
          273B9C484B711A806F8323981C19C6D8EF094348B32A8C0A8B211C0CF4B0AA33
          BEBFDA1F1DFEE5733893CA66A5CDE81A1DFE59DFE8A9F1C638B0636C9E23852C
          799E6F90EC47AC23FF07EDBF3C39FD056ACE0000000049454E44AE426082}
        Proportional = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        Transparent = False
      end
    end
  end
  object Menu: TUniMainMenu
    BiDiMode = bdLeftToRight
    Images = DM_Imagens.img_16
    ParentBiDiMode = False
    ScreenMask.Enabled = True
    ScreenMask.WaitData = True
    ScreenMask.Message = 'Processando, por favor aguarde...'
    Left = 16
    Top = 8
    object d1: TUniMenuItem
      Caption = 'Principal'
      ImageIndex = 14
      object MudardeEmpresa1: TUniMenuItem
        Caption = 'Mudar de Empresa'
        ImageIndex = 3
        OnClick = MudardeEmpresa1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Sair1: TUniMenuItem
        Caption = 'Sair'
        Hint = 'Sair da Aplica'#231#227'o.'
        ImageIndex = 0
        OnClick = Sair1Click
      end
    end
    object Financeiro1: TUniMenuItem
      Caption = 'Financeiro'
      ImageIndex = 5
      object ContasaPagar1: TUniMenuItem
        Caption = 'Contas a Pagar'
        ImageIndex = 12
        OnClick = ContasaPagar1Click
      end
      object ContasaReceber1: TUniMenuItem
        Caption = 'Contas a Receber'
        ImageIndex = 11
        OnClick = ContasaReceber1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object ransfernciadeSaldo1: TUniMenuItem
        Caption = 'Transfer'#234'ncia de Saldo'
        ImageIndex = 2
        OnClick = ransfernciadeSaldo1Click
      end
      object N5: TUniMenuItem
        Caption = '-'
      end
      object MovimentaoBancria1: TUniMenuItem
        Caption = 'Movimenta'#231#227'o Banc'#225'ria'
      end
      object FluxodeCaixa1: TUniMenuItem
        Caption = 'Fluxo de Caixa'
      end
    end
    object Cadastros1: TUniMenuItem
      Caption = 'Cadastros'
      ImageIndex = 6
      object Contas1: TUniMenuItem
        Caption = 'Contas'
        ImageIndex = 16
        OnClick = Contas1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object ipodeReceita1: TUniMenuItem
        Caption = 'Tipo de Receita'
        ImageIndex = 9
        OnClick = ipodeReceita1Click
      end
      object ipodeDespesa1: TUniMenuItem
        Caption = 'Tipo de Despesa'
        ImageIndex = 10
        OnClick = ipodeDespesa1Click
      end
      object FornecedorCliente1: TUniMenuItem
        Caption = 'Clientes / Fornecedores '
        ImageIndex = 15
        OnClick = FornecedorCliente1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object Usurios1: TUniMenuItem
        Caption = 'Usu'#225'rios'
        ImageIndex = 8
      end
      object Empresas1: TUniMenuItem
        Caption = 'Empresas'
        ImageIndex = 3
      end
    end
    object Relatrios1: TUniMenuItem
      Caption = 'Relat'#243'rios'
      ImageIndex = 7
      object ContasaPagar2: TUniMenuItem
        Caption = 'Contas a Pagar'
      end
      object ContasaReceber2: TUniMenuItem
        Caption = 'Contas a Receber'
      end
    end
    object Confirguraes1: TUniMenuItem
      Caption = 'Confirgura'#231#245'es'
      ImageIndex = 4
    end
  end
end
