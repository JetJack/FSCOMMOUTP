unit FSCOMMOUTPSOAP;

interface
uses
  Classes,  Soap.Rio, Soap.InvokeRegistry, System.JSON, NativeXml,
  Soap.SOAPHTTPClient, facadeServiceProxyUnit, System.SysUtils, Generics.Collections ;

type
  TFSCOMMOUTPSOAP = class(TObject)
  private
    class var FWSDL: String;
    class var FService: String;
    class var FPort: String;
    RIO: THTTPRIO;
  public
    class procedure InitSOAP();
    constructor Create();
    /// <summary>�û���¼</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�Login����
    /// </remarks>
    function Login(InXml: String): String;
    /// <summary>�û������޸�</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�101����
    /// </remarks>
    function ChangePassword(InXml: String): String;
    /// <summary>��ѯ��Ժ�����¼</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�20����
    /// </remarks>
    function QueryMedicalRecordLocal(InXml: String): String;
    /// <summary>��ѯȫ�о����¼</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�21����
    /// </remarks>
    function QueryMedicalRecordGlobal(InXml: String): String;
    /// <summary>�����ʸ�ȷ��</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�06����
    /// </remarks>
    function Checkin(InXml: String): String;
    /// <summary>��ͨ�������</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�05����
    /// </remarks>
    function Balance(InXml: String): String;
    /// <summary>����������</summary>
    /// <param name="InXml">���</param>
    /// <returns>����</returns>
    /// <remarks>
    /// ������ͨ�����������ӿ�09����
    /// </remarks>
    function Rollback(InXml: String): String;
  end;

  TFSCOMMOUTPLogin = class(TOBJect)
  private

  public
    ckz543: String; //ҽԺ���
    operid: String; //�û�id
    password: String; //����
    opertype: String;  //����������
    clienttype: String; //�ͻ�������
    sessionid: String; //sessiion
    return_message: String;//message
    /// <summary>�����������</summary>
    /// <returns>��¼����XML��</returns>
    /// <remarks>
    /// �����������
    /// </remarks>
    function GetInXml():String;
    /// <summary>���ݳ����趨����</summary>
    /// <param name="OutXml">login���صĲ���</param>
    /// <remarks>
    /// ���ݳ����趨����
    /// </remarks>
    procedure ReadOutXml(OutXml:String);
  end;

  TFSCOMMOUTPQueryMedRecordLocal = Class(TObject)
  private

  public
    ckz543: String;// ҽԺ���
    aae011: String;// ������
    sessionid: String;//ҽԺ��½��sessionid
    return_message: string;//���ص��ַ���
    aac058: string;// ֤�����
    aac002: String;//֤������
    aaz217: string;//����ǼǺ�
    aae030: String;//��ʼ����
    aae031: String;//��ֹ����
    ksbm: string ; //��ʶ����
    sbkxlh: String;//�籣�����к�
    qqzfc: String;//�����ַ���
    psamzdh: string;//PSAM���ն˺�
    gmsfhm: String;//���֤��
    grbh: String;//���˱��
    /// <summary>������ѯ�����ڱ�Ժ�������</summary>
    /// <returns>��¼����XML��</returns>
    /// <remarks>
    /// ������ѯ�����ڱ�Ժ�������
    /// </remarks>
    function GetInXml(): String;
    /// <summary>���ݳ����趨����</summary>
    /// <param name="OutXml">login���صĲ���</param>
    /// <return>TJSON�ַ������ݼ��ӿ��ĵ�</return>
    /// <remarks>
    /// TJSON�ַ������ݼ��ӿ��ĵ�
    /// </remarks>
    function ReadOutXml(OutXml: String):String;
  End;

  TFSCOMMOUTPQueryMedRecordGlobal_InParam = Class(TObject)
  private

  public
    ckz543: String;// ҽԺ���
    aae011: String;// ������
    sessionid: String;//ҽԺ��½��sessionid
    aac058: String; // 	֤�����
    aac002: String; //	֤������
    aac001: String; //	ҽ�����
    ake007: TDatetime;	//��������
    ksbm: String; //	��ʶ����
    sbkxlh: String; //	�籣�����к�
    qqzfc: String; //	�����ַ���
    psamzdh: string; //	PSAM���ն˺�
    gmsfhm: String; //	���֤��
    ylzd1: String; //	Ԥ���ֶ�1
    ylzd2: String; //	Ԥ���ֶ�2
    ylzd3: String; //	Ԥ���ֶ�3
    /// <summary>������ѯ����������ҽԺ�������</summary>
    /// <returns>���XML��</returns>
    /// <remarks>
    /// ������ѯ����������ҽԺ�������
    /// </remarks>
    function GetInXml():string;
  End;

  TFSCOMMOUTPCheckInInXml = Class(TObject)
  private

  public
    ckz543: String;// ҽԺ���
    aae011: String;// ������
    sessionid: String;//ҽԺ��½��sessionid
    aac058: String; //֤�����
    aac002: String; //֤������
    aac001: String; //ҽ�����
    ake007: TDatetime; //��������
    ksbm: String; //��ʶ����
    sbkxlh: string; //�籣�����к�
    qqzfc: String; //�����ַ���
    psamzdh:String; //PSAM���ն˺�
    gmsfhm: String; //���֤��
    /// <summary>����������������ʸ�ȷ�����</summary>
    /// <returns>��������ʸ�ȷ�����XML��</returns>
    /// <remarks>
    /// ����������������ʸ�ȷ�����
    /// </remarks>
    function GetInXml(): String;
  End;

  TFSCOMMOUTPCheckIN = Class(TObject)
  private

  public
    Code: String;//ִ�н������
    return_message: string; //������Ϣ
    aac001: String;
    aac002: String;
    aac003: String;
    aac004: String;
    aac006: String;
    Aac027: String;//	��Ա���
    cac089: String; //	ְ�����
    cac007: String;//	����Ա���
    dyxsfs: String; //	����������ܷ�ʽ
    dyxsbz: String; //	����������ܱ�־
    yka430: double; //	ͳ���ۼ���֧��
    mtxsbz: String; //	���������������ܱ�־
    mtxsye: Double; //	�����������������
    dlxsbz: String; //	��������������ܱ�־
    dlxsye: Double; //	����������������
    syxsbz: String; //	��������������ܱ�־
    syxsye: Double; //	������������������
    lxyrbz: String; //	������Ա��־
    mzdbrylb: String; //	�����ͱ���Ա���
    mzyfrylb: String; //	�����Ÿ���Ա���
    /// <summary>��ȡ�籣�ӿڷ��ص�XML������ֵ</summary>
    /// <param name="InXml">�籣�ӿڷ��ص�XML��</param>
    /// <remarks>
    /// ��ȡ�籣�ӿڷ��ص�XML������ֵ
    /// </remarks>
    procedure ReadFromXML(InXml: String);
  end;


   TFSCOMMOUTPOrder_Send = Class(TObject)
   private

   public
     akc220: String;  //������
     ykc610: String;  //��Ŀ���
     aae030: Tdatetime; //	���ÿ�ʼ����
     aae031: TDatetime;//	������ֹ����
     aka111: String;//	�������  ��������Ŀ���ࣩ
     akc222y: String; //	��Ŀ����
     akc223y: String; //	��Ŀ����
     cke522: String;	//ʹ�����
     akc225: Double; //	����
     akc226: Double; //	����
     akc227: Double; //	�����ܶ�
     akc229: String; //	������ҩ���
     ykc613: String; //	����ҽ������
     ykc011: String; //	��������
     jjdw: String; //	�Ƽ۵�λ
     gytj: String; //	��ҩ;��
     yl: double; //	��������
     yldw: String; //	������λ
     pc: String; //	Ƶ��
     ypgg: String; //	ҩƷ���
     ylzd4: String; //	Ԥ���ֶ�4
     ylzd5: String; //	Ԥ���ֶ�5
     ylzd6: String; //	Ԥ���ֶ�6
   End;

   TFSCOMMOUTPBalance_InParam = Class(TObject)
   private

   public
     ckz543: String; //	ҽԺ���
     aae011: String;	//������
     sessionid: String; //	ҽԺ��½��sessionid
     aac058: String; //֤�����
     aac002: String; //	֤������
     YKC010: String; //	�����
     aka130: String; //	�������
     ykc600: String; //	�������
     ake007: TDatetime; //	��������
     YKC011: String; //	��������
     ykc613: String; //	����ҽ������
     cfts: String; //	��������
     zyfs: String; //	��ҩ����
     ykc675: String; //	��������
     aae004: String; //	������ϵ��
     aae005:String; //	������ϵ�绰
     ksbm: String;	//��ʶ����
     sbkxlh: String;  //	�籣�����к�
     qqzfc: String;	//�����ַ���
     psamzdh: String;  //	PSAM���ն˺�
     gmsfhm: String;  //	���֤��
     xm	: String; //����
     grbh: String;  //���˱��
     aae013: String; // 	��ע
     skjlid: String; //	ˢ����¼ID
     akc227: Double; //	ҽ���ܷ���
     zdbm:String; //	��ϱ���
     fzd1: String; //	��һ����ϱ���
     fzd2: String; //	�ڶ�����ϱ���
     fzd3: String; //	��������ϱ���
     fzd4: String; //	���ĸ���ϱ���
     fzd5:String;  //	���帱��ϱ���
     fzd6: String; //	��������ϱ���
     fzd7:String; //	���߸���ϱ���
     fzd8:String; //	�ڰ˸���ϱ���
     fzd9:String; //	�ھŸ���ϱ���
     fzd10:String; //	��ʮ����ϱ���
     sfhy:String; //	�Ƿ���
     sfbrq:String; //	�Ƿ�����
     sfzry: String; //	�Ƿ�ת��Ժ
     cjrbs: String; //	�м��˱�ʶ
     ylzd1: String;  //	Ԥ���ֶ�1
     ylzd2:String;  //	Ԥ���ֶ�2
     ylzd3:String; //	Ԥ���ֶ�3
     OrderList: TList<TFSCOMMOUTPOrder_Send>;
     constructor Create();
     destructor Destory();
     /// <summary>������ͨ����������</summary>
    /// <returns>��ͨ����������XML��</returns>
    /// <remarks>
    /// ������ͨ����������
    /// </remarks>
     function GetInXml(): String;
   end;

   TFSCOMMOUTPRollback_InParam = class(TObject)
   private

   public
     ckz543: String; //	ҽԺ���
     aae011: String;	//������
     sessionid: String; //	ҽԺ��½��sessionid
     aac001: String; //	ҽ�����
     aaz217: String; //	�����¼��
     ykc618: String; //	����ҵ���
     aae013: string; // 	ȡ��ԭ��
     skjlid: string; //	ˢ����¼ID
     /// <summary>������ͨ�������ع����</summary>
    /// <returns>��ͨ�������ع����XML��</returns>
    /// <remarks>
    /// ������ͨ�������ع����
    /// </remarks>
     function GetInXml(): String;
   end;

