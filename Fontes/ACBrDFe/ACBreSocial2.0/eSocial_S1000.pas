{******************************************************************************}
{ Projeto: Componente ACBreSocial                                              }
{  Biblioteca multiplataforma de componentes Delphi para envio dos eventos do  }
{ eSocial - http://www.esocial.gov.br/                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       André Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doação do componente para o Projeto ACBr
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S1000;

interface

uses
  SysUtils, Classes, ACBreSocialConsts,
  eSocial_Common, eSocial_Conversao,
  pcnConversao, ACBrUtil,
  ACBreSocialGerador;

type
  TS1000Collection = class;
  TS1000CollectionItem = class;
  TevtInfoEmpregador = class;

  {Classes específicas deste evento}
  TInfoEmpregador = class;
  TInfoCadastro = class;
  TDadosIsencao = class;
  TInfoOrgInternacional = class;
  TSoftwareHouseCollection = class;
  TSoftwareHouseCollectionItem = class;
  TInfoComplementares = class;
  TSituacaoPJ = class;
  TSituacaoPF = class;
  TPerc = class;
  TInfEnteFed = class;
  TInfoRPPS = class;
  TInfoFap = class;
  TLimitesRemCollection = class;
  TLimitesRemCollectionItem = class;
  TAliqEnteFedCollection = class;
  TAliqEnteFedCollectionItem = class;

  TS1000Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1000CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1000CollectionItem);
  public
    function Add: TS1000CollectionItem;
    property Items[Index: Integer]: TS1000CollectionItem read GetItem write SetItem; default;
  end;

  TS1000CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FevtInfoEmpregador: TevtInfoEmpregador;
    procedure setevtInfoEmpregador(const Value: TevtInfoEmpregador);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property evtInfoEmpregador: TevtInfoEmpregador read FevtInfoEmpregador write setevtInfoEmpregador;
  end;

  TevtInfoEmpregador = class(TeSocialEvento)//Classe do elemento principal do XML do evento!
  private
    FXMLAssinado: String;
    FModoLancamento: TModoLancamento;
    FIdeEvento: TIdeEvento;
    FIdeEmpregador: TIdeEmpregador;
    FInfoEmpregador: TInfoEmpregador;

    {Geradores específicos desta classe}
    procedure GerarInfoCadastro();
    procedure GerarInfoFap();
    procedure GerarDadosIsencao();
    procedure GerarContato();
    procedure GerarInfoOrgInternacional();
    procedure GerarSoftwareHouse();
    procedure GerarSituacaoPJ();
    procedure GerarSituacaoPF();
    procedure GerarInfoComplementares();
    procedure GerarLimitesRem();
    procedure GerarPerc(indexAliqEnteFed: Integer);
    procedure GerarAliqEnteFed();
    procedure GerarInfEnteFed();
    procedure GerarInfoRPPS();

  public
    constructor Create(AACBreSocial: TObject); overload;
    destructor  Destroy; override;

    function  GerarXML: boolean; override;

    property ModoLancamento: TModoLancamento read FModoLancamento write FModoLancamento;
    property ideEvento: TIdeEvento read FIdeEvento write FIdeEvento;
    property ideEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property infoEmpregador: TInfoEmpregador read FInfoEmpregador write FInfoEmpregador;
  end;

  TInfoEmpregador = class(TPersistent)
   private
    FidePeriodo: TIdePeriodo;
    FinfoCadastro: TInfoCadastro;
    FNovaValidade: TidePeriodo;
    function getInfoCadastro(): TInfoCadastro;
    function getNovaValidade(): TidePeriodo;
  public
    constructor Create;
    destructor Destroy; override;
    function infoCadastroInst(): Boolean;
    function novaValidadeInst(): Boolean;

    property idePeriodo: TIdePeriodo read FidePeriodo write FidePeriodo;
    property infoCadastro: TInfoCadastro read getInfoCadastro write FinfoCadastro;
    property novaValidade: TIdePeriodo read getNovaValidade write FnovaValidade;
  end;

  TInfoCadastro = class(TPersistent)
   private
    FNmRazao: string;
    FClassTrib: integer;
    FNatJurid: integer;
    FIndCoop: TpIndCoop;
    FIndConstr: TpIndConstr;
    FIndDesFolha: TpIndDesFolha;
    FIndOptRegEletron: TpIndOptRegEletron;
    FMultTabRubricas: tpSimNao;
    FNrSiafi: string;
    FInfoFap: TInfoFap;
    FDadosIsencao: TDadosIsencao;
    FContato: TContato;
    FInfoOrgInternacional: TInfoOrgInternacional;
    FSoftwareHouse: TSoftwareHouseCollection;
    FInfoComplementares: TInfoComplementares;
    FInfoRPPS: TInfoRPPS;
    function getInfoFap(): TInfoFap;
    function getDadosIsencao(): TDadosIsencao;
    function getInfoOrgInternacional(): TInfoOrgInternacional;
    function getInfoRPPS(): TInfoRPPS;
  public
    constructor Create;
    destructor Destroy; override;
    function infoRPPSInst(): Boolean;
    function infoOrgInternacionalInst(): Boolean;
    function dadosIsencaoInst(): Boolean;
    function infoFapInst(): Boolean;

    property NmRazao: string read FNmRazao write FNmRazao;
    property ClassTrib: integer read FClassTrib write FClassTrib;
    property NatJurid: integer read FNatJurid write FNatJurid;
    property IndCoop: TpIndCoop read FIndCoop write FIndCoop;
    property IndConstr: TpIndConstr read FIndConstr write FIndConstr;
    property IndDesFolha: TpIndDesFolha read FIndDesFolha write FIndDesFolha;
    property IndOptRegEletron: TpIndOptRegEletron read FIndOptRegEletron write FIndOptRegEletron;
    property MultTabRubricas: tpSimNao read FMultTabRubricas write FMultTabRubricas;
    property NrSiafi: string read FNrSiafi write FNrSiafi;
    property InfoFap: TInfoFap read getInfoFap write FInfoFap;
    property DadosIsencao: TDadosIsencao read getDadosIsencao write FDadosIsencao;
    property Contato: TContato read FContato write FContato;
    property InfoOrgInternacional: TInfoOrgInternacional read getInfoOrgInternacional write FInfoOrgInternacional;
    property SoftwareHouse: TSoftwareHouseCollection read FSoftwareHouse write FSoftwareHouse;
    property InfoComplementares: TInfoComplementares read FInfoComplementares write FInfoComplementares;
    property InfoRPPS: TInfoRPPS read getInfoRPPS write FInfoRPPS;
  end;

  TInfoComplementares = class(TPersistent)
   private
    FSituacaoPJ: TSituacaoPJ;
    FSituacaoPF: TSituacaoPF;
    function getSituacaoPJ(): TSituacaoPJ;
    function getSituacaoPF(): TSituacaoPF;
  public
    destructor destroy; override;
    function situacaoPFInst(): Boolean;
    function situacaoPJInst(): Boolean;

    property SituacaoPJ: TSituacaoPJ read getSituacaoPJ write FSituacaoPJ;
    property SituacaoPF: TSituacaoPF read getSituacaoPF write FSituacaoPF;
  end;

  TSituacaoPJ = class(TPersistent)
   private
    FIndSitPJ: tpIndSitPJ;
  public
    property IndSitPJ: tpIndSitPJ read FIndSitPJ write FIndSitPJ;
  end;

  TSituacaoPF = class(TPersistent)
   private
    FIndSitPF: tpIndSitPF;
  public
    property IndSitPF: tpIndSitPF read FIndSitPF write FIndSitPF;
  end;

  TDadosIsencao = class(TPersistent)
   private
    FSiglaMin: tpSiglaMin;
    FNrCertif: string;
    FDtEmisCertif : TDateTime;
    FDtVencCertif: TDateTime;
    FNrProtRenov: string;
    FDtProtRenov: TDateTime;
    FDtDou: TDateTime;
    FPagDou: string;
  public
    property SiglaMin: tpSiglaMin read FSiglaMin write FSiglaMin;
    property NrCertif: string read FNrCertif write FNrCertif;
    property DtEmisCertif: TDateTime read FDtEmisCertif write FDtEmisCertif;
    property DtVencCertif: TDateTime read FDtVencCertif write FDtVencCertif;
    property NrProtRenov: string read FNrProtRenov write FNrProtRenov;
    property DtProtRenov: TDateTime read FDtProtRenov write FDtProtRenov;
    property DtDou: TDateTime read FDtDou write FDtDou;
    property PagDou: string read FPagDou write FPagDou;
  end;

  TInfoOrgInternacional = class(TPersistent)
   private
    FIndAcordoIsenMulta: tpIndAcordoIsencaoMulta;
  public
    property IndAcordoIsenMulta: tpIndAcordoIsencaoMulta read FIndAcordoIsenMulta write FIndAcordoIsenMulta;
  end;

  TSoftwareHouseCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TSoftwareHouseCollectionItem;
    procedure SetItem(Index: Integer; Value: TSoftwareHouseCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TSoftwareHouseCollectionItem;
    property Items[Index: Integer]: TSoftwareHouseCollectionItem read GetItem write SetItem; default;
  end;

  TSoftwareHouseCollectionItem = class(TCollectionItem)
   private
    FCnpjSoftHouse: string;
    FNmRazao: string;
    FNmCont: string;
    FTelefone: string;
    Femail: string;
  public
    constructor create; reintroduce;

    property CnpjSoftHouse: string read FCnpjSoftHouse write FCnpjSoftHouse;
    property NmRazao: string read FNmRazao write FNmRazao;
    property NmCont: string read FNmCont write FNmCont;
    property Telefone: string read FTelefone write FTelefone;
    property email: string read Femail write Femail;
  end;

  TInfoFap = class(TPersistent)
   private
     Ffap: Double;
     FProcAdmJudFap: TProcAdmJudFap;
     function getProcAdmJudFap(): TProcAdmJudFap;
  public
    constructor Create;
    destructor Destroy; override;
    function procAdmJudFapInst(): Boolean;

    property fap: Double read Ffap write Ffap;
    property procAdmJudFap: TProcAdmJudFap read getProcAdmJudFap write FProcAdmJudFap;
  end;

  TLimitesRemCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TLimitesRemCollectionItem;
    procedure SetItem(Index: Integer; Value: TLimitesRemCollectionItem);
  public
    constructor create(); reintroduce;

    function Add: TLimitesRemCollectionItem;
    property Items[Index: Integer]: TLimitesRemCollectionItem read GetItem write SetItem; default;
  end;

  TLimitesRemCollectionItem = class(TCollectionItem)
   private
    FIdeSubteto: tpIdeSubteto;
    FValSubteto: Double;
    FIdMaior: string;
  public
    constructor create; reintroduce;
    property IdeSubteto: tpIdeSubteto read FIdeSubteto write FIdeSubteto;
    property ValSubteto: Double read  FValSubteto write FValSubteto;
    property IdMaior: string read FIdMaior write FIdMaior;
  end;

  TPerc = class(TPersistent)
   private
    FPercSeg: Double;
    FPercEnte: Double;
    FPercSupl: Double;
  public
    property PercSeg: Double read FPercSeg write FPercSeg;
    property PercEnte: Double read FPercEnte write FPercEnte;
    property PercSupl: Double read FPercSupl write FPercSupl;
  end;

  TAliqEnteFedCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TAliqEnteFedCollectionItem;
    procedure SetItem(Index: Integer; Value: TAliqEnteFedCollectionItem);
  public
    constructor Create();

    function Add: TAliqEnteFedCollectionItem;
    property Items[Index: Integer]: TAliqEnteFedCollectionItem read GetItem write SetItem; default;
  end;

  TAliqEnteFedCollectionItem = class(TCollectionItem)
   private
    FTpPublAlvo: tpTpPublAlvo;
    FDescSegDif: string;
    FPerc: TPerc;
    procedure setPerc(const value: TPerc);
  public
    constructor create; reintroduce;
    destructor Destroy; override;

    property TpPublAlvo: tpTpPublAlvo read FTpPublAlvo write FTpPublAlvo;
    property DescSegDif: string read FDescSegDif write FDescSegDif;
    property Perc: TPerc read FPerc write setPerc;
  end;

  TInfEnteFed = class(TPersistent)
   private
    FufEnteFed: tpuf;
    FcodMunic: Integer;
    FaliqEnteFed: TAliqEnteFedCollection;
    FlimitesRem: TLimitesRemCollection;
  public
    constructor create;
    destructor Destroy; override;

    property ufEnteFed: tpuf read FufEnteFed write FufEnteFed;
    property codMunic: Integer read FcodMunic write FcodMunic;
    property aliqEnteFed: TAliqEnteFedCollection read FaliqEnteFed write FaliqEnteFed;
    property limitesRem: TLimitesRemCollection read FlimitesRem write FlimitesRem;
  end;

  TInfoRPPS = class(TPersistent)
   private
    FindRPPS: tpSimNao;
    FinfEnteFed: TInfEnteFed;
    function getInfEnteFed(): TInfEnteFed;
  public
    constructor create;
    destructor Destroy; override;
    function infEnteFedInst(): Boolean;

    property indRPPS: tpSimNao read FindRPPS write FindRPPS;
    property infEnteFed: TInfEnteFed read getInfEnteFed write FinfEnteFed;
  end;


implementation

uses
  eSocial_Iniciais;

{ TS1000Collection }

function TS1000Collection.Add: TS1000CollectionItem;
begin
  Result := TS1000CollectionItem(inherited Add);
  Result.create(TComponent(Self.Owner));
end;

function TS1000Collection.GetItem(Index: Integer): TS1000CollectionItem;
begin
  Result := TS1000CollectionItem(inherited GetItem(Index));
end;

procedure TS1000Collection.SetItem(Index: Integer; Value: TS1000CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS1000CollectionItem }

constructor TS1000CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1000;
  FevtInfoEmpregador := TevtInfoEmpregador.Create(AOwner);
end;

destructor TS1000CollectionItem.Destroy;
begin
  FevtInfoEmpregador.Free;
  inherited;
end;

procedure TS1000CollectionItem.setevtInfoEmpregador(const Value: TevtInfoEmpregador);
begin
  FevtInfoEmpregador.Assign(Value);
end;

{ TevtInfoEmpregador }

constructor TevtInfoEmpregador.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEmpregador:= TIdeEmpregador.create;
  FIdeEvento:= TIdeEvento.create;
  FInfoEmpregador := TInfoEmpregador.Create;
end;

destructor TevtInfoEmpregador.Destroy;
begin
  FIdeEmpregador.Free;
  FIdeEvento.Free;
  FInfoEmpregador.Free;
  inherited;
end;

procedure TevtInfoEmpregador.GerarAliqEnteFed;
  var
      iAliqEnteFed: Integer;
begin
  for iAliqEnteFed := 0 to Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Count - 1 do
  begin
    Gerador.wGrupo('aliqEnteFed');
      Gerador.wCampo(tcStr, '', 'tpPublAlvo', 0, 0, 0, eSTpPublAlvoToStr(infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Items[iAliqEnteFed].TpPublAlvo));

      if (infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Items[iAliqEnteFed].DescSegDif <> '') then
        Gerador.wCampo(tcStr, '', 'descSegDif', 0, 0, 0, infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Items[iAliqEnteFed].DescSegDif);
      GerarPerc(iAliqEnteFed);
    Gerador.wGrupo('/aliqEnteFed');
  end;
end;

procedure TevtInfoEmpregador.GerarContato;
begin
  Gerador.wGrupo('contato');
    Gerador.wCampo(tcStr, '', 'nmCtt', 0, 0, 0, Self.infoEmpregador.infoCadastro.Contato.NmCtt);
    Gerador.wCampo(tcStr, '', 'cpfCtt', 0, 0, 0, Self.infoEmpregador.infoCadastro.Contato.CpfCtt);

    if (Self.infoEmpregador.infoCadastro.Contato.FoneFixo <> '') then
      Gerador.wCampo(tcStr, '', 'foneFixo', 0, 0, 0, Self.infoEmpregador.infoCadastro.Contato.FoneFixo);

    if (Self.infoEmpregador.infoCadastro.Contato.FoneCel <> '') then
      Gerador.wCampo(tcStr, '', 'foneCel', 0, 0, 0, Self.infoEmpregador.infoCadastro.Contato.FoneCel);

    if (Self.infoEmpregador.infoCadastro.Contato.email <> '') then
      Gerador.wCampo(tcStr, '', 'email', 0, 0, 0, Self.infoEmpregador.infoCadastro.Contato.email);
  Gerador.wGrupo('/contato');
end;

procedure TevtInfoEmpregador.GerarDadosIsencao;
begin
  if infoEmpregador.infoCadastro.dadosIsencaoInst() then
  begin
    Gerador.wGrupo('dadosIsencao');
      Gerador.wCampo(tcStr, '', 'siglaMin', 0, 0, 0, eSSiglaMinToStr(infoEmpregador.infoCadastro.DadosIsencao.SiglaMin));
      Gerador.wCampo(tcStr, '', 'nrCertif', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.NrCertif);
      Gerador.wCampo(tcDat, '', 'dtEmisCertif', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.DtEmisCertif);
      Gerador.wCampo(tcDat, '', 'dtVencCertif', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.DtVencCertif);

      if (infoEmpregador.infoCadastro.DadosIsencao.NrProtRenov <> '') then
        Gerador.wCampo(tcStr, '', 'nrProtRenov', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.NrProtRenov);

      if (DateToStr(infoEmpregador.infoCadastro.DadosIsencao.DtProtRenov) <> dDataBrancoNula) then
        Gerador.wCampo(tcDat, '', 'dtProtRenov', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.DtProtRenov);

      if (DateToStr(infoEmpregador.infoCadastro.DadosIsencao.DtDou) <> dDataBrancoNula) then
        Gerador.wCampo(tcDat, '', 'dtDou', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.DtDou);

      if (infoEmpregador.infoCadastro.DadosIsencao.PagDou <> '') then
        Gerador.wCampo(tcStr, '', 'pagDou', 0, 0, 0, infoEmpregador.infoCadastro.DadosIsencao.PagDou);
    Gerador.wGrupo('/dadosIsencao');
  end;
end;

procedure TevtInfoEmpregador.GerarInfEnteFed;
begin
  Gerador.wGrupo('infEnteFed');
    Gerador.wCampo(tcStr, '', 'ufEnteFed', 0, 0, 0, eSufToStr(Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.ufEnteFed));

    if (Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.codMunic <> 0) then
      Gerador.wCampo(tcInt, '', 'codMunic', 0, 0, 0, Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.codMunic);
    GerarAliqEnteFed();
    GerarLimitesRem();
  Gerador.wGrupo('/infEnteFed');
end;

procedure TevtInfoEmpregador.GerarInfoCadastro;
begin
  Gerador.wGrupo('infoCadastro');
    Gerador.wCampo(tcStr, '', 'nmRazao', 0, 0, 0, Self.infoEmpregador.infoCadastro.NmRazao);
    Gerador.wCampo(tcStr, '', 'classTrib', 0, 0, 0, Self.infoEmpregador.infoCadastro.ClassTrib);
    Gerador.wCampo(tcStr, '', 'natJurid', 0, 0, 0, Self.infoEmpregador.infoCadastro.NatJurid);
    Gerador.wCampo(tcStr, '', 'indCoop', 0, 0, 0, eSIndCooperativaToStr(Self.infoEmpregador.infoCadastro.IndCoop));
    Gerador.wCampo(tcStr, '', 'indConstr', 0, 0, 0, eSIndConstrutoraToStr(Self.infoEmpregador.infoCadastro.IndConstr));
    Gerador.wCampo(tcStr, '', 'indDesFolha', 0, 0, 0, eSIndDesFolhaToStr(Self.infoEmpregador.infoCadastro.IndDesFolha));
    Gerador.wCampo(tcStr, '', 'indOptRegEletron', 0, 0, 0, eSIndOptRegEletronicoToStr(Self.infoEmpregador.infoCadastro.IndOptRegEletron));
    Gerador.wCampo(tcStr, '', 'multTabRubricas', 0, 0, 0, eSSimNaoToStr(Self.infoEmpregador.infoCadastro.MultTabRubricas));

    if (Self.infoEmpregador.infoCadastro.NatJurid = 85) then
      Gerador.wCampo(tcStr, '', 'nrSiafi', 0, 0, 0, Self.infoEmpregador.infoCadastro.NrSiafi);

    GerarInfoFap();
    GerarDadosIsencao();
    GerarContato();
    GerarInfoOrgInternacional();
    GerarSoftwareHouse();
    GerarInfoComplementares();
    GerarInfoRPPS();
  Gerador.wGrupo('/infoCadastro');
end;

procedure TevtInfoEmpregador.GerarInfoComplementares;
begin
  Gerador.wGrupo('infoComplementares');    
    GerarSituacaoPJ();
    GerarSituacaoPF();
  Gerador.wGrupo('/infoComplementares');
end;

procedure TevtInfoEmpregador.GerarInfoFap;
begin
  if infoEmpregador.infoCadastro.infoFapInst() then
  begin
    Gerador.wGrupo('infoFap');
      Gerador.wCampo(tcDe4, '', 'fap', 0, 0, 0, infoEmpregador.infoCadastro.InfoFap.fap);
      if (infoEmpregador.infoCadastro.InfoFap.procAdmJudFapInst()) then
        GerarProcessoAdmJudFap(infoEmpregador.infoCadastro.InfoFap.procAdmJudFap);
    Gerador.wGrupo('/infoFap');
  end;
end;

procedure TevtInfoEmpregador.GerarInfoOrgInternacional;
begin
  if infoEmpregador.infoCadastro.infoOrgInternacionalInst() then
  begin
    Gerador.wGrupo('infoOrgInternacional');
      Gerador.wCampo(tcStr, '', 'indAcordoIsenMulta', 0, 0, 0, eSIndAcordoIsencaoMultaToStr(infoEmpregador.infoCadastro.InfoOrgInternacional.IndAcordoIsenMulta));
    Gerador.wGrupo('/infoOrgInternacional');
  end;
end;

procedure TevtInfoEmpregador.GerarInfoRPPS;
begin
  if infoEmpregador.infoCadastro.infoRPPSInst() then
  begin
    Gerador.wGrupo('infoRPPS');
      Gerador.wCampo(tcStr, '', 'indRPPS', 0, 0, 0, eSSimNaoToStr(infoEmpregador.infoCadastro.InfoRPPS.indRPPS));
      GerarInfEnteFed();
    Gerador.wGrupo('/infoRPPS');
  end;
end;

procedure TevtInfoEmpregador.GerarLimitesRem;
  var
      iLimitesRem: Integer;
begin
  for iLimitesRem := 0 to infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.limitesRem.Count - 1 do
  begin
    Gerador.wGrupo('limitesRem');
      Gerador.wCampo(tcStr, '', 'ideSubteto', 0, 0, 0, eSIdeSubtetoToStr(Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.limitesRem.Items[iLimitesRem].IdeSubteto));
      Gerador.wCampo(tcDe2, '', 'valSubteto', 0, 0, 0, Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.limitesRem.Items[iLimitesRem].ValSubteto);
      Gerador.wCampo(tcStr, '', 'idMaior', 0, 0, 0, Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.limitesRem.Items[iLimitesRem].IdMaior);
    Gerador.wGrupo('/limitesRem');
  end;
end;

procedure TevtInfoEmpregador.GerarPerc(indexAliqEnteFed: Integer);
begin
  Gerador.wGrupo('perc');
    Gerador.wCampo(tcDe2, '', 'percSeg', 0, 0, 0, Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Items[indexAliqEnteFed].Perc.PercSeg);
    Gerador.wCampo(tcDe2, '', 'percEnte', 0, 0, 0, Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Items[indexAliqEnteFed].Perc.PercEnte);
    Gerador.wCampo(tcDe2, '', 'percSupl', 0, 0, 0, Self.infoEmpregador.infoCadastro.InfoRPPS.infEnteFed.aliqEnteFed.Items[indexAliqEnteFed].Perc.percSupl);
  Gerador.wGrupo('/perc');
end;

procedure TevtInfoEmpregador.GerarSituacaoPF;
begin
  if infoEmpregador.infoCadastro.InfoComplementares.situacaoPFInst() then
  begin
    Gerador.wGrupo('situacaoPF');
      Gerador.wCampo(tcStr, '', 'indSitPF', 0, 0, 0, eSIndSitPFToStr(Self.infoEmpregador.infoCadastro.InfoComplementares.SituacaoPF.IndSitPF));
    Gerador.wGrupo('/situacaoPF');
  end;
end;

procedure TevtInfoEmpregador.GerarSituacaoPJ;
begin
  if infoEmpregador.infoCadastro.InfoComplementares.situacaoPJInst() then
  begin
    Gerador.wGrupo('situacaoPJ');
      Gerador.wCampo(tcStr, '', 'indSitPJ', 0, 0, 0, eSIndSitPJToStr(infoEmpregador.infoCadastro.InfoComplementares.SituacaoPJ.IndSitPJ));
    Gerador.wGrupo('/situacaoPJ');
  end;
end;

procedure TevtInfoEmpregador.GerarSoftwareHouse;
  var
      iSoftwareHouse: Integer;
begin
  for iSoftwareHouse := 0 to infoEmpregador.infoCadastro.SoftwareHouse.Count - 1 do
  begin
    Gerador.wGrupo('softwareHouse');
      Gerador.wCampo(tcStr, '', 'cnpjSoftHouse', 0, 0, 0, infoEmpregador.infoCadastro.SoftwareHouse[iSoftwareHouse].CnpjSoftHouse);
      Gerador.wCampo(tcStr, '', 'nmRazao', 0, 0, 0, infoEmpregador.infoCadastro.SoftwareHouse[iSoftwareHouse].NmRazao);
      Gerador.wCampo(tcStr, '', 'nmCont', 0, 0, 0, infoEmpregador.infoCadastro.SoftwareHouse[iSoftwareHouse].NmCont);
      Gerador.wCampo(tcStr, '', 'telefone', 0, 0, 0, infoEmpregador.infoCadastro.SoftwareHouse[iSoftwareHouse].Telefone);

      if (infoEmpregador.infoCadastro.SoftwareHouse[iSoftwareHouse].email <> '') then
        Gerador.wCampo(tcStr, '', 'email', 0, 0, 0,  infoEmpregador.infoCadastro.SoftwareHouse[iSoftwareHouse].email);
    Gerador.wGrupo('/softwareHouse');
  end;
end;

function TevtInfoEmpregador.GerarXML: boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtInfoEmpregador Id="'+ GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0) +'"');
        GerarIdeEvento(Self.IdeEvento);
        GerarIdeEmpregador(Self.IdeEmpregador);
        Gerador.wGrupo('infoEmpregador');
          GerarModoAbertura(Self.ModoLancamento);
          GerarIdePeriodo(Self.infoEmpregador.idePeriodo);
          if (Self.ModoLancamento <> mlExclusao) then
          begin
            GerarInfoCadastro;
            if ModoLancamento = mlAlteracao then
              if (InfoEmpregador.novaValidadeInst()) then
                GerarIdePeriodo(InfoEmpregador.novaValidade,'novaValidade');
          end;
          GerarModoFechamento(Self.ModoLancamento);
        Gerador.wGrupo('/infoEmpregador');
      Gerador.wGrupo('/evtInfoEmpregador');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtInfoEmpregador');//Gerador.ArquivoFormatoXML;
    Validar('evtInfoEmpregador');

  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '');
