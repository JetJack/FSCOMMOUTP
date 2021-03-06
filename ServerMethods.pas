unit ServerMethods;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs, DACDataAccessor, DBProvider, DSCJSON,
  Generics.Collections, FireDAC.Comp.Client, System.JSON, qLog,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, Data.FireDACJSONReflect;

type
  TBaseServerMethods = class(TDataModule)
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
  private
    { Private declarations }
  protected
    DAO: TDataAccessor;//
    {
    //function GetSQLString(Key: String):String;virtual;abstract;
    //procedure LoadASQLLibrary(ModuleInfo, ModuleName, Classname: String);virtual;abstract;
    //procedure LoadSQLLibrarys();virtual;abstract;
    }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADB: TdmDBProvider);overload;
    /// <summary>运行一组SQL语句</summary>
    /// <param name="ModeInfo">需要运行SQL语句的模块信息</param>
    /// <param name="SQLSet">要运行的SQL语句JSON数组（字符串）</param>
    /// <returns>运行结果JSON串</returns>
    /// <remarks>
    /// 业务模块需要在一次事务中运行多条SQL语句时调用
    /// </remarks>
    function ExecuteSQLSet(ModeInfo:String; SQLSet: WideString):WideString;
    /// <summary>获取字典值</summary>
    /// <param name="ModeInfo">需要获取字典值的模块信息</param>
    /// <param name="ASQL">要获得的字段列表（字符串）</param>
    /// <param name="TyoeName">字典值类型名</param>
    /// <returns>字典值记录集JSON串</returns>
    /// <remarks>
    /// 运行时把SQL语句记录到日志文件中
    /// </remarks>
    function GetDictionaryValue(ModeInfo, ASQL, TypeName: String):WideString;
    /// <summary>获取一个字符串的拼音和五笔首码</summary>
    /// <param name="ModeInfo">运行TFDQuery的模块信息</param>
    /// <param name="AString">需要获得首码的字符串</param>
    /// <returns>拼音和五笔的首码两个首码以"|"分隔<returns>
    /// <remarks>
    /// 获取一个字符串的拼音和五笔首码
    /// </remarks>
    function GetFirstCode(ModeInfo, AString: String): String;
    /// <summary>获取一个序列号的新值</summary>
    /// <param name="ModeInfo">运行TFDQuery的模块信息</param>
    /// <param name="SeqName">序列号名称</param>
    /// <returns>序列号的新值<returns>
    /// <remarks>
    /// 获取一个序列号的新值
    /// </remarks>
    function GetNewSeqValue(ModeInfo: String; SeqName: String): Integer;
    /// <summary>获取记录数</summary>
    /// <param name="ModeInfo">需要获取记录数的模块信息</param>
    /// <param name="TableName">相关表名称列表（字符串）</param>
    /// <param name="WhereStr">查询条件</param>
    /// <returns>记录数，若出错为-1</returns>
    /// <remarks>
    /// 运行时把SQL语句记录到日志文件中
    /// </remarks>
    function GetRecordNum(ModeInfo, TableName, WhereStr: String): Integer;
    /// <summary>使用FDJSON控件更新一组FDMemTable的DElta包</summary>
    /// <param name="ModeInfo">调用的模块信息</param>
    /// <param name="ADeltas">一组Delta包</param>
    /// <returns>是否成功</returns>
    /// <remarks>
    /// 运行时把SQL语句记录到日志文件中
    /// </remarks>
    function ApplyUpdateWithJSON(TableList: String; ADeltas: TFDJSONDeltas):Boolean  ;
  end;

var
  BaseServerMethods: TBaseServerMethods;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmBase }

function TBaseServerMethods.ApplyUpdateWithJSON(TableList: String;
  ADeltas: TFDJSONDeltas): Boolean;