implementation

{ TCOMMOUTPSOAP }

function TFSCOMMOUTPSOAP.Balance(InXml: String): String;
/// <summary>��ͨ�������</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�05����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.process('05', InXml) ;
  finally
    IPoint := nil;
  end;
end;

function TFSCOMMOUTPSOAP.ChangePassword(InXml: String): String;
/// <summary>�û������޸�</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�101����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.process('101', InXml) ;
  finally
    IPoint := nil;
  end;
end;

function TFSCOMMOUTPSOAP.Checkin(InXml: String): String;
/// <summary>�����ʸ�ȷ��</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�06����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.process('06', InXml) ;
  finally
    IPoint := nil;
  end;
end;

constructor TFSCOMMOUTPSOAP.Create;
begin
  self.RIO := THTTPRIO.Create(nil);
  self.RIO.WSDLLocation := TFSCOMMOUTPSOAP.FWSDL;
  self.RIO.Service := TFSCOMMOUTPSOAP.FService;
  self.RIO.Port := TFSCOMMOUTPSOAP.FPort;
end;

class procedure TFSCOMMOUTPSOAP.InitSOAP;
var _InterfaceParam: TNativeXML;
    _node: TXmlNode;
begin
  try
    _InterfaceParam := TNativeXML.Create(nil);
    _InterfaceParam.LoadFromFile('InsuInterfaceConfig.xml');
    _node := _InterfaceParam.Root.FindNode('FSCOMMOUTP');
    TFSCOMMOUTPSOAP.FWSDL := _node.FindNode('WSDL').Value;
    TFSCOMMOUTPSOAP.FService := _node.FindNode('Service').Value;
    TFSCOMMOUTPSOAP.FPort := _node.FindNode('Port').Value;
  finally
    //_node.Free();
    _InterfaceParam.Free();
  end;
