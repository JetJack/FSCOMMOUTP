inherited frmOrderRelateInsu: TfrmOrderRelateInsu
  Caption = #31038#20445#30446#24405#23545#24212
  ClientHeight = 581
  ClientWidth = 1316
  ExplicitWidth = 1338
  ExplicitHeight = 636
  PixelsPerInch = 144
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1316
    Height = 49
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1316
    Height = 532
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1314
      Height = 240
      Align = alTop
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 648
        Height = 238
        Align = alLeft
        TabOrder = 0
        object cxGroupBox1: TcxGroupBox
          Left = 1
          Top = 1
          Align = alTop
          Caption = #25910#36153#39033#30446#27169#31946#26597#35810
          TabOrder = 0
          Height = 48
          Width = 646
          object editOrder: TcxTextEdit
            Left = 3
            Top = 15
            Properties.OnChange = editOrderPropertiesChange
            TabOrder = 0
            Width = 190
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 1
          Top = 49
          Align = alClient
          Caption = #25910#36153#39033#30446#20449#24687
          TabOrder = 1
          Height = 188
          Width = 646
          object cxGrid1: TcxGrid
            Left = 3
            Top = 15
            Width = 640
            Height = 164
            Align = alClient
            TabOrder = 0
            object cxGrid1DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = dsOrder
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              object cxGrid1DBTableView1ORDER_CODE: TcxGridDBColumn
                Caption = #25910#36153#20195#30721
                DataBinding.FieldName = 'ORDER_CODE'
                Width = 70
              end
              object cxGrid1DBTableView1ORDER_NAME: TcxGridDBColumn
                Caption = #25910#36153#39033#30446#21517#31216
                DataBinding.FieldName = 'ORDER_NAME'
                Width = 200
              end
              object cxGrid1DBTableView1SPECS: TcxGridDBColumn
                Caption = #35268#26684
                DataBinding.FieldName = 'SPECS'
                Width = 120
              end
              object cxGrid1DBTableView1GB_CODE: TcxGridDBColumn
                Caption = #26412#20301#30721
                DataBinding.FieldName = 'GB_CODE'
                Width = 100
              end
              object cxGrid1DBTableView1INV_NAME: TcxGridDBColumn
                Caption = #36153#29992#31867#22411
                DataBinding.FieldName = 'INV_NAME'
                Width = 100
              end
              object cxGrid1DBTableView1ORDER_UNIT: TcxGridDBColumn
                Caption = #21333#20301
                DataBinding.FieldName = 'ORDER_UNIT'
                Width = 30
              end
              object cxGrid1DBTableView1ORDER_PRICE: TcxGridDBColumn
                Caption = #21333#20215
                DataBinding.FieldName = 'ORDER_PRICE'
                Width = 100
              end
              object cxGrid1DBTableView1ORDER_PRICE2: TcxGridDBColumn
                Caption = #31038#20445#20215
                DataBinding.FieldName = 'ORDER_PRICE2'
              end
              object cxGrid1DBTableView1VALID_STATE: TcxGridDBColumn
                Caption = #22312#29992
                DataBinding.FieldName = 'VALID_STATE'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = '1'
                Properties.ValueUnchecked = '0'
                Width = 60
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 649
        Top = 1
        Width = 664
        Height = 238
        Align = alClient
        TabOrder = 1
        object cxGroupBox3: TcxGroupBox
          Left = 1
          Top = 1
          Align = alTop
          Caption = #31038#20445#30446#24405#27169#31946#26597#35810
          TabOrder = 0
          Height = 48
          Width = 662
          object editInsu: TcxTextEdit
            Left = 11
            Top = 15
            Properties.OnChange = editInsuPropertiesChange
            TabOrder = 0
            Width = 190
          end
        end
        object cxGroupBox4: TcxGroupBox
          Left = 1
          Top = 49
          Align = alClient
          Caption = #31038#20445#39033#30446#20449#24687
          TabOrder = 1
          Height = 188
          Width = 662
          object cxGrid2: TcxGrid
            Left = 3
            Top = 15
            Width = 656
            Height = 164
            Align = alClient
            TabOrder = 0
            object cxGrid2DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = dsInsuItem
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              object cxGrid2DBTableView1FIN_TYPE: TcxGridDBColumn
                Caption = #36153#29992#20998#31867
                DataBinding.FieldName = 'FIN_TYPE'
                Width = 80
              end
              object cxGrid2DBTableView1INSU_ITEM_CODE: TcxGridDBColumn
                Caption = #31038#20445#39033#30446#32534#30721
                DataBinding.FieldName = 'INSU_ITEM_CODE'
                Width = 150
              end
              object cxGrid2DBTableView1INSU_ITEM_NAME: TcxGridDBColumn
                Caption = #31038#20445#39033#30446#21517#31216
                DataBinding.FieldName = 'INSU_ITEM_NAME'
                Width = 180
              end
              object cxGrid2DBTableView1PRICE_UNIT: TcxGridDBColumn
                Caption = #21333#20301
                DataBinding.FieldName = 'PRICE_UNIT'
                Width = 40
              end
              object cxGrid2DBTableView1INSU_DOSAGE_FORM: TcxGridDBColumn
                Caption = #21058#22411
                DataBinding.FieldName = 'INSU_DOSAGE_FORM'
                Width = 100
              end
              object cxGrid2DBTableView1BASE_MED_TYPE: TcxGridDBColumn
                Caption = #25253#38144#31867#22411
                DataBinding.FieldName = 'BASE_MED_TYPE'
              end
              object cxGrid2DBTableView1ITEM_PRICE: TcxGridDBColumn
                Caption = #21333#20215
                DataBinding.FieldName = 'ITEM_PRICE'
                Width = 80
              end
              object cxGrid2DBTableView1INSU_ITEM_CONTENT: TcxGridDBColumn
                Caption = #22791#27880
                DataBinding.FieldName = 'INSU_ITEM_CONTENT'
                Width = 82
              end
            end
            object cxGrid2Level1: TcxGridLevel
              GridView = cxGrid2DBTableView1
            end
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 241
      Width = 1314
      Height = 290
      Align = alClient
      TabOrder = 1
      object cxGroupBox5: TcxGroupBox
        Left = 1
        Top = 1
        Align = alClient
        Caption = #31038#20445#30446#24405#23545#24212#24773#20917
        TabOrder = 0
        Height = 288
        Width = 1312
        object cxGrid3: TcxGrid
          Left = 3
          Top = 15
          Width = 1306
          Height = 264
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 192
          ExplicitTop = 112
          ExplicitWidth = 250
          ExplicitHeight = 200
          object cxGrid3DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsOrderInsu
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object cxGrid3DBTableView1FIN_TYPE: TcxGridDBColumn
              Caption = #31867#22411
              DataBinding.FieldName = 'FIN_TYPE'
              Width = 71
            end
            object cxGrid3DBTableView1INSU_ITEM_CODE: TcxGridDBColumn
              Caption = #31038#20445#39033#30446#32534#30721
              DataBinding.FieldName = 'INSU_ITEM_CODE'
              Width = 144
            end
            object cxGrid3DBTableView1INSU_ITEM_NAME: TcxGridDBColumn
              Caption = #31038#20445#39033#30446#21517#31216
              DataBinding.FieldName = 'INSU_ITEM_NAME'
              Width = 200
            end
            object cxGrid3DBTableView1ORDER_CODE: TcxGridDBColumn
              Caption = #21307#38498#25910#36153#32534#30721
              DataBinding.FieldName = 'ORDER_CODE'
            end
            object cxGrid3DBTableView1ORDER_NAME: TcxGridDBColumn
              Caption = #21307#38498#39033#30446#21517#31216
              DataBinding.FieldName = 'ORDER_NAME'
              Width = 200
            end
            object cxGrid3DBTableView1BASE_MED_TYPE: TcxGridDBColumn
              Caption = #25253#38144#31867#21035
              DataBinding.FieldName = 'BASE_MED_TYPE'
            end
            object cxGrid3DBTableView1BASE_MED_RATE: TcxGridDBColumn
              Caption = #22522#26412#21307#30103#25253#38144#24133#24230
              DataBinding.FieldName = 'BASE_MED_RATE'
            end
            object cxGrid3DBTableView1COM_OUTP_RATE: TcxGridDBColumn
              Caption = #26222#36890#38376#35786#25253#38144#24133#24230
              DataBinding.FieldName = 'COM_OUTP_RATE'
            end
            object cxGrid3DBTableView1INSU_DOSAGE_FORM: TcxGridDBColumn
              Caption = #21058#22411
              DataBinding.FieldName = 'INSU_DOSAGE_FORM'
              Width = 80
            end
            object cxGrid3DBTableView1SPECS: TcxGridDBColumn
              Caption = #35268#26684
              DataBinding.FieldName = 'SPECS'
              Width = 120
            end
            object cxGrid3DBTableView1ORDER_UNIT: TcxGridDBColumn
              Caption = #21333#20301
              DataBinding.FieldName = 'ORDER_UNIT'
              Width = 60
            end
            object cxGrid3DBTableView1ORDER_PRICE2: TcxGridDBColumn
              Caption = #21333#20215
              DataBinding.FieldName = 'ORDER_PRICE2'
            end
            object cxGrid3DBTableView1VALID_STATE: TcxGridDBColumn
              Caption = #22312#29992
              DataBinding.FieldName = 'VALID_STATE'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              Width = 30
            end
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = cxGrid3DBTableView1
          end
        end
      end
    end
  end
  object cdsOrder: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 458
    Top = 138
    object cdsOrderORDER_CODE: TStringField
      FieldName = 'ORDER_CODE'
      Origin = 'ORDER_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrderORDER_NAME: TWideStringField
      FieldName = 'ORDER_NAME'
      Size = 100
    end
    object cdsOrderSPECS: TStringField
      FieldName = 'SPECS'
      Origin = 'SPECS'
      Size = 50
    end
    object cdsOrderCLASS_CODE: TStringField
      FieldName = 'CLASS_CODE'
      Origin = 'CLASS_CODE'
      Size = 3
    end
    object cdsOrderFEE_CODE: TStringField
      FieldName = 'FEE_CODE'
      Origin = 'FEE_CODE'
      Size = 3
    end
    object cdsOrderSPELL_CODE: TStringField
      FieldName = 'SPELL_CODE'
      Origin = 'SPELL_CODE'
      Size = 50
    end
    object cdsOrderWB_CODE: TStringField
      FieldName = 'WB_CODE'
      Origin = 'WB_CODE'
      Size = 50
    end
    object cdsOrderINPUT_CDOE: TStringField
      FieldName = 'INPUT_CDOE'
      Origin = 'INPUT_CDOE'
      Size = 50
    end
    object cdsOrderGB_CODE: TStringField
      FieldName = 'GB_CODE'
      Origin = 'GB_CODE'
      Size = 50
    end
    object cdsOrderINTERNATIONAL_CODE: TStringField
      FieldName = 'INTERNATIONAL_CODE'
      Origin = 'INTERNATIONAL_CODE'
      Size = 50
    end
    object cdsOrderALIAS_NAME: TWideStringField
      FieldName = 'ALIAS_NAME'
      Size = 100
    end
    object cdsOrderALIAS_SPELL: TStringField
      FieldName = 'ALIAS_SPELL'
      Origin = 'ALIAS_SPELL'
      Size = 50
    end
    object cdsOrderALIAS_WB: TStringField
      FieldName = 'ALIAS_WB'
      Size = 50
    end
    object cdsOrderENGLISH_NAME: TStringField
      FieldName = 'ENGLISH_NAME'
      Origin = 'ENGLISH_NAME'
      Size = 100
    end
    object cdsOrderENGLISH_ALIAS: TStringField
      FieldName = 'ENGLISH_ALIAS'
      Origin = 'ENGLISH_ALIAS'
      Size = 100
    end
    object cdsOrderORDER_UNIT: TWideStringField
      FieldName = 'ORDER_UNIT'
      Size = 30
    end
    object cdsOrderORDER_PRICE: TBCDField
      FieldName = 'ORDER_PRICE'
      Origin = 'ORDER_PRICE'
      Precision = 18
    end
    object cdsOrderORDER_PRICE2: TBCDField
      FieldName = 'ORDER_PRICE2'
      Origin = 'ORDER_PRICE2'
      Precision = 18
    end
    object cdsOrderORDER_PRICE3: TBCDField
      FieldName = 'ORDER_PRICE3'
      Origin = 'ORDER_PRICE3'
      Precision = 18
    end
    object cdsOrderORDER_PRICE4: TBCDField
      FieldName = 'ORDER_PRICE4'
      Origin = 'ORDER_PRICE4'
      Precision = 18
    end
    object cdsOrderORDER_PRICE5: TBCDField
      FieldName = 'ORDER_PRICE5'
      Origin = 'ORDER_PRICE5'
      Precision = 18
    end
    object cdsOrderEXEDEPT_CODE: TStringField
      FieldName = 'EXEDEPT_CODE'
      Origin = 'EXEDEPT_CODE'
      Size = 10
    end
    object cdsOrderVALID_STATE: TStringField
      FieldName = 'VALID_STATE'
      Origin = 'VALID_STATE'
      FixedChar = True
      Size = 1
    end
    object cdsOrderAPPLY_STATE: TStringField
      FieldName = 'APPLY_STATE'
      Origin = 'APPLY_STATE'
      FixedChar = True
      Size = 1
    end
    object cdsOrderITEM_FLAG: TStringField
      FieldName = 'ITEM_FLAG'
      Origin = 'ITEM_FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsOrderCOMB_FLAG: TStringField
      FieldName = 'COMB_FLAG'
      Origin = 'COMB_FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsOrderSPECIAL_FLAG1: TStringField
      FieldName = 'SPECIAL_FLAG1'
      Origin = 'SPECIAL_FLAG1'
      FixedChar = True
      Size = 1
    end
    object cdsOrderSPECIAL_FLAG2: TStringField
      FieldName = 'SPECIAL_FLAG2'
      Origin = 'SPECIAL_FLAG2'
      FixedChar = True
      Size = 1
    end
    object cdsOrderSPECIAL_FLAG3: TStringField
      FieldName = 'SPECIAL_FLAG3'
      Origin = 'SPECIAL_FLAG3'
      FixedChar = True
      Size = 1
    end
    object cdsOrderSPECIAL_FLAG4: TStringField
      FieldName = 'SPECIAL_FLAG4'
      Origin = 'SPECIAL_FLAG4'
      FixedChar = True
      Size = 1
    end
    object cdsOrderSPECIAL_FLAG5: TStringField
      FieldName = 'SPECIAL_FLAG5'
      Origin = 'SPECIAL_FLAG5'
      FixedChar = True
      Size = 1
    end
    object cdsOrderOPER_ID: TIntegerField
      FieldName = 'OPER_ID'
      Origin = 'OPER_ID'
    end
    object cdsOrderOPER_TIME: TSQLTimeStampField
      FieldName = 'OPER_TIME'
      Origin = 'OPER_TIME'
    end
    object cdsOrderINV_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'INV_NAME'
      LookupDataSet = cdsInvFee
      LookupKeyFields = 'FEE_CODE'
      LookupResultField = 'INV_NAME'
      KeyFields = 'FEE_CODE'
      Size = 50
      Lookup = True
    end
  end
  object cdsInvFee: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 401
    Top = 178
    object cdsInvFeeFEE_CODE: TStringField
      FieldName = 'FEE_CODE'
      Size = 10
    end
    object cdsInvFeeINV_CODE: TStringField
      FieldName = 'INV_CODE'
      Size = 10
    end
    object cdsInvFeeINV_NAME: TWideStringField
      FieldName = 'INV_NAME'
      Size = 50
    end
  end
  object cdsInsuItem: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 731
    Top = 156
    object cdsInsuItemFIN_TYPE: TWideStringField
      FieldName = 'FIN_TYPE'
      Origin = 'FIN_TYPE'
      Size = 50
    end
    object cdsInsuItemINSU_ITEM_CODE: TStringField
      FieldName = 'INSU_ITEM_CODE'
      Origin = 'INSU_ITEM_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsInsuItemINSU_ITEM_NAME: TWideStringField
      FieldName = 'INSU_ITEM_NAME'
      Origin = 'INSU_ITEM_NAME'
      Size = 255
    end
    object cdsInsuItemINSU_ITEM_CONTENT: TWideMemoField
      FieldName = 'INSU_ITEM_CONTENT'
      Origin = 'INSU_ITEM_CONTENT'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object cdsInsuItemPRICE_UNIT: TWideStringField
      FieldName = 'PRICE_UNIT'
      Origin = 'PRICE_UNIT'
      Size = 50
    end
    object cdsInsuItemITEM_PRICE: TFMTBCDField
      FieldName = 'ITEM_PRICE'
      Origin = 'ITEM_PRICE'
      Precision = 19
      Size = 2
    end
    object cdsInsuItemBASE_MED_TYPE: TWideStringField
      FieldName = 'BASE_MED_TYPE'
      Origin = 'BASE_MED_TYPE'
      Size = 10
    end
    object cdsInsuItemINSU_DOSAGE_FORM: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'INSU_DOSAGE_FORM'
      Size = 50
      Calculated = True
    end
  end
  object dsInsuItem: TDataSource
    DataSet = cdsInsuItem
    Left = 779
    Top = 212
  end
  object dsOrder: TDataSource
    DataSet = cdsOrder
    Left = 243
    Top = 180
  end
  object dsOrderInsu: TDataSource
    DataSet = cdsOrderInsu
    Left = 737
    Top = 482
  end
  object cdsOrderInsu: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 834
    Top = 435
    object cdsOrderInsuFIN_TYPE: TWideStringField
      FieldName = 'FIN_TYPE'
      Origin = 'FIN_TYPE'
      Size = 50
    end
    object cdsOrderInsuINSU_ITEM_CODE: TStringField
      FieldName = 'INSU_ITEM_CODE'
      Origin = 'INSU_ITEM_CODE'
      Size = 50
    end
    object cdsOrderInsuINSU_ITEM_NAME: TWideStringField
      FieldName = 'INSU_ITEM_NAME'
      Origin = 'INSU_ITEM_NAME'
      Size = 255
    end
    object cdsOrderInsuINSU_DOSAGE_FORM: TWideStringField
      FieldName = 'INSU_DOSAGE_FORM'
      Origin = 'INSU_DOSAGE_FORM'
      Size = 50
    end
    object cdsOrderInsuORDER_CODE: TStringField
      FieldName = 'ORDER_CODE'
      Origin = 'ORDER_CODE'
      Required = True
    end
    object cdsOrderInsuORDER_NAME: TWideStringField
      FieldName = 'ORDER_NAME'
      Origin = 'ORDER_NAME'
      Size = 100
    end
    object cdsOrderInsuSPECS: TStringField
      FieldName = 'SPECS'
      Origin = 'SPECS'
      Size = 50
    end
    object cdsOrderInsuORDER_UNIT: TWideStringField
      FieldName = 'ORDER_UNIT'
      Origin = 'ORDER_UNIT'
      Size = 30
    end
    object cdsOrderInsuORDER_PRICE2: TBCDField
      FieldName = 'ORDER_PRICE2'
      Origin = 'ORDER_PRICE2'
      Precision = 18
    end
    object cdsOrderInsuBASE_MED_TYPE: TWideStringField
      FieldName = 'BASE_MED_TYPE'
      Origin = 'BASE_MED_TYPE'
      Size = 10
    end
    object cdsOrderInsuBASE_MED_RATE: TFMTBCDField
      FieldName = 'BASE_MED_RATE'
      Origin = 'BASE_MED_RATE'
      Precision = 19
      Size = 2
    end
    object cdsOrderInsuCOM_OUTP_RATE: TFMTBCDField
      FieldName = 'COM_OUTP_RATE'
      Origin = 'COM_OUTP_RATE'
      Precision = 19
      Size = 2
    end
    object cdsOrderInsuVALID_STATE: TStringField
      FieldName = 'VALID_STATE'
      Origin = 'VALID_STATE'
      FixedChar = True
      Size = 1
    end
  end
end
