unit DACDataAccessor;
{
 功能：数据库访问层，为各业务模块提供数据访问服务
 创建日期：2017年10月13日
 作者：霍杰
 TQLogLevel = (llEmergency, llAlert, llFatal, llError, llWarning, llHint,
    llMessage, llDebug);
}

interface

uses
  System.SysUtils, System.Classes, DBProvider, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Pool, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, Data.FireDACJSONReflect,
   QLog, DSCJSON, System.JSON, EncdDecd, System.Variants, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDataAccessor = class(TDataModule)
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDCommand: TFDCommand;
    FDTableAdapter: TFDTableAdapter;
    FDMemTable: TFDMemTable;
    FDTransaction: TFDTransaction;
    FDQuery: TFDQuery;
    conSys: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FDTransactionAfterCommit(Sender: TObject);
    procedure FDTransactionAfterRollback(Sender: TObject);
  private
    { Private declarations }
    FDBProvider: TdmDBProvider;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADBProvider: TdmDBProvider); overLoad;
    function CommitTrans(ModeInfo: String):string;// 提交事务
    function ExcSQL(ModeInfo: String; ASQL: String): String;// 执行SQL语句
    /// <summary>获取TFDMemTable格式的数据集</summary>
    /// <param name="ModeInfo">运行TFDQuery的模块信息</param>
    /// <param name="ASQL">要运行的SQL语句（字符串）</param>
    /// <param name="FDMemTable">接收数据的TFDMemTable（字符串）</param>
    /// <returns>成功还是失败</returns>
    /// <remarks>
    ///
    /// </remarks>
    function GetADataset(ModeInfo: String; ASQL: String; AFDMemTable: TFDMemTable):Boolean;//返回一个数据集
    /// <summary>获取JSON格式的数据集</summary>
    /// <param name="ModeInfo">运行TFDQuery的模块信息</param>
    /// <param name="ASQL">要运行的SQL语句（字符串）</param>
    /// <returns>返回封装成JSON格式的数据集字符串</returns>
    /// <remarks>
    /// 客户端需要运行TDSCJSONTools.JSONToDataSet方法解包为TDataset
    /// </remarks>
    function GetAJSONDataSet(ModeInfo: String; ASQL: String):WideString;
    function GetAJSONDataSets(ModeInfo: String; TableName: String;
      ASQL: String):TFDJSONDataSets;//返回一个JSONDATASets数据集
    /// <summary>获取一个序列号的新值</summary>
    /// <param name="ModeInfo">运行TFDQuery的模块信息</param>
    /// <param name="SeqName">序列号名称</param>
    /// <returns>序列号的新值<returns>
    /// <remarks>
    /// 获取一个序列号的新值
    /// </remarks>
    function GetNewSeqValue(ModeInfo: String; SeqName: String): Integer;
    function GetValue(ModeInfo: String; ASQL: String):variant;// 返回一个值
    /// <summary>为一个TFDQuery对象运行一条SQL语句</summary>
    /// <param name="ModeInfo">运行TFDQuery的模块信息</param>
    /// <param name="ASQL">要运行的SQL语句（字符串）</param>
    /// <param name="AFDQUery">运行SQL的TFDQuery控件</param>
    /// <remarks>
    /// 运行时把SQL语句记录到日志文件中
    /// </remarks>
    procedure QueryASQL(ModeInfo: String; ASQL: String; AFDQUery: TFDQUery);Overload;//
    /// <summary>为一个TFDCommand对象运行一条SQL语句</summary>
    /// <param name="ModeInfo">运行TFDCommand的模块信息</param>
    /// <param name="ASQL">要运行的SQL语句（字符串）</param>
    /// <param name="AFDQUery">运行SQL的TFDCommand控件</param>
    /// <remarks>
    /// 运行时把SQL语句记录到日志文件中
    /// </remarks>
    procedure QueryASQL(ModeInfo: String; ASQL: String; ACommand: TFDCommand);Overload;//
    procedure SetDB(DB: TdmDBProvider);//设定数据库连接提供者
    function StartTrans(ModeInfo: String): String;//开始一个事务
    /// <summary>把一个BLOB对象保存到数据库中</summary>
    /// <param name="ModeInfo">保存BLOB对象的模块信息</param>
    /// <param name="AJSONBlob">封装了BLOB对象的JSON对象</param>
    /// <returns>返回封装了运行结果的JSON格式字符串</returns>
    /// <remarks>
    /// AJSONBlob内包含TableName数据表名FieldName为BLOB字段名KeyName主键值ABLOB为BLOB数据内容
    /// </remarks>
    function SaveBlob(ModeInfo: String; AJSONBlob: WideString): WideString;
    function RollbackTrans(ModeInfo: String):string; // 回滚事务
    /// <summary>使用FDJSON控件更新一组FDMemTable的DElta包</summary>
    /// <param name="ModeInfo">调用的模块信息</param>
    /// <param name="ADeltas">一组Delta包</param>
    /// <returns>是否成功</returns>
    /// <remarks>
    /// 运行时把SQL语句记录到日志文件中
    /// </remarks>
    function ApplyUpdateWithJSON(TableList: String; ADeltas: TFDJSONDeltas):Boolean  ;
    property DB: TdmDBProvider read FDBProvider write FDBProvider;//构造函数
  end;