end;

function TFSCOMMOUTPSOAP.Login(InXml: String): String;
// <summary>�û���¼</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�Login����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.login('100', InXml);
  finally
    IPoint := nil;
  end;
end;


function TFSCOMMOUTPSOAP.QueryMedicalRecordGlobal(
  InXml: String): String;
/// <summary>��ѯȫ�о����¼</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�21����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.process('21', InXml) ;
  finally
    IPoint := nil;
  end;
end;

function TFSCOMMOUTPSOAP.QueryMedicalRecordLocal(InXml: String): String;
/// <summary>��ѯ��Ժ�����¼</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�20����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.process('20', InXml) ;
  finally
    IPoint := nil;
  end;
end;

function TFSCOMMOUTPSOAP.Rollback(InXml: String): String;
/// <summary>����������</summary>
/// <param name="InXml">���</param>
/// <returns>����</returns>
/// <remarks>
/// ������ͨ�����������ӿ�09����
/// </remarks>
var Ipoint : FacadeServiceProxy ;
begin
  IPoint := self.RIO as FacadeServiceProxy;
  try
    Result := IPoint.process('09', InXml) ;
  finally
    IPoint := nil;
  end;
end;

{ TFSCOMMOUTPLogin }

function TFSCOMMOUTPLogin.GetInXml: String;
/// <summary>�����������</summary>
/// <returns>��¼����XML��</returns>
/// <remarks>
/// �����������
/// </remarks>
var _xml : TNativeXML;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.XmlFormat := xfReadable;
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
    + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);
    _xml.Root.WriteString('operid', self.operid);
    _xml.Root.WriteString('password', self.password);
    _xml.Root.WriteString('opertype', '2');
    _xml.Root.WriteString('clienttype ', '1');
    Result := _xml.WriteToString;
  finally
    _xml.Free();
  end;
