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
    function GetCheckInInParam(): String;
    function GetBalanceInParam(): String;
  end;

var
  frmTestCommoutp: TfrmTestCommoutp;

implementation

{$R *.dfm}

procedure TfrmTestCommoutp.Button1Click(Sender: TObject);
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
    self.UserInfo.HospitalID := ocx.Yybh;
    self.UserInfo.UserID := ocx.OperId;
    self.UserInfo.Password := ocx.PassWord;
  finally
    xml.Free();
  end;
end;

function TfrmTestCommoutp.GetBalanceInParam: String;
var InParam: TFSCOMMOUTPBalance_InParm;
     AOrder: TFSCOMMOUTPOrder_Send;
begin
  try
    InParam := TFSCOMMOUTPBalance_InParm.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.aae011 := self.UserInfo.UserID;
    InParam.sessionid := self.labSessionID.Caption;
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.aac058 := self.CardInfo.CardType ;// 证件类别
      InParam.aac002 := self.CardInfo.CardNumber ;//证件号码
      InParam.ake007 := StrToDate(FormatDatetime('yyyy-mm-dd', now));//就诊日期
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
      InParam.ake007 := StrToDate(FormatDatetime('yyyy-mm-dd', now));//就诊日期
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
    Inparam.ykc600 := '感冒'; //	就诊诊断
    Inparam.YKC011 := '内  科'; //	科室名称
    Inparam.ykc613 := '8003'; //	主治医生代码
    Inparam.cfts := '3'; //	处方天数
    Inparam.zyfs := '0'; //	中药付数
    Inparam.ykc675 := '1'; //	结算类型
    Inparam.aae004 := '张三'; //	患者联系人
    Inparam.aae005 := '83628549'; //	患者联系电话
    InParam.grbh := '';//个人编号
    Inparam.aae013 := '';//备注
    Inparam.akc227 := 999.99; //	医疗总费用
    Inparam.zdbm := ''; //	诊断编码
    Inparam.fzd1 := ''; //	第一副诊断编码
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

    AOrder := TFSCOMMOUTPOrder_Send.Create();
    AOrder.akc220 := 'R1';   //处方号
    AOrder.ykc610 := '1';  //项目序号
    AOrder.aae030 := StrToDate(FormatDatetime('yyyy-mm-dd', now)); //	费用开始日期
    AOrder.aae031 := StrToDate(FormatDatetime('yyyy-mm-dd', now));//	费用终止日期
    AOrder.aka111 := '3' ;//	大类代码  （结算项目分类）
    AOrder.akc222y := '90030'; //	项目代码
    AOrder.akc223y := '大换药'; //	项目名称
    AOrder.cke522 := ' ';	//使用情况
    AOrder.akc225 := 23; //	单价
    AOrder.akc226 := 1; //	数量
    AOrder.akc227 := 23; //	费用总额
    AOrder.akc229 := ''; //	限制用药标记
    AOrder.ykc613 := '8003'; //	处方医生代码
    AOrder.ykc011 := '内  科'; //	科室名称
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


    Result := InParam.GetInXml();
  finally
    InParam.Free();
  end;
end;

function TfrmTestCommoutp.GetCheckInInParam: String;
var InParam: TFSCOMMOUTPCheckInInXml;
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
      Inparam.aac001 := '';
      InParam.ake007 := StrToDate(FormatDatetime('yyyy-mm-dd', now));//就诊日期
      InParam.ksbm := self.CardInfo.CardID ; //卡识别码
      InParam.sbkxlh := self.CardInfo.CardSerial;//社保卡序列号
      InParam.qqzfc := self.CardInfo.ReqString;//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
    end
    else
    begin
      InParam.aac058 := '1' ;// 证件类别
      InParam.aac002 := self.eIDENO.Text ;//证件号码
      Inparam.aac001 := '';
      InParam.ake007 := StrToDate(FormatDatetime('yyyy-mm-dd', now));//就诊日期
      InParam.ksbm := '' ; //卡识别码
      InParam.sbkxlh := '';//社保卡序列号
      InParam.qqzfc := '';//请求字符串
      InParam.psamzdh := '';//PSAM卡终端号
      InParam.gmsfhm := self.CardInfo.IDENo;//身份证号
    end;
    Result := InParam.GetInXml();
  finally
    InParam.Free();
  end;
end;

function TfrmTestCommoutp.GetFuntion20InParam: String;
var InParam: TFSCOMMOUTPQueryMedRecordLocal;
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
    Result := InParam.GetInXml();
  finally
    InParam.Free();
  end;
end;

function  TfrmTestCommoutp.GetLoginInParam: String;
var InParam: TFSCOMMOUTPLogin;
begin
  try
    InParam := TFSCOMMOUTPLogin.Create();
    InParam.ckz543 := self.UserInfo.HospitalID;
    InParam.operid := self.UserInfo.UserID;
    InParam.password := self.UserInfo.Password;
    Inparam.opertype := '2';
    InParam.clienttype := '1';
    Result := InParam.GetInXml();
  finally
    Inparam.Free();
  end;
end;

end.
