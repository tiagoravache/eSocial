// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.1.60:8088/EnviarLoteEventos?WSDL
//  >Import : http://192.168.1.60:8088/EnviarLoteEventos?WSDL>0
// Encoding : UTF-8
// Codegen  : [wfForceSOAP11+]
// Version  : 1.0
// (22/02/2016 16:25:47 - - $Rev: 25127 $)
// ************************************************************************ //

unit wsEnviarLoteEventos;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  loteEventos          = class;                 { "http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0"[Cplx] }
  EnviarLoteEventosResult = class;              { "http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0"[Cplx] }



  // ************************************************************************ //
  // XML       : loteEventos, <complexType>
  // Namespace : http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0
  // ************************************************************************ //
  loteEventos = class(TRemotable)
  private
    FMsg : String;
  public
    property Msg : String read FMsg write FMsg;
  end;



  // ************************************************************************ //
  // XML       : EnviarLoteEventosResult, <complexType>
  // Namespace : http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0
  // ************************************************************************ //
  EnviarLoteEventosResult = class(TRemotable)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0
  // soapAction: http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0/ServicoEnviarLoteEventos/EnviarLoteEventos
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : ServicosEmpregador_ServicoEnviarLoteEventos
  // service   : ServicoEnviarLoteEventos
  // port      : ServicosEmpregador_ServicoEnviarLoteEventos
  // URL       : http://TIAGO:8088/EnviarLoteEventos
  // ************************************************************************ //
  ServicoEnviarLoteEventos = interface(IInvokable)
  ['{53B25AA0-33C0-8702-7ED6-ECAA8334668A}']
    function  EnviarLoteEventos(const loteEventos: loteEventos): EnviarLoteEventosResult; stdcall;
  end;

function GetServicoEnviarLoteEventos(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServicoEnviarLoteEventos;


implementation
  uses SysUtils;

function GetServicoEnviarLoteEventos(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServicoEnviarLoteEventos;
const
  defWSDL = 'http://192.168.1.60:8088/EnviarLoteEventos?WSDL';
  defURL  = 'http://192.168.1.60:8088/EnviarLoteEventos';
  defSvc  = 'ServicoEnviarLoteEventos';
  defPrt  = 'ServicosEmpregador_ServicoEnviarLoteEventos';
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
    Result := (RIO as ServicoEnviarLoteEventos);
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


initialization
  InvRegistry.RegisterInterface(TypeInfo(ServicoEnviarLoteEventos), 'http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServicoEnviarLoteEventos), 'http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0/ServicoEnviarLoteEventos/EnviarLoteEventos');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServicoEnviarLoteEventos), ioDocument);
  RemClassRegistry.RegisterXSClass(loteEventos, 'http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0', 'loteEventos');
  RemClassRegistry.RegisterXSClass(EnviarLoteEventosResult, 'http://www.esocial.gov.br/servicos/empregador/lote/eventos/envio/v1_0_0', 'EnviarLoteEventosResult');

end.