end;

procedure TFSCOMMOUTPLogin.ReadOutXml(OutXml: String);
/// <summary>���ݳ����趨����</summary>
/// <param name="OutXml">login���صĲ���</param>
/// <remarks>
/// ���ݳ����趨����
/// </remarks>
var _xml: TNativeXml;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.ReadFromString(OutXml);
     if _xml.Root.FindNode('code').Value = '1' then
      self.SessionID := _xml.Root.FindNode('SessionID').Value
    else
      self.SessionID := '-1';
    self.return_message := _xml.Root.FindNode('Message').Value;
  finally
    _xml.Free();
  end;
end;

{ TFSCOMMOUTPQueryMedRecordLocal }

function TFSCOMMOUTPQueryMedRecordLocal.GetInXml: String;
/// <summary>������ѯ�����ڱ�Ժ�������</summary>
/// <returns>��¼����XML��</returns>
/// <remarks>
/// ������ѯ�����ڱ�Ժ�������
/// </remarks>
var _xml: TNativeXml;
    _sXml: String;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.XmlFormat := xfReadable;
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
    + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);
    _xml.Root.WriteString('operid', self.aae011);
    _xml.Root.WriteString('sessionid', self.sessionid);
    _xml.Root.WriteString('aac058', self.aac058);
    _xml.Root.WriteString('aac002', self.aac002);
    _xml.Root.WriteString('aaz217', self.aaz217);
    _xml.Root.WriteString('aae030', self.aae030);
    _xml.Root.WriteString('aae031', self.aae031);
    _xml.Root.WriteString('ksbm', self.ksbm);
    _xml.Root.WriteString('sbkxlh', self.sbkxlh);
    _xml.Root.WriteString('qqzfc', self.qqzfc);
    _xml.Root.WriteString('psamzdh', self.psamzdh);
    _xml.Root.WriteString('gmsfhm', self.gmsfhm);
    _xml.Root.WriteString('grbh', self.grbh);
    _sXml := _xml.WriteToString;
    Result := _sXml;
    //Result := _xml.WriteToString;                                                                                           n
  finally
    _xml.Free();
  end;
