unit FinanceOrderMaintainFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxInplaceContainer,
  cxTLData, cxDBTL, cxEditRepositoryItems, cxTextEdit, cxClasses, cxLabel,
  cxGroupBox, Vcl.ExtCtrls, TestDataModule, cxMaskEdit, cxDBLookupComboBox,
  cxDBEdit, cxDBLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxCheckBox,
  cxRadioGroup, dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid;

type
  TframFinanceOrderMaintain = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxEditStyleControllerTitle: TcxEditStyleController;
    editOrderCode: TcxTextEdit;
    cxEditStyleControllerValue: TcxEditStyleController;
    cxEditRepository1: TcxEditRepository;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxEditRepository1TextItemLocate: TcxEditRepositoryTextItem;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxDBTreeListOrder: TcxDBTreeList;
    cdsOrder: TFDMemTable;
    cdsOrderORDER_CODE: TStringField;
    cdsOrderSPECS: TStringField;
    cdsOrderCLASS_CODE: TStringField;
    cdsOrderFEE_CODE: TStringField;
    cdsOrderSPELL_CODE: TStringField;
    cdsOrderWB_CODE: TStringField;
    cdsOrderINPUT_CDOE: TStringField;
    cdsOrderGB_CODE: TStringField;
    cdsOrderINTERNATIONAL_CODE: TStringField;
    cdsOrderALIAS_SPELL: TStringField;
    cdsOrderENGLISH_NAME: TStringField;
    cdsOrderENGLISH_ALIAS: TStringField;
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
    dsOrder: TDataSource;
    cdsMINFEE: TFDMemTable;
    cdsMINFEECODE: TStringField;
    cdsOrderFEE_NAME: TStringField;
    cdsInvFee: TFDMemTable;
    cdsOrderINV_NAME: TStringField;
    cdsClassCode: TFDMemTable;
    cdsClassCodeCODE: TStringField;
    cdsOrderCLASS_NAME: TStringField;
    cdsApply: TFDMemTable;
    cdsApplyCODE: TStringField;
    cdsOrderAPPLY_AREA: TStringField;
    cdsValid: TFDMemTable;
    cdsValidCODE: TStringField;
    cdsOrderVALID_NAME: TStringField;
    cdsOperator: TFDMemTable;
    cdsOrderOPER_NAME: TStringField;
    cxDBTreeList1ORDER_CODE: TcxDBTreeListColumn;
    cxDBTreeList1ORDER_NAME: TcxDBTreeListColumn;
    cxDBTreeList1SPECS: TcxDBTreeListColumn;
    cxDBTreeList1ORDER_UNIT: TcxDBTreeListColumn;
    cxDBTreeList1ORDER_PRICE: TcxDBTreeListColumn;
    cxDBTreeList1FEE_NAME: TcxDBTreeListColumn;
    cxDBTreeList1INV_NAME: TcxDBTreeListColumn;
    cxDBTreeList1CLASS_NAME: TcxDBTreeListColumn;
    cxDBTreeList1APPLY_AREA: TcxDBTreeListColumn;
    cxDBTreeList1VALID_NAME: TcxDBTreeListColumn;
    cxDBTreeList1OPER_NAME: TcxDBTreeListColumn;
    cxDBTreeList1OPER_TIME: TcxDBTreeListColumn;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLable4: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxLabel7: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cdsMinUnit: TFDMemTable;
    cdsMinUnitCODE: TStringField;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxLabel8: TcxLabel;
    dsClassCode: TDataSource;
    cxLabel9: TcxLabel;
    dsApply: TDataSource;
    dsValid: TDataSource;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    dsMINFEE: TDataSource;
    dsMinUnit: TDataSource;
    cdsDept: TFDMemTable;
    cdsDeptDEPT_CODE: TStringField;
    dsDept: TDataSource;
    cxLabel10: TcxLabel;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    dsGDService: TDataSource;
    cdsGDService: TFDMemTable;
    cdsGDServiceITEM_CODE: TStringField;
    cxLabel13: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Panel6: TPanel;
    Panel7: TPanel;
    dsOrderItem: TDataSource;
    dsOrderInsu: TDataSource;
    cdsOrderItem: TFDMemTable;
    cdsOrderItemSPECS: TStringField;
    cdsOrderItemGB_CODE: TStringField;
    cdsOrderItemVALID_STATE: TStringField;
    cxGroupBox5: TcxGroupBox;
    cdsOrderInsu: TFDMemTable;
    cdsOrderInsuINSU_ITEM_CODE: TStringField;
    cdsOperatorUSER_ID: TIntegerField;
    cdsOrderALIAS_WB: TStringField;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cdsInvFeeFEE_CODE: TStringField;
    cdsInvFeeINV_CODE: TStringField;
    cdsOrderItemLACK_NAME: TStringField;
    cdsOrderItemPRICE: TFMTBCDField;
    cdsOrderInsuBASE_MED_RATE: TFMTBCDField;
    cdsOrderInsuCOM_OUTP_RATE: TFMTBCDField;
    cdsClassCodeNAME: TWideStringField;
    cdsMINFEENAME: TWideStringField;
    cdsInvFeeINV_NAME: TWideStringField;
    cdsApplyNAME: TWideStringField;
    cdsValidNAME: TWideStringField;
    cdsMinUnitNAME: TWideStringField;
    cdsGDServiceITEM_NAME: TWideStringField;
    cdsGDServicePRICE_UNIT: TWideStringField;
    cdsGDServicePRICE: TWideStringField;
    cdsDeptDEPT_NAME: TWideStringField;
    cdsOperatorUSER_NAME: TWideStringField;
    cdsOrderInsuINSU_ITEM_NAME: TWideStringField;
    cdsOrderInsuBASE_MED_TYPE: TWideStringField;
    cdsOrderItemTRADE_NAME: TWideStringField;
    cdsOrderItemVALID_NAME: TWideStringField;
    cdsOrderORDER_NAME: TWideStringField;
    cdsOrderALIAS_NAME: TWideStringField;
    cdsOrderORDER_UNIT: TWideStringField;
    cdsOrderItemPRODUCER: TWideStringField;
    cdsOrderInsuINSU_INTERFACE: TWideStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1TRADE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SPECS: TcxGridDBColumn;
    cxGrid1DBTableView1GB_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1PRODUCER: TcxGridDBColumn;
    cxGrid1DBTableView1LACK_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1VALID_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1INSU_INTERFACE: TcxGridDBColumn;
    cxGrid2DBTableView1INSU_ITEM_CODE: TcxGridDBColumn;
    cxGrid2DBTableView1INSU_ITEM_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1BASE_MED_TYPE: TcxGridDBColumn;
    cxGrid2DBTableView1BASE_MED_RATE: TcxGridDBColumn;
    cxGrid2DBTableView1COM_OUTP_RATE: TcxGridDBColumn;
    procedure editOrderCodePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TframFinanceOrderMaintain.editOrderCodePropertiesChange(
  Sender: TObject);
var _sFilter: String;
begin
   self.cdsOrder.Filtered := false;
   _sFilter := 'ORDER_CODE LIKE ' +  quotedStr('%' + self.editOrderCode.Text + '%')
     + ' OR ORDER_NAME LIKE ' + quotedStr('%' + self.editOrderCode.Text + '%')
     + ' OR SPELL_CODE LIKE ' + quotedStr('%' + self.editOrderCode.Text + '%')
     + ' OR WB_CODE LIKE ' + quotedStr('%' + self.editOrderCode.Text + '%');
   self.cdsOrder.Filter := _sFilter;
   self.cdsOrder.Filtered := true;
end;

end.
