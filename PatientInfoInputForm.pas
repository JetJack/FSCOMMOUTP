unit PatientInfoInputForm;

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
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup, cxClasses, Vcl.ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxLabel, TestDataModule, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxDBEdit, cxDBLabel, cxCalc;

type
  TfrmPatientInfoInput = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    cxEditStyleControllerTitle: TcxEditStyleController;
    cxEditStyleControllerValue: TcxEditStyleController;
    cxRadioGroup1: TcxRadioGroup;
    cxGroupBox1: TcxGroupBox;
    cxRadioGroup2: TcxRadioGroup;
    cxGroupBox2: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    cxGroupBox3: TcxGroupBox;
    cdsPatientInfo: TFDMemTable;
    cdsPatientInfoFILE_NO: TStringField;
    cdsPatientInfoMED_REDCORD_NO: TStringField;
    cdsPatientInfoNAME: TWideStringField;
    cdsPatientInfoBIRTHDAY: TSQLTimeStampField;
    cdsPatientInfoSEX_CODE: TStringField;
    cdsPatientInfoIDENNO: TStringField;
    cdsPatientInfoIDCARDTYPE: TStringField;
    cdsPatientInfoBLOOD_CODE: TStringField;
    cdsPatientInfoRH_CODE: TStringField;
    cdsPatientInfoPROF_CODE: TStringField;
    cdsPatientInfoDISTRICT: TWideStringField;
    cdsPatientInfoCOUN_CODE: TStringField;
    cdsPatientInfoNATION_CODE: TStringField;
    cdsPatientInfoMARI: TStringField;
    cdsPatientInfoWORK_ADDRESS: TWideStringField;
    cdsPatientInfoWORK_TEL: TStringField;
    cdsPatientInfoWORK_ZIP: TStringField;
    cdsPatientInfoCURRENT_ADDRESS: TWideStringField;
    cdsPatientInfoHOME_ADDRESS: TWideStringField;
    cdsPatientInfoHOME_TEL: TStringField;
    cdsPatientInfoHOME_ZIP: TStringField;
    cdsPatientInfoRELA_CODE: TStringField;
    cdsPatientInfoLINKMAN_NAME: TWideStringField;
    cdsPatientInfoLINKMAN_TEL: TStringField;
    cdsPatientInfoLINKMAN_ADD: TWideStringField;
    cdsPatientInfoEMAIL: TStringField;
    cdsPatientInfoMONTHER_NAME: TWideStringField;
    cdsPatientInfoVALID_STATE: TStringField;
    cdsPatientInfoOPER_ID: TIntegerField;
    cdsPatientInfoOPER_TIME: TSQLTimeStampField;
    cdsPatientInfoCARD_TYPE: TStringField;
    cdsPatientInfoCARD_NO: TStringField;
    cdsPatientType: TFDMemTable;
    cdsSex: TFDMemTable;
    cdsSexCODE: TStringField;
    cdsSexNAME: TWideStringField;
    cdsSexSORT_ID: TIntegerField;
    cdsPType: TFDMemTable;
    cdsPTypeCODE: TStringField;
    cdsPTypeNAME: TWideStringField;
    cdsPTypeSORT_ID: TIntegerField;
    cdsCardType: TFDMemTable;
    cdsCardTypeCODE: TStringField;
    cdsCardTypeNAME: TWideStringField;
    cdsCardTypeSORT_ID: TIntegerField;
    cdsNation: TFDMemTable;
    cdsNationCODE: TStringField;
    cdsNationNAME: TWideStringField;
    cdsNationSORT_ID: TIntegerField;
    cxLabel2: TcxLabel;
    dsPatientInfo: TDataSource;
    dsPatientType: TDataSource;
    dsPType: TDataSource;
    dsSex: TDataSource;
    dsNation: TDataSource;
    dsCardType: TDataSource;
    cxDBLabel1: TcxDBLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cdsBlood: TFDMemTable;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel14: TcxLabel;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cdsRelate: TFDMemTable;
    cdsRelateCODE: TStringField;
    cdsRelateNAME: TWideStringField;
    cdsRelateSORT_ID: TIntegerField;
    dsBlood: TDataSource;
    dsRelate: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPatientInfoInput: TfrmPatientInfoInput;

implementation

{$R *.dfm}

end.