end;

{ TInfoEmpregador }

constructor TInfoEmpregador.Create;
begin
  inherited;
  FidePeriodo:= TIdePeriodo.Create;
  FinfoCadastro:= nil;
  FNovaValidade:= nil;
end;

destructor TInfoEmpregador.Destroy;
begin
  FidePeriodo.Free;
  FreeAndNil(FinfoCadastro);
  FreeAndNil(FNovaValidade);
  inherited;
end;

function TInfoEmpregador.getInfoCadastro: TInfoCadastro;
begin
  if Not(Assigned(FinfoCadastro)) then
    FinfoCadastro := TInfoCadastro.Create;
  Result := FinfoCadastro;
end;

function TInfoEmpregador.getNovaValidade: TidePeriodo;
begin
  if Not(Assigned(FNovaValidade)) then
    FNovaValidade := TIdePeriodo.Create;
  Result := FNovaValidade;
end;

function TInfoEmpregador.infoCadastroInst: Boolean;
begin
  Result := Assigned(FinfoCadastro);
end;

function TInfoEmpregador.novaValidadeInst: Boolean;
begin
  Result := Assigned(FNovaValidade);
end;

{ TInfoCadastro }

constructor TInfoCadastro.Create;
begin
  FInfoFap := nil;
  FDadosIsencao:= nil;
  FContato:= TContato.Create;
  FInfoOrgInternacional:= nil;
  FSoftwareHouse:= TSoftwareHouseCollection.Create;
  FInfoComplementares:= TInfoComplementares.Create;
  FInfoRPPS := nil;
