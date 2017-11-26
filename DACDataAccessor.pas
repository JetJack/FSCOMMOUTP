unit DACDataAccessor;
{
 ���ܣ����ݿ���ʲ㣬Ϊ��ҵ��ģ���ṩ���ݷ��ʷ���
 �������ڣ�2017��10��13��
 ���ߣ�����
 TQLogLevel = (llEmergency, llAlert, llFatal, llError, llWarning, llHint,
    llMessage, llDebug);
}

interface

uses
  System.SysUtils, System.Classes, DBProvider, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Pool, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, Data.FireDACJSONReflect,
   QLog, DSCJSON, System.JSON, EncdDecd, System.Variants;

type
  TDataAccessor = class(TDataModule)
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDCommand: TFDCommand;
    FDTableAdapter: TFDTableAdapter;
    FDMemTable: TFDMemTable;
    FDTransaction: TFDTransaction;
    FDQuery: TFDQuery;
    procedure FDTransactionAfterCommit(Sender: TObject);
    procedure FDTransactionAfterRollback(Sender: TObject);
  private
    { Private declarations }
    FDBProvider: TdmDBProvider;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADBProvider: TdmDBProvider); overLoad;
    function CommitTrans(ModeInfo: String):string;// �ύ����
    function ExcSQL(ModeInfo: String; ASQL: String): String;// ִ��SQL���
    /// <summary>��ȡTFDMemTable��ʽ�����ݼ�</summary>
    /// <param name="ModeInfo">����TFDQuery��ģ����Ϣ</param>
    /// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
    /// <param name="FDMemTable">�������ݵ�TFDMemTable���ַ�����</param>
    /// <returns>�ɹ�����ʧ��</returns>
    /// <remarks>
    ///
    /// </remarks>
    function GetADataset(ModeInfo: String; ASQL: String; AFDMemTable: TFDMemTable):Boolean;//����һ�����ݼ�
    /// <summary>��ȡJSON��ʽ�����ݼ�</summary>
    /// <param name="ModeInfo">����TFDQuery��ģ����Ϣ</param>
    /// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
    /// <returns>���ط�װ��JSON��ʽ�����ݼ��ַ���</returns>
    /// <remarks>
    /// �ͻ�����Ҫ����TDSCJSONTools.JSONToDataSet�������ΪTDataset
    /// </remarks>
    function GetAJSONDataSet(ModeInfo: String; ASQL: String):WideString;
    function GetAJSONDataSets(ModeInfo: String; TableName: String;
      ASQL: String):TFDJSONDataSets;//����һ��JSONDATASets���ݼ�
    function GetValue(ModeInfo: String; ASQL: String):variant;// ����һ��ֵ
    /// <summary>Ϊһ��TFDQuery��������һ��SQL���</summary>
    /// <param name="ModeInfo">����TFDQuery��ģ����Ϣ</param>
    /// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
    /// <param name="AFDQUery">����SQL��TFDQuery�ؼ�</param>
    /// <remarks>
    /// ����ʱ��SQL����¼����־�ļ���
    /// </remarks>
    procedure QueryASQL(ModeInfo: String; ASQL: String; AFDQUery: TFDQUery);Overload;//
    /// <summary>Ϊһ��TFDCommand��������һ��SQL���</summary>
    /// <param name="ModeInfo">����TFDCommand��ģ����Ϣ</param>
    /// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
    /// <param name="AFDQUery">����SQL��TFDCommand�ؼ�</param>
    /// <remarks>
    /// ����ʱ��SQL����¼����־�ļ���
    /// </remarks>
    procedure QueryASQL(ModeInfo: String; ASQL: String; ACommand: TFDCommand);Overload;//
    procedure SetDB(DB: TdmDBProvider);//�趨���ݿ������ṩ��
    function StartTrans(ModeInfo: String): String;//��ʼһ������
    /// <summary>��һ��BLOB���󱣴浽���ݿ���</summary>
    /// <param name="ModeInfo">����BLOB�����ģ����Ϣ</param>
    /// <param name="AJSONBlob">��װ��BLOB�����JSON����</param>
    /// <returns>���ط�װ�����н����JSON��ʽ�ַ���</returns>
    /// <remarks>
    /// AJSONBlob�ڰ���TableName���ݱ���FieldNameΪBLOB�ֶ���KeyName����ֵABLOBΪBLOB��������
    /// </remarks>
    function SaveBlob(ModeInfo: String; AJSONBlob: WideString): WideString;
    function RollbackTrans(ModeInfo: String):string; // �ع�����
    property DB: TdmDBProvider read FDBProvider write FDBProvider;//���캯��
  end;

var
  DataAccessor: TDataAccessor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataAccessor }

function TDataAccessor.CommitTrans(ModeInfo: String): string;
{
  ���ܣ��ύһ������
  �������ڣ�2017��10��13��
  ���ߣ�����
}
var _sMsg: String;
begin
  if self.FDTransaction.Active  then
  begin
    self.FDTransaction.Commit();
    _sMsg := '�������ύ��';
  end
  else
  begin
    _sMsg := '����δ����������Ҫ�ύ��';
  end;
  Postlog(llMessage, ModeInfo + ' ' + _sMsg);
