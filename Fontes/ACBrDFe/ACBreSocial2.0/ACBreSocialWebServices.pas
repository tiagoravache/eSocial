{$I ACBr.inc}

unit ACBreSocialWebServices;

interface

uses
  Classes, SysUtils, ACBrDFe, ACBrDFeWebService, pcnRetConsCad, pcnAuxiliar, pcnConversao, eSocial_Conversao, eSocial_Common,
  pcnDistDFeInt, pcnRetDistDFeInt, ACBreSocialLoteEventos,  ACBreSocialEventos, ACBreSocialConfiguracoes;

type

  TeSocialWebService = class(TDFeWebService)
  private
    FPStatus: TStatusACBreSocial;
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
    property Status: TStatusACBreSocial read FPStatus;
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
  TStatusRetorno = class
  private
    FcdResposta : Integer;
	  FdescResposta : String;
  	FOcorrencias : TOcorrencias;
  public
    property cdResposta : Integer read FcdResposta write FcdResposta;
    property descResposta : String read FdescResposta write FdescResposta;
    property Ocorrencias : TOcorrencias read FOcorrencias write FOcorrencias;
  end;

  TStatusEnvLote = class(TStatusRetorno);

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

  TStatusProcLote = class(TStatusRetorno)
  private
  	FTmpConclusao : Integer;
  public
  	property TmpConclusao : Integer read FTmpConclusao write FTmpConclusao;
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

  TdadosProcLote = class
  private
  	FversaoAplicProcLote : String;
  public
  	property versaoAplicProcLote : String read FversaoAplicProcLote write FversaoAplicProcLote;
  end;

  TRecepcao = class
  private
  	FtpAmb : TptpAmb;
  	FdhRecepcao : TDateTime;
  	FversaoAplicRecepcao : String;
  	Fprotocolo : String;
  end;

  TProcessamento = class
  	FcdResposta : String;
  	FdescResposta : String;
  	FversaoAplicProcLote : String;
  	FdhProcessamento : TDateTime;
  	FOcorrencias : TOcorrencias;
  end;

  TRecibo = class
  private
  	FnrRecibo : String;
  	FHash : String;
  end;

  TretEvento = class
  private
  	FId : String;
  	FRecepcao : TRecepcao;
  	FProcessamento : TProcessamento;
  	FRecibo : TRecibo;
  	FSignature : AnsiString;
  public
  end;

  TretEventos = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TretEvento;
    procedure SetItem(Index: Integer; Value: TretEvento);
  public
    function Add: TretEvento;
    property Items[Index: Integer]: TretEvento read GetItem write SetItem; default;
  end;

  TRetProcLote = class(TeSocialWebService)
  private
  	FIdeEmpregador : TIdeEmpregador;
  	FIdeTransmissor : TIdeTransmissor;
  	FStatus : TStatusProcLote;
  	FdadosRecLote : TDadosRecepcaoLote;
   	FdadosProcLote : TdadosProcLote;
  	FretEventos : TretEventos;
  public
  	constructor Create;
  	destructor Destroy;
  	procedure LerXML;
  end;

   { TeSocialConsulta }

  TConsultaLote = class(TeSocialWebService)
  private
    FProtocolo : String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(OProtocolo : String);
    destructor Destroy;
    procedure GerarXML;
    property Protocolo: String read FProtocolo write FProtocolo;
    end;

  { TEnvioLote }

  TEnvioLote = class(TeSocialWebService)
  private
    FGrupo : Integer;
    FIdeEmpregador : TIdeEmpregador;
    FIdeTransmissor : TIdeTransmissor;
    FEventos : TEventos;
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
    constructor Create;
    destructor Destroy;
    procedure GerarXML;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBreSocial: TACBrDFe;
    FEnvioLote  : TEnvioLote;
    FRetEnvLote : TRetEnvLote;
    FConsultaLote : TConsultaLote;
    FRetProcLote : TRetProcLote;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;
    function Envia(ALote: integer; const ASincrono: Boolean = False): Boolean;
      overload;
    function Envia(ALote: String; const ASincrono: Boolean = False): Boolean;
      overload;
    property ACBreSocial: TACBrDFe read FACBreSocial write FACBreSocial;
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
  FPHeaderElement := 'Header';
  FPSoapEnvelopeAtributtes :=
    'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' +
    'xmlns:xsd="http://www.w3.org/2001/XMLSchema"' +
    'xmlns:soap="http://www.w3.org/2003/05/soap-envelope/';
  FPBodyElement := 'Body';
end;

function TeSocialWebService.ExtrairModeloChaveAcesso(AChaveeSocial: String): String;
begin
//ESOCIAL NÃO POSSUI MODELO DE DF NA CHAVE
//  AChaveeSocial := OnlyNumber(AChaveeSocial);
//  if ValidarChave(AChaveeSocial) then
//    Result := copy(AChaveeSocial, 21, 2)// checar esses valores no copy
//  else
//    Result := '';
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
  FRetEnvLote := TRetEnvLote.Create(FACBreSocial);
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
