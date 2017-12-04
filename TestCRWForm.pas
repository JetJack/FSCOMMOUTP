unit TestCRWForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, hnisi_ssdkProj_TLB, comObj,
  Vcl.StdCtrls, Vcl.ExtCtrls, NativeXml;

type
  TfrmTestCRW = class(TForm)
    EditCode: TLabeledEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo2: TMemo;
    Button5: TButton;
    rgCardType: TRadioGroup;
    rgkind: TRadioGroup;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    ocx: Thnisi_ssdk;
  public
    { Public declarations }
  end;

var
  frmTestCRW: TfrmTestCRW;

implementation

{$R *.dfm}

procedure TfrmTestCRW.Button1Click(Sender: TObject);
begin
  self.Memo1.Lines.Add(self.ocx.DK1118());
end;

procedure TfrmTestCRW.Button2Click(Sender: TObject);
var str, str2:String;
    xml: TNativeXml;
begin
  try
  // xml := TNativeXml.Create(nil);
   str := self.ocx.Dk(self.EditCode.Text);
   self.Memo1.Lines.Clear();
   self.Memo1.Lines.Add(str);
   //xml.ReadFromString(str);
   //str2 := xml.Root.FindNode('公民身份号码').Value;
  finally
    xml.Free();
  end;
end;

procedure TfrmTestCRW.Button3Click(Sender: TObject);
var str1, str2: String;
    strlist: TStringList;
    i: Integer;
begin
  try
    strlist := Tstringlist.Create();
    str2 := '';
    str1 := self.ocx.GetJkxx();
    strlist.Delimiter := '|' ;
    strlist.DelimitedText := str1;
    self.Memo1.Lines.Clear();
    self.Memo1.Lines.Add(str1);
    for i := 0 to strlist.Count - 1 do
    begin
      str2 := str2 + strlist.Strings[i] + ';';
    end;
    self.Memo2.Lines.Clear;
    self.Memo2.Lines.Add(str2);
  finally
    strlist.Clear();
    strlist.Free();
  end;
end;

procedure TfrmTestCRW.Button4Click(Sender: TObject);
var str1, str2: String;
    strlist: TStringList;
    i: Integer;
begin
  try
    strlist := Tstringlist.Create();
    str2 := '';
    str1 := self.ocx.Getskjlid();
    strlist.Delimiter := '|' ;
    strlist.DelimitedText := str1;
    self.Memo1.Lines.Clear();
    self.Memo1.Lines.Add(str1);
    for i := 0 to strlist.Count - 1 do
    begin
      str2 := str2 + strlist.Strings[i] + ';';
    end;
    self.Memo2.Lines.Clear;
    self.Memo2.Lines.Add(str2);
  finally
    strlist.Clear();
    strlist.Free();
  end;
end;

procedure TfrmTestCRW.Button5Click(Sender: TObject);
var str1, str2: String;
    strlist: TStringList;
    i: Integer;
begin
  try
    strlist := Tstringlist.Create();
    str2 := '';
    str1 := self.ocx.GetSkjlidFjc();
    strlist.Delimiter := '|' ;
    strlist.DelimitedText := str1;
    self.Memo1.Lines.Clear();
    self.Memo1.Lines.Add(str1);
    for i := 0 to strlist.Count - 1 do
    begin
      str2 := str2 + strlist.Strings[i] + ';';
    end;
    self.Memo2.Lines.Clear;
    self.Memo2.Lines.Add(str2);
  finally
    strlist.Clear();
    strlist.Free();
  end;
end;

procedure TfrmTestCRW.Button6Click(Sender: TObject);
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
    self.Memo1.Lines.Add(str1);
    for i := 0 to strlist.Count - 1 do
    begin
      str2 := str2 + strlist.Strings[i] + ';';
    end;
    self.Memo2.Lines.Clear;
    self.Memo2.Lines.Add(str2);
  finally
    strlist.Clear();
    strlist.Free();
  end;
end;

procedure TfrmTestCRW.FormCreate(Sender: TObject);
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
  finally
    xml.Free();
  end;
end;

end.
