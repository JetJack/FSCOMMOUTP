unit OrderRelateInsuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxGroupBox, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DSCJSON, HISServerMethods, System.JSON,
  cxTextEdit;

type
  TfrmOrderRelateInsu = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cdsOrder: TFDMemTable;
    cdsOrderORDER_CODE: TStringField;
    cdsOrderORDER_NAME: TWideStringField;
    cdsOrderSPECS: TStringField;
    cdsOrderCLASS_CODE: TStringField;
    cdsOrderFEE_CODE: TStringField;
    cdsOrderSPELL_CODE: TStringField;
    cdsOrderWB_CODE: TStringField;
    cdsOrderINPUT_CDOE: TStringField;
    cdsOrderGB_CODE: TStringField;
    cdsOrderINTERNATIONAL_CODE: TStringField;
    cdsOrderALIAS_NAME: TWideStringField;
    cdsOrderALIAS_SPELL: TStringField;
    cdsOrderALIAS_WB: TStringField;
    cdsOrderENGLISH_NAME: TStringField;
    cdsOrderENGLISH_ALIAS: TStringField;
    cdsOrderORDER_UNIT: TWideStringField;
    cdsOrderORDER_PRICE: TBCDField;
    cdsOrderORDER_PRICE2: TBCDField;
    cdsOrderORDER_PRICE3: TBCDField;
    cdsOrderORDER_PRICE4: TBCDField;
    cdsOrderORDER_PRICE5: TBCDField;
    cdsOrderEXEDEPT_CODE: TStringField;
    cdsOrderVALID_STATE: TStringField;
    cdsOrderAPPLY_STATE: TStringField;
    cdsOrderITEM_FLAG: TStringField;
    cdsOrderCOMB_FLAG: TStringField;
    cdsOrderSPECIAL_FLAG1: TStringField;
    cdsOrderSPECIAL_FLAG2: TStringField;
    cdsOrderSPECIAL_FLAG3: TStringField;
    cdsOrderSPECIAL_FLAG4: TStringField;
    cdsOrderSPECIAL_FLAG5: TStringField;
    cdsOrderOPER_ID: TIntegerField;
    cdsOrderOPER_TIME: TSQLTimeStampField;
    cdsOrderINV_NAME: TStringField;
    cdsInvFee: TFDMemTable;
    cdsInvFeeFEE_CODE: TStringField;
    cdsInvFeeINV_CODE: TStringField;
    cdsInvFeeINV_NAME: TWideStringField;
    cdsInsuItem: TFDMemTable;
    cdsInsuItemFIN_TYPE: TWideStringField;
    cdsInsuItemINSU_ITEM_CODE: TStringField;
    cdsInsuItemINSU_ITEM_NAME: TWideStringField;
    cdsInsuItemINSU_ITEM_CONTENT: TWideMemoField;
    cdsInsuItemPRICE_UNIT: TWideStringField;
    cdsInsuItemITEM_PRICE: TFMTBCDField;
    cdsInsuItemBASE_MED_TYPE: TWideStringField;
    dsInsuItem: TDataSource;
    dsOrder: TDataSource;
    dsOrderInsu: TDataSource;
    cxGroupBox5: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ORDER_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1ORDER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SPECS: TcxGridDBColumn;
    cxGrid1DBTableView1GB_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1ORDER_UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1ORDER_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1ORDER_PRICE2: TcxGridDBColumn;
    cxGrid1DBTableView1VALID_STATE: TcxGridDBColumn;
    cxGrid1DBTableView1INV_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1FIN_TYPE: TcxGridDBColumn;
    cxGrid2DBTableView1INSU_ITEM_CODE: TcxGridDBColumn;
    cxGrid2DBTableView1INSU_ITEM_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1INSU_ITEM_CONTENT: TcxGridDBColumn;
    cxGrid2DBTableView1PRICE_UNIT: TcxGridDBColumn;
    cxGrid2DBTableView1ITEM_PRICE: TcxGridDBColumn;
    cxGrid2DBTableView1BASE_MED_TYPE: TcxGridDBColumn;
    cdsInsuItemINSU_DOSAGE_FORM: TWideStringField;
    cxGrid2DBTableView1INSU_DOSAGE_FORM: TcxGridDBColumn;
    cdsOrderInsu: TFDMemTable;
    cdsOrderInsuFIN_TYPE: TWideStringField;
    cdsOrderInsuINSU_ITEM_CODE: TStringField;
    cdsOrderInsuINSU_ITEM_NAME: TWideStringField;
    cdsOrderInsuINSU_DOSAGE_FORM: TWideStringField;
    cdsOrderInsuORDER_CODE: TStringField;
    cdsOrderInsuORDER_NAME: TWideStringField;
    cdsOrderInsuSPECS: TStringField;
    cdsOrderInsuORDER_UNIT: TWideStringField;
    cdsOrderInsuORDER_PRICE2: TBCDField;
    cdsOrderInsuBASE_MED_TYPE: TWideStringField;
    cdsOrderInsuBASE_MED_RATE: TFMTBCDField;
    cdsOrderInsuCOM_OUTP_RATE: TFMTBCDField;
    cdsOrderInsuVALID_STATE: TStringField;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1FIN_TYPE: TcxGridDBColumn;
    cxGrid3DBTableView1INSU_ITEM_CODE: TcxGridDBColumn;
    cxGrid3DBTableView1INSU_ITEM_NAME: TcxGridDBColumn;
    cxGrid3DBTableView1INSU_DOSAGE_FORM: TcxGridDBColumn;
    cxGrid3DBTableView1ORDER_CODE: TcxGridDBColumn;
    cxGrid3DBTableView1ORDER_NAME: TcxGridDBColumn;
    cxGrid3DBTableView1SPECS: TcxGridDBColumn;
    cxGrid3DBTableView1ORDER_UNIT: TcxGridDBColumn;
    cxGrid3DBTableView1ORDER_PRICE2: TcxGridDBColumn;
    cxGrid3DBTableView1BASE_MED_TYPE: TcxGridDBColumn;
    cxGrid3DBTableView1BASE_MED_RATE: TcxGridDBColumn;
    cxGrid3DBTableView1COM_OUTP_RATE: TcxGridDBColumn;
    cxGrid3DBTableView1VALID_STATE: TcxGridDBColumn;
    editOrder: TcxTextEdit;
    editInsu: TcxTextEdit;
    procedure editOrderPropertiesChange(Sender: TObject);
    procedure editInsuPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FModeInfo: String;
    procedure GetDictionary();
  public
    { Public declarations }
  end;

