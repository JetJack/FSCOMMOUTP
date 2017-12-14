inherited frmDrugItemMaintain: TfrmDrugItemMaintain
  Caption = #33647#21697'/'#26448#26009#32500#25252
  ClientHeight = 581
  ClientWidth = 1316
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
    Locked = True
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1316
    Height = 532
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 704
    ExplicitTop = 416
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1314
      Height = 264
      Align = alTop
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 1312
        Height = 64
        Align = alTop
        TabOrder = 0
        object cxGroupBox1: TcxGroupBox
          Left = 1
          Top = 1
          Align = alClient
          Caption = #26597#35810#26465#20214
          TabOrder = 0
          ExplicitHeight = 57
          Height = 62
          Width = 1310
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 65
        Width = 1312
        Height = 198
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 105
        object cxGroupBox2: TcxGroupBox
          Left = 1
          Top = 1
          Align = alClient
          Caption = #33647#21697#21015#34920
          TabOrder = 0
          ExplicitLeft = 256
          ExplicitTop = 72
          ExplicitWidth = 185
          ExplicitHeight = 105
          Height = 196
          Width = 1310
          object cxGrid1: TcxGrid
            Left = 3
            Top = 15
            Width = 1304
            Height = 172
            Align = alClient
            TabOrder = 0
            ExplicitTop = 3
            object cxGrid1DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = dsDrug
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object cxGrid1DBTableView1ITEM_CODE: TcxGridDBColumn
                Caption = #33647#21697#20195#30721
                DataBinding.FieldName = 'ITEM_CODE'
              end
              object cxGrid1DBTableView1TRADE_NAME: TcxGridDBColumn
                Caption = #33647#21697#21517#31216
                DataBinding.FieldName = 'TRADE_NAME'
                Width = 291
              end
              object cxGrid1DBTableView1SPECS: TcxGridDBColumn
                Caption = #35268#26684
                DataBinding.FieldName = 'SPECS'
                Width = 269
              end
              object cxGrid1DBTableView1PRODUCER_NAME: TcxGridDBColumn
                Caption = #29983#20135#21378#23478
                DataBinding.FieldName = 'PRODUCER_NAME'
                Width = 100
              end
              object cxGrid1DBTableView1ITEM_TYPE: TcxGridDBColumn
                Caption = #33647#21697#31867#22411
                DataBinding.FieldName = 'ITEM_TYPE'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'CODE'
                Properties.ListColumns = <
                  item
                    FieldName = 'NAME'
                  end>
                Properties.ListSource = dsItemType
                Width = 54
              end
              object cxGrid1DBTableView1VALID_STATE: TcxGridDBColumn
                Caption = #26377#25928
                DataBinding.FieldName = 'VALID_STATE'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = '1'
                Properties.ValueUnchecked = '0'
                Width = 46
              end
              object cxGrid1DBTableView1LACK_FLAG: TcxGridDBColumn
                Caption = #32570#33647
                DataBinding.FieldName = 'LACK_FLAG'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = '1'
                Properties.ValueUnchecked = '0'
                Width = 45
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 265
      Width = 1314
      Height = 266
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 592
      ExplicitTop = 344
      ExplicitWidth = 185
      ExplicitHeight = 41
      object cxPageControl1: TcxPageControl
        Left = 1
        Top = 1
        Width = 1312
        Height = 264
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet1
        Properties.CustomButtons.Buttons = <>
        ExplicitLeft = 344
        ExplicitTop = 72
        ExplicitWidth = 289
        ExplicitHeight = 193
        ClientRectBottom = 257
        ClientRectLeft = 3
        ClientRectRight = 1305
        ClientRectTop = 27
        object cxTabSheet1: TcxTabSheet
          Caption = #33647#21697#22522#26412#20449#24687
          ImageIndex = 0
          ExplicitHeight = 262
        end
      end
    end
  end
  object cdsDrug: TFDMemTable
    Left = 835
    Top = 244
    object cdsDrugITEM_CODE: TStringField
      FieldName = 'ITEM_CODE'
      Origin = 'ITEM_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDrugORDER_CODE: TStringField
      FieldName = 'ORDER_CODE'
      Origin = 'ORDER_CODE'
    end
    object cdsDrugTRADE_NAME: TWideStringField
      FieldName = 'TRADE_NAME'
      Origin = 'TRADE_NAME'
      Size = 60
    end
    object cdsDrugSPELL_CODE: TStringField
      FieldName = 'SPELL_CODE'
      Origin = 'SPELL_CODE'
      Size = 50
    end
    object cdsDrugWB_CODE: TStringField
      FieldName = 'WB_CODE'
      Origin = 'WB_CODE'
      Size = 50
    end
    object cdsDrugCUSTOM_CODE: TStringField
      FieldName = 'CUSTOM_CODE'
      Origin = 'CUSTOM_CODE'
    end
    object cdsDrugREGULAR_NAME: TWideStringField
      FieldName = 'REGULAR_NAME'
      Origin = 'REGULAR_NAME'
      Size = 50
    end
    object cdsDrugREGULAR_SPELL: TStringField
      FieldName = 'REGULAR_SPELL'
      Origin = 'REGULAR_SPELL'
      Size = 50
    end
    object cdsDrugREGULAR_WB: TStringField
      FieldName = 'REGULAR_WB'
      Origin = 'REGULAR_WB'
      Size = 50
    end
    object cdsDrugREGULAR_CUSTOM: TStringField
      FieldName = 'REGULAR_CUSTOM'
      Origin = 'REGULAR_CUSTOM'
    end
    object cdsDrugFORMAL_NAME: TWideStringField
      FieldName = 'FORMAL_NAME'
      Origin = 'FORMAL_NAME'
      Size = 50
    end
    object cdsDrugFORMAL_SPELL: TStringField
      FieldName = 'FORMAL_SPELL'
      Origin = 'FORMAL_SPELL'
      Size = 50
    end
    object cdsDrugFORMAL_WB: TStringField
      FieldName = 'FORMAL_WB'
      Origin = 'FORMAL_WB'
      Size = 50
    end
    object cdsDrugFORMAL_CUSTOM: TStringField
      FieldName = 'FORMAL_CUSTOM'
      Origin = 'FORMAL_CUSTOM'
    end
    object cdsDrugALIAS_NAME: TWideStringField
      FieldName = 'ALIAS_NAME'
      Origin = 'ALIAS_NAME'
      Size = 50
    end
    object cdsDrugALIAS_SPELL: TStringField
      FieldName = 'ALIAS_SPELL'
      Origin = 'ALIAS_SPELL'
      Size = 50
    end
    object cdsDrugALIAS_WB: TStringField
      FieldName = 'ALIAS_WB'
      Origin = 'ALIAS_WB'
      Size = 50
    end
    object cdsDrugALIAS_CUSTOM: TStringField
      FieldName = 'ALIAS_CUSTOM'
      Origin = 'ALIAS_CUSTOM'
      Size = 50
    end
    object cdsDrugENGLISH_REGULAR: TStringField
      FieldName = 'ENGLISH_REGULAR'
      Origin = 'ENGLISH_REGULAR'
      Size = 50
    end
    object cdsDrugENGLISH_ALIAS: TStringField
      FieldName = 'ENGLISH_ALIAS'
      Origin = 'ENGLISH_ALIAS'
      Size = 50
    end
    object cdsDrugENGLISH_NAME: TStringField
      FieldName = 'ENGLISH_NAME'
      Origin = 'ENGLISH_NAME'
      Size = 50
    end
    object cdsDrugINTERNATIONAL_CODE: TStringField
      FieldName = 'INTERNATIONAL_CODE'
      Origin = 'INTERNATIONAL_CODE'
      Size = 50
    end
    object cdsDrugGB_CODE: TStringField
      FieldName = 'GB_CODE'
      Origin = 'GB_CODE'
      Size = 50
    end
    object cdsDrugCLASS_CODE: TStringField
      FieldName = 'CLASS_CODE'
      Origin = 'CLASS_CODE'
      Size = 3
    end
    object cdsDrugFEE_CODE: TStringField
      FieldName = 'FEE_CODE'
      Origin = 'FEE_CODE'
      Size = 3
    end
    object cdsDrugITEM_TYPE: TStringField
      FieldName = 'ITEM_TYPE'
      Origin = 'ITEM_TYPE'
      Size = 3
    end
    object cdsDrugITEM_QUALITY: TStringField
      FieldName = 'ITEM_QUALITY'
      Origin = 'ITEM_QUALITY'
      Size = 3
    end
    object cdsDrugSPECS: TStringField
      FieldName = 'SPECS'
      Origin = 'SPECS'
      Size = 50
    end
    object cdsDrugRETAIL_PRICE: TBCDField
      FieldName = 'RETAIL_PRICE'
      Origin = 'RETAIL_PRICE'
      Precision = 18
    end
    object cdsDrugWHOLESALE_PRICE: TBCDField
      FieldName = 'WHOLESALE_PRICE'
      Origin = 'WHOLESALE_PRICE'
      Precision = 18
    end
    object cdsDrugPURCHASE_PRICE: TBCDField
      FieldName = 'PURCHASE_PRICE'
      Origin = 'PURCHASE_PRICE'
      Precision = 18
    end
    object cdsDrugPACK_UNIT: TWideStringField
      FieldName = 'PACK_UNIT'
      Origin = 'PACK_UNIT'
      Size = 16
    end
    object cdsDrugMIN_UNIT: TWideStringField
      FieldName = 'MIN_UNIT'
      Origin = 'MIN_UNIT'
      Size = 16
    end
    object cdsDrugDOSE_UNIT: TWideStringField
      FieldName = 'DOSE_UNIT'
      Origin = 'DOSE_UNIT'
      Size = 16
    end
    object cdsDrugPACK_QTY: TSmallintField
      FieldName = 'PACK_QTY'
      Origin = 'PACK_QTY'
    end
    object cdsDrugBASE_DOSE: TBCDField
      FieldName = 'BASE_DOSE'
      Origin = 'BASE_DOSE'
      Precision = 18
    end
    object cdsDrugONCE_DOSE: TBCDField
      FieldName = 'ONCE_DOSE'
      Origin = 'ONCE_DOSE'
      Precision = 18
    end
    object cdsDrugDOSAGEFORM_CODE: TStringField
      FieldName = 'DOSAGEFORM_CODE'
      Origin = 'DOSAGEFORM_CODE'
      Size = 10
    end
    object cdsDrugFREQUENCY_CODE: TStringField
      FieldName = 'FREQUENCY_CODE'
      Origin = 'FREQUENCY_CODE'
      Size = 10
    end
    object cdsDrugUSAGE_CODE: TStringField
      FieldName = 'USAGE_CODE'
      Origin = 'USAGE_CODE'
      Size = 10
    end
    object cdsDrugVALID_STATE: TStringField
      FieldName = 'VALID_STATE'
      Origin = 'VALID_STATE'
      FixedChar = True
      Size = 1
    end
    object cdsDrugSELF_FLAG: TStringField
      FieldName = 'SELF_FLAG'
      Origin = 'SELF_FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsDrugOCT_FLAG: TStringField
      FieldName = 'OCT_FLAG'
      Origin = 'OCT_FLAG'
      FixedChar = True
      Size = 2
    end
    object cdsDrugGMP_FLAG: TStringField
      FieldName = 'GMP_FLAG'
      Origin = 'GMP_FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsDrugTEST_FLAG: TStringField
      FieldName = 'TEST_FLAG'
      Origin = 'TEST_FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsDrugLACK_FLAG: TStringField
      FieldName = 'LACK_FLAG'
      Origin = 'LACK_FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsDrugPRODUCER_CODE: TStringField
      FieldName = 'PRODUCER_CODE'
      Origin = 'PRODUCER_CODE'
      Size = 10
    end
    object cdsDrugAPPROVE_INFO: TWideStringField
      FieldName = 'APPROVE_INFO'
      Origin = 'APPROVE_INFO'
      Size = 50
    end
    object cdsDrugBAR_CODE: TStringField
      FieldName = 'BAR_CODE'
      Origin = 'BAR_CODE'
      Size = 50
    end
    object cdsDrugSPLIT_TYPE: TStringField
      FieldName = 'SPLIT_TYPE'
      Origin = 'SPLIT_TYPE'
      FixedChar = True
      Size = 1
    end
    object cdsDrugMARK: TWideStringField
      FieldName = 'MARK'
      Origin = 'MARK'
      Size = 200
    end
    object cdsDrugOPER_ID: TIntegerField
      FieldName = 'OPER_ID'
      Origin = 'OPER_ID'
    end
    object cdsDrugOPER_TIME: TSQLTimeStampField
      FieldName = 'OPER_TIME'
      Origin = 'OPER_TIME'
    end
    object cdsDrugOPER_NAME: TWideStringField
      FieldKind = fkLookup
      FieldName = 'OPER_NAME'
      LookupDataSet = cdsUser
      LookupKeyFields = 'USER_ID'
      LookupResultField = 'USER_NAME'
      KeyFields = 'OPER_ID'
      Size = 50
      Lookup = True
    end
    object cdsDrugPRODUCER_NAME: TWideStringField
      FieldKind = fkLookup
      FieldName = 'PRODUCER_NAME'
      LookupDataSet = cdsProduce
      LookupKeyFields = 'COMPANY_CODE'
      LookupResultField = 'COMPANY_NAME'
      KeyFields = 'PRODUCER_CODE'
      Size = 100
      Lookup = True
    end
  end
  object cdsClassCode: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 899
    Top = 244
    object cdsClassCodeCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsClassCodeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsFeeCode: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 971
    Top = 252
    object cdsFeeCodeCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsFeeCodeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsItemType: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 739
    Top = 244
    object cdsItemTypeCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsItemTypeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsItemQuality: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 611
    Top = 244
    object cdsItemQualityCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsItemQualityNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsPackUnit: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 523
    Top = 244
    object cdsPackUnitCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsPackUnitNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsMinUnit: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 411
    Top = 236
    object cdsMinUnitCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsMinUnitNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsDoseUnit: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 307
    Top = 244
    object cdsDoseUnitCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsDoseUnitNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsOrder: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 203
    Top = 252
    object cdsOrderORDER_CODE: TStringField
      FieldName = 'ORDER_CODE'
    end
    object cdsOrderORDER_NAME: TWideStringField
      FieldName = 'ORDER_NAME'
      Size = 100
    end
    object cdsOrderSPECS: TStringField
      FieldName = 'SPECS'
      Size = 50
    end
  end
  object cdsUser: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 139
    Top = 252
    object cdsUserUSER_ID: TIntegerField
      FieldName = 'USER_ID'
    end
    object cdsUserUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Size = 50
    end
  end
  object cdsProduce: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 83
    Top = 252
    object cdsProduceCOMPANY_CODE: TStringField
      FieldName = 'COMPANY_CODE'
      Size = 10
    end
    object cdsProduceCOMPANY_NAME: TWideStringField
      FieldName = 'COMPANY_NAME'
      Size = 100
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
    Left = 921
    Top = 41
    PixelsPerInch = 96
  end
  object dsDrug: TDataSource
    DataSet = cdsDrug
    Left = 923
    Top = 196
  end
  object dsItemType: TDataSource
    DataSet = cdsItemType
    Left = 755
    Top = 196
  end
end
