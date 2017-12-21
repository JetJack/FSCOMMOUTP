unit SystemMaintainServerMethods;

interface

uses
  System.SysUtils, System.Classes, ServerMethods, System.JSON, System.SyncObjs,
  Generics.Collections, FireDAC.Comp.Client, Qlog, DBProvider,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TSysMaintainServer = class(TBaseServerMethods)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    ///类的临界区
    class var CriticalSection: TCriticalSection;  //类的临界区
    ///类初始化标志
    class var ClassInitFlag: Boolean;
    ///类使用的SQL库,供本类的方法使用
    class var SQLLibrary: TDictionary<string, string>; //类使用的SQL库
    /// <summary>为本类的SQL库装载SQL语句</summary>
    /// <remarks>
    /// 类新建实体时调用，如果初始化标志ClassInitFlag为false就运行，true不运行
    /// </remarks>
    procedure LoadSQLLibrary(ModeName, ClassName: String);
  public
    { Public declarations }
    /// <summary>类初始化</summary>
    /// <param name="ModeName">模块名</param>
    /// <param name="ClassName">类名（字符串）</param>
    /// <remarks>
    /// 程序装入单元文件是调用，创建类成员，但是未装入SQL库
    /// </remarks>
    class procedure ClassInitialize();
    /// <summary>类初始化</summary>
    /// <remarks>
    /// 程序结束时单元文件调用，析构类成员
    /// </remarks>
    class procedure ClassFinalize();
    /// <summary>获取SQL语句</summary>
    /// <param name="Key">SQL的查找主键</param>
    /// <remarks>
    /// <returns>SQL语句</returns>
    /// </remarks>
    class function GetSQLString(Key: String): String;
    constructor Create(AOwner: TComponent; ADB: TdmDBProvider);
    /// <summary>获取收费项目信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="OrderCode">收费代码</param>
    /// <returns>收费项目信息</returns>
    /// <remarks>
    /// OrderCode为空时返回所有收费项目信息
    /// </remarks>
    function GetFinanceOrderInfo(ModeInfo,OrderCode:String):WideString;
    /// <summary>获取药品项目信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="ItemCode">收费代码</param>
    /// <returns>药品项目信息</returns>
    /// <remarks>
    /// ItemCode为空时返回所有收费项目信息
    /// </remarks>
    function GetDrugItemInfo(ModeInfo, ItemCode: String): WideString;
    /// <summary>获取收费项目关联的药品/材料信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="OrderCode">收费的代码</param>
    /// <returns>收费项目对应的药品/材料记录集</returns>
    /// <remarks>
    /// OrderCode为空时返回所有收费项目对应的药品/材料记录集
    /// </remarks>
    function GetFinanceOrderRelateItem(ModeInfo,OrderCode:String):WideString;
    /// <summary>获取收费项目关联的社保信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="OrderCode">收费的代码</param>
    /// <param name="InsuInterFace">医保接口名称</param>
    /// <returns>收费项目的社保项目对应情况</returns>
    /// <remarks>
    /// OrderCode为空时返回所有收费项目的社保信息，InsuInterFace为空时返回所有接口信息
    /// </remarks>
    function GetFinanceOrderInsuInfo(ModeInfo, OrderCode, InsuInterFace: String):WideString;
    /// <summary>药品项目维护时获取财务收费项目信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>财务收费项目信息</returns>
    /// <remarks>
    /// 药品项目维护界面使用
    /// </remarks>
    function DrugItemMaintainFormGetOrderList(ModeInfo: String): WideString;
     /// <summary>药品项目维护时获取生产厂家信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>获取生产厂家信息</returns>
    /// <remarks>
    /// 药品项目维护界面使用
    /// </remarks>
    function DrugItemMaintainFormGetProducer(ModeInfo: String): WideString;
    /// <summary>收费社保项目对应窗口获取社保项目信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="QueryStr">模糊查询条件</param>
    /// <returns>社保项目信息</returns>
    /// <remarks>
    /// 收费社保项目对应窗口使用
    /// </remarks>
    function OrderRelateInsuFormGetInsuItem(ModeInfo, QueryStr: String): WideString;
    /// <summary>收费社保项目对应窗口获取收费与社保项目对应信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>收费与社保项目对应信息</returns>
    /// <remarks>
    /// 收费社保项目对应窗口使用
    /// </remarks>
    function OrderRelateInsuFormGetOrdrInsuRelate(ModeInfo: String): WideString;
    /// <summary>收费项目维护时获取广东收费项目信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>广东收费项目信息</returns>
    /// <remarks>
    /// 收费项目维护界面使用
    /// </remarks>
    function OrderMaintianGetGDServiceItem(ModeInfo: String):WideString;
    /// <summary>获取科室基本信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>科室信息</returns>
    /// <remarks>
    /// 获取科室基本信息，科室代码和科室名称
    /// </remarks>
    function GetDepartmentBase(ModeInfo: String):WideString;
    /// <summary>获取操作员基本信息</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>操作员基本信息</returns>
    /// <remarks>
    /// 获取操作员基本信息，操作员ID和操作员名称
    /// </remarks>
    function GetOperatorBase(ModeInfo: String): WideString;
    /// <summary>获取最小费用的发票分类名称</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <returns>最小费用的发票分类名称</returns>
    /// <remarks>
    /// 获取最小费用的发票分类名称
    /// </remarks>
    function GetMINFeeToInvFee(ModeInfo: String): WideString;
    /// <summary>收费代码与社保目录编码进行关联</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="InterfaceName">接口名称</param>
    ///  <param name="OrderCode">收费项目代码</param>
    ///  <param name="InsuCode">社保目录编码</param>
    /// <returns>操作结果TJSONObject串</returns>
    /// <remarks>
    /// 收费代码与社保目录编码进行关联
    /// </remarks>
    function DoOrderInsuRelate(ModeInfo, InterfaceName, OrderCode, InsuCode: String): WideString;
    /// <summary>取消收费代码与社保目录编码的关联</summary>
    /// <param name="ModeInfo">调用模块信息</param>
    /// <param name="InterfaceName">接口名称</param>
    ///  <param name="OrderCode">收费项目代码</param>
    ///  <param name="InsuCode">社保目录编码</param>
    /// <returns>操作结果TJSONObject串</returns>
    /// <remarks>
    /// 取消收费代码与社保目录编码的关联
    /// </remarks>
    function DoDelelteOrderInsuRelate(ModeInfo, InterfaceName, OrderCode, InsuCode: String): WideString;

  end;

