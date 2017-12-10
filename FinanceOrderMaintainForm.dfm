inherited frmFinanceOrderMaintain: TfrmFinanceOrderMaintain
  Caption = #25910#36153#39033#30446#32500#25252
  ClientHeight = 581
  ClientWidth = 1316
  OnShow = FormShow
  ExplicitWidth = 1332
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1316
    Height = 49
    Align = alTop
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 1
      Top = 0
      Width = 48
      Height = 48
      Caption = #26032#22686
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001B744558745469746C65004164643B506C75733B426172733B526962
        626F6E3B9506332F0000036349444154785E35927D6C535518C69F73EE6DEB64
        63A3AEFB60A3A36E33B8C56581E0D8707E21CC1A43A2A22304FE3001512A86C4
        E900132451FF503367420043B244364C483031465C248B4441C0980C45B4D065
        CDBA4ECAE82AAC5DBBDE8FF3E1BD27F1397973DE9C3CBFF7233964226FC2D543
        A53E0280443E3FD752525AB14323FA06685A3381E492F329C6ADF39954E2F8C9
        C3DBA6018858DE940A9C2C5870C1D51BB6FAF61DBB327860F81A1BFE25297FB8
        3127C7EFE4E5D5745E9EBB9991239766E481937FE4DE1818DB0DC0EB322EABBA
        B63FD5EB7D6CCBBE6F1B83FE9E67BA82E084C0E4123697CAE0D109BC94805B0C
        E7AFCC606A66EEECF75FBCBB753AFAEB2201A0BD3E7861B02914D8DBF34408A9
        AC0D2181D3672E23319D81AB950D016CEBED824E809A722FC62E4CE17A343130
        D4DF73507FB9FFAB551E9F6FCF93EB82B879BB088D52504A14FCC9CE4E95F79D
        B80CD396284A8179C7D3DD1144F29FEC5BE1D73E1BA6BEB2C09BEDCD955A7CCE
        44D1744C1687C9045C05EBFC686F0DAADCB08413D2098E89B4E1BC5779965687
        5ED585D03ACBFDA548E7197EFA711C776EDFC5FF12200A7075F4E85975D7D4FA
        F1F4A635A82C5F02A2956CD46D2EEB1D160B455BC19FEE5E0F4A885A45828071
        81137D1B61DB0C1E5D43E4C8CF5858E4D0A1810BBA5CB76DEEBDB768C1E604AE
        EA6B1F40D9121F0A265385BC0E5457530109404A8010E27805EEE60598CDA15B
        8699C8E7CD4784EEC3F2BA00767C340A4AA9327E79300CE1505BDEFF0E9AA681
        5082150DD5604CA26858282E1693D428E42F6666B3909068EF68C5E6171FC7E6
        17BA611A260C93A9029C713CF7FC3A3C1BEE404B5B2398E0989FCBA190FD774C
        CFA46243B11B4B77ADADF67BB236478E10500AA5D2121D5C48354D3A674108A1
        56114C201E4BB1D9F86FA70880FB1EDD3E34B0A229B4E7E1350FC2E22E2011BF
        16C3FCBD050557562DC3CA964608B8B4C4E49F4924A27F1F193F1DD9AF03B0FE
        1AFDE03D113EDC6431B1A96575089212B4AD6D555F581280D902398343308EC9
        EB49DC9A981A75E043000CA46D09005A49457059DB4BC78E77EDFCDAEAFDF892
        DC3B1295EF7C13977D4E444E45E52BCE5BE7AE338555E10FDF0650EE32B30E4B
        D24C0212A8F210EAAED3D01969BB3FD0BCDDE32BEB06D56AD5D09CCDDA66EE62
        EED6EF43A9AB2331008603ABCEFF019D3AAD15CCD8D2E00000000049454E44AE
        426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1316
    Height = 532
    Align = alClient
    TabOrder = 1
    inline framFinanceOrder: TframFinanceOrderMaintain
      Left = 1
      Top = 1
      Width = 1314
      Height = 530
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1314
      ExplicitHeight = 530
      inherited Panel1: TPanel
        Width = 1314
        Height = 241
        ExplicitWidth = 1314
        ExplicitHeight = 241
        inherited Panel4: TPanel
          Width = 1312
          ExplicitWidth = 1312
          inherited cxGroupBox1: TcxGroupBox
            ExplicitWidth = 1310
            Width = 1310
          end
        end
        inherited Panel5: TPanel
          Width = 1312
          Height = 181
          ExplicitWidth = 1312
          ExplicitHeight = 181
          inherited cxGroupBox2: TcxGroupBox
            ExplicitWidth = 1310
            ExplicitHeight = 179
            Height = 179
            Width = 1310
            inherited cxDBTreeListOrder: TcxDBTreeList
              Width = 1304
              Height = 155
              DataController.KeyField = 'ORDER_CODE'
              ExplicitWidth = 1304
              ExplicitHeight = 155
            end
          end
        end
      end
      inherited Panel2: TPanel
        Top = 241
        Width = 1314
        Height = 145
        ExplicitTop = 241
        ExplicitWidth = 1314
        ExplicitHeight = 145
        inherited cxGroupBox3: TcxGroupBox
          ExplicitWidth = 1312
          ExplicitHeight = 143
          Height = 143
          Width = 1312
        end
      end
      inherited Panel3: TPanel
        Top = 386
        Width = 1314
        ExplicitTop = 386
        ExplicitWidth = 1314
        inherited Panel7: TPanel
          Width = 704
          ExplicitWidth = 704
          inherited cxGroupBox5: TcxGroupBox
            ExplicitWidth = 702
            Width = 702
            inherited cxDBTreeListOrderInsu: TcxDBTreeList
              Width = 696
              ExplicitWidth = 696
            end
          end
        end
      end
      inherited cxEditStyleControllerTitle: TcxEditStyleController
        Style.IsFontAssigned = True
        PixelsPerInch = 96
      end
      inherited cxEditStyleControllerValue: TcxEditStyleController
        Style.IsFontAssigned = True
        PixelsPerInch = 96
      end
      inherited cxEditRepository1: TcxEditRepository
        PixelsPerInch = 96
      end
      inherited cxStyleRepository1: TcxStyleRepository
        PixelsPerInch = 96
      end
      inherited cdsOrder: TFDMemTable
        AfterInsert = framFinanceOrderMaintain1cdsOrderAfterInsert
      end
      inherited cdsInvFee: TFDMemTable
        Left = 489
        Top = 442
      end
      inherited cdsClassCode: TFDMemTable
        Left = 641
        Top = 474
      end
      inherited cdsApply: TFDMemTable
        Top = 474
      end
      inherited cdsValid: TFDMemTable
        Left = 401
        Top = 442
      end
      inherited dsClassCode: TDataSource
        Left = 593
        Top = 474
      end
      inherited dsApply: TDataSource
        Top = 482
      end
      inherited cdsDept: TFDMemTable
        Left = 249
        Top = 473
      end
      inherited dsDept: TDataSource
        Left = 329
        Top = 481
      end
      inherited dsGDService: TDataSource
        Left = 153
        Top = 458
      end
      inherited cdsGDService: TFDMemTable
        Left = 89
        Top = 457
      end
    end
  end
end
