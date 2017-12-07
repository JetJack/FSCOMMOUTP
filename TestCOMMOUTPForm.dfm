object frmTestCommoutp: TfrmTestCommoutp
  Left = 0
  Top = 0
  Caption = #26222#36890#38376#35786#27979#35797
  ClientHeight = 729
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 729
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 77
      Width = 36
      Height = 13
      Caption = #21345#20449#24687
    end
    object Label2: TLabel
      Left = 30
      Top = 338
      Width = 68
      Height = 16
      Caption = 'SessionID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labSessionID: TLabel
      Left = 104
      Top = 338
      Width = 56
      Height = 16
      Caption = 'SessionID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 224
      Width = 201
      Height = 99
      Caption = #25163#24037#24405#20837
      TabOrder = 0
      object eName: TLabeledEdit
        Left = 64
        Top = 26
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = #22995'   '#21517
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object eIDENO: TLabeledEdit
        Left = 64
        Top = 66
        Width = 121
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = #36523#20221#35777#21495
        LabelPosition = lpLeft
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 24
      Top = 369
      Width = 233
      Height = 185
      Caption = #21151#33021#35843#29992
      TabOrder = 1
      object Button1: TButton
        Left = 149
        Top = 15
        Width = 75
        Height = 25
        Caption = #35835#21345
        TabOrder = 0
        OnClick = Button1Click
      end
      object rgFuntion: TRadioGroup
        Left = 3
        Top = 24
        Width = 126
        Height = 158
        Caption = #25509#21475#21151#33021
        ItemIndex = 0
        Items.Strings = (
          #30331#24405
          #32467#31639#26597#35810'20'
          #23601#35786#26597#35810'21'
          #38376#35786#36164#26684#30830#35748
          #38376#35786#32467#31639
          #32467#31639#22238#36864)
        TabOrder = 1
      end
      object Button2: TButton
        Left = 149
        Top = 56
        Width = 75
        Height = 25
        Caption = #20135#29983#20837#21442
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 149
        Top = 96
        Width = 75
        Height = 25
        Caption = #35843#29992
        TabOrder = 3
        OnClick = Button3Click
      end
    end
    object rgCardType: TRadioGroup
      Left = 24
      Top = 24
      Width = 185
      Height = 41
      Caption = #21345#31867#22411
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #36523#20221#35777
        #31038#20445#21345)
      TabOrder = 2
    end
    object rgkind: TRadioGroup
      Left = 215
      Top = 24
      Width = 129
      Height = 41
      Caption = #25509#35302#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25509#35302
        #38750#25509#35302)
      TabOrder = 3
    end
    object Memo1: TMemo
      Left = 24
      Top = 96
      Width = 329
      Height = 105
      TabOrder = 4
    end
    object rgInput: TRadioGroup
      Left = 231
      Top = 224
      Width = 121
      Height = 99
      Caption = #30149#20154#36164#26009#21462#20540
      ItemIndex = 0
      Items.Strings = (
        #25163#24037#24405#20837
        #35835#21345)
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 369
    Top = 0
    Width = 639
    Height = 729
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 637
      Height = 352
      Align = alTop
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 1
        Top = 1
        Width = 635
        Height = 350
        Align = alClient
        Caption = #20837#21442
        TabOrder = 0
        object memoInXml: TMemo
          Left = 2
          Top = 15
          Width = 631
          Height = 333
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 353
      Width = 637
      Height = 375
      Align = alClient
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 1
        Top = 1
        Width = 635
        Height = 373
        Align = alClient
        Caption = #20986#21442
        TabOrder = 0
        object memoOutXml: TMemo
          Left = 2
          Top = 15
          Width = 631
          Height = 356
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
end