var
  DataAccessor: TDataAccessor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataAccessor }

function TDataAccessor.ApplyUpdateWithJSON(TableList: String;
  ADeltas: TFDJSONDeltas): Boolean;
/// <summary>使用FDJSON控件更新一组FDMemTable的DElta包</summary>
/// <param name="ModeInfo">调用的模块信息</param>
/// <param name="ADeltas">一组Delta包</param>
/// <returns>是否成功</returns>
/// <remarks>
/// 运行时把SQL语句记录到日志文件中
/// </remarks>
var AUpdator: IFDJSONDeltasApplyUpdates;
    i: Integer;
    ATableList: TStringList;
    qry: TFDQuery;
    TableName: String;
begin
  try
    try
      ATableList := TStringList.Create();
      AUpdator := TFDJSONDeltasApplyUpdates.Create(ADeltas);
      self.conSys := self.DB.GetConnection();
      self.FDCommand.Connection := self.conSys;
      ATableList.Delimiter:='|';
      ATableList.DelimitedText:=TableList;
      for i := 0 to ATableList.Count - 1 do
      begin
        TableName := ATableList.Strings[i];
        if not (TableName = '') then
        begin
          self.FDCommand.Close();
          self.FDCommand.CommandText.Clear();
          self.FDCommand.CommandText.Text := 'select * from ' + TableName + ' where 1 = 2';
          self.FDCommand.Open();
          AUpdator.ApplyUpdates(TableName, self.FDCommand);
        end;
      end;
      Result := true;
    except
      Result := false;
    end;
  finally
    ATableList.Free();
    self.FDCommand.Close();
    self.DB.ReleaseConnection(self.conSys);
  end;
end;

function TDataAccessor.CommitTrans(ModeInfo: String): string;
{
  功能：提交一个事务
  创建日期：2017年10月13日
  作者：霍杰
}
var _sMsg: String;
begin
  try
    try
      if self.FDTransaction.Active  then
      begin
        self.FDTransaction.Commit();
        _sMsg := '事务已提交！';
      end
      else
      begin
        _sMsg := '事务未启动，不需要提交！';
      end;
      Postlog(llMessage, ModeInfo + ' ' + _sMsg);
    except
      on E:Exception do
      begin
        _sMsg := '事务提交失败！' + E.Message;
        Postlog(llError, ModeInfo + ' ' + _sMsg);
      end;
    end;
  finally
    self.DB.ReleaseConnection(self.conSys);
    Result := _sMsg;
  end;
