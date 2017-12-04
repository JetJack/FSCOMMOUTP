object frmTestCRW: TfrmTestCRW
  Left = 0
  Top = 0
  Caption = #35835#21345#22120#27979#35797
  ClientHeight = 396
  ClientWidth = 678
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
  object Label1: TLabel
    Left = 40
    Top = 77
    Width = 48
    Height = 13
    Caption = #36820#22238#32467#26524
  end
  object EditCode: TLabeledEdit
    Left = 40
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'sCode'#35831#27714#30721
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 40
    Top = 96
    Width = 329
    Height = 105
    TabOrder = 1
  end
  object Button1: TButton
    Left = 448
    Top = 16
    Width = 97
    Height = 25
    Caption = #33719#21462#35831#27714#23383#31526#20018
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 448
    Top = 56
    Width = 97
    Height = 25
    Caption = 'DK'#33719#21462#21345#20449#24687
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 448
    Top = 96
    Width = 97
    Height = 25
    Caption = 'GetJkxx'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 136
    Width = 97
    Height = 25
    Caption = 'Getskjlid'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Memo2: TMemo
    Left = 40
    Top = 216
    Width = 329
    Height = 98
    TabOrder = 6
  end
  object Button5: TButton
    Left = 448
    Top = 176
    Width = 97
    Height = 25
    Caption = 'GetSkjlidFjc'
    TabOrder = 7
    OnClick = Button5Click
  end
  object rgCardType: TRadioGroup
    Left = 40
    Top = 328
    Width = 185
    Height = 41
    Caption = #21345#31867#22411
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #36523#20221#35777
      #31038#20445#21345)
    TabOrder = 8
  end
  object rgkind: TRadioGroup
    Left = 256
    Top = 328
    Width = 129
    Height = 41
    Caption = #25509#35302#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25509#35302
      #38750#25509#35302)
    TabOrder = 9
  end
  object Button6: TButton
    Left = 448
    Top = 216
    Width = 97
    Height = 25
    Caption = 'GetSkjlidFtc'
    TabOrder = 10
    OnClick = Button6Click
  end
end
