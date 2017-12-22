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
  cxGrid, cxDBLookupComboBox, cxCheckBox, System.JSON, HISServerMethods, DSCJSON,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxLabel,
  cxDBEdit, cxDBLabel, Vcl.Menus, Vcl.StdCtrls, cxButtons, Data.FireDACJSONReflect;

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
    cdsDrugPRODUCER_ID: TIntegerField;
    cxLabel1: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dsOrder: TDataSource;
    cdsOrderORDER_UNIT: TWideStringField;
    cdsOrderORDER_PRICE: TBCDField;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    dsProduce: TDataSource;
    dsMinUnit: TDataSource;
    dsDoseUnit: TDataSource;
    dsPackUnit: TDataSource;
    dsItemQuality: TDataSource;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cdsProduceCOMPANY_ID: TIntegerField;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    cxDBLookupComboBox6: TcxDBLookupComboBox;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cdsDrugORDER_NAME: TWideStringField;
    cdsDrugORDER_SPECS: TStringField;
    cdsDrugORDER_UNIT: TWideStringField;
    cdsDrugORDER_PRICE: TBCDField;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxDBLabel5: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel24: TcxLabel;
    editOrderCode: TcxTextEdit;
    cxLabel25: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxButton3: TcxButton;
    cdsOrder2: TFDMemTable;
    StringField1: TStringField;
    WideStringField1: TWideStringField;
    StringField2: TStringField;
    WideStringField2: TWideStringField;
    BCDField1: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editOrderCodePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FModeInfo: String;
    procedure GetDictionary();
    procedure GetDrugInfo();
    procedure RefreshItem();
    procedure RefreshItemWithJson();
    procedure SaveDrugInfo();
    procedure NewItem();
  public
    { Public declarations }
  end;

var
  frmDrugItemMaintain: TfrmDrugItemMaintain;

implementation

{$R *.dfm}

{ TfrmDrugItemMaintain }

procedure TfrmDrugItemMaintain.cxButton1Click(Sender: TObject);
begin
  inherited;
  self.NewItem();
end;

procedure TfrmDrugItemMaintain.cxButton2Click(Sender: TObject);
begin
  inherited;
  self.SaveDrugInfo();
end;

procedure TfrmDrugItemMaintain.cxButton3Click(Sender: TObject);
begin
  inherited;
  self.RefreshItem();
end;

procedure TfrmDrugItemMaintain.editOrderCodePropertiesChange(Sender: TObject);
var _sFilter: String;
begin
  inherited;
  if not (self.editOrderCode.Text = '') then
  begin
    _sFilter := 'ITEM_CODE LIKE  ' + QuotedStr('%' + self.editOrderCode.Text + '%')
      + ' OR TRADE_NAME LIKE ' + QuotedStr('%' + self.editOrderCode.Text + '%')
      + ' OR SPELL_CODE LIKE ' + QuotedStr('%' + self.editOrderCode.Text + '%')
      + ' OR WB_CODE LIKE ' + QuotedStr('%' + self.editOrderCode.Text + '%');
    self.cdsDrug.Filter := _sFilter;
    self.cdsDrug.Filtered := true;
  end
  else
    self.cdsDrug.Filtered := false;
end;

procedure TfrmDrugItemMaintain.FormCreate(Sender: TObject);
begin
  inherited;
  FModeInfo := 'DrugItemMaintainForm UserID:' + IntToStr(self.User.OperID);
  self.GetDictionary();
end;

procedure TfrmDrugItemMaintain.FormShow(Sender: TObject);
begin
  inherited;
  self.GetDrugInfo();
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

  //cdsOrder2
  self.cdsOrder2.Open();
  self.cdsOrder2.CopyDataSet(self.cdsOrder,[coAppend]);
end;

procedure TfrmDrugItemMaintain.GetDrugInfo;
var _jo: TJSONObject;
    //_data: WideString;
    _Data: TFDJSONDataSets;
    _Dataset: TFDDataset;
begin
{
  try
    _data := dmHis.SystemMaintainServer.GetDrugItemInfo(FModeInfo, '');
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
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
  }
  try
   _Data := dmHis.SystemMaintainServer.GetDrugItemInfoWithJSON(FModeInfo, 'COM_ITEM', '');
   if Assigned(_Data) then
   begin
     self.cdsDrug.Close();
     _Dataset := TFDJSONDataSetsReader.GetListValueByName(_Data,'COM_ITEM') ;
     _Dataset.Open();
     self.cdsDrug.AppendData(_Dataset);
     self.cdsDrug.Open();
     self.cdsDrug.CachedUpdates := true;
   end
   else
     Showmessage('查询数据出错，请查看运行日志！');
  finally
    _Data.Free();
  end;
end;

procedure TfrmDrugItemMaintain.NewItem;
begin
  try
    if self.cdsDrug.State in dsEditModes then
      self.cdsDrug.Post();
    self.cdsDrug.Append();
    self.cdsDrugITEM_CODE.AsString := IntToStr(dmHis.SystemMaintainServer.GetNewSeqValue(FModeInfo, 'Seq_DrugItem_ID'));
    self.cdsDrugOPER_ID.AsInteger := self.User.OperID;
    self.cdsDrugOPER_TIME.AsDateTime := now()
  except
    on E:Exception do
    begin
      showmessage(E.Message);
    end;
  end;
end;

procedure TfrmDrugItemMaintain.RefreshItem;
var _jo: TJSONObject;
    _data: WideString;
    _sCode: String;
begin
  try
    _data := dmHis.SystemMaintainServer.GetDrugItemInfo(FModeInfo, '');
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if not self.cdsDrug.IsEmpty then
      _sCode := self.cdsDrugITEM_CODE.AsString ;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      //TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.framFinanceOrder.cdsOrder);
      self.cdsDrug.Open();
      //self.cdsDrug.EmptyDataSet() ;
      //self.cdsDrug.CancelUpdates();
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsDrug);
      self.cdsDrug.Locate('ITEM_CODE', _sCode, []);
      self.cdsDrug.Delta.DataView.Clear();
      self.cdsDrug.CachedUpdates := true;
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _jo.Free();
  end;
end;

procedure TfrmDrugItemMaintain.RefreshItemWithJson;
var RunList: TFDJSONDataSets;
    lDATA: TFDDataset;
    _sCode: String;
begin
  try
   RunList := dmHis.SystemMaintainServer.GetDrugItemInfoWithJSON(FModeInfo, 'COM_ITEM', '');
   if not self.cdsDrug.IsEmpty then
      _sCode := self.cdsDrugITEM_CODE.AsString ;
   if Assigned(RunList) then
   begin
     self.cdsDrug.Close();
     lDATA := TFDJSONDataSetsReader.GetListValueByName(RunList,'COM_ITEM') ;
     ldata.Open();
     self.cdsDrug.AppendData(lData);
     self.cdsDrug.Open();
     self.cdsDrug.Locate('ITEM_CODE', _sCode, []);
     self.cdsDrug.CachedUpdates := true;
   end
   else
     Showmessage('查询数据出错，请查看运行日志！');
  finally
    Runlist.Free();
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
      showmessage('数据保存成功！');
      //self.RefreshItem();
      self.RefreshItemWithJson();
    end
    else
    begin
      showmessage(AJSON.GetValue('Message').Value);
    end;
  finally
    AJSON.Free();
  end;
end;

initialization
  RegisterClass(TfrmDrugItemMaintain);

finalization
  UnRegisterClass(TfrmDrugItemMaintain);
end.
