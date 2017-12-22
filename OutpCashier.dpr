program OutpCashier;

uses
  Vcl.Forms,
  DACDataAccessor in 'DACDataAccessor.pas' {DataAccessor: TDataModule},
  ServerMethods in 'ServerMethods.pas' {BaseServerMethods: TDataModule},
  DSCJSON in 'DSCJSON.pas',
  BaseForm in 'BaseForm.pas' {frmBase},
  BasePageControlForm in 'BasePageControlForm.pas' {frmBasePageControl},
  FSCOMMOUTPSOAP in 'FSCOMMOUTPSOAP.pas',
  DBProvider in 'DBProvider.pas' {dmDBProvider: TDataModule},
  HISServerMethods in 'HISServerMethods.pas' {dmHIS: TDataModule},
  Privilege in 'Privilege.pas',
  SevenZIP in 'SevenZIP.pas',
  facadeServiceProxyUnit in 'facadeServiceProxyUnit.pas',
  PatientServerMethods in 'PatientServerMethods.pas' {PatientServer: TDataModule},
  PatientInfoInput in 'PatientInfoInput.pas',
  PatientInfoInputForm in 'PatientInfoInputForm.pas' {frmPatientInfoInput},
  TestDataModule in 'TestDataModule.pas' {dmTest: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataAccessor, DataAccessor);
  Application.CreateForm(TBaseServerMethods, BaseServerMethods);
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmBasePageControl, frmBasePageControl);
  Application.CreateForm(TdmDBProvider, dmDBProvider);
  Application.CreateForm(TdmHIS, dmHIS);
  Application.CreateForm(TPatientServer, PatientServer);
  Application.CreateForm(TfrmPatientInfoInput, frmPatientInfoInput);
  Application.CreateForm(TdmTest, dmTest);
  Application.Run;
end.
