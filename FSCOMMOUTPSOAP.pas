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
    /// <summary>用户登录</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口Login功能
    /// </remarks>
    function Login(InXml: String): String;
    /// <summary>用户密码修改</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口101功能
    /// </remarks>
    function ChangePassword(InXml: String): String;
    /// <summary>查询本院就诊记录</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口20功能
    /// </remarks>
    function QueryMedicalRecordLocal(InXml: String): String;
    /// <summary>查询全市就诊记录</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口21功能
    /// </remarks>
    function QueryMedicalRecordGlobal(InXml: String): String;
    /// <summary>门诊资格确认</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口06功能
    /// </remarks>
    function Checkin(InXml: String): String;
    /// <summary>普通门诊结算</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口05功能
    /// </remarks>
    function Balance(InXml: String): String;
    /// <summary>门诊结算回退</summary>
    /// <param name="InXml">入参</param>
    /// <returns>出参</returns>
    /// <remarks>
    /// 调用普通居民门诊结算接口09功能
    /// </remarks>
    function Rollback(InXml: String): String;
  end;

  TFSCOMMOUTPLogin = class(TOBJect)
  private

  public
    ckz543: String; //医院编号
    operid: String; //用户id
    password: String; //口令
    opertype: String;  //经办人类型
    clienttype: String; //客户端类型
    sessionid: String; //sessiion
    return_message: String;//message
    /// <summary>产生申请入参</summary>
    /// <returns>登录申请XML串</returns>
    /// <remarks>
    /// 产生申请入参
    /// </remarks>
    function GetInXml():String;
    /// <summary>根据出参设定参数</summary>
    /// <param name="OutXml">login返回的参数</param>
    /// <remarks>
    /// 根据出参设定参数
    /// </remarks>
    procedure ReadOutXml(OutXml:String);
  end;

  TFSCOMMOUTPQueryMedRecordLocal = Class(TObject)
  private

  public
    ckz543: String;// 医院编号
    aae011: String;// 经办人
    sessionid: String;//医院登陆的sessionid
    return_message: string;//返回的字符串
    aac058: string;// 证件类别
    aac002: String;//证件号码
    aaz217: string;//就诊登记号
    aae030: String;//开始日期
    aae031: String;//终止日期
    ksbm: string ; //卡识别码
    sbkxlh: String;//社保卡序列号
    qqzfc: String;//请求字符串
    psamzdh: string;//PSAM卡终端号
    gmsfhm: String;//身份证号
    grbh: String;//个人编号
    /// <summary>产生查询病人在本院就诊入参</summary>
    /// <returns>登录申请XML串</returns>
    /// <remarks>
    /// 产生查询病人在本院就诊入参
    /// </remarks>
    function GetInXml(): String;
    /// <summary>根据出参设定参数</summary>
    /// <param name="OutXml">login返回的参数</param>
    /// <return>TJSON字符串内容见接口文档</return>
    /// <remarks>
    /// TJSON字符串内容见接口文档
    /// </remarks>
    function ReadOutXml(OutXml: String):String;
  End;

  TFSCOMMOUTPCheckInInXml = Class(TObject)
  private

  public
    ckz543: String;// 医院编号
    aae011: String;// 经办人
    sessionid: String;//医院登陆的sessionid
    aac058: String; //证件类别
    aac002: String; //证件号码
    aac001: String; //医保编号
    ake007: TDatetime; //就诊日期
    ksbm: String; //卡识别码
    sbkxlh: string; //社保卡序列号
    qqzfc: String; //请求字符串
    psamzdh:String; //PSAM卡终端号
    gmsfhm: String; //身份证号
    /// <summary>产生病人门诊就诊资格确认入参</summary>
    /// <returns>门诊就诊资格确认入参XML串</returns>
    /// <remarks>
    /// 产生病人门诊就诊资格确认入参
    /// </remarks>
    function GetInXml(): String;
  End;

  TFSCOMMOUTPCheckIN = Class(TObject)
  private

  public
    Code: String;//执行结果代码
    return_message: string; //返回信息
    aac001: String;
    aac002: String;
    aac003: String;
    aac004: String;
    aac006: String;
    Aac027: String;//	人员类别
    cac089: String; //	职工类别
    cac007: String;//	公务员类别
    dyxsfs: String; //	门诊待遇享受方式
    dyxsbz: String; //	门诊待遇享受标志
    yka430: double; //	统筹累计已支付
    mtxsbz: String; //	门特门慢待遇享受标志
    mtxsye: Double; //	门特门慢可享受余额
    dlxsbz: String; //	独立定额待遇享受标志
    dlxsye: Double; //	独立定额可享受余额
    syxsbz: String; //	生育产检待遇享受标志
    syxsye: Double; //	生育产检待遇享受余额
    lxyrbz: String; //	离休人员标志
    mzdbrylb: String; //	民政低保人员类别
    mzyfrylb: String; //	民政优抚人员类别
    /// <summary>读取社保接口返回的XML串并赋值</summary>
    /// <param name="InXml">社保接口返回的XML串</param>
    /// <remarks>
    /// 读取社保接口返回的XML串并赋值
    /// </remarks>
    procedure ReadFromXML(InXml: String);
  end;


   TFSCOMMOUTPOrder_Send = Class(TObject)
   private

   public
     akc220: String;
     ykc610: String;
     aae030: Tdatetime; //	费用开始日期
     aae031: TDatetime;//	费用终止日期
     aka111: String;//	大类代码  （结算项目分类）
     akc222y: String; //	项目代码
     akc223y: String; //	项目名称
     cke522: String;	//使用情况
     akc225: Double; //	单价
     akc226: Double; //	数量
     akc227: Double; //	费用总额
     akc229: String; //	限制用药标记
     ykc613: String; //	处方医生代码
     ykc011: String; //	科室名称
     jjdw: String; //	计价单位
     gytj: String; //	给药途径
     yl: double; //	剂量数量
     yldw: String; //	剂量单位
     pc: String; //	频次
     ypgg: String; //	药品规格
     ylzd4: String; //	预留字段4
     ylzd5: String; //	预留字段5
     ylzd6: String; //	预留字段6
   End;

   TFSCOMMOUTPBalance_InParm = Class(TObject)
   private

   public
     ckz543: String; //	医院编号
     aae011: String;	//经办人
     sessionid: String; //	医院登陆的sessionid
     aac058: String; //证件类别
     aac002: String; //	证件号码
     YKC010: String; //	门诊号
     aka130: String; //	就诊类别
     ykc600: TDatetime; //	就诊诊断
     ake007: TDatetime; //	就诊日期
     YKC011: String; //	科室名称
     ykc613: String; //	主治医生代码
     cfts: String; //	处方天数
     zyfs: String; //	中药付数
     ykc675: String; //	结算类型
     aae004: String; //	患者联系人
     aae005:String; //	患者联系电话
     ksbm: String;	//卡识别码
     sbkxlh: String;  //	社保卡序列号
     qqzfc: String;	//请求字符串
     psamzdh: String;  //	PSAM卡终端号
     gmsfhm: String;  //	身份证号
     xm	: String; //姓名
     grbh: String;  //个人编号
     aae013: String; // 	备注
     skjlid: String; //	刷卡记录ID
     akc227: Double; //	医疗总费用
     zdbm:String; //	诊断编码
     fzd1: String; //	第一副诊断编码
     fzd2: String; //	第二副诊断编码
     fzd3: String; //	第三副诊断编码
     fzd4: String; //	第四副诊断编码
     fzd5:String;  //	第五副诊断编码
     fzd6: String; //	第六副诊断编码
     fzd7:String; //	第七副诊断编码
     fzd8:String; //	第八副诊断编码
     fzd9:String; //	第九副诊断编码
     fzd10:String; //	第十副诊断编码
     sfhy:String; //	是否怀孕
     sfbrq:String; //	是否哺乳期
     sfzry: String; //	是否转入院
     cjrbs: String; //	残疾人标识
     ylzd1: String;  //	预留字段1
     ylzd2:String;  //	预留字段2
     ylzd3:String; //	预留字段3
     OrderList: TList<TFSCOMMOUTPOrder_Send>;
     constructor Create();
     destructor Destory();
     /// <summary>产生普通门诊结算入参</summary>
    /// <returns>普通门诊结算入参XML串</returns>
    /// <remarks>
    /// 产生普通门诊结算入参
    /// </remarks>
     function GetInXml(): String;
   end;