end;

constructor TDataAccessor.Create(AOwner: TComponent; ADBProvider: TdmDBProvider);
begin
  inherited Create(AOwner);
  self.DB := ADBProvider;
end;

function TDataAccessor.ExcSQL(ModeInfo, ASQL: String): String;
{
  功能：在事务中运行一条SQL语句
  创建日期：2017年10月13日
  作者：霍杰
}
begin
  Postlog(llMessage, ModeInfo + 'run SQL: ' + #13 + ASQL);
  self.conSys.ExecSQL(ASQL);
{
  if self.FDTransaction.Active then
  begin
    //事务已开始执行SQL

    self.FDQuery.Close();
    self.FDQuery.SQL.Clear();
    self.FDQuery.SQL.Text := ASQL;

    Postlog(llMessage, ModeInfo + 'run SQL: ' + #13 + ASQL);
    self.conSys.ExecSQL(ASQL);
    //self.FDQuery.ExecSQL();
  end
  else
  begin
    //事务未开始单独执行一个事务
    self.StartTrans(ModeInfo);
    try
      self.conSys.ExecSQL(ASQL);
      self.CommitTrans(ModeInfo);
    except
      on E:Exception do
      begin
        self.RollbackTrans(ModeInfo);
        Postlog(llError, ModeInfo + E.Message);
        Postlog(llError, ModeInfo + ' 事务已回滚');
      end;
    end;

    self.FDTransaction.Connection := self.DB.GetConnection();
    self.FDQuery.Connection := self.FDTransaction.Connection;
    self.FDTransaction.StartTransaction();
    Postlog(llMessage, ModeInfo + ' 事务已开始');
    try
      self.FDQuery.Close();
      self.FDQuery.SQL.Clear();
      self.FDQuery.SQL.Text := ASQL;
      Postlog(llMessage, ModeInfo + 'run SQL: ' + #13 + ASQL);
      self.FDQuery.ExecSQL();
      self.FDTransaction.Commit();
      Postlog(llMessage, ModeInfo + ' 事务已提交');
    except
      on E:Exception do
      begin
        self.FDTransaction.Rollback();
        Postlog(llError, ModeInfo + E.Message);
        Postlog(llError, ModeInfo + ' 事务已回滚');
      end;
    end;
  end;
  }
end;

procedure TDataAccessor.FDTransactionAfterCommit(Sender: TObject);
begin
  //if Assigned(self.conSys) then
    //  if self.conSys.Connected then
      //  self.DB.ReleaseConnection(self.conSys);
  //self.DB.ReleaseConnection(TFDConnection(self.FDTransaction.Connection));
  //self.FDTransaction.Connection := nil;
  //self.FDQuery.Connection := nil;
end;

procedure TDataAccessor.FDTransactionAfterRollback(Sender: TObject);
begin
  {
  if Assigned(self.conSys) then
      if self.conSys.Connected then
        self.DB.ReleaseConnection(self.conSys);  }
  //self.DB.ReleaseConnection(TFDConnection(self.FDTransaction.Connection));
  //self.FDTransaction.Connection := nil;
  //self.FDQuery.Connection := nil;
end;

function TDataAccessor.GetADataset(ModeInfo, ASQL: String; AFDMemTable: TFDMemTable): Boolean;
{
  功能：返回一个数据集
  创建日期：2017年10月13日
  作者：霍杰
}
var aQuery: TFDQuery;
    aConnect: TFDConnection;
begin
  try
    try
      if FDMemTable = nil then
        FDMemTable := TFDMemTable.Create(nil);
      aConnect := self.DB.GetConnection();
      AFDMemTable.DisableControls();
      //获取数据库连接
      aQuery := TFDQuery.Create(nil);
      aQuery.Connection := aConnect;
      aQuery.Close();
      aQuery.SQL.Clear();
      aQuery.SQL.Add(ASQL);
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      aQuery.Open();
      //数据集获取数据
      AFDMemTable.Data := aQuery.Data;
      AFDMemTable.EmptyDataSet();
      AFDMemTable.CopyDataSet(aQuery);
      aQuery.EnableControls();
      Result := true;
    except
      on E:Exception do
      begin
        Result := false;
        aQuery.EmptyDataSet();
        aQuery.EnableControls();
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '运行出错:' + E.Message);
        raise;
      end;
    end;
  finally
    //释放数据库连接
    self.DB.ReleaseConnection(aConnect);
    aQuery.Free();
  end;
end;

function TDataAccessor.GetAJSONDataSet(ModeInfo, ASQL: String): WideString;
/// <summary>获取JSON格式的数据集</summary>
/// <param name="ModeInfo">运行TFDQuery的模块信息</param>
/// <param name="ASQL">要运行的SQL语句（字符串）</param>
/// <returns>返回封装成JSON格式的数据集字符串</returns>
/// <remarks>
/// 客户端需要运行TDSCJSONTools.JSONToDataSet方法解包为TDataset
/// </remarks>
var aConnect: TFDConnection;
    aQuery: TFDQuery;
    aJSON: wideString;
    aJo: TJSONObject;
    aPair: TJSONPair;
begin
  try
    try
      //所用的对象构造
      aConnect := TFDConnection.Create(nil);
      aConnect.ConnectionDefName := 'HIS_Pooled' ;
      aConnect.Connected := true;
      AJSON := '';
      aQuery := TFDQuery.Create(nil);
      aQuery.Connection := aConnect;
      aQuery.Close();
      aQuery.SQL.Clear();
      aQuery.SQL.Text := ASQL;
      //运行信息写日志
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      aQuery.Open();
      //把结果记录集转换成JSON串
      TDSCJSONTools.DataSetToJSON(aQuery,aJSON);
      aJo := TJSONObject.Create();
      aPair := TJSONPair.Create('Code', '1');
      aJo.AddPair(aPair);
      aPair := TJSONPair.Create('Message', '处理成功!');
      aJo.AddPair(aPair);
      aPair := TJSONPair.Create('DataSet', aJSON);
      aJo.AddPair(aPair);
    except
      on E:Exception do
      begin
        aJo := TJSONObject.Create();
        aPair := TJSONPair.Create('Code', '-1');
        aJo.AddPair(aPair);
        aPair := TJSONPair.Create('Message', '处理失败!');
        aJo.AddPair(aPair);
        aPair := TJSONPair.Create('ErrorMessage', E.Message);
        aJo.AddPair(aPair);
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '运行出错:' + E.Message);
        //raise;
      end;
    end;
  finally
    aJSON := aJo.ToString;
    Result := aJSON;
    //所用的对象析构
    aJo.Free();
    aQuery.Free();
    aConnect.Connected := false;
    aConnect.Free();
  end;
end;

function TDataAccessor.GetAJSONDataSets(ModeInfo, TableName, ASQL: String): TFDJSONDataSets;
{
  功能：返回一个TFDJSONDataSets数据集
  创建日期：2017年10月13日
  作者：霍杰
}
var AJSONDatasets: TFDJSONDatasets;
begin
  try
    try
      self.FDCommand.Close();
      self.FDMemTable.Close();
      self.FDCommand.Connection := self.DB.GetConnection();
      self.FDCommand.CommandText.Clear();
      self.FDCommand.CommandText.Text := ASQL;
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      self.FDMemTable.Open();
      self.FDMemTable.FetchAll();
      AJSONDatasets := TFDJSONDataSets.Create();
      TFDJSONDataSetsWriter.ListAdd(AJSONDataSets,Tablename,self.FDMemTable);
      Result := AJSONDataSets;
    except
      on E:Exception do
      begin
        Result := nil;
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '运行出错:' + E.Message);
      end;
    end;
  finally
    self.FDCommand.Close();
    self.DB.ReleaseConnection(TFDConnection(self.FDCommand.Connection));
    self.FDCommand.Connection := nil;
  end;