/// <summary>使用FDJSON控件更新一组FDMemTable的DElta包</summary>
/// <param name="ModeInfo">调用的模块信息</param>
/// <param name="ADeltas">一组Delta包</param>
/// <returns>是否成功</returns>
/// <remarks>
/// 运行时把SQL语句记录到日志文件中
/// </remarks>
begin
  Result := self.DAO.ApplyUpdateWithJSON(TableList, ADeltas);
end;

constructor TBaseServerMethods.Create(AOwner: TComponent; ADB: TdmDBProvider);
begin
  self.DAO := TDataAccessor.Create(AOwner,ADB);
  inherited create(AOwner);

end;

{
procedure TdmBase.LoadASQLLibrary(ModuleInfo, ModuleName, Classname: String);
var _sSQL: String;
    _tmp: TFDMemtable;
begin
  if Assigned(self.DAO) then
  begin
    try
      _tmp := TFDMemTable.Create(nil);
      _sSQL := 'select ModuleName, ClassName, ProcedureName, SQLName, SQLText, IsValid from SQLLibrary'
        + ' where ModuleName = ' + QuotedStr('RelieInfoServiceUnit')
        + ' and ClassName = ' +  Classname.QuotedString
        + ' and IsValid = 1 order by ClassName, ProcedureName, SQLName';
      self.DAO.GetADataset(ModuleInfo, _sSQL, _tmp);
      if not _tmp.IsEmpty then
      begin
        _tmp.First();
        if not Assigned( then

      end;
    finally
      _tmp.Free();
    end;
  end;
end;
}

function TBaseServerMethods.ExecuteSQLSet(ModeInfo: String; SQLSet: WideString): WideString;
/// <summary>运行一组SQL语句</summary>
/// <param name="ModeInfo">需要运行SQL语句的模块信息</param>
/// <param name="SQLSet">要运行的SQL语句JSON数组（字符串）</param>
/// <returns>运行结果JSON串</returns>
/// <remarks>
/// 业务模块需要在一次事务中运行多条SQL语句时调用
/// </remarks>
var i: Integer;
    _ja: TJSONArray;
    _jp: TJSONPair;
    _jo: TJSONObject;
    _sRunResult, _sSQL, _sErrMessage, _sProcInfo: WideString;
begin
  try
    try
      _sProcInfo := 'call TBaseServerMethods.ExecuteSQLSet ';
      //把SQL语句组转换成TJSONArray
      _ja := TJSONObject.ParseJSONValue(SQLSet) as TJSONArray;
      //开始事务
      self.DAO.StartTrans(ModeInfo + _SProcInfo);
      // 逐条运行SQL语句
      for i := 0 to _ja.Count -1 do
      begin
        _sSQL := TJSONString(_ja.Get(i)).Value;
        self.DAO.ExcSQL(ModeInfo + _SProcInfo, _sSQL);
      end;
      //提交事务
      self.DAO.CommitTrans(ModeInfo + _sProcInfo);
      _jo := TJSONObject.Create();
      _jp := TJSONPair.Create('Code', '1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SQL语句执行完毕!');
      _jo.AddPair(_jp);
    except
      on E:Exception do
      begin
        //回滚事务
        self.DAO.RollbackTrans(ModeInfo + _SProcInfo);
        _sErrMessage := ModeInfo + 'SQL语句运行出错!' + E.Message + '事务已回滚!'  ;
        //记录出错日志
        Postlog(llError, _sErrMessage + #13 + '出错的SQL语句:' + #13 + _sSQL);
        _jo := TJSONObject.Create();
        _jp := TJSONPair.Create('Code', '-1');
        _jo.AddPair(_jp);
        _jp := TJSONPair.Create('Message', _sErrMessage);
        _jo.AddPair(_jp);
      end;
    end;
  finally
    //把结果TJSONObject转变成字符串
    _sRunResult := _jo.ToString;
    Result := _sRunResult;
    //对象释放
    _ja.Free();
    _jo.Free();
  end;
end;

function TBaseServerMethods.GetDictionaryValue(ModeInfo, ASQL, TypeName: String): WideString;
/// <summary>获取字典值</summary>
/// <param name="ModeInfo">需要获取字典值的模块信息</param>
/// <param name="ASQL">要运行的SQL语句（字符串）</param>
/// <param name="TyoeName">字典值类型名</param>
/// <returns>字典值记录集JSON串</returns>
/// <remarks>
/// 运行时把SQL语句记录到日志文件中
/// </remarks>
var sSQL, sProcInfo : String;
begin
  try
    sProcInfo := 'call TBaseServerMethods.GetDictionaryValue';
    sSQL := 'select ' + ASQL + ' from COM_DICTIONARY ' + 'WHERE TYPE = ' + TypeName.QuotedString
      + ' and VALID_STATE = 1 ORDER BY SORT_ID';
    try
      Result := self.DAO.GetAJSONDataSet(ModeInfo + sProcInfo, sSQL);
    except
      on E:Exception do
      begin
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '运行出错:' + E.Message);
      end;
    end;
  finally

  end;
end;

function TBaseServerMethods.GetFirstCode(ModeInfo, AString: String): String;
/// <summary>获取一个字符串的拼音和五笔首码</summary>
/// <param name="ModeInfo">运行TFDQuery的模块信息</param>
/// <param name="AString">需要获得首码的字符串</param>
/// <returns>拼音和五笔的首码两个首码以"|"分隔<returns>
/// <remarks>
/// 获取一个字符串的拼音和五笔首码
/// </remarks>
var _sSQL: String;
    _tmp: TFDMemtable;
begin
  try
    _tmp := TFDMemTable.Create(nil);
    _sSQL := 'SELECT [dbo].FUN_GET_FIRSTCODE(@P1, 0) as CODE1, [dbo].FUN_GET_FIRSTCODE(@P1, 1) AS CODE2';
    _sSQL := StringReplace(_sSQL, '@P1',QuotedStr(AString),[rfReplaceAll,rfIgnoreCase]);
    self.DAO.GetADataset(ModeInfo, _sSQL, _tmp);
    Result := _tmp.Fields.Fields[0].AsString + '|' + _tmp.Fields.Fields[1].AsString;
  finally
    _tmp.Free();
  end;
end;

function TBaseServerMethods.GetNewSeqValue(ModeInfo, SeqName: String): Integer;
/// <summary>获取一个序列号的新值</summary>
/// <param name="ModeInfo">运行TFDQuery的模块信息</param>
/// <param name="SeqName">序列号名称</param>
/// <returns>序列号的新值<returns>
/// <remarks>
/// 获取一个序列号的新值
/// </remarks>
begin
  Result := self.DAO.GetNewSeqValue(ModeInfo, SeqName);
end;

function TBaseServerMethods.GetRecordNum(ModeInfo, TableName, WhereStr: String): Integer;
/// <summary>获取记录数</summary>
/// <param name="ModeInfo">需要获取记录数的模块信息</param>
/// <param name="TableName">相关表名称列表（字符串）</param>
/// <param name="WhereStr">查询条件</param>
/// <returns>记录数，若出错为-1</returns>
/// <remarks>
/// 运行时把SQL语句记录到日志文件中
/// </remarks>
var tmp: TFDMemTable;
    _sSQL, _sProcInfo : String;
begin
  try
    try
      _sSQL := 'SELECT COUNT(*) AS RecNum FROM ' + TableName + ' where ' + WHereStr;
      _sProcInfo := ' call TBaseServerMethods.GetRecordNum';
      tmp := TFDMemTable.Create(nil);
      self.DAO.GetADataset(ModeInfo + _sProcInfo, _sSQL, tmp);
      tmp.Open();
      Result := tmp.FieldByName('RecNum').AsInteger;
    except
      On R:Exception do
      begin
        Result := -1;
      end;
    end;
  finally
    tmp.Free();
  end;
end;

end.
