unit PatientServerMethods;

interface

uses
  System.SysUtils, System.Classes, ServerMethods, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, System.JSON, System.SyncObjs,
  Generics.Collections, FireDAC.Comp.Client, Qlog, DBProvider;

type
  TPatientServer = class(TBaseServerMethods)
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
  end;

var
  PatientServer: TPatientServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

class procedure TPatientServer.ClassFinalize;
/// <summary>类析构</summary>
/// <remarks>
/// 程序结束时单元文件调用，析构类成员
/// </remarks>
begin
  TPatientServer.ClassInitFlag := false;
  TPatientServer.SQLLibrary.Clear();
  TPatientServer.SQLLibrary.Free();
  TPatientServer.CriticalSection.Free();
end;

class procedure TPatientServer.ClassInitialize;
/// <summary>类初始化</summary>
/// <remarks>
/// 程序装入单元文件是调用，创建类成员，但是未装入SQL库
/// </remarks>
begin
  TPatientServer.SQLLibrary := TDictionary<string, string>.Create();
  TPatientServer.CriticalSection := TCriticalSection.Create();
  TPatientServer.ClassInitFlag := false;
end;

constructor TPatientServer.Create(AOwner: TComponent; ADB: TdmDBProvider);
begin
  inherited ;
end;

procedure TPatientServer.DataModuleCreate(Sender: TObject);
begin
  inherited;
  try
    TPatientServer.CriticalSection.Enter();
    if Not TPatientServer.ClassInitFlag then
    begin
      self.LoadSQLLibrary('HHIS', 'FIN');
      self.LoadSQLLibrary('PatientServerMethods', 'TPatientServer');
      TPatientServer.ClassInitFlag := true;
    end;
  finally
    TPatientServer.CriticalSection.Leave();
  end;
end;

class function TPatientServer.GetSQLString(Key: String): String;
/// <summary>获取SQL语句</summary>
/// <param name="Key">SQL的查找主键</param>
/// <remarks>
///
/// </remarks>
var Value: String ;
begin
  try
    TPatientServer.CriticalSection.Enter();
    if TPatientServer.SQLLibrary.TryGetValue(Key, Value) then
       Result := Value
    else
    begin
      Result := '';
      Postlog(llError, Key+'没有找到SQL语句');
    end;
  finally
    TPatientServer.CriticalSection.Leave();
  end;
end;

procedure TPatientServer.LoadSQLLibrary(ModeName, ClassName: String);
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
            TPatientServer.SQLLibrary.Add(_skey, _svalue);
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
  end;
end;

end.