end;

constructor TDataAccessor.Create(AOwner: TComponent; ADBProvider: TdmDBProvider);
begin
  inherited Create(AOwner);
  self.DB := ADBProvider;
end;

function TDataAccessor.ExcSQL(ModeInfo, ASQL: String): String;
{
  ���ܣ�������������һ��SQL���
  �������ڣ�2017��10��13��
  ���ߣ�����
}
begin
  if self.FDTransaction.Active then
  begin
    //�����ѿ�ʼִ��SQL
    self.FDQuery.Close();
    self.FDQuery.SQL.Clear();
    self.FDQuery.SQL.Text := ASQL;
    Postlog(llMessage, ModeInfo + 'run SQL: ' + #13 + ASQL);
    self.FDQuery.ExecSQL();
  end
  else
  begin
    //����δ��ʼ����ִ��һ������
    self.FDTransaction.Connection := self.DB.GetConnection();
    self.FDQuery.Connection := self.FDTransaction.Connection;
    self.FDTransaction.StartTransaction();
    Postlog(llMessage, ModeInfo + ' �����ѿ�ʼ');
    try
      self.FDQuery.Close();
      self.FDQuery.SQL.Clear();
      self.FDQuery.SQL.Text := ASQL;
      Postlog(llMessage, ModeInfo + 'run SQL: ' + #13 + ASQL);
      self.FDQuery.ExecSQL();
      self.FDTransaction.Commit();
      Postlog(llMessage, ModeInfo + ' �������ύ');
    except
      on E:Exception do
      begin
        self.FDTransaction.Rollback();
        Postlog(llError, ModeInfo + E.Message);
        Postlog(llError, ModeInfo + ' �����ѻع�');
      end;
    end;
  end;
end;

procedure TDataAccessor.FDTransactionAfterCommit(Sender: TObject);
begin
  self.DB.ReleaseConnection(TFDConnection(self.FDTransaction.Connection));
  self.FDTransaction.Connection := nil;
  self.FDQuery.Connection := nil;
end;

procedure TDataAccessor.FDTransactionAfterRollback(Sender: TObject);
begin
  self.DB.ReleaseConnection(TFDConnection(self.FDTransaction.Connection));
  self.FDTransaction.Connection := nil;
  self.FDQuery.Connection := nil;
end;

function TDataAccessor.GetADataset(ModeInfo, ASQL: String; AFDMemTable: TFDMemTable): Boolean;
{
  ���ܣ�����һ�����ݼ�
  �������ڣ�2017��10��13��
  ���ߣ�����
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
      //��ȡ���ݿ�����
      aQuery := TFDQuery.Create(nil);
      aQuery.Connection := aConnect;
      aQuery.Close();
      aQuery.SQL.Clear();
      aQuery.SQL.Add(ASQL);
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      aQuery.Open();
      //���ݼ���ȡ����
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
          + '���г���:' + E.Message);
        raise;
      end;
    end;
  finally
    //�ͷ����ݿ�����
    self.DB.ReleaseConnection(aConnect);
    aQuery.Free();
  end;
end;

function TDataAccessor.GetAJSONDataSet(ModeInfo, ASQL: String): WideString;
/// <summary>��ȡJSON��ʽ�����ݼ�</summary>
/// <param name="ModeInfo">����TFDQuery��ģ����Ϣ</param>
/// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
/// <returns>���ط�װ��JSON��ʽ�����ݼ��ַ���</returns>
/// <remarks>
/// �ͻ�����Ҫ����TDSCJSONTools.JSONToDataSet�������ΪTDataset
/// </remarks>
var aConnect: TFDConnection;
    aQuery: TFDQuery;
    aJSON: wideString;
    aJo: TJSONObject;
    aPair: TJSONPair;
begin
  try
    try
      //���õĶ�����
      aConnect := TFDConnection.Create(nil);
      aConnect.ConnectionDefName := 'HIS_Pooled' ;
      aConnect.Connected := true;
      AJSON := '';
      aQuery := TFDQuery.Create(nil);
      aQuery.Connection := aConnect;
      aQuery.Close();
      aQuery.SQL.Clear();
      aQuery.SQL.Text := ASQL;
      //������Ϣд��־
      Postlog(llDebug, Modeinfo + ' run SQL:' + #13 + ASQL);
      aQuery.Open();
      //�ѽ����¼��ת����JSON��
      TDSCJSONTools.DataSetToJSON(aQuery,aJSON);
      aJo := TJSONObject.Create();
      aPair := TJSONPair.Create('Code', '1');
      aJo.AddPair(aPair);
      aPair := TJSONPair.Create('Message', '����ɹ�!');
      aJo.AddPair(aPair);
      aPair := TJSONPair.Create('DataSet', aJSON);
      aJo.AddPair(aPair);
    except
      on E:Exception do
      begin
        aJo := TJSONObject.Create();
        aPair := TJSONPair.Create('Code', '-1');
        aJo.AddPair(aPair);
        aPair := TJSONPair.Create('Message', '����ʧ��!');
        aJo.AddPair(aPair);
        aPair := TJSONPair.Create('ErrorMessage', E.Message);
        aJo.AddPair(aPair);
        Postlog(llError, Modeinfo + ' run SQL:' + #13 + ASQL + '  ' + #13
          + '���г���:' + E.Message);
        //raise;
      end;
    end;
  finally
    aJSON := aJo.ToString;
    Result := aJSON;
    //���õĶ�������
    aJo.Free();
    aQuery.Free();
    aConnect.Connected := false;
    aConnect.Free();
  end;
end;

function TDataAccessor.GetAJSONDataSets(ModeInfo, TableName, ASQL: String): TFDJSONDataSets;
{
  ���ܣ�����һ��TFDJSONDataSets���ݼ�
  �������ڣ�2017��10��13��
  ���ߣ�����
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
          + '���г���:' + E.Message);
      end;
    end;
  finally
    self.FDCommand.Close();
    self.DB.ReleaseConnection(TFDConnection(self.FDCommand.Connection));
    self.FDCommand.Connection := nil;
  end;
end;

function TDataAccessor.GetValue(ModeInfo, ASQL: String): variant;
{
  ���ܣ�����һ��ֵ
  �������ڣ�2017��10��13��
  ���ߣ�����
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
          + '���г���:' + E.Message);
      end;
    end;
  finally
    self.DB.ReleaseConnection(ACon);
  end;
end;

procedure TDataAccessor.QueryASQL(ModeInfo, ASQL: String; AFDQUery: TFDQUery);
/// <summary>Ϊһ��TFDQuery��������һ��SQL���</summary>
/// <param name="ModeInfo">����TFDQuery��ģ����Ϣ</param>
/// <param name="ASQL">Ҫ���е�SQL��䣨�ַ�����</param>
/// <param name="AFDQUery">����SQL��TFDQuery�ؼ�</param>
/// <remarks>
/// ����ʱ��SQL����¼����־�ļ���
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
          + '���г���:' + E.Message);
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
  ���ܣ��ع�һ������
  �������ڣ�2017��10��13��
  ���ߣ�����
}
var _sMsg: String;
begin
  Result := _sMsg;
  if self.FDTransaction.Active  then
  begin
    self.FDTransaction.Rollback;
    _sMsg := '�����ѻع���';
  end
  else
  begin
    _sMsg := '����δ����������Ҫ�ع���';
  end;
  Postlog(llMessage, ModeInfo + ' ' + _sMsg);
end;

function TDataAccessor.SaveBlob(ModeInfo: String; AJSONBlob: WideString): WideString;
{
  ���ܣ�����һ��BLOB����
  ��Σ�AJSONBlob�ڰ���TableName���ݱ���FieldNameΪBLOB�ֶ���KeyName����ֵABLOBΪBLOB��������
  ���Σ�
  �������ڣ�2017��10��13��
  ���ߣ�����
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
      _jp := TJSONPair.Create('Message', 'ͼƬΪ�գ�');
      _jo.AddPair(_jp);
      Postlog(llMessage, Modeinfo + 'ͼƬΪ�գ���');
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
        Postlog(llMessage, Modeinfo + '����ͼƬ�ɹ���');
        _jp := TJSONPair.Create('Code', '1');
        _jo.AddPair(_jp);
        _jp := TJSONPair.Create('Message', '����ͼƬ�ɹ���');
        _jo.AddPair(_jp);
      except
        on E:Exception do
        begin
          _jp := TJSONPair.Create('Code', '-1');
          _jo.AddPair(_jp);
          _jp := TJSONPair.Create('Message', '����ͼƬʧ�ܣ�' + E.Message);
          _jo.AddPair(_jp);
          Postlog(llError, Modeinfo + '����ͼƬʧ�ܣ�' + E.Message);
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
  ���ܣ���ʼһ������
  �������ڣ�2017��10��13��
  ���ߣ�����
}
var _sMsg: String;
begin
  Result := _sMsg;
  try
    if not self.FDTransaction.Active then
    begin
      //��ȡһ�������Ӳ���������
      self.FDTransaction.Connection := self.DB.GetConnection();
      self.FDQuery.Connection := self.FDTransaction.Connection;
      self.FDTransaction.StartTransaction();
      _sMsg := '������������' ;
      Postlog(llMessage, ModeInfo + ' ' +_sMsg);
    end;
  except
    on E:Exception do
    begin
      //�ͷ����ݿ�����
      db.ReleaseConnection(TFDConnection(self.FDTransaction.Connection));
      self.FDTransaction.Connection := nil;
      self.FDQuery.Connection := nil;
      _sMsg := '��������ʧ�ܣ�' + E.Message;
      Postlog(llError, ModeInfo + ' ' +_sMsg);
    end;
  end;
end;

end.