var
  SysMaintainServer: TSysMaintainServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSysMaintainServer }

class procedure TSysMaintainServer.ClassFinalize;
/// <summary>类析构</summary>
/// <remarks>
/// 程序结束时单元文件调用，析构类成员
/// </remarks>
begin
  TSysMaintainServer.ClassInitFlag := false;
  TSysMaintainServer.SQLLibrary.Clear();
  TSysMaintainServer.SQLLibrary.Free();
  TSysMaintainServer.CriticalSection.Free();
end;

class procedure TSysMaintainServer.ClassInitialize;
/// <summary>类初始化</summary>
/// <remarks>
/// 程序装入单元文件是调用，创建类成员，但是未装入SQL库
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
      self.LoadSQLLibrary('SystemMaintainServerMethods', 'TSysMaintainServer');
      TSysMaintainServer.ClassInitFlag := true;
    end;
  finally
    TSysMaintainServer.CriticalSection.Leave();
  end;
end;

function TSysMaintainServer.DoDelelteOrderInsuRelate(ModeInfo, InterfaceName,
  OrderCode, InsuCode: String): WideString;
/// <summary>取消收费代码与社保目录编码的关联</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="InterfaceName">接口名称</param>
///  <param name="OrderCode">收费项目代码</param>
///  <param name="InsuCode">社保目录编码</param>
/// <returns>操作结果TJSONObject串</returns>
/// <remarks>
/// 取消收费代码与社保目录编码的关联
/// </remarks>
var _jo: TJSONObject;
    _jp: TJSONPair;
    _sSQL, _sMsg: String;
begin
  try
    _jo := TJSONObject.Create();
    _sSQL := 'DELETE FROM FIN_COM_ORDER_RELATE '
      + ' WHERE INTERFACE_TYPE = ' + QuotedStr(InterFaceName)
      + ' AND ORDER_CODE = ' + QuotedStr(OrderCode)
      + ' AND INSU_ITEM_CODE = ' + QuotedStr(InsuCode);
    self.DAO.StartTrans(ModeInfo);
    try
      self.DAO.ExcSQL(ModeInfo , _sSQL);
      self.DAO.CommitTrans(ModeInfo);
      _jp := TJSONPair.Create('Code', '1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', '删除社保目录关联成功！');
      _jo.AddPair(_jp);
    except
      on E:Exception do
      begin
        self.DAO.RollbackTrans(ModeInfo);
        _sMsg := '删除社保目录关联失败！' + E.Message;
        PostLog(llError, _sMsg + ' SQL: ' + _sSQL);
        _jp := TJSONPair.Create('Code', '-1');
        _jo.AddPair(_jp);
        _jp := TJSONPair.Create('Message', _sMsg);
        _jo.AddPair(_jp);
      end;
    end;
  finally
    _sSQL := _jo.ToString;
    Result := _sSQL;
    _jo.Free();
  end;
