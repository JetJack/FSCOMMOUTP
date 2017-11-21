unit BasePageControlForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, dxStatusBar, Vcl.ExtCtrls, Vcl.Menus, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, cxClasses, dxSkinsForm;

type
  TfrmBasePageControl = class(TfrmBase)
    MainMenu: TMainMenu;
    TopPanel: TPanel;
    StatusBar: TdxStatusBar;
    MainPanel: TPanel;
    MainPage: TcxPageControl;
    dxSkinController1: TdxSkinController;
    procedure MainPageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure MainPageCanClose(Sender: TObject; var ACanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>在PageControl中显示一个窗体</summary>
    /// <param name="FormClass">窗体类名称</param>
    procedure OpenForm(FormClass: String);
    /// <summary>关闭所有已经打开的窗体和挂靠的TabSheet</summary>
    procedure CloseAllForm();
  end;

var
  frmBasePageControl: TfrmBasePageControl;

implementation

{$R *.dfm}

{ TfrmBasePageControl }

procedure TfrmBasePageControl.CloseAllForm;
var i: integer;
begin
  for i := 0 to self.MainPage.PageCount - 1 do
  begin
    MainPage.Pages[1].Free;
  end;
end;

procedure TfrmBasePageControl.MainPageCanClose(Sender: TObject; var ACanClose: Boolean);
begin
  inherited;
  try
    //关闭TABSHEET前先释放停靠的窗体
    TfrmBase(self.MainPage.ActivePage.Tag).Free;
    ACanClose := true;
  except
    on E: Exception do
    begin
      showmessage('释放窗体失败！');
      ACanClose := false;
    end;
  end;
end;

procedure TfrmBasePageControl.MainPageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var TabSheet: TcxTabSheet;
begin
  inherited;
  if mbRight = Button then
  begin
    self.MainPage.ActivePage := self.MainPage.Pages[self.MainPage.IndexOfTabAt(X, Y)];
  end;
end;

procedure TfrmBasePageControl.OpenForm(FormClass: String);
const NewSheetName = 'HISTABSHEET_';
var NewForm: TForm;
    NewSheet: TcxTabSheet;
    MyTabSheetName :string;
begin
   //检查窗体是否已经打开
  MyTabSheetName :=  NewSheetName + 'TForm2' ;
  NewSheet :=  TcxTabSheet(self.FindComponent(MyTabSheetName));
  //不存在就建立新的TABSHEET和窗体
  if not Assigned(NewSheet) then
  begin
    //showmessage('零报上传！');
    try
      //建立新TABSHEET
      NewSheet := TcxTabSheet.Create(self);
      NewSheet.Name := MyTabSheetName;
      NewSheet.PageControl := self.MainPage;
      NewSheet.Align := alClient;
      try
        //建立新窗体
        NewForm := TFormClass(FindClass('TForm2')).Create(self);
        NewForm.BorderStyle := bsNone;
        NewForm.ManualDock(NewSheet);
        NewForm.Align := alClient;
        NewSheet.Caption := NewForm.Caption;
        //把窗体指针化成整数保存在TABSHEET的TAG字段中
        NewSheet.Tag := Integer(NewForm) ;
        NewForm.Show();
      except
        FreeAndNil(NewForm);
        Abort;
      end;
    except
      FreeAndNil(NewSheet);
      exit;
    end;
    self.MainPage.ActivePage := NewSheet;
  end;
end;

end.
