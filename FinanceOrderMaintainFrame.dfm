object framFinanceOrderMaintain: TframFinanceOrderMaintain
  Left = 0
  Top = 0
  Width = 1300
  Height = 517
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1300
    Height = 225
    Align = alTop
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1298
      Height = 58
      Align = alTop
      TabOrder = 0
      object cxGroupBox1: TcxGroupBox
        Left = 1
        Top = 1
        Align = alClient
        Caption = #25910#36153#39033#30446#36807#28388#26465#20214
        TabOrder = 0
        Height = 56
        Width = 1296
        object cxLabel1: TcxLabel
          Left = 16
          Top = 25
          Caption = #27169#31946#36807#28388#26465#20214
          ParentFont = False
          Style.StyleController = cxEditStyleControllerTitle
          Transparent = True
        end
        object cxTextEdit1: TcxTextEdit
          Left = 106
          Top = 22
          RepositoryItem = cxEditRepository1TextItemLocate
          ParentFont = False
          Style.StyleController = cxEditStyleControllerValue
          TabOrder = 1
          Width = 199
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 59
      Width = 1298
      Height = 165
      Align = alClient
      TabOrder = 1
      object cxGroupBox2: TcxGroupBox
        Left = 1
        Top = 1
        Align = alClient
        Caption = #25910#36153#39033#30446#21015#34920
        TabOrder = 0
        Height = 163
        Width = 1296
        object cxDBTreeListOrder: TcxDBTreeList
          Left = 3
          Top = 15
          Width = 1290
          Height = 139
          Align = alClient
          Bands = <
            item
            end>
          DataController.DataSource = dsOrder
          DataController.ParentField = 'CLASS_CODE'
          DataController.KeyField = 'ORDER_CODE'
          Navigator.Buttons.CustomButtons = <>
          OptionsData.Editing = False
          OptionsData.Deleting = False
          RootValue = -1
          TabOrder = 0
          object cxDBTreeList1ORDER_CODE: TcxDBTreeListColumn
            Caption.Text = #39033#30446#20195#30721
            DataBinding.FieldName = 'ORDER_CODE'
            Width = 78
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1ORDER_NAME: TcxDBTreeListColumn
            Caption.Text = #39033#30446#21517#31216
            DataBinding.FieldName = 'ORDER_NAME'
            Width = 365
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1SPECS: TcxDBTreeListColumn
            Caption.Text = #35268#26684
            DataBinding.FieldName = 'SPECS'
            Width = 139
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1ORDER_UNIT: TcxDBTreeListColumn
            Caption.Text = #21333#20301
            DataBinding.FieldName = 'ORDER_UNIT'
            Width = 53
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1ORDER_PRICE: TcxDBTreeListColumn
            Caption.Text = #21333#20215
            DataBinding.FieldName = 'ORDER_PRICE'
            Width = 57
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1FEE_NAME: TcxDBTreeListColumn
            Caption.Text = #36153#29992#31867#21035
            DataBinding.FieldName = 'FEE_NAME'
            Width = 71
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1INV_NAME: TcxDBTreeListColumn
            Caption.Text = #21457#31080#31867#21035
            DataBinding.FieldName = 'INV_NAME'
            Width = 71
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1CLASS_NAME: TcxDBTreeListColumn
            Caption.Text = #31995#32479#31867#21035
            DataBinding.FieldName = 'CLASS_NAME'
            Width = 72
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1APPLY_AREA: TcxDBTreeListColumn
            Caption.Text = #36866#29992#33539#22260
            DataBinding.FieldName = 'APPLY_AREA'
            Width = 69
            Position.ColIndex = 8
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1VALID_NAME: TcxDBTreeListColumn
            DataBinding.FieldName = #26377#25928#29366#24577
            Width = 71
            Position.ColIndex = 9
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1OPER_NAME: TcxDBTreeListColumn
            DataBinding.FieldName = #25805#20316#21592
            Width = 60
            Position.ColIndex = 10
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1OPER_TIME: TcxDBTreeListColumn
            DataBinding.FieldName = #25805#20316#26102#38388
            Width = 128
            Position.ColIndex = 11
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 225
    Width = 1300
    Height = 148
    Align = alClient
    TabOrder = 1
    ExplicitTop = 100
    object cxGroupBox3: TcxGroupBox
      Left = 1
      Top = 1
      Align = alClient
      Caption = #25910#36153#39033#30446#20449#24687
      TabOrder = 0
      Height = 146
      Width = 1298
      object cxLabel2: TcxLabel
        Left = 8
        Top = 22
        Caption = #39033#30446#20195#30721
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 226
        Top = 22
        Caption = #39033#30446#21517#31216
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 70
        Top = 21
        DataBinding.DataField = 'ORDER_CODE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 2
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 292
        Top = 21
        DataBinding.DataField = 'ORDER_NAME'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 3
        Width = 349
      end
      object cxLable4: TcxLabel
        Left = 674
        Top = 22
        Caption = #35268#26684
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 712
        Top = 21
        DataBinding.DataField = 'OPER_NAME'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 5
        Width = 225
      end
      object cxLabel4: TcxLabel
        Left = 8
        Top = 53
        Caption = #35745#20215#21333#20301
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 151
        Top = 53
        Caption = #21333#20215
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 184
        Top = 51
        DataBinding.DataField = 'ORDER_PRICE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 8
        Width = 81
      end
      object cxLabel6: TcxLabel
        Left = 284
        Top = 53
        Caption = #36153#29992#31867#21035
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLookupComboBox2: TcxDBLookupComboBox
        Left = 345
        Top = 52
        DataBinding.DataField = 'FEE_CODE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.KeyFieldNames = 'CODE'
        Properties.ListColumns = <
          item
            MinWidth = 4
            FieldName = 'CODE'
          end
          item
            MinWidth = 10
            FieldName = 'NAME'
          end>
        Properties.ListSource = dsMINFEE
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 10
        Width = 104
      end
      object cxLabel7: TcxLabel
        Left = 470
        Top = 53
        Caption = #21457#31080#31867#21035
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLabel1: TcxDBLabel
        Left = 534
        Top = 52
        DataBinding.DataField = 'INV_NAME'
        DataBinding.DataSource = dsOrder
        Transparent = True
        Height = 21
        Width = 121
      end
      object cxDBLookupComboBox3: TcxDBLookupComboBox
        Left = 736
        Top = 51
        DataBinding.DataField = 'CLASS_CODE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.KeyFieldNames = 'CODE'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = dsClassCode
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 13
        Width = 121
      end
      object cxLabel8: TcxLabel
        Left = 673
        Top = 52
        Caption = #31995#32479#31867#21035
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 8
        Top = 82
        Caption = #36866#29992#33539#22260
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLookupComboBox4: TcxDBLookupComboBox
        Left = 69
        Top = 81
        DataBinding.DataField = 'APPLY_STATE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.KeyFieldNames = 'CODE'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = dsApply
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 16
        Width = 121
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 211
        Top = 81
        Caption = #32452#21512#39033#30446#26631#24535
        DataBinding.DataField = 'COMB_FLAG'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.Alignment = taRightJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Style.StyleController = cxEditStyleControllerTitle
        TabOrder = 17
        Width = 105
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 345
        Top = 80
        Caption = #20855#20307#26448#26009#26631#24535
        DataBinding.DataField = 'ITEM_FLAG'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.Alignment = taRightJustify
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Style.StyleController = cxEditStyleControllerTitle
        TabOrder = 18
        Width = 105
      end
      object cxLabel10: TcxLabel
        Left = 470
        Top = 82
        Caption = #25191#34892#31185#23460
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLookupComboBox5: TcxDBLookupComboBox
        Left = 534
        Top = 81
        DataBinding.DataField = 'EXEDEPT_CODE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.KeyFieldNames = 'DEPT_CODE'
        Properties.ListColumns = <
          item
            Caption = #31185#23460#20195#30721
            MinWidth = 10
            FieldName = 'DEPT_CODE'
          end
          item
            Caption = #31185#23460#21517#31216
            FieldName = 'DEPT_NAME'
          end>
        Properties.ListSource = dsDept
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 20
        Width = 121
      end
      object cxLabel11: TcxLabel
        Left = 674
        Top = 82
        Caption = #26377#25928#29366#24577
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 10
        Top = 112
        Caption = #30465#25910#36153#30446#24405#32534#30721
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLookupComboBox7: TcxDBLookupComboBox
        Left = 112
        Top = 109
        DataBinding.DataField = 'INTERNATIONAL_CODE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.KeyFieldNames = 'ITEM_CODE'
        Properties.ListColumns = <
          item
            Caption = #20195#30721
            Width = 20
            FieldName = 'ITEM_CODE'
          end
          item
            Caption = #21517#31216
            Width = 20
            FieldName = 'ITEM_NAME'
          end
          item
            Caption = #21333#20301
            MinWidth = 10
            Width = 10
            FieldName = 'PRICE_UNIT'
          end
          item
            Caption = #21333#20215
            Width = 20
            FieldName = 'PRICE'
          end>
        Properties.ListSource = dsGDService
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 23
        Width = 121
      end
      object cxLabel13: TcxLabel
        Left = 284
        Top = 112
        Caption = #25805#20316#20154
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLabel2: TcxDBLabel
        Left = 349
        Top = 112
        DataBinding.DataField = 'OPER_NAME'
        DataBinding.DataSource = dsOrder
        Transparent = True
        Height = 21
        Width = 121
      end
      object cxLabel14: TcxLabel
        Left = 470
        Top = 112
        Caption = #25805#20316#26102#38388
        ParentFont = False
        Style.StyleController = cxEditStyleControllerTitle
        Transparent = True
      end
      object cxDBLabel3: TcxDBLabel
        Left = 534
        Top = 108
        DataBinding.DataField = 'OPER_TIME'
        DataBinding.DataSource = dsOrder
        Transparent = True
        Height = 21
        Width = 121
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 735
        Top = 80
        Alignment = alLeftCenter
        DataBinding.DataField = 'VALID_STATE'
        DataBinding.DataSource = dsOrder
        ParentFont = False
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = #22312#29992
            Value = '1'
          end
          item
            Caption = #20572#29992
            Value = '0'
          end>
        Style.StyleController = cxEditStyleControllerValue
        TabOrder = 28
        Transparent = True
        Height = 22
        Width = 122
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 70
        Top = 51
        DataBinding.DataField = 'ORDER_UNIT'
        DataBinding.DataSource = dsOrder
        Properties.KeyFieldNames = 'CODE'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = dsMinUnit
        TabOrder = 29
        Width = 81
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 373
    Width = 1300
    Height = 144
    Align = alBottom
    TabOrder = 2
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 608
      Height = 142
      Align = alLeft
      TabOrder = 0
      object cxGroupBox4: TcxGroupBox
        Left = 1
        Top = 1
        Align = alClient
        Caption = #33647#21697#25110#26448#26009#39033#30446#23545#24212#24773#20917
        TabOrder = 0
        Height = 140
        Width = 606
        object cxDBTreeListOrderItem: TcxDBTreeList
          Left = 3
          Top = 15
          Width = 600
          Height = 116
          Align = alClient
          Bands = <
            item
            end>
          DataController.DataSource = dsOrderItem
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Navigator.Buttons.CustomButtons = <>
          ParentFont = False
          RootValue = -1
          TabOrder = 0
          object cxDBTreeListOrderItemTRADE_NAME: TcxDBTreeListColumn
            Caption.Text = #33647#21697'/'#26448#26009#21517#31216
            DataBinding.FieldName = 'TRADE_NAME'
            Width = 157
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderItemSPECS: TcxDBTreeListColumn
            Caption.Text = #35268#26684
            DataBinding.FieldName = 'SPECS'
            Width = 112
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderItemGB_CODE: TcxDBTreeListColumn
            Caption.Text = #26412#20301#30721
            DataBinding.FieldName = 'GB_CODE'
            Width = 120
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderItemPRODUCER: TcxDBTreeListColumn
            Caption.Text = #29983#20135#21830
            DataBinding.FieldName = 'PRODUCER'
            Width = 100
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderItemLACK_NAME: TcxDBTreeListColumn
            Caption.Text = #26377#33647
            DataBinding.FieldName = 'LACK_NAME'
            Width = 51
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderItemVALID_NAME: TcxDBTreeListColumn
            Caption.Text = #22312#29992
            DataBinding.FieldName = 'VALID_NAME'
            Width = 44
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderItemPRICE: TcxDBTreeListColumn
            Caption.Text = #21333#20215
            DataBinding.FieldName = 'PRICE'
            Width = 60
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
      end
    end
    object Panel7: TPanel
      Left = 609
      Top = 1
      Width = 690
      Height = 142
      Align = alClient
      TabOrder = 1
      object cxGroupBox5: TcxGroupBox
        Left = 1
        Top = 1
        Align = alClient
        Caption = #31038#20445#30446#24405#23545#24212#24773#20917
        TabOrder = 0
        Height = 140
        Width = 688
        object cxDBTreeListOrderInsu: TcxDBTreeList
          Left = 3
          Top = 15
          Width = 682
          Height = 116
          Align = alClient
          Bands = <
            item
            end>
          DataController.DataSource = dsOrderInsu
          Navigator.Buttons.CustomButtons = <>
          RootValue = -1
          TabOrder = 0
          object cxDBTreeListOrderInsuINSU_INTERFACE: TcxDBTreeListColumn
            Caption.Text = #31038#20445#25509#21475#21517#31216
            DataBinding.FieldName = 'INSU_INTERFACE'
            Width = 81
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderInsuINSU_ITEM_NAME: TcxDBTreeListColumn
            Caption.Text = #31038#20445#39033#30446#21517
            DataBinding.FieldName = 'INSU_ITEM_NAME'
            Width = 164
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderInsuINSU_ITEM_CODE: TcxDBTreeListColumn
            Caption.Text = #31038#20445#39033#30446#20195#30721
            DataBinding.FieldName = 'INSU_ITEM_CODE'
            Width = 100
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderInsuBASE_MED_TYPE: TcxDBTreeListColumn
            Caption.Text = #31038#20445#31867#22411
            DataBinding.FieldName = 'BASE_MED_TYPE'
            Width = 58
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderInsuBASE_MED_RATE: TcxDBTreeListColumn
            Caption.Text = #22522#26412#21307#30103#25253#38144#27604#20363
            DataBinding.FieldName = 'BASE_MED_RATE'
            Width = 110
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListOrderInsuCOM_OUTP_RATE: TcxDBTreeListColumn
            Caption.Text = #26222#36890#38376#35786#32467#31639#25253#38144#27604#20363
            DataBinding.FieldName = 'COM_OUTP_RATE'
            Width = 126
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
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
    Left = 857
    Top = 121
    PixelsPerInch = 96
  end
  object cxEditRepository1: TcxEditRepository
    Left = 784
    Top = 177
    PixelsPerInch = 96
    object cxEditRepository1TextItemLocate: TcxEditRepositoryTextItem
      Properties.CharCase = ecUpperCase
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 944
    Top = 177
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
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
    Left = 642
    Top = 178
    object cdsOrderORDER_CODE: TStringField
      FieldName = 'ORDER_CODE'
      Origin = 'ORDER_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrderORDER_NAME: TStringField
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
    object cdsOrderALIAS_NAME: TStringField
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
    object cdsOrderORDER_UNIT: TStringField
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
    object cdsOrderFEE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FEE_NAME'
      LookupDataSet = cdsMINFEE
      LookupKeyFields = 'CODE'
      LookupResultField = 'NAME'
      KeyFields = 'FEE_CODE'
      Lookup = True
    end
    object cdsOrderINV_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'INV_NAME'
      LookupDataSet = cdsInvFee
      LookupKeyFields = 'CODE'
      LookupResultField = 'NAME'
      KeyFields = 'FEE_CODE'
      Size = 50
      Lookup = True
    end
    object cdsOrderCLASS_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CLASS_NAME'
      LookupDataSet = cdsClassCode
      LookupKeyFields = 'CODE'
      LookupResultField = 'NAME'
      KeyFields = 'CLASS_CODE'
      Size = 50
      Lookup = True
    end
    object cdsOrderAPPLY_AREA: TStringField
      FieldKind = fkLookup
      FieldName = 'APPLY_AREA'
      LookupDataSet = cdsApply
      LookupKeyFields = 'CODE'
      LookupResultField = 'NAME'
      KeyFields = 'APPLY_STATE'
      Size = 50
      Lookup = True
    end
    object cdsOrderVALID_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VALID_NAME'
      LookupDataSet = cdsValid
      LookupKeyFields = 'CODE'
      LookupResultField = 'NAME'
      KeyFields = 'VALID_STATE'
      Lookup = True
    end
    object cdsOrderOPER_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'OPER_NAME'
      LookupDataSet = cdsOperator
      LookupKeyFields = 'USER_ID'
      LookupResultField = 'USER_NAME'
      KeyFields = 'OPER_ID'
      Size = 50
      Lookup = True
    end
  end
  object dsOrder: TDataSource
    DataSet = cdsOrder
    Left = 530
    Top = 178
  end
  object cdsMINFEE: TFDMemTable
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
    Left = 601
    Top = 402
    object cdsMINFEECODE: TStringField
      FieldName = 'CODE'
    end
    object cdsMINFEENAME: TStringField
      FieldName = 'NAME'
      Size = 50
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
    Left = 537
    Top = 418
    object cdsInvFeeCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object cdsInvFeeNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsClassCode: TFDMemTable
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
    Left = 625
    Top = 514
    object cdsClassCodeCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsClassCodeNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsApply: TFDMemTable
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
    Left = 721
    Top = 418
    object cdsApplyCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsApplyNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsValid: TFDMemTable
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
    Left = 409
    Top = 354
    object cdsValidCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsValidNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cdsOperator: TFDMemTable
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
    Left = 1025
    Top = 330
    object cdsOperatorUSER_ID: TIntegerField
      FieldName = 'USER_ID'
    end
    object cdsOperatorUSER_NAME: TStringField
      FieldName = 'USER_NAME'
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
    Left = 905
    Top = 330
    object cdsMinUnitCODE: TStringField
      FieldName = 'CODE'
    end
    object cdsMinUnitNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object dsClassCode: TDataSource
    DataSet = cdsClassCode
    Left = 497
    Top = 442
  end
  object dsApply: TDataSource
    DataSet = cdsApply
    Left = 769
    Top = 442
  end
  object dsValid: TDataSource
    DataSet = cdsValid
    Left = 353
    Top = 410
  end
  object dsMINFEE: TDataSource
    DataSet = cdsMINFEE
    Left = 657
    Top = 402
  end
  object dsMinUnit: TDataSource
    DataSet = cdsMinUnit
    Left = 961
    Top = 321
  end
  object cdsDept: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 457
    Top = 353
    object cdsDeptDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cdsDeptDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 50
    end
  end
  object dsDept: TDataSource
    DataSet = cdsDept
    Left = 345
    Top = 513
  end
  object dsGDService: TDataSource
    DataSet = cdsGDService
    Left = 289
    Top = 410
  end
  object cdsGDService: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 241
    Top = 401
    object cdsGDServiceITEM_CODE: TStringField
      FieldName = 'ITEM_CODE'
      Size = 50
    end
    object cdsGDServiceITEM_NAME: TStringField
      FieldName = 'ITEM_NAME'
      Size = 255
    end
    object cdsGDServicePRICE_UNIT: TStringField
      FieldName = 'PRICE_UNIT'
      Size = 50
    end
    object cdsGDServicePRICE: TStringField
      FieldName = 'PRICE'
      Size = 50
    end
  end
  object dsOrderItem: TDataSource
    DataSet = cdsOrderItem
    Left = 114
    Top = 530
  end
  object dsOrderInsu: TDataSource
    DataSet = cdsOrderInsu
    Left = 985
    Top = 537
  end
  object cdsOrderItem: TFDMemTable
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
    Left = 194
    Top = 530
    object cdsOrderItemTRADE_NAME: TWideStringField
      FieldName = 'TRADE_NAME'
      Size = 120
    end
    object cdsOrderItemSPECS: TStringField
      FieldName = 'SPECS'
      Size = 50
    end
    object cdsOrderItemGB_CODE: TStringField
      FieldName = 'GB_CODE'
      Size = 50
    end
    object cdsOrderItemPRODUCER: TWideStringField
      FieldName = 'PRODUCER'
      Size = 50
    end
    object cdsOrderItemLACK_NAME: TWideStringField
      FieldName = 'LACK_NAME'
      Size = 4
    end
    object cdsOrderItemPRICE: TBCDField
      FieldName = 'PRICE'
    end
    object cdsOrderItemVALID_NAME: TWideStringField
      FieldName = 'VALID_NAME'
      Size = 4
    end
    object cdsOrderItemVALID_STATE: TStringField
      FieldName = 'VALID_STATE'
      Size = 1
    end
  end
  object cdsOrderInsu: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1058
    Top = 522
    object cdsOrderInsuINSU_INTERFACE: TStringField
      FieldName = 'INSU_INTERFACE'
    end
    object cdsOrderInsuINSU_ITEM_NAME: TWideStringField
      FieldName = 'INSU_ITEM_NAME'
      Size = 50
    end
    object cdsOrderInsuINSU_ITEM_CODE: TStringField
      FieldName = 'INSU_ITEM_CODE'
      Size = 30
    end
    object cdsOrderInsuBASE_MED_TYPE: TWideStringField
      FieldName = 'BASE_MED_TYPE'
    end
    object cdsOrderInsuBASE_MED_RATE: TBCDField
      FieldName = 'BASE_MED_RATE'
    end
    object cdsOrderInsuCOM_OUTP_RATE: TBCDField
      FieldName = 'COM_OUTP_RATE'
    end
  end
end