end;

function TSysMaintainServer.DoOrderInsuRelate(ModeInfo, InterfaceName,
  OrderCode, InsuCode: String): WideString;
 /// <summary>收费代码与社保目录编码进行关联</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="InterfaceName">接口名称</param>
///  <param name="OrderCode">收费项目代码</param>
///  <param name="InsuCode">社保目录编码</param>
/// <returns>操作结果TJSONObject串</returns>
/// <remarks>
/// 收费代码与社保目录编码进行关联
/// </remarks>
var _jo: TJSONObject;
    _jp: TJSONPair;
    _sSQL, _sMsg: String;
begin
  try
    _jo := TJSONObject.Create();
    if self.GetRecordNum(ModeInfo, 'FIN_COM_ORDER_RELATE',
      'INTERFACE_TYPE = ' + QuotedStr(InterfaceName) + ' AND ORDER_CODE = ' + QuotedStr(OrderCode)) > 0  then
      exit  ;

    _sSQL := 'INSERT INTO FIN_COM_ORDER_RELATE (INTERFACE_TYPE, ORDER_CODE, INSU_ITEM_CODE) '
      + ' VALUES (' + QuotedStr(InterFaceName) + ',' + QuotedStr(OrderCode) + ','
      + QuotedStr(InsuCode) + ')';
    self.DAO.StartTrans(ModeInfo);
    try
      self.DAO.ExcSQL(ModeInfo, _sSQL);
      self.DAO.CommitTrans(ModeInfo);
      _jp := TJSONPair.Create('Code', '1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', '社保目录关联成功！');
      _jo.AddPair(_jp);
    except
      on E: Exception do
      begin
        self.DAO.RollbackTrans(ModeInfo);
        _sMsg := '社保目录关联失败！' + E.Message;
        PostLog(llError, _sMsg + ' SQL: ' + _sSQL);
        _jp := TJSONPair.Create('Code', '-1');
        _jo.AddPair(_jp);
        _jp := TJSONPair.Create('Message', _sMsg);
        _jo.AddPair(_jp);
      end;
    end;
  finally
    _sSQL := _jo.ToString;
    Result := _sSQL;
    _jo.Free();
  end;
end;

function TSysMaintainServer.DrugItemMaintainFormGetOrderList(
  ModeInfo: String): WideString;
/// <summary>药品项目维护时获取财务收费项目信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>财务收费项目信息</returns>
/// <remarks>
/// 药品项目维护界面使用
/// </remarks>
var _sSQL: String;
begin
  try
    _sSQL := 'SELECT ORDER_CODE, ORDER_NAME, SPECS, ORDER_UNIT, ORDER_PRICE  FROM FIN_COM_ORDER WHERE VALID_STATE = 1 ORDER BY ORDER_CODE ' ;
  finally
    Result := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.OrderMaintianGetGDServiceItem ', _sSQL);
  end;
end;

function TSysMaintainServer.DrugItemMaintainFormGetProducer(
  ModeInfo: String): WideString;
 /// <summary>药品项目维护时获取生产厂家信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>获取生产厂家信息</returns>
/// <remarks>
/// 药品项目维护界面使用
/// </remarks>
var _sSQL: String;
begin
  try
    _sSQL := 'SELECT COMPANY_ID, COMPANY_NAME FROM COM_COMPANY WHERE COMPANY_TYPE = 1 ORDER BY COMPANY_NAME ' ;
  finally
    Result := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.OrderMaintianGetGDServiceItem ', _sSQL);
  end;
end;

function TSysMaintainServer.GetFinanceOrderInfo(ModeInfo,
  OrderCode: String): WideString;
