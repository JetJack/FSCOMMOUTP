unit TestCOMMOUTPForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, hnisi_ssdkProj_TLB, comObj,
  NativeXml, FSCOMMOUTPSOAP;

type
  TCardInfo = record
    RefreshID: String;
    CardType: String;
    CardNumber: String;
    Name:String;
    IDENo: String;
    CardID: String;
    CardSerial: String;
    ReqString: String;
  end;

  TUserInfo = record
    HospitalID :String;
    UserID: String;
    Password: String;
  end;

  TfrmTestCommoutp = class(TForm)
    rgCardType: TRadioGroup;
    rgkind: TRadioGroup;
    Memo1: TMemo;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    eName: TLabeledEdit;
    eIDENO: TLabeledEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    memoInXml: TMemo;
    memoOutXml: TMemo;
    rgFuntion: TRadioGroup;
    Button2: TButton;
    Button3: TButton;
    rgInput: TRadioGroup;
    Label2: TLabel;
    labSessionID: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    ocx: Thnisi_ssdk;
    SOAP: TFSCOMMOUTPSOAP;
    CardInfo: TCardInfo;
    UserInfo: TUserInfo;
  public
    { Public declarations }
    function  GetLoginInParam(): String;
    function  GetFuntion20InParam(): String;
    function GetFunction21InParam(): String;
    function GetCheckInInParam(): String;
    function GetBalanceInParam(): String;
    function GetRollbackInParam(): String;
    procedure DoLogin();
    procedure DoFunction20();
    procedure DoFunction21();
    procedure DoCheckin();
    procedure DoBalance();
    procedure DoRollback();
  end;

var
  frmTestCommoutp: TfrmTestCommoutp;

implementation

{$R *.dfm}

procedure TfrmTestCommoutp.Button1Click(Sender: TObject);
//读卡
var str1, str2, CardType, kind: String;
    strlist: TStringList;
    i: Integer;
begin
  try
    case self.rgCardType.ItemIndex of
      0: CardType := '1';
      1: CardType := '2';
    end;
    case self.rgkind.ItemIndex of
      0: Kind := '0';
      1: Kind := '1';
    end;
    strlist := Tstringlist.Create();
    str2 := '';
    str1 := self.ocx.GetSkjlidFtc(cardType, Kind, '');
    strlist.Delimiter := '|' ;
    strlist.DelimitedText := str1;
    self.Memo1.Lines.Clear();
    self.Memo1.Lines.Text := str1;
    //self.Memo1.Lines.Add(str1);
    self.CardInfo.RefreshID := strlist.Strings[0];
    self.CardInfo.CardType := strlist.Strings[1];
    self.CardInfo.CardNumber := strlist.Strings[2];
    self.CardInfo.Name := strlist.Strings[3];
    self.CardInfo.IDENo := strlist.Strings[4];
    self.CardInfo.CardID := strlist.Strings[5];
    self.CardInfo.CardSerial := strlist.Strings[6];
    self.CardInfo.CardSerial := strlist.Strings[7];
  finally
    strlist.Clear();
    strlist.Free();
  end;
end;

procedure TfrmTestCommoutp.Button2Click(Sender: TObject);
begin
  try
    case self.rgFuntion.ItemIndex of
      0: self.GetLoginInParam();
      1: self.GetFuntion20InParam();
      2: self.GetFunction21InParam();
      3: self.GetCheckInInParam();
      4: self.GetBalanceInParam();
      5: self.GetRollbackInParam();
    end;
  finally

  end;
end;

procedure TfrmTestCommoutp.Button3Click(Sender: TObject);
begin
    try
    case self.rgFuntion.ItemIndex of
      0: self.DoLogin();
      1: self.DoFunction20();
      2: self.DoFunction21();
      3: self.DoCheckin();
      4: self.DoBalance();
      5: self.DoRollback();
    end;
  finally

  end;
end;

procedure TfrmTestCommoutp.DoBalance;
var inXml, outXMl: String;
    xml: TNativeXml;
    RIO: TFSCOMMOUTPSOAP;
begin
   try
    xml := TNativeXml.Create(nil);
    xml.XmlFormat := xfReadable;
    self.DoLogin();
    inxml := self.GetBalanceInParam();
    RIO := TFSCOMMOUTPSOAP.Create();
    outXml :=self.SOAP.Balance(inXml);
    xml.ReadFromString(outXml);
  finally
    self.memoOutXml.Lines.Text := xml.WriteToString();
    xml.Free();
    RIO.Free();
  end;
