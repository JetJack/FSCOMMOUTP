inherited frmBasePageControl: TfrmBasePageControl
  Caption = 'frmBasePageControl'
  Menu = MainMenu
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 448
    Width = 640
    Height = 32
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object MainPanel: TPanel
    Left = 0
    Top = 41
    Width = 640
    Height = 407
    Align = alClient
    TabOrder = 2
    object MainPage: TcxPageControl
      Left = 1
      Top = 1
      Width = 638
      Height = 405
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      OnCanClose = MainPageCanClose
      OnMouseDown = MainPageMouseDown
      ClientRectBottom = 401
      ClientRectLeft = 4
      ClientRectRight = 634
      ClientRectTop = 4
    end
  end
  object MainMenu: TMainMenu
    Left = 432
    Top = 8
  end
  object dxSkinController1: TdxSkinController
    Left = 536
    Top = 24
  end
end