end;

function TDataAccessor.GetNewSeqValue(ModeInfo, SeqName: String): Integer;
/// <summary>获取一个序列号的新值</summary>
/// <param name="ModeInfo">运行TFDQuery的模块信息</param>
/// <param name="SeqName">序列号名称</param>
/// <returns>序列号的新值<returns>
/// <remarks>
/// 获取一个序列号的新值
/// </remarks>
var AQry: TFDQuery;
    ACon: TFDConnection;
begin
  try
    try
      Acon := self.DB.GetConnection();
      AQry := TFDQuery.Create(nil);
      AQry.Close();
      AQry.SQL.Clear();
      AQry.SQL.Text := 'SELECT next value for  ' + SeqName;
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + AQry.SQL.Text);
      AQry.Open();
      Result := AQry.fields.Fields[0].AsInteger;
    except
      on E: Exception do
      begin
        Result := -1;
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + AQry.SQL.Text + '  ' + #13
          + '运行出错：'  + E.Message);
      end;
    end;
  finally
    Aqry.Free();
    self.DB.ReleaseConnection(ACon);
  end;
end;

function TDataAccessor.GetValue(ModeInfo, ASQL: String): variant;
{
  功能：返回一个值
  创建日期：2017年10月13日
  作者：霍杰
}
var ACon:TFDConnection;
begin
  try
    try
      ACon := self.DB.GetConnection();
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      Result := Acon.ExecSQLScalar(ASQL);
    except
      on E:Exception do
      begin
        Result := '';
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '运行出错:' + E.Message);
      end;
    end;
  finally
    self.DB.ReleaseConnection(ACon);
  end;