end;

function TFSCOMMOUTPQueryMedRecordLocal.ReadOutXml(
  OutXml: String): String;
/// <summary>���ݳ����趨����</summary>
/// <param name="OutXml">login���صĲ���</param>
/// <return>TJSON�ַ������ݼ��ӿ��ĵ�</return>
/// <remarks>
/// TJSON�ַ������ݼ��ӿ��ĵ�
/// </remarks>
var _Jo: TJSONObject;
    _jp: TJSONPair;
    _ja: TJSONArray;
    _xml: TNativeXml;
begin
  try
    _xml := TNativeXml.Create(nil);
    _jo := TJSONObject.Create;
    _xml.ReadFromString(OutXml);
  finally
    _jo.Free();
    _xml.Free();
  end;
end;

{ TFSCOMMOUTPCheckInInXml }

function TFSCOMMOUTPCheckInInXml.GetInXml: String;
 /// <summary>����������������ʸ�ȷ�����</summary>
/// <returns>��������ʸ�ȷ�����XML��</returns>
/// <remarks>
/// ����������������ʸ�ȷ�����
/// </remarks>
var _xml: TNativeXml;
    _sXml: String;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.XmlFormat := xfReadable;
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
    + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);//ҽԺ���
    _xml.Root.WriteString('operid', self.aae011);// ����ԱID
    _xml.Root.WriteString('sessionid', self.sessionid);//SESSIONID
    _xml.Root.WriteString('aac058', self.aac058); //֤�����
    _xml.Root.WriteString('aac002', self.aac002); // ֤������
    _xml.Root.WriteString('aac001', self.aac001); // ҽ�����
    _xml.Root.WriteString('ake007', Formatdatetime('yyyy-mm-dd', self.ake007)); // ��������
    _xml.Root.WriteString('ksbm', self.ksbm); //��ʶ����
    _xml.Root.WriteString('sbkxlh', self.sbkxlh); //�籣���к�
    _xml.Root.WriteString('qqzfc', self.qqzfc); //�����ַ���
    _xml.Root.WriteString('psamzdh', self.psamzdh); //PASM���ն˺�
    _xml.Root.WriteString('gmsfhm', self.gmsfhm); //���֤�ţ����籣�����ȡ)
    _sXml := _xml.WriteToString;
    Result := _sXml;
  finally
    _xml.Free();
  end;
end;

{ TFSCOMMOUTPCheckIN }

