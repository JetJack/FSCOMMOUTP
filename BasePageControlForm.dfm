inherited frmBasePageControl: TfrmBasePageControl
  Caption = 'frmBasePageControl'
  ClientHeight = 729
  ClientWidth = 1344
  Menu = MainMenu
  ExplicitWidth = 1360
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 1344
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 697
    Width = 1344
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
    Width = 1344
    Height = 656
    Align = alClient
    TabOrder = 2
    object MainPage: TcxPageControl
      Left = 1
      Top = 1
      Width = 1342
      Height = 654
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoCloseButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
      OnCanClose = MainPageCanClose
      OnMouseDown = MainPageMouseDown
      ClientRectBottom = 647
      ClientRectLeft = 3
      ClientRectRight = 1335
      ClientRectTop = 3
    end
  end
  object MainMenu: TMainMenu
    Left = 432
    Top = 8
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'Lilian'
    Left = 536
    Top = 24
  end
end
