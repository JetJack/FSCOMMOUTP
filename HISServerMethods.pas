unit HISServerMethods;

interface

uses
  System.SysUtils, System.Classes, DBProvider, SystemMaintainServerMethods;

type
  TdmHIS = class(TDataModule)
  private
    { Private declarations }
    FDBProvider:TdmDBProvider;
    FSystemMaintianServer: TSysMaintainServer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);Override;
    property SystemMaintainServer: TSysMaintainServer read FSystemMaintianServer write FSystemMaintianServer ;
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
end;

end.