procedure TFSCOMMOUTPCheckIN.ReadFromXML(InXml: String);
/// <summary>��ȡ�籣�ӿڷ��ص�XML������ֵ</summary>
/// <param name="InXml">�籣�ӿڷ��ص�XML��</param>
/// <remarks>
/// ��ȡ�籣�ӿڷ��ص�XML������ֵ
/// </remarks>
var _xml: TNativeXml;
    _node: TXMLNode;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.ReadFromString(InXml);

    if _xml.Root.FindNode('code').Value = '1' then
    begin
      self.Code := _xml.Root.FindNode('code').Value;
      self.return_message := _xml.Root.FindNode('message').Value;
      self.aac001 := _xml.Root.FindNode('aac001').Value;  //ҽ�����
      self.aac002 := _xml.Root.FindNode('aac002').Value;  //֤������
      self.aac003 := _xml.Root.FindNode('aac003').Value;  // ����
      self.aac004 := _xml.Root.FindNode('aac004').Value;  //�Ա�
      self.aac006 := _xml.Root.FindNode('aac006').Value;  //��������
      self.Aac027 := _xml.Root.FindNode('Aac027').Value;  // ��Ա���
      self.cac089 := _xml.Root.FindNode('cac089').Value; //  ְ�����
      self.cac007 := _xml.Root.FindNode('cac007').Value; //  ����Ա���
      self.dyxsfs := _xml.Root.FindNode('dyxsfs').Value; //  ����������ܷ�ʽ
      self.dyxsbz := _xml.Root.FindNode('dyxsbz').Value; //   ����������ܱ�־
      self.yka430 := StrToFloat(_xml.Root.FindNode('yka430').Value); //ͳ���ۼ���֧��
      self.mtxsbz := _xml.Root.FindNode('mtxsbz').Value; // ���������������ܱ�־
      self.mtxsye := StrToFloat(_xml.Root.FindNode('mtxsys').Value); // �����������������
      self.dlxsbz := _xml.Root.FindNode('dlxsbz').Value; // ��������������ܱ�־
      self.dlxsye := StrToFloat(_xml.Root.FindNode('dlxsys').Value);  // ����������������
      self.syxsbz := _xml.Root.FindNode('syxsbz').Value;  // ��������������ܱ�־
      self.syxsye := StrToFloat(_xml.Root.FindNode('syxsye').Value);//  ������������������
      self.lxyrbz := _xml.Root.FindNode('lxyrbz').Value; // ������Ա��־
      self.mzdbrylb := _xml.Root.FindNode('mzdbrylb').Value; //�����ͱ���Ա���
      self.mzyfrylb := _xml.Root.FindNode('mzyfrylb').Value; // �����Ÿ���Ա���
    end
    else
    begin
      self.Code := _xml.Root.FindNode('code').Value;
      self.return_message := _xml.Root.FindNode('message').Value;
    end;
  finally
    _xml.Free();
  end;
end;

{ TFSCOMMOUTPBalance_InParm }

constructor TFSCOMMOUTPBalance_InParam.Create;
begin
  inherited ;
  self.OrderList := TList<TFSCOMMOUTPOrder_send>.create();
end;

destructor TFSCOMMOUTPBalance_InParam.Destory;
begin
  self.OrderList.Clear();
  self.OrderList.Free();
  inherited ;
end;

