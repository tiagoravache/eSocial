{$I ACBr.inc}

unit ACBreSocialWebServices;

interface

uses
  Classes, SysUtils, ACBrDFe, ACBrDFeWebService, eSocial_Conversao, eSocial_Common,
  ACBreSocialLoteEventos,  ACBreSocialEventos, ACBreSocialConfiguracoes, ACBrUtil;

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
  TOcorrencia = class(TCollectionItem)
  private
    FCodigo : Integer;
    FDescricao : String;
    FTipo : Byte;
    FLocalizacao : String;
  public
    constructor Create; reintroduce;
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
  	FProtocolo : String;
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

  TretEvento = class(TCollectionItem)
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
    FACBreSocial : TACBrDFe;
    FProtocolo : String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner : TACBrDFe);
    destructor Destroy;
    procedure GerarXML;
    property Protocolo: String read FProtocolo write FProtocolo;
    end;

  { TEnvioLote }

  TEnvioLote = class(TeSocialWebService)
  private
    FVersao : String;
    FGrupo : Integer;
    FIdeEmpregador : TIdeEmpregador;
    FIdeTransmissor : TIdeTransmissor;
    FLote : TLoteEventos;
    FPURLEnvio : String;
    FXMLEnvio : String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    procedure SalvarEnvio; override;
    function TratarResposta: Boolean; override;
    procedure SalvarResposta; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
    function GerarMsgErro(E: Exception): String;
    function GerarVersaoDadosSoap: String;
  public
    constructor Create(AOwner : TACBrDFe);
    destructor Destroy;
    procedure GerarXML;
    function Executar : Boolean;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBreSocial: TACBrDFe;
    FEnvioLote  : TEnvioLote;
    FConsultaLote : TConsultaLote;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;
    function Envia(ALote: integer; const ASincrono: Boolean = False): Boolean;
      overload;
    function Envia(ALote: String; const ASincrono: Boolean = False): Boolean;
      overload;
    property ACBreSocial: TACBrDFe read FACBreSocial write FACBreSocial;
    property EnvioLote : TEnvioLote read FEnvioLote write FEnvioLote;
    property ConsultaLote : TConsultaLote read FConsultaLote write FConsultaLote;
  end;

implementation

uses
  StrUtils, Math, ACBreSocial, pcnLeitor;

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
    FPVersaoServico := 'v2.1.0';//TACBreSocial(FPDFeOwner).LerVersaoDeParams(FPLayout);

  Result := '<versaoDados>' + FPVersaoServico + '</versaoDados>';
end;

procedure TeSocialWebService.InicializarServico;
begin
  inherited;
//Implementar!
end;

procedure TeSocialWebService.FinalizarServico;
begin
  { Sobrescrever apenas se necessário }

  TACBreSocial(FPDFeOwner).SetStatus(stIdle);
end;

{ TEnvioLote }

constructor TEnvioLote.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPStatus := stIdle;
  FVersao := '';
end;

destructor TEnvioLote.Destroy;
begin
  inherited Destroy;
end;

function TEnvioLote.Executar: Boolean;
begin
  Result := inherited Executar;
end;

procedure TEnvioLote.DefinirURL;
begin
  FPURL := FPURLEnvio;
end;

procedure TEnvioLote.DefinirServicoEAction;
begin
  FPServico := FPSoapAction;
end;

procedure TEnvioLote.DefinirDadosMsg;
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

function TEnvioLote.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'soap:Body');
  Result := True;
end;

function TEnvioLote.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService: '+FPServico + #13#10 +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TEnvioLote.GerarMsgLog: String;
begin
//implementar!
end;

function TEnvioLote.GerarPrefixoArquivo: String;
begin
//implementar!
end;

function TEnvioLote.GerarVersaoDadosSoap: String;
begin
  Result := '<versaoDados>' + FVersao + '</versaoDados>';
end;

procedure TEnvioLote.GerarXML;
begin
//implementar!
end;

procedure TEnvioLote.SalvarEnvio;
begin
  inherited;
//implementar!
end;

procedure TEnvioLote.SalvarResposta;
begin
  inherited;
//implementar!
end;

{ TWebServices }

constructor TWebServices.Create(AOwner: TACBrDFe);
begin
  FACBreSocial := TACBrDFe(AOwner);
  FConsultaLote := TConsultaLote.Create(FACBreSocial);
  FEnvioLote := TEnvioLote.Create(FACBreSocial);
end;

destructor TWebServices.Destroy;
begin
  FConsultaLote.Free;
  FEnvioLote.Free;

  inherited Destroy;
end;

function TWebServices.Envia(ALote: integer; const ASincrono: Boolean): Boolean;
begin
  Result := Envia(IntToStr(ALote), ASincrono);
end;

function TWebServices.Envia(ALote: String; const ASincrono: Boolean): Boolean;
begin
  FEnvioLote.FLote.XML := ALote;

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

{ TOcorrencia }

constructor TOcorrencia.Create;
begin
end;

{ TRetEnvLote }

constructor TRetEnvLote.Create(AOwner: TACBrDFe);
begin
  inherited;
  FACBreSocial := AOwner;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeTransmissor := TIdeTransmissor.Create;
  FStatusEnvLote := TStatusEnvLote.Create;
  FDadosRecepcaoLote := TDadosRecepcaoLote.Create;
end;

destructor TRetEnvLote.Destroy;
begin
  FIdeEmpregador.Free;
  FIdeTransmissor.Free;
  FStatusEnvLote.Free;
  FDadosRecepcaoLote.Free;
  inherited;
end;

{ TretEventos }

function TretEventos.Add: TretEvento;
begin
  Result := TretEvento(inherited Add);
  Result.Create(self);
end;

function TretEventos.GetItem(Index: Integer): TretEvento;
begin
   Result := TretEvento(inherited GetItem(Index));
end;

procedure TretEventos.SetItem(Index: Integer; Value: TretEvento);
begin
  inherited SetItem(Index, Value);
end;

{ TRetProcLote }

constructor TRetProcLote.Create;
begin
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeTransmissor := TIdeTransmissor.Create;
  FStatus := TStatusProcLote.Create;
  FdadosRecLote := TDadosRecepcaoLote.Create;
  FdadosProcLote := TdadosProcLote.Create;
end;

destructor TRetProcLote.Destroy;
begin
  FIdeEmpregador.Free;
  FIdeTransmissor.Free;
  FStatus.Free;
  FdadosRecLote.Free;
  FdadosProcLote.Free;
end;

procedure TRetProcLote.LerXML;
begin
//Implementar
end;

{ TConsultaLote }

constructor TConsultaLote.Create(AOwner: TACBrDFe);
begin
  FACBreSocial := AOwner;
end;

procedure TConsultaLote.DefinirDadosMsg;
begin
  inherited;

end;

procedure TConsultaLote.DefinirServicoEAction;
begin
  inherited;

end;

destructor TConsultaLote.Destroy;
begin

end;

function TConsultaLote.GerarMsgLog: String;
begin

end;

function TConsultaLote.GerarPrefixoArquivo: String;
begin

end;

procedure TConsultaLote.GerarXML;
begin

end;

function TConsultaLote.TratarResposta: Boolean;
begin

end;

end.
