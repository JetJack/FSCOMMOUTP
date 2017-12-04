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
  TestCRWForm in 'TestCRWForm.pas' {frmTestCRW};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestCRW, frmTestCRW);
  Application.Run;
end.