end;

procedure TfrmTestCommoutp.DoCheckin;
var inXml, outXMl: String;
    xml: TNativeXml;
    RIO: TFSCOMMOUTPSOAP;
begin
   try
    xml := TNativeXml.Create(nil);
    xml.XmlFormat := xfReadable;
    self.DoLogin();
    inxml := self.GetCheckInInParam();
    RIO := TFSCOMMOUTPSOAP.Create();
    outXml :=RIO.Checkin(inXml);
    xml.ReadFromString(outXml);
  finally
    self.memoOutXml.Lines.Text := xml.WriteToString();
    xml.Free();
    RIO.Free();
  end;
end;

procedure TfrmTestCommoutp.DoFunction20;
var inXml, outXMl: String;
    xml: TNativeXml;
    RIO: TFSCOMMOUTPSOAP;
begin
   try
    xml := TNativeXml.Create(nil);
    xml.XmlFormat := xfReadable;
    self.DoLogin();
    inxml := self.GetFuntion20InParam();
    RIO := TFSCOMMOUTPSOAP.Create();
    outXml :=self.SOAP.QueryMedicalRecordLocal(inXml);
    xml.ReadFromString(outXml);
  finally
    self.memoOutXml.Lines.Text := xml.WriteToString();
    xml.Free();
    RIO.Free();
  end;
end;

procedure TfrmTestCommoutp.DoFunction21;
var inXml, outXMl: String;
    xml: TNativeXml;
    RIO: TFSCOMMOUTPSOAP;
begin
   try
    xml := TNativeXml.Create(nil);
    xml.XmlFormat := xfReadable;
    self.DoLogin();
    inxml := self.GetFunction21InParam();
    RIO := TFSCOMMOUTPSOAP.Create();
    outXml :=self.SOAP.QueryMedicalRecordGlobal(inXml);
    xml.ReadFromString(outXml);
  finally
    self.memoOutXml.Lines.Text := xml.WriteToString();
    xml.Free();
    RIO.Free();
  end;
end;

procedure TfrmTestCommoutp.DoLogin;
var inXml, outXMl: String;
    xml: TNativeXml;
    RIO: TFSCOMMOUTPSOAP;
begin
  try
    RIO := TFSCOMMOUTPSOAP.Create();
    xml := TNativeXml.Create(nil);
    xml.XmlFormat := xfReadable;
    inxml := self.GetLoginInParam();
    outXml :=RIO.Login(inXml);
    xml.ReadFromString(outXml);
    if xml.Root.FindNode('code').Value = '1' then
    begin
      self.labSessionID.Caption := xml.Root.FindNode('sessionid').Value;
    end
    else
    begin
      self.labSessionID.Caption := '';
    end;
  finally
    self.memoOutXml.Lines.Text := xml.WriteToString();
    xml.Free();
    RIO.Free();
  end;
end;

procedure TfrmTestCommoutp.DoRollback;
var inXml, outXMl: String;
    xml: TNativeXml;
    RIO: TFSCOMMOUTPSOAP;
begin
   try
    xml := TNativeXml.Create(nil);
    xml.XmlFormat := xfReadable;
    self.DoLogin();
    inxml := self.GetRollbackInParam();
    RIO := TFSCOMMOUTPSOAP.Create();
    outXml :=self.SOAP.Rollback(inXml);
    xml.ReadFromString(outXml);
  finally
    self.memoOutXml.Lines.Text := xml.WriteToString();
    xml.Free();
    RIO.Free();
  end;
end;

procedure TfrmTestCommoutp.FormCreate(Sender: TObject);
var xml:  TNativeXml;
    node : TXMlNode;
begin
  try
    self.ocx := Thnisi_ssdk.Create(nil);
    xml := TNativeXml.Create(nil);
    xml.LoadFromFile('InsuInterfaceConfig.xml');
    node := xml.Root.FindNode('CRW');
    ocx.Yybh := node.FindNode('Yybh').Value;
    ocx.OperId := node.FindNode('OperId').Value;
    ocx.PassWord := node.FindNode('Password').Value;
    ocx.WebServiceIP := node.FindNode('IP').Value;
    ocx.WebServicePort := node.FindNode('Port').Value;
    self.SOAP := TFSCOMMOUTPSOAP.Create();
    self.UserInfo.HospitalID := node.FindNode('Yybh').Value;
    self.UserInfo.UserID := node.FindNode('OperId').Value;
    self.UserInfo.Password := node.FindNode('Password').Value;
  finally
    xml.Free();
  end;
