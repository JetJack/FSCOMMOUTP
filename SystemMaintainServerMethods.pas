unit SystemMaintainServerMethods;

interface

uses
  System.SysUtils, System.Classes, ServerMethods, System.JSON, System.SyncObjs,
  Generics.Collections, FireDAC.Comp.Client, Qlog, DBProvider;

type
  TSysMaintainServer = class(TBaseServerMethods)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    ///����ٽ���
    class var CriticalSection: TCriticalSection;  //����ٽ���
    ///���ʼ����־
    class var ClassInitFlag: Boolean;
    ///��ʹ�õ�SQL��,������ķ���ʹ��
    class var SQLLibrary: TDictionary<string, string>; //��ʹ�õ�SQL��
    /// <summary>Ϊ�����SQL��װ��SQL���</summary>
    /// <remarks>
    /// ���½�ʵ��ʱ���ã������ʼ����־ClassInitFlagΪfalse�����У�true������
    /// </remarks>
    procedure LoadSQLLibrary(ModeName, ClassName: String);
  public
    { Public declarations }
    /// <summary>���ʼ��</summary>
    /// <param name="ModeName">ģ����</param>
    /// <param name="ClassName">�������ַ�����</param>
    /// <remarks>
    /// ����װ�뵥Ԫ�ļ��ǵ��ã��������Ա������δװ��SQL��
    /// </remarks>
    class procedure ClassInitialize();
    /// <summary>���ʼ��</summary>
    /// <remarks>
    /// �������ʱ��Ԫ�ļ����ã��������Ա
    /// </remarks>
    class procedure ClassFinalize();
    /// <summary>��ȡSQL���</summary>
    /// <param name="Key">SQL�Ĳ�������</param>
    /// <remarks>
    ///
    /// </remarks>
    class function GetSQLString(Key: String): String;
    constructor Create(AOwner: TComponent; ADB: TdmDBProvider);
    /// <summary>��ȡ�շ���Ŀ��Ϣ</summary>
    /// <param name="ModeInfo">����ģ����Ϣ</param>
    /// <param name="OrderCode">�շѴ���</param>
    /// <remarks>
    /// OrderCodeΪ��ʱ���������շ���Ŀ��Ϣ
    /// </remarks>
    function GetFinanceOrderInfo(ModeInfo,OrderCode:String):WideString;
    /// <summary>��ȡ�շ���Ŀ������ҩƷ/������Ϣ</summary>
    /// <param name="ModeInfo">����ģ����Ϣ</param>
    /// <param name="OrderCode">�շѵĴ���</param>
    /// <remarks>
    /// OrderCodeΪ��ʱ���������շ���Ŀ��ҩƷ/������Ϣ
    /// </remarks>
    function GetFinanceOrderRelateItem(ModeInfo,OrderCode:String):WideString;
    /// <summary>��ȡ�շ���Ŀ�������籣��Ϣ</summary>
    /// <param name="ModeInfo">����ģ����Ϣ</param>
    /// <param name="OrderCode">�շѵĴ���</param>
    /// <param name="InsuInterFace">ҽ���ӿ�����</param>
    /// <remarks>
    /// OrderCodeΪ��ʱ���������շ���Ŀ���籣��Ϣ��InsuInterFaceΪ��ʱ�������нӿ���Ϣ
    /// </remarks>
    function GetFinanceOrderInsuInfo(ModeInfo, OrderCode, InsuInterFace: String):WideString;
  end;

var
  SysMaintainServer: TSysMaintainServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSysMaintainServer }

class procedure TSysMaintainServer.ClassFinalize;
/// <summary>������</summary>
/// <remarks>
/// �������ʱ��Ԫ�ļ����ã��������Ա
/// </remarks>
begin
  TSysMaintainServer.ClassInitFlag := false;
  TSysMaintainServer.SQLLibrary.Clear();
  TSysMaintainServer.SQLLibrary.Free();
  TSysMaintainServer.CriticalSection.Free();
