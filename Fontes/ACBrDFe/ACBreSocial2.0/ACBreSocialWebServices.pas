{$I ACBr.inc}

unit ACBreSocialWebServices;

interface

uses
  Classes, SysUtils, ACBrDFe, ACBrDFeWebService, pcnRetConsCad, pcnAuxiliar, pcnConversao, eSocial_Conversao, eSocial_Common,
  pcnDistDFeInt, pcnRetDistDFeInt, ACBreSocialLoteEventos,  ACBreSocialEventos, ACBreSocialConfiguracoes;

type

  { TeSocialWebService }

  {
   Serão necessárias classes para os WS EnvioLote e ConsultaLoteEventos e seus respectivos retornos RetEnvioLote e RetProcLote
   (este possui um xsd específico para o retorno de cada evento RetEvento).

   Arquivos xsd vs. classe a ser construída:

   - TEnvioLote -> EnvioLoteEventos-v1_0_0.xsd;
   - TConsultaLoteEventos -> ConsultaLoteEventos-v1_0_0.xsd;
   - TRetEnvioLote -> RetornoEnvioLoteEventos-v1_0_0.xsd;
   - TRetProcLote -> RetornoProcessamentoLote-v1_0_0.xsd;
   - TRetEvento -> retornoEvento-v1_0_0.xsd;

   As Orientações para estas classes estão no Manual de Orientação do Desenvolvedor do e-Social v1.1 Item 5.
  }

  TeSocialWebService = class(TDFeWebService)
  private
  protected
    FPStatus: TStatusACBreSocial;//Fazer um enumerador
    FPLayout: TLayOut;
    FPConfiguracoeseSocial: TConfiguracoeseSocial;

    procedure ConfigurarSoapDEPC;
    function ExtrairModeloChaveAcesso(AChaveeSocial: String): String;

  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    function GerarVersaoDadosSoap: String; override;
    procedure FinalizarServico; override;

  public
    constructor Create(AOwner: TACBrDFe); override;

    property Status: TStatusACBreSocial read FPStatus;//?
    property Layout: TLayOut read FPLayout;
  end;

  { TOcorrencia }
  TOcorrencia = class
  private
    FCodigo : Integer;
    FDescricao : String;
    FTipo : Byte;
    FLocalizacao : String;
  public
    property Codigo : Integer read FCodigo write FCodigo;
    property Descricao : String read FDescricao write FDescricao;
    property Tipo : Byte read FTipo write FTipo;
    property Localizacao : String read FLocalizacao write FLocalizacao;
  end;

  { TOcorrencias }
  TOcorrencias = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TOcorrencia;
    procedure SetItem(Index: Integer; Value: TOcorrencia);
  public
    function Add: TOcorrencia;
    property Items[Index: Integer]: TOcorrencia read GetItem write SetItem; default;
  end;

  { TStatusEnvLote }
  TStatusEnvLote = class
  private
    FcdResposta : Integer;
	  FdescResposta : String;
  	FOcorrencias : TOcorrencias;
  public
    property cdResposta : Integer read FcdResposta write FcdResposta;
    property descResposta : String read FdescResposta write FdescResposta;
    property Ocorrencias : TOcorrencias read FOcorrencias write FOcorrencias;
  end;

  { TDadosRecepcaoLote }
  TDadosRecepcaoLote = class
  private
   	FdhRecepcao : TDateTime;
  	FversaoAplicRecepcao : String;
  	FProtocolo : String
  public
    property dhRecepcao : TDateTime read FdhRecepcao write FdhRecepcao;
    property versaoAplicRecepcao : String read FversaoAplicRecepcao write FversaoAplicRecepcao;
    property Protocolo : String read FProtocolo write FProtocolo;
  end;

  { TRetEnvLote }

  TRetEnvLote = class(TeSocialWebService)
  private
    FACBreSocial : TComponent;
    FIdeEmpregador : TIdeEmpregador;
	  FIdeTransmissor : TIdeTransmissor;
	  FStatusEnvLote : TStatusEnvLote;
	  FDadosRecepcaoLote : TDadosRecepcaoLote;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirURL; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;

    property IdeEmpregador : TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property IdeTransmissor : TIdeTransmissor read FIdeTransmissor write FIdeTransmissor;
    property StatusEnvLote : TStatusEnvLote read FStatusEnvLote write FStatusEnvLote;

  end;

  { TeSocialConsulta }

  TeSocialConsulta = class(TeSocialWebService)
  private
    FeSocialChave: String;//campo id de 36 posições
    FProtocolo: String;
    FDhRecbto: TDateTime;
    FXMotivo: String;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: integer;
    FcUF: integer;
    FReteSocialDFe: String;

    Fprot: TProc;//checar equivalente no esocial
    FprocEventoeSocial: TRetEventoeSocialCollection; // coleção de resposta do processamento de eventos...
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;

    property eSocialChave: String read FeSocialChave write FeSocialChave;
    property Protocolo: String read FProtocolo write FProtocolo;
    property DhRecbto: TDateTime read FDhRecbto write FDhRecbto;
    property XMotivo: String read FXMotivo write FXMotivo;
    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: integer read FcStat;
    property cUF: integer read FcUF;
    property ReteSocialDFe: String read FReteSocialDFe;

    property prot: TProc read Fprot;
    property procEventoeSocial: TRetEventoeSocialCollection read FprocEventoeSocial;
  end;

  { TEnvioLote }// usar para o WS EnviarLoteEventos

  TEnvioLote = class(TeSocialWebService)
  private
    FidLote: integer;
    Fversao: String;
    FLote: TLoteEventos;
    FcStat: integer;
    FxMotivo: String;
    FTpAmb: TpcnTipoAmbiente;

    FRetEnvLote: TRetEnvLote;

    function GerarPathEvento: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    procedure SalvarEnvio; override;
    function TratarResposta: Boolean; override;
    procedure SalvarResposta; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe); reintroduce; overload;
    destructor Destroy; override;

    property idLote: integer read FidLote write FidLote;
    property versao: String read Fversao write Fversao;
    property cStat: integer read FcStat;
    property xMotivo: String read FxMotivo;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;

    property RetEnvLote: TRetEnvLote read TRetEnvLote;
  end;

  { TeSocialEnvioWebService }

  TeSocialEnvioWebService = class(TeSocialWebService)
  private
    FXMLEnvio: String;
    FPURLEnvio: String;
    FVersao: String;
    FSoapActionEnvio: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgErro(E: Exception): String; override;
    function GerarVersaoDadosSoap: String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;
    function Executar: Boolean; override;

    property XMLEnvio: String read FXMLEnvio write FXMLEnvio;
    property URLEnvio: String read FPURLEnvio write FPURLEnvio;
    property SoapActionEnvio: String read FSoapActionEnvio write FSoapActionEnvio;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBreSocial: TACBrDFe;
    FRetorno: TRetRecepcao;
    FRecibo: TRecibo;
    FConsulta: TConsulta;
    FEnvioLote: TEnvioLote;
    FEnvioWebService: TEnvioWebService;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;

    function Envia(ALote: integer; const ASincrono: Boolean = False): Boolean;
      overload;
    function Envia(ALote: String; const ASincrono: Boolean = False): Boolean;
      overload;
    procedure Inutiliza(CNPJ, AJustificativa: String;
      Ano, Modelo, Serie, NumeroInicial, NumeroFinal: integer);

    property ACBreSocial: TACBrDFe read FACBreSocial write FACBreSocial;
    property Enviar: TRecepcao read FEnviar write FEnviar;
    property Retorno: TRetRecepcao read FRetorno write FRetorno;
    property Recibo: TRecibo read FRecibo write FRecibo;
    property Consulta: TConsulta read FConsulta write FConsulta;
    property EnvioLote: TEnvioLote read FEnvioLote write FEnvioLote;
    property EnvioWebService: TEnvioWebService read FEnvioWebService write FEnvioWebService;
  end;

