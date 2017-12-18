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
  DSCJSON, System.JSON, HISServerMethods, FireDAC.Comp.Client, Data.FireDACJSONReflect,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TfrmFinanceOrderMaintain = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    framFinanceOrder: TframFinanceOrderMaintain;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    cxButton3: TcxButton;
    procedure framFinanceOrderMaintain1cdsOrderAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure framFinanceOrdercdsOrderAfterScroll(DataSet: TDataSet);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    FModeInfo: String;
    procedure GetDictionary();
    procedure GetOrderInfo();
    procedure NewOrderItem();
    procedure RefreshOrderInfo();
    procedure ShowOrderRelateInfo(OrderCode: String);
    procedure SaveOrderInfo();
    procedure SaveOrderInfoWithJSON();
  public
    { Public declarations }
  end;

var
  frmFinanceOrderMaintain: TfrmFinanceOrderMaintain;

implementation

{$R *.dfm}

procedure TfrmFinanceOrderMaintain.cxButton1Click(Sender: TObject);
begin
  inherited;
  self.NewOrderItem();
end;

procedure TfrmFinanceOrderMaintain.cxButton2Click(Sender: TObject);
begin
  inherited;
  self.SaveOrderInfo();
  //self.SaveOrderInfoWithJSON();
end;

procedure TfrmFinanceOrderMaintain.cxButton3Click(Sender: TObject);
begin
  inherited;
  self.RefreshOrderInfo();
end;

procedure TfrmFinanceOrderMaintain.FormCreate(Sender: TObject);
begin
  inherited;
  FModeInfo := 'FinanceOrderMaintainForm UserID:' + IntToStr(self.User.OperID);
  self.GetDictionary();
end;

procedure TfrmFinanceOrderMaintain.FormShow(Sender: TObject);
begin
  inherited;
  self.GetOrderInfo();
end;

procedure TfrmFinanceOrderMaintain.framFinanceOrdercdsOrderAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  self.ShowOrderRelateInfo(self.framFinanceOrder.cdsOrderORDER_CODE.AsString);
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
    {
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
      }
    _data := dmHis.SystemMaintainServer.GetMINFeeToInvFee(FModeInfo);
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

    //cdsGDService
    _data := dmHis.SystemMaintainServer.OrderMaintianGetGDServiceItem(FModeInfo);
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsGDService);
      self.framFinanceOrder.cdsGDService.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsDept
     _data := dmHis.SystemMaintainServer.GetDepartmentBase(FModeInfo);
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsDept);
      self.framFinanceOrder.cdsDept.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsOperator
    _data := dmHis.SystemMaintainServer.GetOperatorBase(FModeInfo);
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOperator);
      self.framFinanceOrder.cdsOperator.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

  finally
    _jo.Free();
  end;
end;

procedure TfrmFinanceOrderMaintain.GetOrderInfo;
var _jo: TJSONObject;
    _data: WideString;
    _tmp: TFDMemTable;
    i: Integer;
begin
  try
    _data := dmHis.SystemMaintainServer.GetFinanceOrderInfo(FModeInfo,'');
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    _tmp := TFDMemTable.Create(nil);
    self.framFinanceOrder.cdsOrder.AfterScroll := nil;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      //TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrder);
      self.framFinanceOrder.cdsOrder.Open();
      self.framFinanceOrder.cdsOrder.EmptyDataSet() ;
      self.framFinanceOrder.cdsOrder.CancelUpdates();
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrder);
      {
      if not self.framFinanceOrder.cdsOrder.Active then
        self.framFinanceOrder.cdsOrder.Open();
      self.framFinanceOrder.cdsOrder.EmptyDataSet();
      _tmp.First();
      while not _tmp.Eof do
      begin
        self.framFinanceOrder.cdsOrder.Append;
        for I := 0  to _tmp.Fields.Count -1 do
        begin
          self.framFinanceOrder.cdsOrder.FieldByName(_tmp.Fields.Fields[i].FieldName).Value
            := _tmp.Fields.Fields[i].Value;
        end;
        self.framFinanceOrder.cdsOrder.Post();
        _tmp.Next();
      end;
      }
      self.framFinanceOrder.cdsOrder.Delta.DataView.Clear();
      self.framFinanceOrder.cdsOrder.CachedUpdates := true;
      if not self.framFinanceOrder.cdsOrder.IsEmpty then
      begin
        self.ShowOrderRelateInfo(self.framFinanceOrder.cdsOrderORDER_CODE.AsString);
      end;
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _tmp.Free();
    self.framFinanceOrder.cdsOrder.AfterScroll := self.framFinanceOrdercdsOrderAfterScroll;
    _jo.Free();
  end;
end;