function TFSCOMMOUTPBalance_InParam.GetInXml: String;
/// <summary>������ͨ����������</summary>
/// <returns>��ͨ����������XML��</returns>
/// <remarks>
/// ������ͨ����������
/// </remarks>
var _xml: TNativeXml;
    DataSetNode, RowNode: TXmlNode;
    AOrder: TFSCOMMOUTPOrder_send;
    i: Integer;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.XmlFormat := xfReadable;
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
      + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);//ҽԺ���
    _xml.Root.WriteString('operid', self.aae011);// ����ԱID
    _xml.Root.WriteString('sessionid', self.sessionid);//SESSIONID
    _xml.Root.WriteString('acc058', self.aac058);//֤�����
    _xml.Root.WriteString('aac002', self.aac002);//֤������
    _xml.Root.WriteString('YKC010', self.YKC010);//�����
    _xml.Root.WriteString('aka130', self.aka130);//�������
    _xml.Root.WriteString('ykc600', self.ykc600);//�������
    _xml.Root.WriteString('ake007', FormatDatetime('yyyy-mm-dd hh:mi:ss', self.ake007));//��������
    _xml.Root.WriteString('YKC011', self.YKC011);//��������
    _xml.Root.WriteString('ykc613', self.ykc613);//����ҽ������
    _xml.Root.WriteString('cfts', self.cfts);//��������
    _xml.Root.WriteString('zyfs', self.zyfs);//��ҩ����
    _xml.Root.WriteString('ykc675', self.ykc675);//��������
    _xml.Root.WriteString('aae004', self.aae004);//������ϵ��
    _xml.Root.WriteString('aae005', self.aae005);//������ϵ�绰
    _xml.Root.WriteString('ksbm', self.ksbm);//��ʶ����
    _xml.Root.WriteString('sbkxlh', self.sbkxlh);//�籣�����к�
    _xml.Root.WriteString('qqzfc', self.qqzfc);//�����ַ���
    _xml.Root.WriteString('psamzdh', self.psamzdh);//PSAM���ն˺�
    _xml.Root.WriteString('gmsfhm', self.gmsfhm);//���֤��
    _xml.Root.WriteString('xm', self.xm);//����
    _xml.Root.WriteString('grbh', self.grbh);//���˱��
    _xml.Root.WriteString('aae013', self.aae013);//��ע
    _xml.Root.WriteString('skjlid', self.skjlid);//ˢ����¼ID
    _xml.Root.WriteString('akc227', FormatFloat('#.##', self.akc227));//ҽ���ܷ���
    _xml.Root.WriteString('zdbm', self.zdbm);//��ϱ���
    _xml.Root.WriteString('fzd1', self.fzd1);//��һ����ϱ���
    _xml.Root.WriteString('fzd2', self.fzd2);//�ڶ�����ϱ���
    _xml.Root.WriteString('fzd3', self.fzd3);//��������ϱ���
    _xml.Root.WriteString('fzd4', self.fzd4);//���ĸ���ϱ���
    _xml.Root.WriteString('fzd5', self.fzd5);//���帱��ϱ���
    _xml.Root.WriteString('fzd6', self.fzd6);//��������ϱ���
    _xml.Root.WriteString('fzd7', self.fzd7);//���߸���ϱ���
    _xml.Root.WriteString('fzd8', self.fzd8);//�ڰ˸���ϱ���
    _xml.Root.WriteString('fzd9', self.fzd9);//�ھŸ���ϱ���
    _xml.Root.WriteString('fzd10', self.fzd10);//��ʮ����ϱ���
    _xml.Root.WriteString('sfhy', self.sfhy);//�Ƿ���
    _xml.Root.WriteString('sfbrq', self.sfbrq);//�Ƿ�����
    _xml.Root.WriteString('sfzry', self.sfzry);//�Ƿ�ת��Ժ
    _xml.Root.WriteString('cjrbs', self.cjrbs);//�м��˱�ʶ
    _xml.Root.WriteString('ylzd1', self.ylzd1);//Ԥ���ֶ�1
    _xml.Root.WriteString('ylzd2', self.ylzd2);//Ԥ���ֶ�2
    _xml.Root.WriteString('ylzd3', self.ylzd3);//Ԥ���ֶ�3
    DatasetNode := _xml.NodeNew('dataset');
    for i := 0 to self.OrderList.Count - 1 do
    begin
      RowNode := _xml.NodeNew('row') ;
      AOrder := self.OrderList.Items[i];
      RowNode.WriteString('akc220', AOrder.akc220);//������
      RowNode.WriteString('ykc610', AOrder.ykc610); //��Ŀ˳���
      RowNode.WriteString('aae030', FormatDatetime('yyyy-mm-dd',AOrder.aae030)); //���ÿ�ʼ����
      RowNode.WriteString('aae031', FormatDatetime('yyyy-mm-dd',AOrder.aae031)); //������ֹ����
      RowNode.WriteString('aka111', AOrder.aka111);//�������
      RowNode.WriteString('akc222y', AOrder.akc222y); //��Ŀ������
      RowNode.WriteString('akc223y', AOrder.akc223y); //��Ŀ����
      RowNode.WriteString('cke522', AOrder.cke522); //ʹ�����
      RowNode.WriteString('akc225', FormatFloat('#.##', AOrder.akc225));  //����
      RowNode.WriteString('akc226', FormatFloat('#.##',AOrder.akc226)); //����
      RowNode.WriteString('akc227', FormatFloat('#.##',AOrder.akc227)); //�����ܶ�
      RowNode.WriteString('akc229', AOrder.akc229);//������ҩ���
      RowNode.WriteString('ykc613', AOrder.ykc613); //����ҽ������
      RowNode.WriteString('ykc011', AOrder.ykc011); //��������
      RowNode.WriteString('jjdw', AOrder.jjdw); //�Ƽ۵�λ
      RowNode.WriteString('gytj', AOrder.gytj); //��ҩ;��
      RowNode.WriteString('yl', FormatFloat('#.##',AOrder.yl));  //��������
      RowNode.WriteString('yldw', AOrder.yldw); //������λ
      RowNode.WriteString('pc', AOrder.pc);  //Ƶ��
      RowNode.WriteString('ypgg', AOrder.ypgg); //ҩƷ���
      RowNode.WriteString('ylzd4', AOrder.ylzd4);  //Ԥ���ֶ�4
      RowNode.WriteString('ylzd5', AOrder.ylzd5); //Ԥ���ֶ�5
      RowNode.WriteString('ylzd6', AOrder.ylzd6);//Ԥ���ֶ�6
      DataSetNode.NodeAdd(RowNode);
    end;
    _xml.Root.NodeAdd(DatasetNode);
    Result := _xml.WriteToString();
  finally
    _xml.Free();

  end;