implementation

{ TCOMMOUTPSOAP }

function TFSCOMMOUTPSOAP.Balance(InXml: String): String;
/// <summary>普通门诊结算</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口05功能
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
/// <summary>用户密码修改</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口101功能
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
/// <summary>门诊资格确认</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口06功能
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
    _node.Free();
    _InterfaceParam.Free();
  end;
end;

function TFSCOMMOUTPSOAP.Login(InXml: String): String;
// <summary>用户登录</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口Login功能
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
/// <summary>查询全市就诊记录</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口21功能
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
/// <summary>查询本院就诊记录</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口20功能
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
/// <summary>门诊结算回退</summary>
/// <param name="InXml">入参</param>
/// <returns>出参</returns>
/// <remarks>
/// 调用普通居民门诊结算接口09功能
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
/// <summary>产生申请入参</summary>
/// <returns>登录申请XML串</returns>
/// <remarks>
/// 产生申请入参
/// </remarks>
var _xml : TNativeXML;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
    + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);
    _xml.Root.WriteString('operid', self.operid);
    _xml.Root.WriteString('password', self.password);
    _xml.Root.WriteString('opertype', '2');
    _xml.Root.WriteString('clienttype ', '1');
    //Result := _xml.WriteToString;                                                                                           n
  finally
    _xml.Free();
  end;
end;

procedure TFSCOMMOUTPLogin.ReadOutXml(OutXml: String);
/// <summary>根据出参设定参数</summary>
/// <param name="OutXml">login返回的参数</param>
/// <remarks>
/// 根据出参设定参数
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
/// <summary>产生查询病人在本院就诊入参</summary>
/// <returns>登录申请XML串</returns>
/// <remarks>
/// 产生查询病人在本院就诊入参
/// </remarks>
var _xml: TNativeXml;
    _sXml: String;