end;

function TInfoCadastro.dadosIsencaoInst: Boolean;
begin
  Result := Assigned(FDadosIsencao);
end;

destructor TInfoCadastro.Destroy;
begin
  FreeAndNil(FInfoFap);
  FreeAndNil(FDadosIsencao);
  FContato.Free;
  FreeAndNil(FInfoOrgInternacional);
  FSoftwareHouse.Free;
  FInfoComplementares.Free;
  FreeAndNil(FInfoRPPS);
  inherited;
end;

function TInfoCadastro.getDadosIsencao: TDadosIsencao;
begin
  if Not(Assigned(FDadosIsencao)) then
    FDadosIsencao := TDadosIsencao.Create;
  Result := FDadosIsencao;
end;

function TInfoCadastro.getInfoFap: TInfoFap;
begin
  if Not(Assigned(FInfoFap)) then
    FInfoFap := TInfoFap.Create;
  Result := FInfoFap;
end;

function TInfoCadastro.getInfoOrgInternacional: TInfoOrgInternacional;
begin
  if Not(Assigned(FInfoOrgInternacional)) then
    FInfoOrgInternacional := TInfoOrgInternacional.Create;
  Result := FInfoOrgInternacional;
end;

function TInfoCadastro.getInfoRPPS: TInfoRPPS;
begin
  if Not(Assigned(FInfoRPPS)) then
    FInfoRPPS := TInfoRPPS.create;
  Result := FInfoRPPS;
