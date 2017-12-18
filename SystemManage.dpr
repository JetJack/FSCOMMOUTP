program SystemManage;

uses
  Vcl.Forms,
  Privilege in 'Privilege.pas',
  SevenZIP in 'SevenZIP.pas',
  DSCJSON in 'DSCJSON.pas',
  BaseForm in 'BaseForm.pas' {frmBase},
  BasePageControlForm in 'BasePageControlForm.pas' {frmBasePageControl},
  DACDataAccessor in 'DACDataAccessor.pas' {DataAccessor: TDataModule},
  DBProvider in 'DBProvider.pas' {dmDBProvider: TDataModule},
  ServerMethods in 'ServerMethods.pas' {BaseServerMethods: TDataModule},
  SystemMaintainServerMethods in 'SystemMaintainServerMethods.pas' {SysMaintainServer: TDataModule},
  HISServerMethods in 'HISServerMethods.pas' {dmHIS: TDataModule},
  SystemMaintainMainForm in 'SystemMaintainMainForm.pas' {frmSysMaintainPageControl},
  FinanceOrderMaintainFrame in 'FinanceOrderMaintainFrame.pas' {framFinanceOrderMaintain: TFrame},
  TestDataModule in 'TestDataModule.pas' {dmTest: TDataModule},
  FinanceOrderMaintainForm in 'FinanceOrderMaintainForm.pas' {frmFinanceOrderMaintain},
  DrugItemMaintainForm in 'DrugItemMaintainForm.pas' {frmDrugItemMaintain},
  OrderRelateInsuForm in 'OrderRelateInsuForm.pas' {frmOrderRelateInsu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmHIS, dmHIS);
  Application.CreateForm(TfrmSysMaintainPageControl, frmSysMaintainPageControl);
  Application.CreateForm(TfrmOrderRelateInsu, frmOrderRelateInsu);
  Application.Run;
end.