procedure TfrmFinanceOrderMaintain.NewOrderItem;
begin
    try
    if self.framFinanceOrder.cdsOrder.State in dsEditModes then
      self.framFinanceOrder.cdsOrder.Post();
    self.framFinanceOrder.cdsOrder.Append();
    self.framFinanceOrder.cdsOrderOPER_ID.AsInteger := self.User.OperID;
    self.framFinanceOrder.cdsOrderOPER_TIME.AsDateTime := now()
  except
    on E:Exception do
    begin
      showmessage(E.Message);
    end;
  end;
end;

procedure TfrmFinanceOrderMaintain.RefreshOrderInfo;
var _jo: TJSONObject;
    _data: WideString;
    i: Integer;
    _sCode: String;
begin
  try
    if not self.framFinanceOrder.cdsOrder.IsEmpty then
       _sCode := self.framFinanceOrder.cdsOrderORDER_CODE.AsString;
    _data := dmHis.SystemMaintainServer.GetFinanceOrderInfo(FModeInfo,'');
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    self.framFinanceOrder.cdsOrder.AfterScroll := nil;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      //TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrder);
      self.framFinanceOrder.cdsOrder.Open();
      self.framFinanceOrder.cdsOrder.EmptyDataSet() ;
      self.framFinanceOrder.cdsOrder.CancelUpdates();
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrder);
      self.framFinanceOrder.cdsOrder.Delta.DataView.Clear();
      self.framFinanceOrder.cdsOrder.CachedUpdates := true;
      self.framFinanceOrder.cdsOrder.Locate('ORDER_CODE',_sCode,[]);
      if not self.framFinanceOrder.cdsOrder.IsEmpty then
      begin
        self.ShowOrderRelateInfo(self.framFinanceOrder.cdsOrderORDER_CODE.AsString);
      end;
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    self.framFinanceOrder.cdsOrder.AfterScroll := self.framFinanceOrdercdsOrderAfterScroll;
    _jo.Free();
  end;
end;

procedure TfrmFinanceOrderMaintain.SaveOrderInfo;
var _sSQL, _sNoField: string;
    AJSON: TJSONObject;
begin
  try
    self.framFinanceOrder.cdsOrder.AfterScroll := nil;
    _sNoField := '';
    _sSQL := TDSCJSONTools.FDMemtableToSQLJSON(self.framFinanceOrder.cdsOrder,
       'FIN_COM_ORDER','ORDER_CODE', _sNoField);
    AJSON := TJSONObject.ParseJSONValue(dmHis.SystemMaintainServer.ExecuteSQLSet(FModeInfo, _sSQL)) as TJSONObject;
    self.framFinanceOrder.cdsOrder.AfterScroll := self.framFinanceOrdercdsOrderAfterScroll;
    if AJSON.GetValue('Code').Value = '1' then
    begin
      showmessage('数据保存成功！');
      self.GetOrderInfo();
    end
    else
    begin
      showmessage(AJSON.GetValue('Message').Value);
    end;
  finally
    AJSON.Free();
  end;
end;

procedure TfrmFinanceOrderMaintain.SaveOrderInfoWithJSON;
var ADeltas: TFDJSONDeltas;
begin
  try
    self.framFinanceOrder.cdsOrder.AfterScroll := nil;
    if self.framFinanceOrder.cdsOrder.State in dsEditModes then
       self.framFinanceOrder.cdsOrder.Post();
    ADeltas := TFDJSONDeltas.Create;
    TFDJSONDeltasWriter.ListAdd(ADeltas, 'FIN_COM_ORDER', self.framFinanceOrder.cdsOrder);
    dmHis.SystemMaintainServer.ApplyUpdateWithJSON('FIN_COM_ORDER', ADeltas);
  finally
    self.framFinanceOrder.cdsOrder.AfterScroll := self.framFinanceOrdercdsOrderAfterScroll;
  end;
end;

procedure TfrmFinanceOrderMaintain.ShowOrderRelateInfo(OrderCode: String);
var _jo: TJSONObject;
    _data: WideString;
begin
  try
    //cdsOrderItem
    self.framFinanceOrder.cdsOrderItem.ReadOnly := false;
    _data := dmHis.SystemMaintainServer.GetFinanceOrderRelateItem(FModeInfo,OrderCode);
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrderItem);
      self.framFinanceOrder.cdsOrderItem.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);

    //cdsOrderInsu
    self.framFinanceOrder.cdsOrderInsu.ReadOnly := false;
    _data := dmHis.SystemMaintainServer.GetFinanceOrderInsuInfo(FModeInfo,OrderCode,'');
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrderInsu);
      self.framFinanceOrder.cdsOrderInsu.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _jo.Free();
    self.framFinanceOrder.cdsOrderItem.ReadOnly := true;
    self.framFinanceOrder.cdsOrderInsu.ReadOnly := true;
  end;
end;

initialization
  RegisterClass(TfrmFinanceOrderMaintain);

finalization
  UnRegisterClass(TfrmFinanceOrderMaintain);


end.
