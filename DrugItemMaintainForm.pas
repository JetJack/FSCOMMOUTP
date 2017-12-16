unit DrugItemMaintainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxGroupBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxDBLookupComboBox, cxCheckBox, System.JSON, HISServerMethods, DSCJSON;

type
  TfrmDrugItemMaintain = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsDrug: TFDMemTable;
    cdsDrugITEM_CODE: TStringField;
    cdsDrugORDER_CODE: TStringField;
    cdsDrugTRADE_NAME: TWideStringField;
    cdsDrugSPELL_CODE: TStringField;
    cdsDrugWB_CODE: TStringField;
    cdsDrugCUSTOM_CODE: TStringField;
    cdsDrugREGULAR_NAME: TWideStringField;
    cdsDrugREGULAR_SPELL: TStringField;
    cdsDrugREGULAR_WB: TStringField;
    cdsDrugREGULAR_CUSTOM: TStringField;
    cdsDrugFORMAL_NAME: TWideStringField;
    cdsDrugFORMAL_SPELL: TStringField;
    cdsDrugFORMAL_WB: TStringField;
    cdsDrugFORMAL_CUSTOM: TStringField;
    cdsDrugALIAS_NAME: TWideStringField;
    cdsDrugALIAS_SPELL: TStringField;
    cdsDrugALIAS_WB: TStringField;
    cdsDrugALIAS_CUSTOM: TStringField;
    cdsDrugENGLISH_REGULAR: TStringField;
    cdsDrugENGLISH_ALIAS: TStringField;
    cdsDrugENGLISH_NAME: TStringField;
    cdsDrugINTERNATIONAL_CODE: TStringField;
    cdsDrugGB_CODE: TStringField;
    cdsDrugCLASS_CODE: TStringField;
    cdsDrugFEE_CODE: TStringField;
    cdsDrugITEM_TYPE: TStringField;
    cdsDrugITEM_QUALITY: TStringField;
    cdsDrugSPECS: TStringField;
    cdsDrugRETAIL_PRICE: TBCDField;
    cdsDrugWHOLESALE_PRICE: TBCDField;
    cdsDrugPURCHASE_PRICE: TBCDField;
    cdsDrugPACK_UNIT: TWideStringField;
    cdsDrugMIN_UNIT: TWideStringField;
    cdsDrugDOSE_UNIT: TWideStringField;
    cdsDrugPACK_QTY: TSmallintField;
    cdsDrugBASE_DOSE: TBCDField;
    cdsDrugONCE_DOSE: TBCDField;
    cdsDrugDOSAGEFORM_CODE: TStringField;
    cdsDrugFREQUENCY_CODE: TStringField;
    cdsDrugUSAGE_CODE: TStringField;
    cdsDrugVALID_STATE: TStringField;
    cdsDrugSELF_FLAG: TStringField;
    cdsDrugOCT_FLAG: TStringField;
    cdsDrugGMP_FLAG: TStringField;
    cdsDrugTEST_FLAG: TStringField;
    cdsDrugLACK_FLAG: TStringField;
    cdsDrugPRODUCER_CODE: TStringField;
    cdsDrugAPPROVE_INFO: TWideStringField;
    cdsDrugBAR_CODE: TStringField;
    cdsDrugSPLIT_TYPE: TStringField;
    cdsDrugMARK: TWideStringField;
    cdsDrugOPER_ID: TIntegerField;
    cdsDrugOPER_TIME: TSQLTimeStampField;
    cdsItemType: TFDMemTable;
    cdsItemQuality: TFDMemTable;
    cdsPackUnit: TFDMemTable;
    cdsMinUnit: TFDMemTable;
    cdsDoseUnit: TFDMemTable;
    cdsOrder: TFDMemTable;
    cdsUser: TFDMemTable;
    cdsItemTypeCODE: TStringField;
    cdsItemTypeNAME: TWideStringField;
    cdsItemQualityCODE: TStringField;
    cdsItemQualityNAME: TWideStringField;
    cdsPackUnitCODE: TStringField;
    cdsPackUnitNAME: TWideStringField;
    cdsMinUnitCODE: TStringField;
    cdsMinUnitNAME: TWideStringField;
    cdsDoseUnitCODE: TStringField;
    cdsDoseUnitNAME: TWideStringField;
    cdsOrderORDER_CODE: TStringField;
    cdsOrderORDER_NAME: TWideStringField;
    cdsOrderSPECS: TStringField;
    cdsUserUSER_ID: TIntegerField;
    cdsUserUSER_NAME: TWideStringField;
    cdsDrugOPER_NAME: TWideStringField;
    cdsProduce: TFDMemTable;
    cdsProduceCOMPANY_NAME: TWideStringField;
    cdsDrugPRODUCER_NAME: TWideStringField;
    cdsProduceCOMPANY_CODE: TStringField;
    cxEditStyleControllerTitle: TcxEditStyleController;
    cxEditStyleControllerValue: TcxEditStyleController;
    dsDrug: TDataSource;
    cxGrid1DBTableView1ITEM_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1TRADE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SPECS: TcxGridDBColumn;
    cxGrid1DBTableView1PRODUCER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1ITEM_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1VALID_STATE: TcxGridDBColumn;
    cxGrid1DBTableView1LACK_FLAG: TcxGridDBColumn;
    dsItemType: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FModeInfo: String;
    procedure GetDictionary();
    procedure GetDrugInfo();
    procedure SaveDrugInfo();
  public
    { Public declarations }
  end;

