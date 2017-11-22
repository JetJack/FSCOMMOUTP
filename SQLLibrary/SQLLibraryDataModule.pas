unit SQLLibraryDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.FMTBcd,
  Datasnap.Provider, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Win.TConnect, vcl.dialogs, NativeXml;

type
  TdmSQLLibrary = class(TDataModule)
    System: TSQLConnection;
    qryGen: TSQLQuery;
    dspGen: TDataSetProvider;
    qrySQL: TSQLQuery;
    LocalConnection1: TLocalConnection;
    qryNewSQLID: TSQLQuery;
    dspSQL: TDataSetProvider;
    spNewSequence: TSQLStoredProc;
    deleSQL: TSQLQuery;
    procedure dspSQLBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure ConnectToServer();
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetSQLList(): OLEVariant;
    function GetNewSQLID(): Integer;
    function DeleteSQL(SQLID: Integer):String;
  end;

var
  dmSQLLibrary: TdmSQLLibrary;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmSQLLibrary }

procedure TdmSQLLibrary.ConnectToServer;
var conParam :TNativeXML;
    node :TxmlNode;
    str, str2 : String;
begin
  conParam := TNativeXml.Create(nil);
  conParam.LoadFromFile('ServerConfig.xml');
  self.System.Connected := false;
  node := conparam.Root.FindNode('Database').FindNode('BaseServer') ;
  str := 'HostName=' + node.FindNode('HostName').Value;
  self.System.Params[2] := Str;
  str := 'DataBase=' + node.FindNode('DataBase').Value;
  self.System.Params[3] := Str;
  str := 'User_Name=' + node.FindNode('User_Name').Value;
  self.System.Params[4] := str;
  str := 'Password=' + node.FindNode('Password').Value;
  self.System.Params[5] := str;
  self.System.Connected := true;
  conParam.Free;
end;

procedure TdmSQLLibrary.DataModuleCreate(Sender: TObject);
begin
  self.ConnectToServer();
end;

function TdmSQLLibrary.DeleteSQL(SQLID: Integer): String;
begin
  try
    self.deleSQL.Close;
    self.deleSQL.ParamByName('SQLID').AsInteger := SQLID;
    self.deleSQL.ExecSQL() ;
    Result := '删除SQL语句成功！';
  except
    on E: EXCEPTion do
    begin
      Result := '删除SQL语句失败！' + E.Message;
    end;
  end;
end;

procedure TdmSQLLibrary.dspSQLBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  if UpdateKind = ukInsert then
  begin
    //DeltaDS.FieldByName('SQLID').NewValue
      //:= self.GetNewSQLID();
    DeltaDS.FieldByName('CreateTime').NewValue
      := now();
  end;
  if UpdateKind = ukModify then
  begin
    DeltaDS.FieldByName('CreateTime').NewValue
      := now();
  end;
end;

function TdmSQLLibrary.GetNewSQLID: Integer;
begin
{
  self.spNewSequence.Close;
  self.spNewSequence.ParamByName('@SeqID').AsString := 'SQLID';
  self.spNewSequence.ExecProc();
  Result := self.spNewSequence.ParamByName('@NewSeq').AsInteger ;
  }
  self.qryNewSQLID.Close();
  self.qryNewSQLID.Open();
  Result := self.qryNewSQLID.Fields.Fields[0].AsInteger;
end;

function TdmSQLLibrary.GetSQLList: OLEVariant;
var dataset: TClientDataset;
    query: TSQLQuery;
    sSqlStr: String;
