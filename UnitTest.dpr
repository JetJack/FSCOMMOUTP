program UnitTest;

uses
  Vcl.Forms,
  frmOrderCodeInfoUnit in 'frmOrderCodeInfoUnit.pas' {frmOrderCodeInfo},
  DBProvider in 'DBProvider.pas' {dmDBProvider: TDataModule},
  DACDataAccessor in 'DACDataAccessor.pas' {DataAccessor: TDataModule},
  DSCJSON in 'DSCJSON.pas',
  SevenZIP in 'SevenZIP.pas',
  facadeServiceProxyUnit in 'facadeServiceProxyUnit.pas',
  FSCOMMOUTPSOAP in 'FSCOMMOUTPSOAP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmOrderCodeInfo, frmOrderCodeInfo);
  Application.CreateForm(TdmDBProvider, dmDBProvider);
  Application.CreateForm(TDataAccessor, DataAccessor);
  Application.Run;
end.