var
  frmDrugItemMaintain: TfrmDrugItemMaintain;

implementation

{$R *.dfm}

{ TfrmDrugItemMaintain }

procedure TfrmDrugItemMaintain.FormCreate(Sender: TObject);
begin
  inherited;
  FModeInfo := 'DrugItemMaintainForm UserID:' + IntToStr(self.User.OperID);
end;

procedure TfrmDrugItemMaintain.GetDictionary;
var _sFieldList, _sTypeName: string;
    _jo: TJSONObject;
    _data: WideString;
begin
  //cdsItemType
  _sFieldList := 'CODE, NAME';
  _sTypeName := 'ITEMTYPE';
  _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
  _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsItemType);
    self.cdsItemType.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsItemQuality
   _sFieldList := 'CODE, NAME';
  _sTypeName := 'DRUGQUALITY';
  _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
  _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsItemQuality);
    self.cdsItemQuality.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsPackUnit
  _sFieldList := 'CODE, NAME';
  _sTypeName := 'PACKUNIT';
  _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
  _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsPackUnit);
    self.cdsPackUnit.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsMinUnit
  _sFieldList := 'CODE, NAME';
  _sTypeName := 'MINUNIT';
  _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
  _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsMinUnit);
    self.cdsMinUnit.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsDoseUnit
  _sFieldList := 'CODE, NAME';
  _sTypeName := 'DOSEUNIT';
  _data := dmHis.SystemMaintainServer.GetDictionaryValue(FModeInfo, _sFieldList, _sTypeName);
  _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsDoseUnit);
    self.cdsDoseUnit.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsProduce
  _data := dmHis.SystemMaintainServer.DrugItemMaintainFormGetProducer(FModeInfo);
  _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsProduce);
    self.cdsProduce.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsUser
  _data := dmHis.SystemMaintainServer.GetOperatorBase(FModeInfo);
  _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsUser);
    self.cdsUser.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);

  //cdsOrder
  _data := dmHis.SystemMaintainServer.DrugItemMaintainFormGetOrderList(FModeInfo);
  _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
  if (_jo.GetValue('Code').Value = '1') then
  begin
    TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsOrder);
    self.cdsOrder.Delta.DataView.Clear();
  end
  else
    showmessage(_jo.GetValue('Message').Value);
end;

procedure TfrmDrugItemMaintain.GetDrugInfo;
var _jo: TJSONObject;
    _data: WideString;
begin
  try
    _data := dmHis.SystemMaintainServer.GetDrugItemInfo(FModeInfo, '');
    if (_jo.GetValue('Code').Value = '1') then
    begin
      //TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrder);
      self.cdsDrug.Open();
      self.cdsDrug.EmptyDataSet() ;
      self.cdsDrug.CancelUpdates();
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsDrug);
      self.cdsDrug.Delta.DataView.Clear();
      self.cdsDrug.CachedUpdates := true;
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _jo.Free();
  end;
end;

procedure TfrmDrugItemMaintain.SaveDrugInfo;
var _sSQL, _sNoField: string;
    AJSON: TJSONObject;
begin
  try
    _sNoField := '';
    _sSQL := TDSCJSONTools.FDMemtableToSQLJSON(self.cdsDrug,
       'COM_ITEM','ITEM_CODE', _sNoField);
    AJSON := TJSONObject.ParseJSONValue(dmHis.SystemMaintainServer.ExecuteSQLSet(FModeInfo, _sSQL)) as TJSONObject;
    if AJSON.GetValue('Code').Value = '1' then
    begin
      showmessage('���ݱ���ɹ���');
      self.GetDrugInfo();
    end
    else
    begin
      showmessage(AJSON.GetValue('Message').Value);
    end;
  finally
    AJSON.Free();
  end;
end;
end.