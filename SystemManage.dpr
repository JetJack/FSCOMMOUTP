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
  SystemMaintainServerMethods in 'SystemMaintainServerMethods.pas' {SysMaintainServer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmBasePageControl, frmBasePageControl);
  Application.CreateForm(TDataAccessor, DataAccessor);
  Application.CreateForm(TdmDBProvider, dmDBProvider);
  Application.CreateForm(TBaseServerMethods, BaseServerMethods);
  Application.CreateForm(TSysMaintainServer, SysMaintainServer);
  Application.Run;
end.