begin
  try
    _xml := TNativeXml.Create(nil);
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
/// <summary>根据出参设定参数</summary>
/// <param name="OutXml">login返回的参数</param>
/// <return>TJSON字符串内容见接口文档</return>
/// <remarks>
/// TJSON字符串内容见接口文档
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
 /// <summary>产生病人门诊就诊资格确认入参</summary>
/// <returns>门诊就诊资格确认入参XML串</returns>
/// <remarks>
/// 产生病人门诊就诊资格确认入参
/// </remarks>
var _xml: TNativeXml;
    _sXml: String;
begin
  try
    _xml := TNativeXml.Create(nil);
    _xml.ReadFromString('<?xml version="1.0" encoding="UTF-8" standalone="yes">'
    + '<input></input>');
    _xml.Root.WriteString('ckz543', self.ckz543);//医院编号
    _xml.Root.WriteString('operid', self.aae011);// 操作员ID
    _xml.Root.WriteString('sessionid', self.sessionid);//SESSIONID
    _xml.Root.WriteString('aac058', self.aac058); //证件类别
    _xml.Root.WriteString('aac002', self.aac002); // 证件号码
    _xml.Root.WriteString('aac001', self.aac001); // 医保编号
    _xml.Root.WriteString('ake007', Formatdatetime('yyyy-mm-dd', self.ake007)); // 就诊日期
    _xml.Root.WriteString('ksbm', self.ksbm); //卡识别码
    _xml.Root.WriteString('sbkxlh', self.sbkxlh); //社保序列号
    _xml.Root.WriteString('qqzfc', self.qqzfc); //请求字符串
    _xml.Root.WriteString('psamzdh', self.psamzdh); //PASM卡终端号
    _xml.Root.WriteString('gmsfhm', self.gmsfhm); //身份证号（从社保卡里读取)
    _sXml := _xml.WriteToString;
    Result := _sXml;
  finally
    _xml.Free();
  end;
end;

{ TFSCOMMOUTPCheckIN }

procedure TFSCOMMOUTPCheckIN.ReadFromXML(InXml: String);
/// <summary>读取社保接口返回的XML串并赋值</summary>
/// <param name="InXml">社保接口返回的XML串</param>
/// <remarks>
/// 读取社保接口返回的XML串并赋值
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
      self.aac001 := _xml.Root.FindNode('aac001').Value;  //医保编号
      self.aac002 := _xml.Root.FindNode('aac002').Value;  //证件号码
      self.aac003 := _xml.Root.FindNode('aac003').Value;  // 姓名
      self.aac004 := _xml.Root.FindNode('aac004').Value;  //性别
      self.aac006 := _xml.Root.FindNode('aac006').Value;  //出生年月
      self.Aac027 := _xml.Root.FindNode('Aac027').Value;  // 人员类别
      self.cac089 := _xml.Root.FindNode('cac089').Value; //  职工类别
      self.cac007 := _xml.Root.FindNode('cac007').Value; //  公务员类别
      self.dyxsfs := _xml.Root.FindNode('dyxsfs').Value; //  门诊待遇享受方式
      self.dyxsbz := _xml.Root.FindNode('dyxsbz').Value; //   门诊待遇享受标志
      self.yka430 := StrToFloat(_xml.Root.FindNode('yka430').Value); //统筹累计已支付
      self.mtxsbz := _xml.Root.FindNode('mtxsbz').Value; // 门特门慢待遇享受标志
      self.mtxsye := StrToFloat(_xml.Root.FindNode('mtxsys').Value); // 门特门慢可享受余额
      self.dlxsbz := _xml.Root.FindNode('dlxsbz').Value; // 独立定额待遇享受标志
      self.dlxsye := StrToFloat(_xml.Root.FindNode('dlxsys').Value);  // 独立定额可享受余额
      self.syxsbz := _xml.Root.FindNode('syxsbz').Value;  // 生育产检待遇享受标志
      self.syxsye := StrToFloat(_xml.Root.FindNode('syxsye').Value);//  生育产检待遇享受余额
      self.lxyrbz := _xml.Root.FindNode('lxyrbz').Value; // 离休人员标志
      self.mzdbrylb := _xml.Root.FindNode('mzdbrylb').Value; //民政低保人员类别
      self.mzyfrylb := _xml.Root.FindNode('mzyfrylb').Value; // 民政优抚人员类别
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

constructor TFSCOMMOUTPBalance_InParm.Create;
begin
  inherited ;
  self.OrderList := TList<TFSCOMMOUTPOrder_send>.create();
end;

destructor TFSCOMMOUTPBalance_InParm.Destory;
begin

end;

function TFSCOMMOUTPBalance_InParm.GetInXml: String;
/// <summary>产生普通门诊结算入参</summary>
/// <returns>普通门诊结算入参XML串</returns>
/// <remarks>
/// 产生普通门诊结算入参
/// </remarks>
begin
  self.OrderList.Clear();
  self.OrderList.Free();
  inherited ;
end;

initialization
  TFSCOMMOUTPSOAP.InitSOAP();

end.