end;

function TInfoCadastro.infoFapInst: Boolean;
begin
  Result := Assigned(FInfoFap);
end;

function TInfoCadastro.infoOrgInternacionalInst: Boolean;
begin
  Result := Assigned(FInfoOrgInternacional);
end;

function TInfoCadastro.infoRPPSInst: Boolean;
begin
  Result := Assigned(FInfoRPPS);
end;

{ TInfoFap }

constructor TInfoFap.Create;
begin
  FProcAdmJudFap := TProcAdmJudFap.Create;
end;

destructor TInfoFap.Destroy;
begin  
  FreeAndNil(FProcAdmJudFap);
  inherited;
end;

function TInfoFap.getProcAdmJudFap: TProcAdmJudFap;
begin
  if Not(Assigned(FProcAdmJudFap)) then
    FProcAdmJudFap := TProcAdmJudFap.Create;
  Result := FProcAdmJudFap;
end;

function TInfoFap.procAdmJudFapInst: Boolean;
begin
  Result := Assigned(FProcAdmJudFap);
end;

{ TInfoComplementares }

destructor TInfoComplementares.destroy;
begin
  FreeAndNil(FSituacaoPJ);
  FreeAndNil(FSituacaoPF);
  inherited;
end;

function TInfoComplementares.getSituacaoPF: TSituacaoPF;
begin
  if Not(Assigned(FSituacaoPF)) then
    FSituacaoPF := TSituacaoPF.Create;
  Result := FSituacaoPF;