begin
  try
  dataset :=  TClientDataset.Create(nil);
  query := TSQLQuery.Create(nil);
  dataset.FieldDefs.Add('Domain', ftString, 220, true);
  dataset.FieldDefs.Add('ParentField', ftString, 160, true);
  dataset.FieldDefs.Add('SQLName', ftString, 50);
  dataset.FieldDefs.Add('SQLID', ftInteger);
  dataset.FieldDefs.Add('IsValid', ftInteger);
  dataset.CreateDataSet;
  dataset.Open;
  query.SQLConnection := self.System;
  //导入系统模块名节点
  sSqlStr := 'select ModuleName from SQLLibrary';
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(sSqlStr);
  query.Open;
  if not query.IsEmpty then
  begin
    query.First;
    while not query.Eof do
    begin
      dataset.Append;
      dataset.FieldByName('Domain').AsString
        := query.FieldByName('ModuleName').AsString;
      dataset.FieldByName('ParentField').AsString
        := '-1';
      dataset.FieldByName('SQLName').AsString
        := query.FieldByName('ModuleName').AsString;
      dataset.FieldByName('SQLID').AsInteger := 0;
      dataset.FieldByName('IsValid').AsInteger := 1;
      dataset.Post;
      query.Next;
    end;
  end;
  //导入类名节点
  sSqlStr := 'select ModuleName, ClassName from SQLLibrary';
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(sSqlStr);
  query.Open;
  if not query.IsEmpty then
  begin
    query.First;
    while not query.Eof do
    begin
      dataset.Append;
      dataset.FieldByName('Domain').AsString
        := query.FieldByName('ModuleName').AsString + '.'
         + query.FieldByName('ClassName').AsString;
      dataset.FieldByName('ParentField').AsString
        := query.FieldByName('ModuleName').AsString;
      dataset.FieldByName('SQLName').AsString
        := query.FieldByName('ClassName').AsString;
      dataset.FieldByName('SQLID').AsInteger := 0;
      dataset.FieldByName('IsValid').AsInteger := 1;
      dataset.Post;
      query.Next;
    end;
  end;
  //导入类成员函数名
  //sSqlStr := 'select ModuleName, ClassName, ProcedureName, SQLName, IsValid, SQLID  from SQLLibrary';
  sSqlStr := 'select ModuleName, ClassName, ProcedureName from SQLLibrary';
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(sSqlStr);
  query.Open;
  if not query.IsEmpty then
  begin
    query.First;
    while not query.Eof do
    begin
      dataset.Append;
      dataset.FieldByName('Domain').AsString
        := query.FieldByName('ModuleName').AsString + '.'
         + query.FieldByName('ClassName').AsString  + '.'
         + query.FieldByName('ProcedureName').AsString;
      dataset.FieldByName('ParentField').AsString
        := query.FieldByName('ModuleName').AsString + '.'
         + query.FieldByName('ClassName').AsString ;
      dataset.FieldByName('SQLName').AsString
        := query.FieldByName('ProcedureName').AsString;
      dataset.FieldByName('SQLID').AsInteger
        := 0;
      dataset.FieldByName('IsValid').AsInteger
        := 1;
      dataset.Post;
      query.Next;
    end;
  end;
  //导入SQL语句名
  //sSqlStr := 'select ModuleName, ClassName, ProcedureName from SQLLibrary';
  sSqlStr := 'select ModuleName, ClassName, ProcedureName, SQLName, IsValid, SQLID  from SQLLibrary';
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(sSqlStr);
  query.Open;
  if not query.IsEmpty then
  begin
    query.First;
    while not query.Eof do
    begin
      dataset.Append;
      dataset.FieldByName('Domain').AsString
         := query.FieldByName('ModuleName').AsString + '.'
         + query.FieldByName('ClassName').AsString  + '.'
         + query.FieldByName('ProcedureName').AsString + '.'
         + query.FieldByName('SQLName').AsString + '.'
         + query.FieldByName('SQLID').AsString;
      dataset.FieldByName('ParentField').AsString
        := query.FieldByName('ModuleName').AsString + '.'
         + query.FieldByName('ClassName').AsString  + '.'
         + query.FieldByName('ProcedureName').AsString ;
      dataset.FieldByName('SQLName').AsString
        := query.FieldByName('SQLName').AsString;
      dataset.FieldByName('SQLID').AsInteger
        := query.FieldByName('SQLID').AsInteger;
      dataset.FieldByName('IsValid').AsInteger
        := query.FieldByName('IsValid').AsInteger;
      dataset.Post;
      query.Next;
    end;
  end;
  Result := dataset.Data;
  finally
    dataset.Free;
    query.Free;
  end;

end;

end.