end;

procedure TDataAccessor.QueryASQL(ModeInfo, ASQL: String; AFDQUery: TFDQUery);
/// <summary>为一个TFDQuery对象运行一条SQL语句</summary>
/// <param name="ModeInfo">运行TFDQuery的模块信息</param>
/// <param name="ASQL">要运行的SQL语句（字符串）</param>
/// <param name="AFDQUery">运行SQL的TFDQuery控件</param>
/// <remarks>
/// 运行时把SQL语句记录到日志文件中
/// </remarks>
var aConnect: TFDConnection;
begin
  try
    try
      aConnect := self.DB.GetConnection();
      AFDQuery.Connection := aConnect;
      AFDQuery.Close();
      AFDQuery.SQL.Text := ASQL;
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      AFDQuery.Open();
    except
      on E:Exception do
      begin
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '运行出错:' + E.Message);
        raise;
      end;
    end;
  finally
    self.DB.ReleaseConnection(aConnect);
  end;
end;

procedure TDataAccessor.QueryASQL(ModeInfo, ASQL: String; ACommand: TFDCommand);
begin

end;

function TDataAccessor.RollbackTrans(ModeInfo: String): string;
{
  功能：回滚一个事务
  创建日期：2017年10月13日
  作者：霍杰
}
var _sMsg: String;
begin
  try
    try
      Result := _sMsg;
      if self.FDTransaction.Active  then
      begin
        self.FDTransaction.Rollback;
        _sMsg := '事务已回滚！';
      end
      else
      begin
        _sMsg := '事务未启动，不需要回滚！';
      end;
      Postlog(llMessage, ModeInfo + ' ' + _sMsg);

    except
      on E:Exception do
      begin
        _sMsg := '事务回滚失败！' + E.Message;
        Postlog(llError, ModeInfo + _sMsg);
      end;
    end;
  finally
    self.DB.ReleaseConnection(self.conSys);
    Result := _sMsg;
  end;
end;

