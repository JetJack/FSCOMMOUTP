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
    /// <returns>SQL���</returns>
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
/// <summary>������</summary>
/// <remarks>
/// �������ʱ��Ԫ�ļ����ã��������Ա
/// </remarks>
begin
  TPatientServer.ClassInitFlag := false;
  TPatientServer.SQLLibrary.Clear();
  TPatientServer.SQLLibrary.Free();
  TPatientServer.CriticalSection.Free();
end;

class procedure TPatientServer.ClassInitialize;
/// <summary>���ʼ��</summary>
/// <remarks>
/// ����װ�뵥Ԫ�ļ��ǵ��ã��������Ա������δװ��SQL��
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
/// <summary>��ȡSQL���</summary>
/// <param name="Key">SQL�Ĳ�������</param>
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
      Postlog(llError, Key+'û���ҵ�SQL���');
    end;
  finally
    TPatientServer.CriticalSection.Leave();
  end;
end;

procedure TPatientServer.LoadSQLLibrary(ModeName, ClassName: String);
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
            TPatientServer.SQLLibrary.Add(_skey, _svalue);
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
  end;
end;

end.