end;

function TfrmTestCommoutp.GetBalanceInParam: String;
var InParam: TFSCOMMOUTPBalance_InParam;
     AOrder: TFSCOMMOUTPOrder_Send;
     strXml: String;
begin
  try
    InParam := TFSCOMMOUTPBalance_InParam.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.aae011 := self.UserInfo.UserID;
    InParam.sessionid := self.labSessionID.Caption;
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.aac058 := self.CardInfo.CardType ;// 证件类别
      InParam.aac002 := self.CardInfo.CardNumber ;//证件号码
      InParam.ake007 := now;//就诊日期
      InParam.ksbm := self.CardInfo.CardID ; //卡识别码
      InParam.sbkxlh := self.CardInfo.CardSerial;//社保卡序列号
      InParam.qqzfc := self.CardInfo.ReqString;//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
      InParam.xm := self.CardInfo.Name;//姓名
      InParam.skjlid := self.CardInfo.RefreshID;//刷卡记录ID
    end
    else
    begin
      InParam.aac058 := '1' ;// 证件类别
      InParam.aac002 := self.eIDENO.Text ;//证件号码
      InParam.ake007 := now;//就诊日期
      InParam.ksbm := '' ; //卡识别码
      InParam.sbkxlh := '';//社保卡序列号
      InParam.qqzfc := '';//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.eIDENO.Text;//身份证号
      InParam.xm := self.eName.Text;//姓名
      InParam.skjlid := '';//刷卡记录ID
    end;
    Inparam.YKC010 :=  '20171207001' ;//	门诊号
    Inparam.aka130 := '11'; //	就诊类别
    Inparam.ykc600 := '上臂挤压伤'; //	就诊诊断
    Inparam.YKC011 := '外  科'; //	科室名称
    Inparam.ykc613 := '8007'; //	主治医生代码
    Inparam.cfts := '1'; //	处方天数
    Inparam.zyfs := '0'; //	中药付数
    Inparam.ykc675 := '1'; //	结算类型
    Inparam.aae004 := '张三'; //	患者联系人
    Inparam.aae005 := '83628549'; //	患者联系电话
    InParam.grbh := '';//个人编号
    Inparam.aae013 := '';//备注
    Inparam.akc227 := 25.3; //	医疗总费用
    Inparam.zdbm := 'S47.x01'; //	诊断编码
    Inparam.fzd1 := 'S49.700'; //	第一副诊断编码
    Inparam.fzd2 := ''; //	第二副诊断编码
    Inparam.fzd3 := ''; //	第三副诊断编码
    Inparam.fzd4 := ''; //	第四副诊断编码
    Inparam.fzd5 := '';  //	第五副诊断编码
    Inparam.fzd6 := ''; //	第六副诊断编码
    Inparam.fzd7 := ''; //	第七副诊断编码
    Inparam.fzd8 := ''; //	第八副诊断编码
    Inparam.fzd9 := ''; //	第九副诊断编码
    Inparam.fzd10 := ''; //	第十副诊断编码
    Inparam.sfhy := '0'; //	是否怀孕
    Inparam.sfbrq := '0';; //	是否哺乳期
    Inparam.sfzry := '0';; //	是否转入院
    Inparam.cjrbs := '0';; //	残疾人标识
    Inparam.ylzd1 := '';  //	预留字段1
    Inparam.ylzd2 := '';  //	预留字段2
    Inparam.ylzd3 := ''; //	预留字段3
    //处方第1条明细
    AOrder := TFSCOMMOUTPOrder_Send.Create();
    AOrder.akc220 := 'R1';   //处方号
    AOrder.ykc610 := '1';  //项目序号
    AOrder.aae030 := trunc(now); //	费用开始日期
    AOrder.aae031 := trunc(now);//	费用终止日期
    AOrder.aka111 := '3' ;//	大类代码  （结算项目分类）
    AOrder.akc222y := '90030'; //	项目代码
    AOrder.akc223y := '大换药'; //	项目名称
    AOrder.cke522 := ' ';	//使用情况
    AOrder.akc225 := 23; //	单价
    AOrder.akc226 := 1; //	数量
    AOrder.akc227 := 23; //	费用总额
    AOrder.akc229 := ''; //	限制用药标记
    AOrder.ykc613 := '8003'; //	处方医生代码
    AOrder.ykc011 := '外  科'; //	科室名称
    AOrder.jjdw := '0'; //	计价单位
    AOrder.gytj := '611'; //	给药途径
    AOrder.yl := 0; //	剂量数量
    AOrder.yldw :=  '0'; //	剂量单位
    AOrder.pc := '11'; //	频次
    AOrder.ypgg := '' ; //	药品规格
    AOrder.ylzd4 := ''; //	预留字段4
    AOrder.ylzd5 := ''; //	预留字段5
    AOrder.ylzd6 := ''; //	预留字段6
    InParam.OrderList.Add(AOrder);
    //处方第2条明细
    AOrder := TFSCOMMOUTPOrder_Send.Create();
    AOrder.akc220 := 'R1';   //处方号
    AOrder.ykc610 := '2';  //项目序号
    AOrder.aae030 := trunc(now); //	费用开始日期
    AOrder.aae031 := trunc(now);//	费用终止日期
    AOrder.aka111 := '8' ;//	大类代码  （结算项目分类）
    AOrder.akc222y := '80055'; //	项目代码
    AOrder.akc223y := '维生素K1';//项目名称
    AOrder.akc225 := 1.05; //	单价
    AOrder.akc226 := 2; //	数量
    AOrder.akc227 := 2.3; //	费用总额
    AOrder.akc229 := ''; //	限制用药标记
    AOrder.ykc613 := '8003'; //	处方医生代码
    AOrder.ykc011 := '外  科'; //	科室名称
    AOrder.jjdw := '0'; //	计价单位
    AOrder.gytj := '611'; //	给药途径
    AOrder.yl := 1; //	剂量数量
    AOrder.yldw :=  '支'; //	剂量单位
    AOrder.pc := '12'; //	频次
    AOrder.ypgg := '' ; //	药品规格
    AOrder.ylzd4 := ''; //	预留字段4
    AOrder.ylzd5 := ''; //	预留字段5
    AOrder.ylzd6 := ''; //	预留字段6
    InParam.OrderList.Add(AOrder);
    strXml := InParam.GetInXml();
    self.memoInXml.Lines.Text := strXMl;
    Result := strXml;
  finally
    InParam.Free();
  end;
