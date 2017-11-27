inherited frmSysMaintainPageControl: TfrmSysMaintainPageControl
  Caption = 'frmSysMaintainPageControl'
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    ExplicitWidth = 1344
  end
  inherited StatusBar: TdxStatusBar
    ExplicitTop = 697
    ExplicitWidth = 1344
  end
  inherited MainPanel: TPanel
    ExplicitWidth = 1344
    ExplicitHeight = 656
    inherited MainPage: TcxPageControl
      Properties.ActivePage = cxTabSheet1
      ExplicitWidth = 1342
      ExplicitHeight = 654
      ClientRectTop = 27
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        ImageIndex = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 1332
          Height = 620
          Align = alClient
          Caption = 'Panel1'
          TabOrder = 0
          ExplicitLeft = 416
          ExplicitTop = 320
          ExplicitWidth = 185
          ExplicitHeight = 41
        end
      end
    end
  end
end