/// <summary>获取收费项目信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="OrderCode">收费代码</param>
/// <remarks>
/// OrderCode为空时返回所有收费项目信息
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
      _jp := TJSONPair.Create('Message', 'HHIS.FIN.COM.FIN_COM_ORDER'+'没有找到SQL语句');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if OrderCode <> '' then
       _sSQL := _sSQL + 'WHERE ORDER_CODE = ' + QuotedStr(OrderCode)
      else
       _sSQL := _sSQL + ' ORDER BY ORDER_CODE' ;
      _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.GetFinanceOrderInfo', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.GetFinanceOrderInsuInfo(ModeInfo, OrderCode,
  InsuInterFace: String): WideString;
/// <summary>获取收费项目关联的社保信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="OrderCode">收费的代码</param>
/// <param name="InsuInterFace">医保接口名称</param>
/// <remarks>
/// OrderCode为空时返回所有收费项目的社保信息，InsuInterFace为空时返回所有接口信息
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
         + 'TSysMaintainServer.GetFinanceOrderInsuInfo.FinanceOrderInsuInfo'+'没有找到SQL语句');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if OrderCode <> '' then
       _sSQL := _sSQL + ' AND A.ORDER_CODE = ' + QuotedStr(OrderCode) ;
      if InsuInterFace <> '' then
        _sSQL := _sSQL + 'AND A.INTERFACE_TYPE = ' + QuotedStr(InsuInterFace) ;
      _sSQL := _sSQL + ' ORDER BY A.ORDER_CODE' ;
      _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.GetFinanceOrderInsuInfo', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.GetFinanceOrderRelateItem(ModeInfo,
  OrderCode: String): WideString;
/// <summary>获取收费项目关联的药品/材料信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="OrderCode">收费的代码</param>
/// <remarks>
/// OrderCode为空时返回所有收费项目的药品/材料信息
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
         + 'TSysMaintainServer.GetFinanceOrderRelateItem.FinanceOrderRelateItem'+'没有找到SQL语句');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if OrderCode <> '' then
       _sSQL := _sSQL + ' WHERE ORDER_CODE = ' + QuotedStr(OrderCode)
      else
       _sSQL := _sSQL + ' ORDER BY ORDER_CODE' ;
      _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.GetFinanceOrderRelateItem', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.GetMINFeeToInvFee(ModeInfo: String): WideString;
/// <summary>获取最小费用的发票分类名称</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>最小费用的发票分类名称</returns>
/// <remarks>
/// 获取最小费用的发票分类名称
/// </remarks>
var _sSQL, _sResult: String;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
  try
    _sSQL := TSysMaintainServer.GetSQLString('SystemMaintainServerMethods.'
       + 'TSysMaintainServer.GetMINFeeToInvFee.NO1');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SystemMaintainServerMethods.'
         + 'TSysMaintainServer.GetMINFeeToInvFee.NO1'+'没有找到SQL语句');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
       _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.GetMINFeeToInvFee', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.GetOperatorBase(ModeInfo: String): WideString;
/// <summary>获取操作员基本信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>操作员基本信息</returns>
/// <remarks>
/// 获取操作员基本信息，操作员ID和操作员名称
/// </remarks>
var _sSQL: String;
begin
  try
    _sSQL := 'SELECT  USER_ID, USER_NAME from COM_USER ORDER BY USER_ID';
  finally
    Result := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.GetOperatorBase ', _sSQL);
  end;
end;

class function TSysMaintainServer.GetSQLString(Key: String): String;
/// <summary>获取SQL语句</summary>
/// <param name="Key">SQL的查找主键</param>
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
      Postlog(llError, Key+'没有找到SQL语句');
    end;
  finally
    TSysMaintainServer.CriticalSection.Leave();
  end;
end;


procedure TSysMaintainServer.LoadSQLLibrary(ModeName, ClassName: String);
/// <summary>类初始化</summary>
/// <param name="ModeName">模块名</param>
/// <param name="ClassName">类名（字符串）</param>
/// <remarks>
/// 程序结束时单元文件调用，析构类成员
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
        //获取SQL语句集
        self.DAO.GetADataset('TSysMaintainServer get SQLLibrary '+ ModeName+'.'+ClassName
          ,_sSQL, _tmp);
          //把SQL语句集装入到TDictionary中
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
          + ' 获取SQL语句时运行出错:' + E.Message);
        end;
      end;
  finally
    _tmp.Free();
    //TSysMaintainServer.CriticalSection.Leave();
  end;
end;

function TSysMaintainServer.GetDepartmentBase(
  ModeInfo: String): WideString;
