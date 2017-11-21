// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.1.108:9090/facadeServiceProxy?wsdl
//  >Import : http://192.168.1.108:9090/facadeServiceProxy?wsdl>0
// Encoding : UTF-8
// Version  : 1.0
// (2016/3/5 17:07:26 - - $Rev: 76228 $)
// ************************************************************************ //

unit facadeServiceProxyUnit;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  Exception            = class;                 { "http://services.agent.sinobest.cn/"[Flt][GblElm] }
  Exception2           = class;                 { "http://services.agent.sinobest.cn/"[GblCplx] }



  // ************************************************************************ //
  // XML       : Exception, global, <element>
  // Namespace : http://services.agent.sinobest.cn/
  // Info      : Fault
  // Base Types: Exception
  // ************************************************************************ //
  Exception = class(ERemotableException)
  private
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  published
    property message_: string  Index (IS_OPTN or IS_UNQL) read Fmessage_ write Setmessage_ stored message__Specified;
  end;



  // ************************************************************************ //
  // XML       : Exception, global, <complexType>
  // Namespace : http://services.agent.sinobest.cn/
  // ************************************************************************ //
  Exception2 = class(TRemotable)
  private
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  published
    property message_: string  Index (IS_OPTN or IS_UNQL) read Fmessage_ write Setmessage_ stored message__Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.agent.sinobest.cn/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : FacadeServiceProxyServiceSoapBinding
  // service   : FacadeServiceProxyService
  // port      : FacadeServiceProxyPort
  // URL       : http://192.168.1.108:9090/facadeServiceProxy
  // ************************************************************************ //
  FacadeServiceProxy = interface(IInvokable)
  ['{562675AC-0D27-086D-B5C0-ABAD918A2E3B}']
    function  login(const arg0: string; const arg1: string): string; stdcall;
    function  process(const arg0: string; const arg1: string): string; stdcall;
  end;

function GetFacadeServiceProxy(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): FacadeServiceProxy;


implementation
  uses System.SysUtils;

function GetFacadeServiceProxy(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): FacadeServiceProxy;
const
  //defWSDL = 'http://192.168.1.109:9090/facadeServiceProxy?wsdl';
  //defURL  = 'http://192.168.1.108:9090/facadeServiceProxy';
  defWSDL = 'http://192.168.1.107:9090/facadeServiceProxy?wsdl';
  defURL  = '';
  defSvc  = 'FacadeServiceProxyService';
  defPrt  = 'FacadeServiceProxyPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as FacadeServiceProxy);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure Exception.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function Exception.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

procedure Exception2.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function Exception2.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

initialization
  { FacadeServiceProxy }
  InvRegistry.RegisterInterface(TypeInfo(FacadeServiceProxy), 'http://services.agent.sinobest.cn/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FacadeServiceProxy), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(FacadeServiceProxy), ioHasNamespace);
  { FacadeServiceProxy.login }
  InvRegistry.RegisterMethodInfo(TypeInfo(FacadeServiceProxy), 'login', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(FacadeServiceProxy), 'login', 'arg0', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(FacadeServiceProxy), 'login', 'arg1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(FacadeServiceProxy), 'login', 'return', '',
                                '', IS_UNQL);
  { FacadeServiceProxy.process }
  InvRegistry.RegisterMethodInfo(TypeInfo(FacadeServiceProxy), 'process', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(FacadeServiceProxy), 'process', 'arg0', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(FacadeServiceProxy), 'process', 'arg1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(FacadeServiceProxy), 'process', 'return', '',
                                '', IS_UNQL);
  RemClassRegistry.RegisterXSClass(Exception, 'http://services.agent.sinobest.cn/', 'Exception');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(Exception), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSClass(Exception2, 'http://services.agent.sinobest.cn/', 'Exception2', 'Exception');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(Exception2), 'message_', '[ExtName="message"]');

end.