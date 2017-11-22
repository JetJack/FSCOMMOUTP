program SQLLibrary;

uses
  Vcl.Forms,
  frmSQLLibrary in 'frmSQLLibrary.pas' {frmSQL},
  SQLLibraryDataModule in 'SQLLibraryDataModule.pas' {dmSQLLibrary: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TdmSQLLibrary, dmSQLLibrary);
  Application.Run;
end.
