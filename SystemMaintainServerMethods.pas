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
    constructor Create(AOwner: TComponent; ADB: TdmDBProvider);
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
