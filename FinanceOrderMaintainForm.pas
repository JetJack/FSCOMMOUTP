unit FinanceOrderMaintainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, FinanceOrderMaintainFrame, Data.DB,
  DSCJSON, System.JSON, HISServerMethods;

type
  TfrmFinanceOrderMaintain = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    framFinanceOrder: TframFinanceOrderMaintain;
    cxButton1: TcxButton;
    procedure framFinanceOrderMaintain1cdsOrderAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FModeInfo: String;
    procedure GetDictionary();
  public
    { Public declarations }
  end;

var
  frmFinanceOrderMaintain: TfrmFinanceOrderMaintain;

implementation

{$R *.dfm}

procedure TfrmFinanceOrderMaintain.FormCreate(Sender: TObject);
begin
  inherited;
  FModeInfo := 'FinanceOrderMaintainForm UserID:' + IntToStr(self.User.OperID);
end;

procedure TfrmFinanceOrderMaintain.framFinanceOrderMaintain1cdsOrderAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  self.framFinanceOrder.cdsOrderOPER_ID.AsInteger := self.User.OperID;
  self.framFinanceOrder.cdsOrderOPER_TIME.AsDateTime := Now();
end;

procedure TfrmFinanceOrderMaintain.GetDictionary;
var _sFieldList, _sTypeName: string;
    _jo: TJSONObject;
    _data: WideString;
begin
  try
    //cdsClassCode
    _sFieldList := 'CODE, NAME';
    _sTypeName := 'CLASSCODE';
    _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsClassCode);
      self.framFinanceOrder.cdsClassCode.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsMINFEE
    _sFieldList := 'CODE, NAME';
    _sTypeName := 'MINFEE';
    _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsMINFEE);
      self.framFinanceOrder.cdsMINFEE.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsMINUNIT
    _sFieldList := 'CODE, NAME';
    _sTypeName := 'MINUNIT';
    _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsMinUnit);
      self.framFinanceOrder.cdsMinUnit.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsApply
    _sFieldList := 'CODE, NAME';
    _sTypeName := 'APPLICABILITYAREA';
    _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsApply);
      self.framFinanceOrder.cdsApply.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsInvFee
    _sFieldList := 'CODE, NAME';
    _sTypeName := 'MZINVOICEITEM';
    _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsInvFee);
      self.framFinanceOrder.cdsInvFee.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsValidState
    _sFieldList := 'CODE, NAME';
    _sTypeName := 'VALIDSTATE';
    _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsValid);
      self.framFinanceOrder.cdsValid.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _jo.Free();
  end;
end;

end.