end;

function TfrmTestCommoutp.GetCheckInInParam: String;
var InParam: TFSCOMMOUTPCheckInInXml;
    strXml:String;
begin
  try
    InParam := TFSCOMMOUTPCheckInInXml.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.aae011 := self.UserInfo.UserID;
    InParam.sessionid := self.labSessionID.Caption;
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.aac058 := self.CardInfo.CardType ;// 证件类别
      InParam.aac002 := self.CardInfo.CardNumber ;//证件号码
      Inparam.aac001 := ' ';
      InParam.ake007 := trunc(now);//就诊日期
      InParam.ksbm := self.CardInfo.CardID ; //卡识别码
      InParam.sbkxlh := self.CardInfo.CardSerial;//社保卡序列号
      InParam.qqzfc := self.CardInfo.ReqString;//请求字符串
      InParam.psamzdh := ' ';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
    end
    else
    begin
      InParam.aac058 := '1' ;// 证件类别
      InParam.aac002 := self.eIDENO.Text ;//证件号码
      Inparam.aac001 := ' ';
      InParam.ake007 := trunc(now);//就诊日期
      InParam.ksbm := ' ' ; //卡识别码
      InParam.sbkxlh := ' ';//社保卡序列号
      InParam.qqzfc := ' ';//请求字符串
      InParam.psamzdh := ' ';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
    end;
    strXml := InParam.GetInXml();
    self.memoInXml.Lines.Text := strXml;
    Result := strXml;
  finally
    InParam.Free();
  end;
end;

function TfrmTestCommoutp.GetFunction21InParam: String;
var InParam: TFSCOMMOUTPQueryMedRecordGlobal_InParam;
    xmlStr: String;
