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
  cxGrid, cxDBLookupComboBox, cxCheckBox;

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
    cdsClassCode: TFDMemTable;
    cdsFeeCode: TFDMemTable;
    cdsItemType: TFDMemTable;
    cdsItemQuality: TFDMemTable;
    cdsPackUnit: TFDMemTable;
    cdsMinUnit: TFDMemTable;
    cdsDoseUnit: TFDMemTable;
    cdsOrder: TFDMemTable;
    cdsUser: TFDMemTable;
    cdsFeeCodeCODE: TStringField;
    cdsFeeCodeNAME: TWideStringField;
    cdsClassCodeCODE: TStringField;
    cdsClassCodeNAME: TWideStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDrugItemMaintain: TfrmDrugItemMaintain;

implementation

{$R *.dfm}

end.