end;

function TInfoComplementares.getSituacaoPJ(): TSituacaoPJ;
begin
  if Not(Assigned(FSituacaoPJ)) then
    FSituacaoPJ := TSituacaoPJ.Create;
  Result := FSituacaoPJ;
end;

function TInfoComplementares.situacaoPFInst: Boolean;
begin
  Result := Assigned(FSituacaoPF);
end;

function TInfoComplementares.situacaoPJInst: Boolean;
begin
  Result := Assigned(FSituacaoPJ);
end;

{ TAliqEnteFed }

constructor TAliqEnteFedCollectionItem.create;
begin
  FPerc := TPerc.Create;
end;

destructor TAliqEnteFedCollectionItem.destroy;
begin
  FreeAndNil(FPerc);
  inherited;
end;

procedure TAliqEnteFedCollectionItem.setPerc(const value: TPerc);
begin
  FreeAndNil(FPerc);
  FPerc := value;
end;

{ TInfEnteFed }

constructor TInfEnteFed.create;
begin
  FaliqEnteFed := TAliqEnteFedCollection.create;
  FlimitesRem := TLimitesRemCollection.Create;
end;

destructor TInfEnteFed.destroy;
begin
  FaliqEnteFed.Free;
  FlimitesRem.Free;
  inherited;
