unit HISServerMethods;

interface

uses
  System.SysUtils, System.Classes, DBProvider, SystemMaintainServerMethods,
  PatientServerMethods;

type
  TdmHIS = class(TDataModule)
  private
    { Private declarations }
    FDBProvider:TdmDBProvider;
    FSystemMaintianServer: TSysMaintainServer;
    FPatientServer: TPatientServer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);Override;
    property SystemMaintainServer: TSysMaintainServer read FSystemMaintianServer write FSystemMaintianServer ;
    property PatientServer: TPatientServer read FPatientServer write FPatientServer;
  end;

var
  dmHIS: TdmHIS;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmHIS }

constructor TdmHIS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  self.FDBProvider := TdmDBProvider.Create(self);
  self.SystemMaintainServer := TSysMaintainServer.Create(nil, self.FDBProvider);
  self.PatientServer := TPatientServer.Create(nil, self.FDBProvider);
end;

end.
