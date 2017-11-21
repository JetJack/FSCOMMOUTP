unit DBProvider;
{
 功能：为系统提供数据库连接，使用FDAC引擎
 创建日期：2017年10月13日
 作者：霍杰
}

interface

uses
  Vcl.Forms,System.SysUtils, System.Classes, QLog, NativeXML, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL;

type
  TdmDBProvider = class(TDataModule)
    FDManager: TFDManager;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetConnection():TFDConnection;
    procedure ReleaseConnection(FDConnection: TFDConnection);
  end;

var
  dmDBProvider: TdmDBProvider;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDBProvider.DataModuleCreate(Sender: TObject);
var aParam: TStrings;
    _sLogPath, _sPool: String;
    _conParam :TNativeXML;
    _node :TxmlNode;
begin
  try
    _sLogPath := ExtractFilePath(Application.ExeName) + 'log\runlog';
    SetDefaultLogFile(_sLogPath,2097152,false,true);
    aParam := TStringList.Create();
    _conParam := TNativeXML.Create(nil);
    _conParam.LoadFromFile('ServerConfig.xml');
    //配置系统数据库连接参数
    _node := _conParam.Root.FindNode('DataBase').FindNode('BaseServer');
    aParam.Add('Server=' + _node.FindNode('HostName').Value);
    aParam.Add('Database=' + _node.FindNode('DataBase').Value);
    aParam.Add('User_Name=' + _node.FindNode('User_Name').Value) ;
    aParam.Add('Password=' + _node.FindNode('Password').Value);
    _sPool := _node.FindNode('Pool').Value ;
    if _sPool = 'true' then
    begin
      aparam.Add('Pooled=True');
      aparam.Add('POOL_MaximumItems=' + _node.FindNode('Pool_Size').Value);
      aparam.Add('POOL_CleanupTimeout=' + _node.FindNode('Pool_CleanupTimeout').Value);
      aparam.Add('POOL_ExpireTimeout=' + _node.FindNode('Pool_ExpireTimeout').Value);
    end
    else
      aparam.Add('Pooled=False');
    self.FDManager.AddConnectionDef('HIS_Pooled', 'MSSQL', aParam);
  finally
    aParam.Free;
    _conParam.Free();
  end;
end;

function TdmDBProvider.GetConnection: TFDConnection;
var aConnection: TFDConnection;
begin
  try
    aConnection := TFDConnection.Create(nil);
    aConnection.ConnectionDefName := 'HIS_Pooled';
    aConnection.Connected := true;
    Result := aConnection;
  except

  end;
end;

procedure TdmDBProvider.ReleaseConnection(FDConnection: TFDConnection);
begin
  FDConnection.Connected := false;
  FDConnection.Free();
end;

end.