end;

class procedure TSysMaintainServer.ClassInitialize;
/// <summary>���ʼ��</summary>
/// <remarks>
/// ����װ�뵥Ԫ�ļ��ǵ��ã��������Ա������δװ��SQL��
/// </remarks>
begin
  TSysMaintainServer.SQLLibrary := TDictionary<string, string>.Create();
  TSysMaintainServer.CriticalSection := TCriticalSection.Create();
  TSysMaintainServer.ClassInitFlag := false;
end;

constructor TSysMaintainServer.Create(AOwner: TComponent; ADB: TdmDBProvider);
begin
  inherited ;
  //Create(AOwner, ADB)
end;

procedure TSysMaintainServer.DataModuleCreate(Sender: TObject);
begin
  inherited;
  try
    TSysMaintainServer.CriticalSection.Enter();
    if Not TSysMaintainServer.ClassInitFlag then
    begin
      self.LoadSQLLibrary('HHIS', 'FIN');
      TSysMaintainServer.ClassInitFlag := true;
    end;
  finally
    TSysMaintainServer.CriticalSection.Leave();
  end;
end;

function TSysMaintainServer.GetFinanceOrderInfo(ModeInfo,
  OrderCode: String): WideString;
/// <summary>��ȡ�շ���Ŀ��Ϣ</summary>
/// <param name="ModeInfo">����ģ����Ϣ</param>
/// <param name="OrderCode">�շѴ���</param>
/// <remarks>
/// OrderCodeΪ��ʱ���������շ���Ŀ��Ϣ
/// </remarks>
var _sSQL, _sResult: String;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
  try
    _sSQL := TSysMaintainServer.GetSQLString('HHIS.FIN.COM.FIN_COM_ORDER');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'HHIS.FIN.COM.FIN_COM_ORDER'+'û���ҵ�SQL���');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if OrderCode <> '' then
       _sSQL := _sSQL + 'WHERE ORDERCODE = ' + QuotedStr(OrderCode)
      else
       _sSQL := _sSQL + ' ORDER BY ORDERCODE' ;
      _sResult := self.DAO.GetAJSONDataSet('TSysMaintainServer.GetFinanceOrderInfo', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.GetFinanceOrderInsuInfo(ModeInfo, OrderCode,
  InsuInterFace: String): WideString;
/// <summary>��ȡ�շ���Ŀ�������籣��Ϣ</summary>
/// <param name="ModeInfo">����ģ����Ϣ</param>
/// <param name="OrderCode">�շѵĴ���</param>
/// <param name="InsuInterFace">ҽ���ӿ�����</param>
/// <remarks>
/// OrderCodeΪ��ʱ���������շ���Ŀ���籣��Ϣ��InsuInterFaceΪ��ʱ�������нӿ���Ϣ
/// </remarks>
var _sSQL, _sResult: String;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
  try
    _sSQL := TSysMaintainServer.GetSQLString('SystemMaintainServerMethods.'
       + 'TSysMaintainServer.GetFinanceOrderInsuInfo.FinanceOrderInsuInfo');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SystemMaintainServerMethods.'
         + 'TSysMaintainServer.GetFinanceOrderInsuInfo.FinanceOrderInsuInfo'+'û���ҵ�SQL���');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if OrderCode <> '' then
       _sSQL := _sSQL + 'AND A.ORDERCODE = ' + QuotedStr(OrderCode) ;
      if InsuInterFace <> '' then
        _sSQL := _sSQL + 'AND A.INTERFACE_TYPE = ' + QuotedStr(InsuInterFace) ;
      _sSQL := _sSQL + ' ORDER BY A.ORDERCODE' ;
      _sResult := self.DAO.GetAJSONDataSet('TSysMaintainServer.GetFinanceOrderInsuInfo', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.GetFinanceOrderRelateItem(ModeInfo,
  OrderCode: String): WideString;
/// <summary>��ȡ�շ���Ŀ������ҩƷ/������Ϣ</summary>
/// <param name="ModeInfo">����ģ����Ϣ</param>
/// <param name="OrderCode">�շѵĴ���</param>
/// <remarks>
/// OrderCodeΪ��ʱ���������շ���Ŀ��ҩƷ/������Ϣ
/// </remarks>
var _sSQL, _sResult: String;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
  try
    _sSQL := TSysMaintainServer.GetSQLString('SystemMaintainServerMethods.'
       + 'TSysMaintainServer.GetFinanceOrderRelateItem.FinanceOrderRelateItem');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SystemMaintainServerMethods.'
         + 'TSysMaintainServer.GetFinanceOrderRelateItem.FinanceOrderRelateItem'+'û���ҵ�SQL���');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if OrderCode <> '' then
       _sSQL := _sSQL + 'WHERE ORDERCODE = ' + QuotedStr(OrderCode)
      else
       _sSQL := _sSQL + ' ORDER BY ORDERCODE' ;
      _sResult := self.DAO.GetAJSONDataSet('TSysMaintainServer.GetFinanceOrderRelateItem', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

class function TSysMaintainServer.GetSQLString(Key: String): String;
/// <summary>��ȡSQL���</summary>
/// <param name="Key">SQL�Ĳ�������</param>
/// <remarks>
///
/// </remarks>
var Value: String ;
begin
  try
    TSysMaintainServer.CriticalSection.Enter();
    if TSysMaintainServer.SQLLibrary.TryGetValue(Key, Value) then
       Result := Value
    else
    begin
      Result := '';
      Postlog(llError, Key+'û���ҵ�SQL���');
    end;
  finally
    TSysMaintainServer.CriticalSection.Leave();
  end;
end;


procedure TSysMaintainServer.LoadSQLLibrary(ModeName, ClassName: String);
/// <summary>���ʼ��</summary>
/// <param name="ModeName">ģ����</param>
/// <param name="ClassName">�������ַ�����</param>
/// <remarks>
/// �������ʱ��Ԫ�ļ����ã��������Ա
/// </remarks>
var _sSQL, _sKey, _sValue: String;
    _tmp: TFDMemTable;
begin
  try
    //TSysMaintainServer.CriticalSection.Enter();
    _tmp := TFDMemTable.Create(nil);
    _sSQL := 'select ModuleName, ClassName, ProcedureName, SQLName, SQLText, IsValid from SQLLibrary'
      +  ' where ModuleName = ' + QuotedStr(ModeName)
      + ' and ClassName = ' + QuotedStr(ClassName)
      + ' and IsValid = 1 order by ClassName, ProcedureName, SQLName';
      try
        //��ȡSQL��伯
        self.DAO.GetADataset('TSysMaintainServer get SQLLibrary '+ ModeName+'.'+ClassName
          ,_sSQL, _tmp);
          //��SQL��伯װ�뵽TDictionary��
        if not _tmp.IsEmpty then
        begin
          _tmp.First();
          while not _tmp.Eof do
          begin
            _skey := Trim(_tmp.FieldByName('ModuleName').AsString) + '.'
               + Trim(_tmp.FieldByName('ClassName').AsString) +'.'
               + Trim(_tmp.FieldByName('ProcedureName').AsString) +'.'
               + Trim(_tmp.FieldByName('SQLName').AsString) ;
            _svalue := _tmp.FieldByName('SQLText').AsString ;
            TSysMaintainServer.SQLLibrary.Add(_skey, _svalue);
            _tmp.Next;
          end;
        end;
      except
        on E: Exception do
        begin
          Postlog(llError, 'TSysMaintainServer.' + ModeName + '.' + ClassName
          + ' ��ȡSQL���ʱ���г���:' + E.Message);
        end;
      end;
  finally
    _tmp.Free();
    //TSysMaintainServer.CriticalSection.Leave();
  end;
end;

initialization
  TSysMaintainServer.ClassInitialize();

finalization
  TSysMaintainServer.ClassFinalize();

end.