/// <summary>获取科室基本信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>科室信息</returns>
/// <remarks>
/// 获取科室基本信息，科室代码和科室名称
/// </remarks>
var _sSQL: String;
begin
  try
    _sSQL := 'SELECT DEPT_CODE, DEPT_NAME FROM COM_DEPARTMENT WHERE VALID_STATE = 1 ORDER BY DEPT_CODE';
  finally
    Result := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.OrderMaintainGetDepartment ', _sSQL);
  end;
end;

function TSysMaintainServer.GetDrugItemInfo(ModeInfo,
  ItemCode: String): WideString;
 /// <summary>获取药品项目信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="ItemCode">收费代码</param>
/// <returns>药品项目信息</returns>
/// <remarks>
/// ItemCode为空时返回所有收费项目信息
/// </remarks>
var _sSQL, _sResult: String;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
  try
    _sSQL := TSysMaintainServer.GetSQLString('SystemMaintainServerMethods.TSysMaintainServer.GetComItemInfo.No1');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SystemMaintainServerMethods.TSysMaintainServer.GetComItemInfo.No1'+'没有找到SQL语句');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      if ItemCode <> '' then
       _sSQL := _sSQL + 'WHERE ITEM_CODE = ' + QuotedStr(ItemCode) ;
      _sSQL := _sSQL + ' ORDER BY ITEM_CODE' ;
      _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.GetFinanceOrderInfo', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.OrderMaintianGetGDServiceItem(ModeInfo: String): WideString;
/// <summary>收费项目维护时获取广东收费项目信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>广东收费项目信息</returns>
/// <remarks>
/// 收费项目维护界面使用
/// </remarks>
var _sSQL: String;
begin
  try
    _sSQL := 'SELECT ITEM_CODE, ITEM_NAME, PRICE_UNIT, PRICE FROM COM_GDSERVICE_ITEM WHERE FIN_TYPE <> '
      + QuotedStr('NA') + ' order by ITEM_CODE' ;
  finally
    Result := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.OrderMaintianGetGDServiceItem ', _sSQL);
  end;
end;

function TSysMaintainServer.OrderRelateInsuFormGetInsuItem(ModeInfo,
  QueryStr: String): WideString;
/// <summary>收费社保项目对应窗口获取社保项目信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <param name="QueryStr">模糊查询条件</param>
/// <returns>社保项目信息</returns>
/// <remarks>
/// 收费社保项目对应窗口使用
/// </remarks>
var _sSQL, _sResult: string;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
  try
    _sSQL := TSysMaintainServer.GetSQLString('SystemMaintainServerMethods.TSysMaintainServer.OrderRelateInsuFormGetInsuItem.NO1');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SystemMaintainServerMethods.TSysMaintainServer.OrderRelateInsuFormGetInsuItem.NO1'+'没有找到SQL语句');
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin
      _sSQL := StringReplace(_sSQL, '@P1',QuotedStr(QueryStr),[rfReplaceAll,rfIgnoreCase]);

      _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.OrderRelateInsuFormGetInsuItem', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

function TSysMaintainServer.OrderRelateInsuFormGetOrdrInsuRelate(ModeInfo: String): WideString;
 /// <summary>收费社保项目对应窗口获取收费与社保项目对应信息</summary>
/// <param name="ModeInfo">调用模块信息</param>
/// <returns>收费与社保项目对应信息</returns>
/// <remarks>
/// 收费社保项目对应窗口使用
/// </remarks>
var _sSQL, _sResult: string;
    _jo: TJSONObject;
    _jp:TJSONPair;
begin
    try
    _sSQL := TSysMaintainServer.GetSQLString('SystemMaintainServerMethods.TSysMaintainServer.OrderRelateInsuFormGetOrdrInsuRelate.NO1');
    _jo := TJSONObject.Create();
    if _sSQL = '' then
    begin
      _jp := TJSONPair.Create('Code', '-1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SystemMaintainServerMethods.TSysMaintainServer.OrderRelateInsuFormGetOrdrInsuRelate.No1' + '没有找到SQL语句' );
      _jo.AddPair(_jp);
      _sResult := _Jo.ToString;
    end
    else
    begin

      _sResult := self.DAO.GetAJSONDataSet(ModeInfo + ' call TSysMaintainServer.OrderRelateInsuFormGetOrdrInsuRelate', _sSQL);
    end;
  finally
     Result := _sResult;
    _jo.Free();
  end;
end;

initialization
  TSysMaintainServer.ClassInitialize();

finalization
  TSysMaintainServer.ClassFinalize();

end.
