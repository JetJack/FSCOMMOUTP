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
  cxRadioGroup;

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
    cxTextEdit1: TcxTextEdit;
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
    cdsOrderALIAS_WB: TVarBytesField;
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
    dsOrder: TDataSource;
    cdsMINFEE: TFDMemTable;
    cdsMINFEECODE: TStringField;
    cdsMINFEENAME: TStringField;
    cdsOrderFEE_NAME: TStringField;
    cdsInvFee: TFDMemTable;
    cdsInvFeeCODE: TStringField;
    cdsInvFeeINV_NAME: TStringField;
    cdsOrderINV_NAME: TStringField;
    cdsClassCode: TFDMemTable;
    cdsClassCodeCODE: TStringField;
    cdsClassCodeNAME: TStringField;
    cdsOrderCLASS_NAME: TStringField;
    cdsApply: TFDMemTable;
    cdsApplyCODE: TStringField;
    cdsApplyNAME: TStringField;
    cdsOrderAPPLY_AREA: TStringField;
    cdsValid: TFDMemTable;
    cdsValidCODE: TStringField;
    cdsValidNAME: TStringField;
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
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel6: TcxLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxLabel7: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cdsMinUnit: TFDMemTable;
    cdsMinUnitCODE: TStringField;
    cdsMinUnitNAME: TStringField;
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
    cdsDeptDEPT_NAME: TStringField;
    dsDept: TDataSource;
    cxLabel10: TcxLabel;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    dsGDService: TDataSource;
    cdsGDService: TFDMemTable;
    cdsGDServiceITEM_CODE: TStringField;
    cdsGDServiceITEM_NAME: TStringField;
    cdsGDServicePRICE_UNIT: TStringField;
    cdsGDServicePRICE: TBCDField;
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
    cdsOrderItemTRADE_NAME: TWideStringField;
    cdsOrderItemSPECS: TStringField;
    cdsOrderItemGB_CODE: TStringField;
    cdsOrderItemPRODUCER: TWideStringField;
    cdsOrderItemLACK_NAME: TWideStringField;
    cdsOrderItemVALID_NAME: TWideStringField;
    cdsOrderItemVALID_STATE: TStringField;
    cxDBTreeListOrderItem: TcxDBTreeList;
    cxDBTreeListOrderItemTRADE_NAME: TcxDBTreeListColumn;
    cxDBTreeListOrderItemSPECS: TcxDBTreeListColumn;
    cxDBTreeListOrderItemGB_CODE: TcxDBTreeListColumn;
    cxDBTreeListOrderItemPRODUCER: TcxDBTreeListColumn;
    cxDBTreeListOrderItemLACK_NAME: TcxDBTreeListColumn;
    cxDBTreeListOrderItemVALID_NAME: TcxDBTreeListColumn;
    cxGroupBox5: TcxGroupBox;
    cdsOrderInsu: TFDMemTable;
    cdsOrderInsuINSU_INTERFACE: TStringField;
    cdsOrderInsuINSU_ITEM_NAME: TWideStringField;
    cdsOrderInsuINSU_ITEM_CODE: TStringField;
    cdsOrderInsuBASE_MED_TYPE: TWideStringField;
    cdsOrderInsuBASE_MED_RATE: TBCDField;
    cdsOrderInsuCOM_OUTP_RATE: TBCDField;
    cxDBTreeListOrderInsu: TcxDBTreeList;
    cxDBTreeListOrderInsuINSU_INTERFACE: TcxDBTreeListColumn;
    cxDBTreeListOrderInsuINSU_ITEM_NAME: TcxDBTreeListColumn;
    cxDBTreeListOrderInsuINSU_ITEM_CODE: TcxDBTreeListColumn;
    cxDBTreeListOrderInsuBASE_MED_TYPE: TcxDBTreeListColumn;
    cxDBTreeListOrderInsuBASE_MED_RATE: TcxDBTreeListColumn;
    cxDBTreeListOrderInsuCOM_OUTP_RATE: TcxDBTreeListColumn;
    cdsOrderItemPRICE: TBCDField;
    cxDBTreeListOrderItemPRICE: TcxDBTreeListColumn;
    cdsOperatorSALARY_ID: TIntegerField;
    cdsOperatorEMPL_NAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