implementation

uses
  StrUtils, Math,
  ACBrUtil, ACBreSocial, ACBreSocialConfiguracoes,
  pcnGerador, pcnConsStatServ, pcnRetConsStatServ,
  pcnConsCad, pcnLeitor;

{ TeSocialWebService }

constructor TeSocialWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPConfiguracoeseSocial := TConfiguracoeseSocial(FPConfiguracoes);
  FPLayout := LayEnvLoteEventos;//checar o layout
  FPStatus := stIdle;
end;

procedure TeSocialWebService.ConfigurarSoapDEPC;
begin
  FPSoapVersion := 'soap';
  FPHeaderElement := 'sceCabecMsg';
  FPSoapEnvelopeAtributtes :=
    'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' +
    'xmlns:xsd="http://www.w3.org/2001/XMLSchema"' +
    'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/';
  FPBodyElement := 'sceDadosMsg';
end;

function TeSocialWebService.ExtrairModeloChaveAcesso(AChaveeSocial: String): String;
begin
  AChaveeSocial := OnlyNumber(AChaveeSocial);
  if ValidarChave(AChaveeSocial) then
    Result := copy(AChaveeSocial, 21, 2)// checar esses valores no copy
  else
    Result := '';
end;

procedure TeSocialWebService.DefinirURL ;
var
  Versao: Double;
