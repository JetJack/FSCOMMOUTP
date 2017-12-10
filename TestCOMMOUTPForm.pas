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
//����
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
      InParam.aac058 := self.CardInfo.CardType ;// ֤�����
      InParam.aac002 := self.CardInfo.CardNumber ;//֤������
      InParam.ake007 := now;//��������
      InParam.ksbm := self.CardInfo.CardID ; //��ʶ����
      InParam.sbkxlh := self.CardInfo.CardSerial;//�籣�����к�
      InParam.qqzfc := self.CardInfo.ReqString;//�����ַ���
      InParam.psamzdh := '';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
      InParam.xm := self.CardInfo.Name;//����
      InParam.skjlid := self.CardInfo.RefreshID;//ˢ����¼ID
    end
    else
    begin
      InParam.aac058 := '1' ;// ֤�����
      InParam.aac002 := self.eIDENO.Text ;//֤������
      InParam.ake007 := now;//��������
      InParam.ksbm := '' ; //��ʶ����
      InParam.sbkxlh := '';//�籣�����к�
      InParam.qqzfc := '';//�����ַ���
      InParam.psamzdh := '';//PSAM���ն˺�
      InParam.gmsfhm := self.eIDENO.Text;//���֤��
      InParam.xm := self.eName.Text;//����
      InParam.skjlid := '';//ˢ����¼ID
    end;
    Inparam.YKC010 :=  '20171207001' ;//	�����
    Inparam.aka130 := '11'; //	�������
    Inparam.ykc600 := '�ϱۼ�ѹ��'; //	�������
    Inparam.YKC011 := '��  ��'; //	��������
    Inparam.ykc613 := '8007'; //	����ҽ������
    Inparam.cfts := '1'; //	��������
    Inparam.zyfs := '0'; //	��ҩ����
    Inparam.ykc675 := '1'; //	��������
    Inparam.aae004 := '����'; //	������ϵ��
    Inparam.aae005 := '83628549'; //	������ϵ�绰
    InParam.grbh := '';//���˱��
    Inparam.aae013 := '';//��ע
    Inparam.akc227 := 25.3; //	ҽ���ܷ���
    Inparam.zdbm := 'S47.x01'; //	��ϱ���
    Inparam.fzd1 := 'S49.700'; //	��һ����ϱ���
    Inparam.fzd2 := ''; //	�ڶ�����ϱ���
    Inparam.fzd3 := ''; //	��������ϱ���
    Inparam.fzd4 := ''; //	���ĸ���ϱ���
    Inparam.fzd5 := '';  //	���帱��ϱ���
    Inparam.fzd6 := ''; //	��������ϱ���
    Inparam.fzd7 := ''; //	���߸���ϱ���
    Inparam.fzd8 := ''; //	�ڰ˸���ϱ���
    Inparam.fzd9 := ''; //	�ھŸ���ϱ���
    Inparam.fzd10 := ''; //	��ʮ����ϱ���
    Inparam.sfhy := '0'; //	�Ƿ���
    Inparam.sfbrq := '0';; //	�Ƿ�����
    Inparam.sfzry := '0';; //	�Ƿ�ת��Ժ
    Inparam.cjrbs := '0';; //	�м��˱�ʶ
    Inparam.ylzd1 := '';  //	Ԥ���ֶ�1
    Inparam.ylzd2 := '';  //	Ԥ���ֶ�2
    Inparam.ylzd3 := ''; //	Ԥ���ֶ�3
    //������1����ϸ
    AOrder := TFSCOMMOUTPOrder_Send.Create();
    AOrder.akc220 := 'R1';   //������
    AOrder.ykc610 := '1';  //��Ŀ���
    AOrder.aae030 := trunc(now); //	���ÿ�ʼ����
    AOrder.aae031 := trunc(now);//	������ֹ����
    AOrder.aka111 := '3' ;//	�������  ��������Ŀ���ࣩ
    AOrder.akc222y := '90030'; //	��Ŀ����
    AOrder.akc223y := '��ҩ'; //	��Ŀ����
    AOrder.cke522 := ' ';	//ʹ�����
    AOrder.akc225 := 23; //	����
    AOrder.akc226 := 1; //	����
    AOrder.akc227 := 23; //	�����ܶ�
    AOrder.akc229 := ''; //	������ҩ���
    AOrder.ykc613 := '8003'; //	����ҽ������
    AOrder.ykc011 := '��  ��'; //	��������
    AOrder.jjdw := '0'; //	�Ƽ۵�λ
    AOrder.gytj := '611'; //	��ҩ;��
    AOrder.yl := 0; //	��������
    AOrder.yldw :=  '0'; //	������λ
    AOrder.pc := '11'; //	Ƶ��
    AOrder.ypgg := '' ; //	ҩƷ���
    AOrder.ylzd4 := ''; //	Ԥ���ֶ�4
    AOrder.ylzd5 := ''; //	Ԥ���ֶ�5
    AOrder.ylzd6 := ''; //	Ԥ���ֶ�6
    InParam.OrderList.Add(AOrder);
    //������2����ϸ
    AOrder := TFSCOMMOUTPOrder_Send.Create();
    AOrder.akc220 := 'R1';   //������
    AOrder.ykc610 := '2';  //��Ŀ���
    AOrder.aae030 := trunc(now); //	���ÿ�ʼ����
    AOrder.aae031 := trunc(now);//	������ֹ����
    AOrder.aka111 := '8' ;//	�������  ��������Ŀ���ࣩ
    AOrder.akc222y := '80055'; //	��Ŀ����
    AOrder.akc223y := 'ά����K1';//��Ŀ����
    AOrder.akc225 := 1.05; //	����
    AOrder.akc226 := 2; //	����
    AOrder.akc227 := 2.3; //	�����ܶ�
    AOrder.akc229 := ''; //	������ҩ���
    AOrder.ykc613 := '8003'; //	����ҽ������
    AOrder.ykc011 := '��  ��'; //	��������
    AOrder.jjdw := '0'; //	�Ƽ۵�λ
    AOrder.gytj := '611'; //	��ҩ;��
    AOrder.yl := 1; //	��������
    AOrder.yldw :=  '֧'; //	������λ
    AOrder.pc := '12'; //	Ƶ��
    AOrder.ypgg := '' ; //	ҩƷ���
    AOrder.ylzd4 := ''; //	Ԥ���ֶ�4
    AOrder.ylzd5 := ''; //	Ԥ���ֶ�5
    AOrder.ylzd6 := ''; //	Ԥ���ֶ�6
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
      InParam.aac058 := self.CardInfo.CardType ;// ֤�����
      InParam.aac002 := self.CardInfo.CardNumber ;//֤������
      Inparam.aac001 := ' ';
      InParam.ake007 := trunc(now);//��������
      InParam.ksbm := self.CardInfo.CardID ; //��ʶ����
      InParam.sbkxlh := self.CardInfo.CardSerial;//�籣�����к�
      InParam.qqzfc := self.CardInfo.ReqString;//�����ַ���
      InParam.psamzdh := ' ';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
    end
    else
    begin
      InParam.aac058 := '1' ;// ֤�����
      InParam.aac002 := self.eIDENO.Text ;//֤������
      Inparam.aac001 := ' ';
      InParam.ake007 := trunc(now);//��������
      InParam.ksbm := ' ' ; //��ʶ����
      InParam.sbkxlh := ' ';//�籣�����к�
      InParam.qqzfc := ' ';//�����ַ���
      InParam.psamzdh := ' ';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
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
      InParam.aac058 := self.CardInfo.CardType ;// ֤�����
      InParam.aac002 := self.CardInfo.CardNumber ;//֤������
      InParam.aac001 := ''; //	ҽ�����
      InParam.ake007 := trunc(now);//��������
      InParam.ksbm := self.CardInfo.CardID ; //��ʶ����
      InParam.sbkxlh := self.CardInfo.CardSerial;//�籣�����к�
      InParam.qqzfc := self.CardInfo.ReqString;//�����ַ���
      InParam.psamzdh := '';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
      InParam.ylzd1 := '';
      InParam.ylzd2 := '';
      InParam.ylzd3 := '';
    end
    else
    begin
      InParam.aac058 := '1' ;// ֤�����
      InParam.aac002 := self.eIDENO.Text ;//֤������
      InParam.aac001 := ''; //	ҽ�����
      InParam.ake007 := trunc(now);//��������
      InParam.ksbm := '' ; //��ʶ����
      InParam.sbkxlh := '';//�籣�����к�
      InParam.qqzfc := '';//�����ַ���
      InParam.psamzdh := '';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
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
      InParam.aac058 := self.CardInfo.CardType ;// ֤�����
      InParam.aac002 := self.CardInfo.CardNumber ;//֤������
      InParam.aaz217 := '';//����ǼǺ�
      InParam.aae030 := FormatDatetime('yyyy-mm-dd', now - 7);//��ʼ����
      InParam.aae031 := FormatDatetime('yyyy-mm-dd', now);//��ֹ����
      InParam.ksbm := self.CardInfo.CardID ; //��ʶ����
      InParam.sbkxlh := self.CardInfo.CardSerial;//�籣�����к�
      InParam.qqzfc := self.CardInfo.ReqString;//�����ַ���
      InParam.psamzdh := '';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
      InParam.grbh := '';//���˱��
    end
    else
    begin
      InParam.aac058 := '1' ;// ֤�����
      InParam.aac002 := self.eIDENO.Text ;//֤������
      InParam.aaz217 := '';//����ǼǺ�
      InParam.aae030 := FormatDatetime('yyyy-mm-dd', now - 7);//��ʼ����
      InParam.aae031 := FormatDatetime('yyyy-mm-dd', now);//��ֹ����
      InParam.ksbm := '' ; //��ʶ����
      InParam.sbkxlh := '';//�籣�����к�
      InParam.qqzfc := '';//�����ַ���
      InParam.psamzdh := '';//PSAM���ն˺�
      InParam.gmsfhm := self.CardInfo.IDENo;//���֤��
      InParam.grbh := '';//���˱��
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
    InParam.aac001 := ''; //	ҽ�����
    InParam.aaz217 := ''; //	�����¼��
    InParam.ykc618 := ''; //	����ҵ���
    InParam.aae013 := ''; // 	ȡ��ԭ��
    if self.rgInput.ItemIndex = 1 then
    begin
      InParam.skjlid := self.CardInfo.RefreshID ; //	ˢ����¼ID
    end
    else
    begin
      InParam.skjlid := '' ; //	ˢ����¼ID
    end;
    xmlStr := InParam.GetInXml();
    self.memoInXml.Lines.Text := xmlStr;
    Result := xmlStr;
  finally
    InParam.Free();
  end;
end;

end.
