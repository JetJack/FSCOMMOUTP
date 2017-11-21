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
    /// <summary>��PageControl����ʾһ������</summary>
    /// <param name="FormClass">����������</param>
    procedure OpenForm(FormClass: String);
    /// <summary>�ر������Ѿ��򿪵Ĵ���͹ҿ���TabSheet</summary>
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
    //�ر�TABSHEETǰ���ͷ�ͣ���Ĵ���
    TfrmBase(self.MainPage.ActivePage.Tag).Free;
    ACanClose := true;
  except
    on E: Exception do
    begin
      showmessage('�ͷŴ���ʧ�ܣ�');
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
   //��鴰���Ƿ��Ѿ���
  MyTabSheetName :=  NewSheetName + 'TForm2' ;
  NewSheet :=  TcxTabSheet(self.FindComponent(MyTabSheetName));
  //�����ھͽ����µ�TABSHEET�ʹ���
  if not Assigned(NewSheet) then
  begin
    //showmessage('�㱨�ϴ���');
    try
      //������TABSHEET
      NewSheet := TcxTabSheet.Create(self);
      NewSheet.Name := MyTabSheetName;
      NewSheet.PageControl := self.MainPage;
      NewSheet.Align := alClient;
      try
        //�����´���
        NewForm := TFormClass(FindClass('TForm2')).Create(self);
        NewForm.BorderStyle := bsNone;
        NewForm.ManualDock(NewSheet);
        NewForm.Align := alClient;
        NewSheet.Caption := NewForm.Caption;
        //�Ѵ���ָ�뻯������������TABSHEET��TAG�ֶ���
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
