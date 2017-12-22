unit PatientInfoInput;

interface

uses
  System.SysUtils, System.Classes;

type
  TCardType = (IDENTITY, RESIDENCE_BOOKIET, PASSPORT, OFFICER_PAPER, DRIVER_LICENCE,
               INSUCARD, FILE_NO );
  TPatientInfoInput = class(TObject)
  private
     FReFreshID: String;
     FCardType: TCardType;
     FCardNumber: String;
     FName: String;
     FIDENNo: String;
     FCardID: String;
     FInsuSerial: String;
     FRequestID: String;
     FBirthdat: TDatetime;
     FSexCode: String;
     FNation: String;
     FAddress: String;
  public
    property ReFreshID: String read FReFreshID write FReFreshID;
    Property CardType: String read FCardType write FCardType;
    property CardNumber: String read FCardNumber write FCardNumber;
    property Name: String read FName write FName;
    property IDENNo: String read FIDENNo write FIDENNo;
    property CardID: String read FCardID write FCardID;
    property InsuSerial: String read FInsuSerial write FInsuSerial;
    property RequestID: String read FRequestID write FRequestID;
    property Birthdat: TDatetime read FBirthdat write FBirthdat;
    property SexCode: String read FSexCode write FSexCode;
    property Nation: String read FSexCode write FSexCode;
    property Address: String read FAddress write FAddress;
  end;




implementation

end.