end;

{ TFSCOMMOUTPRollback_InParam }

function TFSCOMMOUTPRollback_InParam.GetInXml: String;
/// <summary>������ͨ�������ع����</summary>
/// <returns>��ͨ�������ع����XML��</returns>
/// <remarks>
/// ������ͨ�������ع����
/// </remarks>
var _xml: TNativeXml;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.XmlFormat := xfReadable;
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
      + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);//ҽԺ���
    _xml.Root.WriteString('operid', self.aae011);// ����ԱID
    _xml.Root.WriteString('sessionid', self.sessionid);//SESSIONID
    _xml.Root.WriteString('aac001', self.aac001); //	ҽ�����
    _xml.Root.WriteString('aaz217', self.aaz217); //	�����¼��
    _xml.Root.WriteString('ykc618', self.ykc618); //	����ҵ���
    _xml.Root.WriteString('aae013', self.aae013);  // 	ȡ��ԭ��
    _xml.Root.WriteString('skjlid', self.skjlid); //	ˢ����¼ID
    Result := _xml.WriteToString();
  finally
    _xml.Free();
  end;
end;

{ TFSCOMMOUTPQueryMedRecordGlobal_InParam }

function TFSCOMMOUTPQueryMedRecordGlobal_InParam.GetInXml: string;
/// <summary>������ѯ����������ҽԺ�������</summary>
/// <returns>���XML��</returns>
/// <remarks>
/// ������ѯ����������ҽԺ�������
/// </remarks>
var _xml: TNativeXml;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.XmlFormat := xfReadable;
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
      + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);//ҽԺ���
    _xml.Root.WriteString('operid', self.aae011);// ����ԱID
    _xml.Root.WriteString('sessionid', self.sessionid);//SESSIONID
    _xml.Root.WriteString('aac058', self.aac058);   //֤�����
    _xml.Root.WriteString('aac002', self.aac002);//	֤������
    _xml.Root.WriteString('aac001', self.aac001);//	ҽ�����
    _xml.Root.WriteString('ake007', FormatDatetime('yyyy-mm-dd',self.ake007));//	��������
    _xml.Root.WriteString('ksbm', self.ksbm);//��ʶ����
    _xml.Root.WriteString('sbkxlh', self.sbkxlh); //	�籣�����к�
    _xml.Root.WriteString('qqzfc', self.qqzfc);//	�����ַ���
    _xml.Root.WriteString('psamzdh', self.psamzdh);//	PSAM���ն˺�
    _xml.Root.WriteString('gmsfhm', self.gmsfhm);//	���֤��
    _xml.Root.WriteString('ylzd1', self.ylzd1);//	Ԥ���ֶ�1
    _xml.Root.WriteString('ylzd2', self.ylzd1); //	Ԥ���ֶ�2
    _xml.Root.WriteString('ylzd3', self.ylzd1); //	Ԥ���ֶ�3
    Result := _xml.WriteToString();
  finally
    _xml.Free();
  end;
end;

initialization
  TFSCOMMOUTPSOAP.InitSOAP();

end.