begin
  { sobrescrever apenas se necessário.
    Você também pode mudar apenas o valor de "FLayoutServico" na classe
    filha e chamar: Inherited;     }

  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';

  TACBreSocial(FPDFeOwner).LerServicoDeParams(FPLayout, Versao, FPURL);
  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;


function TeSocialWebService.GerarVersaoDadosSoap: String;
begin
  { Sobrescrever apenas se necessário }

  if EstaVazio(FPVersaoServico) then
    FPVersaoServico := TACBreSocial(FPDFeOwner).LerVersaoDeParams(FPLayout);

  Result := '<versaoDados>' + FPVersaoServico + '</versaoDados>';
end;

procedure TeSocialWebService.FinalizarServico;
begin
  { Sobrescrever apenas se necessário }

  TACBreSocial(FPDFeOwner).SetStatus(stIdle);
end;

{ TeSocialEnvioWebService }

constructor TeSocialEnvioWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPStatus := stEnvioWebService;
  FVersao := '';
end;

destructor TeSocialEnvioWebService.Destroy;
begin
  inherited Destroy;
end;

function TeSocialEnvioWebService.Executar: Boolean;
begin
  Result := inherited Executar;
end;

procedure TeSocialEnvioWebService.DefinirURL;
begin
  FPURL := FPURLEnvio;
end;

procedure TeSocialEnvioWebService.DefinirServicoEAction;
begin
  FPServico := FPSoapAction;
end;

procedure TeSocialEnvioWebService.DefinirDadosMsg;
var
  LeitorXML: TLeitor;
begin
  LeitorXML := TLeitor.Create;
  try
    LeitorXML.Arquivo := FXMLEnvio;
    LeitorXML.Grupo := FXMLEnvio;
    FVersao := LeitorXML.rAtributo('versao')
  finally
    LeitorXML.Free;
  end;

  FPDadosMsg := FXMLEnvio;
end;

function TeSocialEnvioWebService.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'soap:Body');
  Result := True;
end;

function TeSocialEnvioWebService.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService: '+FPServico + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TeSocialEnvioWebService.GerarVersaoDadosSoap: String;
begin
  Result := '<versaoDados>' + FVersao + '</versaoDados>';
end;

{ TWebServices }

constructor TWebServices.Create(AOwner: TACBrDFe);
begin
  FACBreSocial := TACBrDFe(AOwner);
  FRetorno := TNFeRetRecepcao.Create(FACBrNFe, TACBrNFe(FACBrNFe).NotasFiscais);
  FRecibo := TNFeRecibo.Create(FACBrNFe);
  FConsulta := TNFeConsulta.Create(FACBrNFe);
  FEnvioLote := TEnvioLote.Create(FACBreSocial);
  FEnvioWebService := TNFeEnvioWebService.Create(FACBrNFe);
end;

destructor TWebServices.Destroy;
begin
  FRetorno.Free;
  FRecibo.Free;
  FConsulta.Free;
  FEnvioLote.Free;
  FEnvioWebService.Free;

  inherited Destroy;
end;

function TWebServices.Envia(ALote: integer; const ASincrono: Boolean): Boolean;
begin
  Result := Envia(IntToStr(ALote), ASincrono);
end;

function TWebServices.Envia(ALote: String; const ASincrono: Boolean): Boolean;
begin
  FEnvioLote.FLote := ALote;

  if not EnvioLote.Executar then
    EnvioLote.GerarException( EnvioLote.Msg );

//ESOCIAL É ASSÍNCRONO !!!
//  if not ASincrono then
//  begin
//    FRetorno.Recibo := FEnviar.Recibo;
//    if not FRetorno.Executar then
//      FRetorno.GerarException( FRetorno.Msg );
//  end;

  Result := True;
end;

{ TOcorrencias }

function TOcorrencias.Add: TOcorrencia;
begin
  Result := TOcorrencia(inherited Add);
  Result.Create;
end;

function TOcorrencias.GetItem(Index: Integer): TOcorrencia;
begin
  Result := TOcorrencia(inherited GetItem(Index));
end;

procedure TOcorrencias.SetItem(Index: Integer; Value: TOcorrencia);
begin
  inherited SetItem(Index, Value);
end;

end.