end;

{ TInfoRPPS }

constructor TInfoRPPS.create;
begin
  FinfEnteFed := nil;
end;

destructor TInfoRPPS.destroy;
begin
  FreeAndNil(FinfEnteFed);
  inherited;
end;

function TInfoRPPS.getInfEnteFed: TInfEnteFed;
begin
  if Not(Assigned(FinfEnteFed)) then
    FinfEnteFed := TInfEnteFed.create;
  Result := FinfEnteFed;
end;

function TInfoRPPS.infEnteFedInst: Boolean;
begin
  Result := Assigned(FinfEnteFed);
end;

{ TAliqEnteFedCollection }
function TAliqEnteFedCollection.Add: TAliqEnteFedCollectionItem;
begin
  Result := TAliqEnteFedCollectionItem(inherited Add());
  Result.create;
end;

constructor TAliqEnteFedCollection.Create;
begin
  inherited Create(TAliqEnteFedCollectionItem);
end;

function TAliqEnteFedCollection.GetItem(Index: Integer): TAliqEnteFedCollectionItem;
begin
  Result := TAliqEnteFedCollectionItem(inherited GetItem(Index))
end;

procedure TAliqEnteFedCollection.SetItem(Index: Integer; Value: TAliqEnteFedCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TLimitesRemCollection }  
function TLimitesRemCollection.Add: TLimitesRemCollectionItem;
begin
  Result := TLimitesRemCollectionItem(inherited Add());
  Result.Create();
