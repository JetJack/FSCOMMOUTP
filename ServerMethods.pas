unit ServerMethods;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs, DACDataAccessor, DBProvider, DSCJSON,
  Generics.Collections, FireDAC.Comp.Client, System.JSON, qLog;

type
  TBaseServerMethods = class(TDataModule)
  private
    { Private declarations }
  protected
    DAO: TDataAccessor;//
    {
    //function GetSQLString(Key: String):String;virtual;abstract;
    //procedure LoadASQLLibrary(ModuleInfo, ModuleName, Classname: String);virtual;abstract;
    //procedure LoadSQLLibrarys();virtual;abstract;
    }
    /// <summary>����һ��SQL���</summary>
    /// <param name="ModeInfo">��Ҫ����SQL����ģ����Ϣ</param>
    /// <param name="SQLSet">Ҫ���е�SQL���JSON���飨�ַ�����</param>
    /// <returns>���н��JSON��</returns>
    /// <remarks>
    /// ҵ��ģ����Ҫ��һ�����������ж���SQL���ʱ����
    /// </remarks>
    function ExecuteSQLSet(ModeInfo:String; SQLSet: WideString):WideString;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADB: TdmDBProvider);overload;
    /// <summary>��ȡ�ֵ�ֵ</summary>
    /// <param name="ModeInfo">��Ҫ��ȡ�ֵ�ֵ��ģ����Ϣ</param>
    /// <param name="ASQL">Ҫ��õ��ֶ��б��ַ�����</param>
    /// <param name="TyoeName">�ֵ�ֵ������</param>
    /// <returns>�ֵ�ֵ��¼��JSON��</returns>
    /// <remarks>
    /// ����ʱ��SQL����¼����־�ļ���
    /// </remarks>
    function GetDictionaryValue(ModeInfo, ASQL, TypeName: String):WideString;
    /// <summary>��ȡ��¼��</summary>
    /// <param name="ModeInfo">��Ҫ��ȡ��¼����ģ����Ϣ</param>
    /// <param name="TableName">��ر������б��ַ�����</param>
    /// <param name="WhereStr">��ѯ����</param>
    /// <returns>��¼����������Ϊ-1</returns>
    /// <remarks>
    /// ����ʱ��SQL����¼����־�ļ���
    /// </remarks>
    function GetRecordNum(ModeInfo, TableName, WhereStr: String): Integer;
  end;

var
  BaseServerMethods: TBaseServerMethods;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmBase }

constructor TBaseServerMethods.Create(AOwner: TComponent; ADB: TdmDBProvider);
begin
  inherited Create(AOwner);
  self.DAO := TDataAccessor.Create(AOwner,ADB);
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
/// <summary>����һ��SQL���</summary>
/// <param name="ModeInfo">��Ҫ����SQL����ģ����Ϣ</param>
/// <param name="SQLSet">Ҫ���е�SQL���JSON���飨�ַ�����</param>
/// <returns>���н��JSON��</returns>
/// <remarks>
/// ҵ��ģ����Ҫ��һ�����������ж���SQL���ʱ����
/// </remarks>
var i: Integer;
    _ja: TJSONArray;
    _jp: TJSONPair;
    _jo: TJSONObject;
    _sRunResult, _sSQL, _sErrMessage: WideString;
begin
  try
    try
      //��SQL�����ת����TJSONArray
      _ja := TJSONObject.ParseJSONValue(SQLSet) as TJSONArray;
      //��ʼ����
      self.DAO.StartTrans(ModeInfo);
      // ��������SQL���
      for i := 0 to _ja.Count -1 do
      begin
        _sSQL := TJSONString(_ja.Get(i)).Value;
        self.DAO.ExcSQL(ModeInfo, _sSQL);
      end;
      //�ύ����
      self.DAO.CommitTrans(ModeInfo);
      _jo := TJSONObject.Create();
      _jp := TJSONPair.Create('Code', '1');
      _jo.AddPair(_jp);
      _jp := TJSONPair.Create('Message', 'SQL���ִ�����!');
      _jo.AddPair(_jp);
    except
      on E:Exception do
      begin
        //�ع�����
        self.DAO.RollbackTrans(ModeInfo);
        _sErrMessage := ModeInfo + 'SQL������г���!' + E.Message + '�����ѻع�!'  ;
        //��¼������־
        Postlog(llError, _sErrMessage + #13 + '�����SQL���:' + #13 + _sSQL);
        _jo := TJSONObject.Create();
        _jp := TJSONPair.Create('Code', '-1');
        _jo.AddPair(_jp);
        _jp := TJSONPair.Create('Message', _sErrMessage);
        _jo.AddPair(_jp);
      end;
    end;
  finally
    //�ѽ��TJSONObjectת����ַ���
    _sRunResult := _jo.ToString;
    Result := _sRunResult;
    //�����ͷ�
    _ja.Free();
    _jo.Free();
  end;
end;

function TBaseServerMethods.GetDictionaryValue(ModeInfo, ASQL, TypeName: String): WideString;
/// <summary>��ȡ�ֵ�ֵ</summary>
/// <param name="ModeInfo">��Ҫ��ȡ�ֵ�ֵ��ģ����Ϣ</param>
/// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
/// <param name="TyoeName">�ֵ�ֵ������</param>
/// <returns>�ֵ�ֵ��¼��JSON��</returns>
/// <remarks>
/// ����ʱ��SQL����¼����־�ļ���
/// </remarks>
var sSQL : String;
begin
  try
    sSQL := 'select ' + ASQL + ' from COM_DICTIONARY ' + 'WHERE TYPE = ' + TypeName.QuotedString
      + ' and VALID_STATE = 1 ORDER BY SORT_ID';
    try
      Result := self.DAO.GetAJSONDataSet(ModeInfo, sSQL);
    except
      on E:Exception do
      begin
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '���г���:' + E.Message);
      end;
    end;
  finally

  end;
end;

function TBaseServerMethods.GetRecordNum(ModeInfo, TableName, WhereStr: String): Integer;
/// <summary>��ȡ��¼��</summary>
/// <param name="ModeInfo">��Ҫ��ȡ��¼����ģ����Ϣ</param>
/// <param name="TableName">��ر������б��ַ�����</param>
/// <param name="WhereStr">��ѯ����</param>
/// <returns>��¼����������Ϊ-1</returns>
/// <remarks>
/// ����ʱ��SQL����¼����־�ļ���
/// </remarks>
var tmp: TFDMemTable;
    _sSQL : String;
begin
  try
    try
      _sSQL := 'SELECT COUNT(*) AS RecNum FROM ' + TableName + ' where ' + WHereStr;
      tmp := TFDMemTable.Create(nil);
      self.DAO.GetADataset(ModeInfo, _sSQL, tmp);
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
