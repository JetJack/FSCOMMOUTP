inherited frmSysMaintainPageControl: TfrmSysMaintainPageControl
  Caption = 'frmSysMaintainPageControl'
  ExplicitHeight = 788
  PixelsPerInch = 96
  TextHeight = 13
  inherited MainPanel: TPanel
    inherited MainPage: TcxPageControl
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoCloseButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    end
  end
  inherited MainMenu: TMainMenu
    object N1: TMenuItem
      Caption = #36130#21153#20449#24687#32500#25252
      object N2: TMenuItem
        Caption = #25910#36153#39033#30446#32500#25252
        OnClick = N2Click
      end
    end
  end
end