function TDataAccessor.SaveBlob(ModeInfo: String; AJSONBlob: WideString): WideString;
{
  功能：保存一个BLOB对象
  入参：AJSONBlob内包含TableName数据表名FieldName为BLOB字段名KeyName主键值ABLOB为BLOB数据内容
  出参：
  创建日期：2017年10月13日
  作者：霍杰
}
var MemoryStream: TMemoryStream;
    StringStream: TStringStream;
    AJSON: TJSONObject;
    _sKey, _sTableName, _sFieldName, _sSQL: String;
    AConnect: TFDCOnnection;
    AQuery: TFDQuery;
    _jo: TJSONObject;
    _jp: TJSONPair;
begin
  try
    MemoryStream := TMemoryStream.Create();
    AJSOn := TJSONObject.ParseJSONValue(AJSONBlob) as TJSONObject;
    AConnect := self.DB.GetConnection();
    AQuery := TFDQuery.Create(nil);
    AQuery.Connection := AConnect;
    _jo := TJSONObject.Create();
    if (AJSON.GetValue('ABLOB').Value = '') then
    begin
      _jp := TJSONPair.Create('Code', '0');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', '图片为空！');
      _jo.AddPair(_jp);
      Postlog(llMessage, Modeinfo + '图片为空！！');
    end
    else
    begin
      try
        StringStream := TStringStream.Create(AJSON.GetValue('ABLOB').Value);
        DecodeStream(StringStream, MemoryStream);
        _sTableName := AJSON.GetValue('TableName').Value;
        _sKey := AJSON.GetValue('KeyName').Value;
        _sFieldName := AJSON.GetValue('FieldName').Value;
        _sSQL := 'UPDATE ' + _sTableName + ' SET ' + _sFieldName + '=:BlobStream '
            + ' where ' + _sKey;
        Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + _sSQl);
        AQuery.Close();
        AQuery.SQL.Clear();
        AQuery.SQL.Add(_sSQL);
        AQuery.ParamByName('BlobStream').LoadFromStream(MemoryStream, ftBlob);
        AQuery.ExecSQL();
        Postlog(llMessage, Modeinfo + '保存图片成功！');
        _jp := TJSONPair.Create('Code', '1');
        _jo.AddPair(_jp);
        _jp := TJSONPair.Create('Message', '保存图片成功！');
        _jo.AddPair(_jp);
      except
        on E:Exception do
        begin
          _jp := TJSONPair.Create('Code', '-1');
          _jo.AddPair(_jp);
          _jp := TJSONPair.Create('Message', '保存图片失败！' + E.Message);
          _jo.AddPair(_jp);
          Postlog(llError, Modeinfo + '保存图片失败！' + E.Message);
        end;
      end;
    end;
  finally
    MemoryStream.Free();
    AQuery.Free();
    self.DB.ReleaseConnection(AConnect);
    AConnect.Free();
    Result := _jo.ToString;
  end;
end;

procedure TDataAccessor.SetDB(DB: TdmDBProvider);
begin
  self.DB := DB;
end;

function TDataAccessor.StartTrans(ModeInfo: String): String;
{
  功能：开始一个事务
  创建日期：2017年10月13日
  作者：霍杰
}
var _sMsg: String;
begin
  Result := _sMsg;
  try
    if not self.FDTransaction.Active then
    begin
      //获取一个新连接并启动事务
      self.conSys := self.DB.GetConnection();
      self.FDTransaction.Connection := self.conSys;
      self.FDQuery.Connection := self.conSys;
      self.FDTransaction.StartTransaction();
      _sMsg := '事务已启动！' ;
      Postlog(llMessage, ModeInfo + ' ' +_sMsg);
    end;
  except
    on E:Exception do
    begin
      //释放数据库连接
      db.ReleaseConnection(self.conSys);
      self.FDTransaction.Connection := nil;
      self.FDQuery.Connection := nil;
      _sMsg := '事务启动失败！' + E.Message;
      Postlog(llError, ModeInfo + ' ' +_sMsg);
    end;
  end;
end;

end.
