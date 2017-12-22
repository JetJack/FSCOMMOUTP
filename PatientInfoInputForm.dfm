inherited frmPatientInfoInput: TfrmPatientInfoInput
  Caption = #23601#35786#24066#27665#22522#26412#36164#26009#24405#20837
  ClientHeight = 581
  ClientWidth = 1366
  ExplicitWidth = 1382
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1366
    Height = 49
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1366
    Height = 532
    Align = alClient
    TabOrder = 1
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 1
      Align = alTop
      Caption = #25968#25454#35835#21462
      ParentFont = False
      Style.StyleController = cxEditStyleControllerTitle
      TabOrder = 0
      Height = 72
      Width = 1364
      object cxRadioGroup1: TcxRadioGroup
        AlignWithMargins = True
        Left = 10
        Top = 18
        Caption = #21345#31867#22411
        ParentFont = False
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = #31038#20445#21345
          end
          item
            Caption = #36523#20221#35777
          end>
        ItemIndex = 0
        Style.StyleController = cxEditStyleControllerTitle
        TabOrder = 0
        Height = 47
        Width = 185
      end
      object cxRadioGroup2: TcxRadioGroup
        AlignWithMargins = True
        Left = 205
        Top = 18
        Caption = #35835#21345#26041#24335
        ParentFont = False
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = #38750#25509#35302#24335
          end
          item
            Caption = #25509#35302#24335
          end>
        ItemIndex = 0
        Style.StyleController = cxEditStyleControllerTitle
        TabOrder = 1
        Height = 47
        Width = 185
      end
      object cxGroupBox2: TcxGroupBox
        Left = 401
        Top = 19
        Caption = #25163#24037#24405#20837
        TabOrder = 2
        Height = 46
        Width = 448
        object cxLabel1: TcxLabel
          Left = 11
          Top = 20
          Caption = #35777#20214#21495#30721
          ParentFont = False
          Style.StyleController = cxEditStyleControllerTitle
          Transparent = True
        end
        object cxTextEdit1: TcxTextEdit
          Left = 81
          Top = 19
          ParentFont = False
          Style.StyleController = cxEditStyleControllerValue
          TabOrder = 1
          Text = 'cxTextEdit1'
          Width = 149
        end
        object cxLookupComboBox1: TcxLookupComboBox
          Left = 252
          Top = 19
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = cxEditStyleControllerValue
          TabOrder = 2
          Width = 145
        end
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 1
      Top = 73
      Align = alClient
      Caption = #36164#26009#24405#20837
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 72
      Height = 458
      Width = 1364
      object cxLabel2: TcxLabel
        Left = 15
        Top = 26
        Caption = #35786' '#30103' '#21495
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxDBLabel1: TcxDBLabel
        Left = 95
        Top = 26
        DataBinding.DataField = 'FILE_NO'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        Height = 21
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 229
        Top = 26
        Caption = #22995'    '#21517
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel4: TcxLabel
        Left = 448
        Top = 26
        Caption = #36523#20221#35777#21495
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel5: TcxLabel
        Left = 658
        Top = 26
        Caption = #20986#29983#26085#26399
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel6: TcxLabel
        Left = 15
        Top = 53
        Caption = #24615'  '#21035
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel7: TcxLabel
        Left = 448
        Top = 53
        Caption = #27665#26063
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel8: TcxLabel
        Left = 229
        Top = 53
        Caption = #34880'  '#22411
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel9: TcxLabel
        Left = 659
        Top = 51
        Caption = #32852#31995#30005#35805
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel10: TcxLabel
        Left = 16
        Top = 75
        Caption = #29616#20303#22336
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxLabel11: TcxLabel
        Left = 447
        Top = 75
        Caption = #25143#21475#22320#22336
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 297
        Top = 25
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 11
        Width = 142
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 509
        Top = 25
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 12
        Width = 142
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 721
        Top = 50
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 13
        Width = 142
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 508
        Top = 52
        DataBinding.DataField = 'NATION_CODE'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 14
        Width = 142
      end
      object cxDBLookupComboBox2: TcxDBLookupComboBox
        Left = 297
        Top = 50
        DataBinding.DataField = 'BLOOD_CODE'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 15
        Width = 142
      end
      object cxDBLookupComboBox3: TcxDBLookupComboBox
        Left = 77
        Top = 50
        DataBinding.DataField = 'SEX_CODE'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 16
        Width = 142
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 77
        Top = 74
        DataBinding.DataField = 'HOME_ADDRESS'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 17
        Width = 362
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 508
        Top = 74
        DataBinding.DataField = 'HOME_ADDRESS'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 18
        Width = 355
      end
      object cxLabel12: TcxLabel
        Left = 17
        Top = 100
        Caption = #32852#31995#20154
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 77
        Top = 99
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 20
        Width = 142
      end
      object cxLabel13: TcxLabel
        Left = 229
        Top = 100
        Caption = #32852#31995#30005#35805
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 296
        Top = 99
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 22
        Width = 142
      end
      object cxLabel14: TcxLabel
        Left = 448
        Top = 100
        Caption = #20851'  '#31995
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
      end
      object cxDBLookupComboBox4: TcxDBLookupComboBox
        Left = 510
        Top = 99
        DataBinding.DataField = 'RELA_CODE'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 24
        Width = 142
      end
      object cxDBCalcEdit1: TcxDBCalcEdit
        Left = 721
        Top = 25
        DataBinding.DataField = 'BIRTHDAY'
        DataBinding.DataSource = dsPatientInfo
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 25
        Width = 142
      end
    end
  end
  object cxEditStyleControllerTitle: TcxEditStyleController
    Scalable = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = #23435#20307
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Left = 770
    Top = 34
    PixelsPerInch = 96
  end
  object cxEditStyleControllerValue: TcxEditStyleController
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #23435#20307
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Left = 897
    Top = 65
    PixelsPerInch = 96
  end
  object cdsPatientInfo: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    StoreDefs = True
    Left = 441
    Top = 298
    object cdsPatientInfoFILE_NO: TStringField
      FieldName = 'FILE_NO'
      Origin = 'FILE_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsPatientInfoMED_REDCORD_NO: TStringField
      FieldName = 'MED_REDCORD_NO'
      Origin = 'MED_REDCORD_NO'
      Size = 10
    end
    object cdsPatientInfoNAME: TWideStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 50
    end
    object cdsPatientInfoBIRTHDAY: TSQLTimeStampField
      FieldName = 'BIRTHDAY'
      Origin = 'BIRTHDAY'
    end
    object cdsPatientInfoSEX_CODE: TStringField
      FieldName = 'SEX_CODE'
      Origin = 'SEX_CODE'
      FixedChar = True
      Size = 1
    end
    object cdsPatientInfoIDENNO: TStringField
      FieldName = 'IDENNO'
      Origin = 'IDENNO'
      Size = 18
    end
    object cdsPatientInfoIDCARDTYPE: TStringField
      FieldName = 'IDCARDTYPE'
      Origin = 'IDCARDTYPE'
      FixedChar = True
      Size = 1
    end
    object cdsPatientInfoBLOOD_CODE: TStringField
      FieldName = 'BLOOD_CODE'
      Origin = 'BLOOD_CODE'
      FixedChar = True
      Size = 1
    end
    object cdsPatientInfoRH_CODE: TStringField
      FieldName = 'RH_CODE'
      Origin = 'RH_CODE'
      FixedChar = True
      Size = 1
    end
    object cdsPatientInfoPROF_CODE: TStringField
      FieldName = 'PROF_CODE'
      Origin = 'PROF_CODE'
      Size = 10
    end
    object cdsPatientInfoDISTRICT: TWideStringField
      FieldName = 'DISTRICT'
      Origin = 'DISTRICT'
      Size = 10
    end
    object cdsPatientInfoCOUN_CODE: TStringField
      FieldName = 'COUN_CODE'
      Origin = 'COUN_CODE'
      FixedChar = True
      Size = 3
    end
    object cdsPatientInfoNATION_CODE: TStringField
      FieldName = 'NATION_CODE'
      Origin = 'NATION_CODE'
      FixedChar = True
      Size = 2
    end
    object cdsPatientInfoMARI: TStringField
      FieldName = 'MARI'
      Origin = 'MARI'
      FixedChar = True
      Size = 2
    end
    object cdsPatientInfoWORK_ADDRESS: TWideStringField
      FieldName = 'WORK_ADDRESS'
      Origin = 'WORK_ADDRESS'
      Size = 100
    end
    object cdsPatientInfoWORK_TEL: TStringField
      FieldName = 'WORK_TEL'
      Origin = 'WORK_TEL'
      Size = 50
    end
    object cdsPatientInfoWORK_ZIP: TStringField
      FieldName = 'WORK_ZIP'
      Origin = 'WORK_ZIP'
      Size = 6
    end
    object cdsPatientInfoCURRENT_ADDRESS: TWideStringField
      FieldName = 'CURRENT_ADDRESS'
      Origin = 'CURRENT_ADDRESS'
      Size = 100
    end
    object cdsPatientInfoHOME_ADDRESS: TWideStringField
      FieldName = 'HOME_ADDRESS'
      Origin = 'HOME_ADDRESS'
      Size = 100
    end
    object cdsPatientInfoHOME_TEL: TStringField
      FieldName = 'HOME_TEL'
      Origin = 'HOME_TEL'
      Size = 50
    end
    object cdsPatientInfoHOME_ZIP: TStringField
      FieldName = 'HOME_ZIP'
      Origin = 'HOME_ZIP'
      Size = 6
    end
    object cdsPatientInfoRELA_CODE: TStringField
      FieldName = 'RELA_CODE'
      Origin = 'RELA_CODE'
      FixedChar = True
      Size = 3
    end
    object cdsPatientInfoLINKMAN_NAME: TWideStringField
      FieldName = 'LINKMAN_NAME'
      Origin = 'LINKMAN_NAME'
      Size = 50
    end
    object cdsPatientInfoLINKMAN_TEL: TStringField
      FieldName = 'LINKMAN_TEL'
      Origin = 'LINKMAN_TEL'
      Size = 50
    end
    object cdsPatientInfoLINKMAN_ADD: TWideStringField
      FieldName = 'LINKMAN_ADD'
      Origin = 'LINKMAN_ADD'
      Size = 100
    end
    object cdsPatientInfoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object cdsPatientInfoMONTHER_NAME: TWideStringField
      FieldName = 'MONTHER_NAME'
      Origin = 'MONTHER_NAME'
      Size = 50
    end
    object cdsPatientInfoVALID_STATE: TStringField
      FieldName = 'VALID_STATE'
      Origin = 'VALID_STATE'
      FixedChar = True
      Size = 1
    end
    object cdsPatientInfoOPER_ID: TIntegerField
      FieldName = 'OPER_ID'
      Origin = 'OPER_ID'
    end
    object cdsPatientInfoOPER_TIME: TSQLTimeStampField
      FieldName = 'OPER_TIME'
      Origin = 'OPER_TIME'
    end
    object cdsPatientInfoCARD_TYPE: TStringField
      FieldName = 'CARD_TYPE'
      Origin = 'CARD_TYPE'
      Size = 30
    end
    object cdsPatientInfoCARD_NO: TStringField
      FieldName = 'CARD_NO'
      Origin = 'CARD_NO'
      Size = 50
    end
  end
  object cdsPatientType: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 745
    Top = 298
  end
  object cdsSex: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 57
    Top = 298
    object cdsSexCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsSexNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsSexSORT_ID: TIntegerField
      FieldName = 'SORT_ID'
    end
  end
  object cdsPType: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 665
    Top = 298
    object cdsPTypeCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsPTypeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsPTypeSORT_ID: TIntegerField
      FieldName = 'SORT_ID'
    end
  end
  object cdsCardType: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 809
    Top = 298
    object cdsCardTypeCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsCardTypeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsCardTypeSORT_ID: TIntegerField
      FieldName = 'SORT_ID'
    end
  end
  object cdsNation: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 601
    Top = 298
    object cdsNationCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsNationNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsNationSORT_ID: TIntegerField
      FieldName = 'SORT_ID'
    end
  end
  object dsPatientInfo: TDataSource
    DataSet = cdsPatientInfo
    Left = 433
    Top = 242
  end
  object dsPatientType: TDataSource
    DataSet = cdsPatientType
    Left = 745
    Top = 242
  end
  object dsPType: TDataSource
    DataSet = cdsPType
    Left = 673
    Top = 242
  end
  object dsSex: TDataSource
    DataSet = cdsSex
    Left = 65
    Top = 250
  end
  object dsNation: TDataSource
    DataSet = cdsNation
    Left = 601
    Top = 250
  end
  object dsCardType: TDataSource
    DataSet = cdsCardType
    Left = 817
    Top = 250
  end
  object cdsBlood: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 329
    Top = 154
  end
  object cdsRelate: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 521
    Top = 298
    object cdsRelateCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsRelateNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsRelateSORT_ID: TIntegerField
      FieldName = 'SORT_ID'
    end
  end
  object dsBlood: TDataSource
    DataSet = cdsBlood
    Left = 345
    Top = 226
  end
  object dsRelate: TDataSource
    DataSet = cdsRelate
    Left = 521
    Top = 258
  end
end