end;

constructor TLimitesRemCollection.Create;
begin
  inherited Create(TLimitesRemCollectionItem);
end;

function TLimitesRemCollection.GetItem(Index: Integer): TLimitesRemCollectionItem;
begin
  Result := TLimitesRemCollectionItem(inherited GetItem(Index));
end;

procedure TLimitesRemCollection.SetItem(Index: Integer;Value: TLimitesRemCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TLimitesRemCollectionItem }     
constructor TLimitesRemCollectionItem.create;
begin
end;

{ TSoftwareHouseCollection }

function TSoftwareHouseCollection.Add: TSoftwareHouseCollectionItem;
begin
  Result := TSoftwareHouseCollectionItem(inherited add());
  Result.Create;
end;

constructor TSoftwareHouseCollection.create;
begin
  Inherited create(TSoftwareHouseCollectionItem);
end;

function TSoftwareHouseCollection.GetItem(
  Index: Integer): TSoftwareHouseCollectionItem;
begin
  Result := TSoftwareHouseCollectionItem(inherited GetItem(Index));
end;

procedure TSoftwareHouseCollection.SetItem(Index: Integer;
  Value: TSoftwareHouseCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TSoftwareHouseCollectionItem }

constructor TSoftwareHouseCollectionItem.create;
begin
end;

end.