begin
  try
    InParam := TFSCOMMOUTPQueryMedRecordGlobal_InParam.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.aae011 := self.UserInfo.UserID;
    InParam.sessionid := self.labSessionID.Caption;
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.aac058 := self.CardInfo.CardType ;// 证件类别
      InParam.aac002 := self.CardInfo.CardNumber ;//证件号码
      InParam.aac001 := ''; //	医保编号
      InParam.ake007 := trunc(now);//就诊日期
      InParam.ksbm := self.CardInfo.CardID ; //卡识别码
      InParam.sbkxlh := self.CardInfo.CardSerial;//社保卡序列号
      InParam.qqzfc := self.CardInfo.ReqString;//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
      InParam.ylzd1 := '';
      InParam.ylzd2 := '';
      InParam.ylzd3 := '';
    end
    else
    begin
      InParam.aac058 := '1' ;// 证件类别
      InParam.aac002 := self.eIDENO.Text ;//证件号码
      InParam.aac001 := ''; //	医保编号
      InParam.ake007 := trunc(now);//就诊日期
      InParam.ksbm := '' ; //卡识别码
      InParam.sbkxlh := '';//社保卡序列号
      InParam.qqzfc := '';//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
      InParam.ylzd1 := '';
      InParam.ylzd2 := '';
      InParam.ylzd3 := '';
    end;
    xmlStr := InParam.GetInXml();
    self.memoInXml.Lines.Text := xmlStr;
    Result := xmlStr;
  finally
    InParam.Free();
  end;
end;

function TfrmTestCommoutp.GetFuntion20InParam: String;
var InParam: TFSCOMMOUTPQueryMedRecordLocal;
    xmlStr: String;
begin
  try
    InParam := TFSCOMMOUTPQueryMedRecordLocal.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.aae011 := self.UserInfo.UserID;
    InParam.sessionid := self.labSessionID.Caption;
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.aac058 := self.CardInfo.CardType ;// 证件类别
      InParam.aac002 := self.CardInfo.CardNumber ;//证件号码
      InParam.aaz217 := '';//就诊登记号
      InParam.aae030 := FormatDatetime('yyyy-mm-dd', now - 7);//开始日期
      InParam.aae031 := FormatDatetime('yyyy-mm-dd', now);//终止日期
      InParam.ksbm := self.CardInfo.CardID ; //卡识别码
      InParam.sbkxlh := self.CardInfo.CardSerial;//社保卡序列号
      InParam.qqzfc := self.CardInfo.ReqString;//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
      InParam.grbh := '';//个人编号
    end
    else
    begin
      InParam.aac058 := '1' ;// 证件类别
      InParam.aac002 := self.eIDENO.Text ;//证件号码
      InParam.aaz217 := '';//就诊登记号
      InParam.aae030 := FormatDatetime('yyyy-mm-dd', now - 7);//开始日期
      InParam.aae031 := FormatDatetime('yyyy-mm-dd', now);//终止日期
      InParam.ksbm := '' ; //卡识别码
      InParam.sbkxlh := '';//社保卡序列号
      InParam.qqzfc := '';//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
      InParam.grbh := '';//个人编号
    end;
    xmlStr := InParam.GetInXml();
    self.memoInXml.Lines.Text := xmlStr;
    Result := xmlStr;
  finally
    InParam.Free();
  end;
end;

function  TfrmTestCommoutp.GetLoginInParam: String;
var InParam: TFSCOMMOUTPLogin;
    xmlStr:String;
begin
  try
    InParam := TFSCOMMOUTPLogin.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.operid := self.UserInfo.UserID;
    InParam.password := self.UserInfo.Password;
    Inparam.opertype := '2';
    InParam.clienttype := '1';
    xmlStr := InParam.GetInXml();
    self.memoInXml.Lines.Text := xmlStr;
    Result := xmlStr;
  finally
    Inparam.Free();
  end;
end;

function TfrmTestCommoutp.GetRollbackInParam: String;
var InParam: TFSCOMMOUTPRollback_InParam;
    xmlStr: String;
begin
  try
    InParam := TFSCOMMOUTPRollback_InParam.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.aae011 := self.UserInfo.UserID;
    InParam.sessionid := self.labSessionID.Caption;
    InParam.aac001 := ''; //	医保编号
    InParam.aaz217 := ''; //	就诊记录号
    InParam.ykc618 := ''; //	结算业务号
    InParam.aae013 := ''; // 	取消原因
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.skjlid := self.CardInfo.RefreshID ; //	刷卡记录ID
    end
    else
    begin
      InParam.skjlid := '' ; //	刷卡记录ID
    end;
    xmlStr := InParam.GetInXml();
    self.memoInXml.Lines.Text := xmlStr;
    Result := xmlStr;
  finally
    InParam.Free();
  end;
end;

end.
