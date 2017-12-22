program UnitTest;

uses
  Vcl.Forms,
  frmOrderCodeInfoUnit in 'frmOrderCodeInfoUnit.pas' {frmOrderCodeInfo},
  DBProvider in 'DBProvider.pas' {dmDBProvider: TDataModule},
  DACDataAccessor in 'DACDataAccessor.pas' {DataAccessor: TDataModule},
  DSCJSON in 'DSCJSON.pas',
  SevenZIP in 'SevenZIP.pas',
  facadeServiceProxyUnit in 'facadeServiceProxyUnit.pas',
  FSCOMMOUTPSOAP in 'FSCOMMOUTPSOAP.pas',
  TestCRWForm in 'TestCRWForm.pas' {frmTestCRW},
  TestCOMMOUTPForm in 'TestCOMMOUTPForm.pas' {frmTestCommoutp},
  TestDataModule in 'TestDataModule.pas' {dmTest: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestCommoutp, frmTestCommoutp);
  Application.CreateForm(TdmTest, dmTest);
  Application.Run;
end.