var
  frmOrderRelateInsu: TfrmOrderRelateInsu;

implementation

{$R *.dfm}

{ TfrmOrderRelateInsu }

procedure TfrmOrderRelateInsu.editInsuPropertiesChange(Sender: TObject);
var _data: WideString;
    _jo: TJSONObject;
begin
  try
    inherited;
    _data := dmHis.SystemMaintainServer.OrderRelateInsuFormGetInsuItem(FMOdeInfo, self.editInsu.Text);
    _jo := TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value , self.cdsInsuItem);
      self.cdsInsuItem.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _jo.Free();
  end;
end;

procedure TfrmOrderRelateInsu.editOrderPropertiesChange(Sender: TObject);
var _sFilter: String;
begin
  inherited;
  if (self.editOrder.Text = '') then
  begin
    self.cdsOrder.Filtered := false;
    self.cdsOrder.Filter := '';
  end
  else
  begin
    self.cdsOrder.Filtered := false;
    _sFilter := 'ORDER_CODE LIKE ' +  quotedStr('%' + self.editOrder.Text + '%')
     + ' OR ORDER_NAME LIKE ' + quotedStr('%' + self.editOrder.Text + '%')
     + ' OR SPELL_CODE LIKE ' + quotedStr('%' + self.editOrder.Text + '%')
     + ' OR WB_CODE LIKE ' + quotedStr('%' + self.editOrder.Text + '%');
    self.cdsOrder.Filter := _sFilter;
   self.cdsOrder.Filtered := true;
  end;
end;

procedure TfrmOrderRelateInsu.GetDictionary;
var _sFieldList, _sTypeName: string;
    _jo: TJSONObject;
    _data: WideString;
begin
  //cdsInvFee
  try
    _data := dmHis.SystemMaintainServer.GetMINFeeToInvFee(FModeInfo);
    _jo :=  TJSONObject.ParseJSONValue(_data) as TJSONObject;
    if (_jo.GetValue('Code').Value = '1') then
    begin
      TDSCJSONTools.JSONToDataSet(_jo.GetValue('DataSet').Value, self.cdsInvFee);
      self.cdsInvFee.Delta.DataView.Clear();
    end
    else
      showmessage(_jo.GetValue('Message').Value);
  finally
    _jo.Free();
  end;
end;

end.
