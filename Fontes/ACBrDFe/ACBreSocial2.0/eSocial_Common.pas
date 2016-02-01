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

unit eSocial_Common;

interface

uses
  SysUtils, Classes, eSocial_Conversao, Controls;

type
  {Classes existentes nesta unit}
  TeSocial = class;
  TAliqGilRat = class;
  TAlvaraJudicial = class;
  TAposentadoria = class;
  TBrasil = class;
  TCNH = class;
  TContato = class;
  TContatoTrabalhador = class;
  TInfoContrato = class;
  TCTPS = class;
  TDependenteCollection = class;
  TDependenteCollectionItem = class;
  TDescAtividadeCollection = class;
  TDescAtividadeCollectionItem = class;
  TDocumentos = class;
  TDuracao = class;
  TEndereco = class;
  TEpiCollection = class;
  TEpiCollectionItem = class;
  TExterior = class;
  TFGTS = class;
  TFiliacaoSindical = class;
  THorarioCollection = class;
  THorarioCollectionItem = class;
  THorContratual = class;
  TIdeEmpregador = class;
  TIdeTransmissor = class(TIdeEmpregador);
  TIdeEvento = class;
  TIdePeriodo = class;
  TIdeTomadorServ = class;
  TIdeTrabSubstituido = class;
  TIdeVinculo = class;
  TInfoAtivDesemp = class;
  TInfoDeficiencia = class;
  TLocalTrabalho = class;
  TNascimento = class;
  TProcAdmJudFap = class;
  TProcAdmJudRat = class;
  TRemuneracao = class;
  TRG = class;
  TRNE = class;
  TSucessaoVinc = class;
  TOC = class;
  TRIC = class;
  TTrabalhador = class;
  TTrabEstrangeiro = class;
  TTrabTemporario = class;
  TVinculo = class;
  TideTrabalhador = class;
  TideTrabalhador2 = class;
  TideTrabSemVinc = class;
  TIdeFolhaPagto = class;
  TEmitente = class;
  TEndExt = class;
  TIdePais = class;
  TInfoAgNocivo = class;
  TRubricaCollectionItem = class;
  TRubricaCollection = class;
  TRecPgtosCollectionItem = class;
  TRecPgtosCollection = class;
  TInfoASO = class;
  TLocalTrabGeral = class;
  TLocalTrabDom = class;
  TInfoCeletista = class;
  TInfoEstatutario = class;
  TInfoRegimeTrab = class;
  TAfastamento = class;
  TDesligamento = class;
  TInfoAmb = class;
  TInfoAtiv = class;
  TFatRisco = class;
  TcargoFuncao = class;
  TinfoEstagiario = class;
  TinstEnsino = class;
  TageIntegracao = class;
  TsupervisorEstagio = class;
  TVerbasResc = class;
  TQuarentena = class;
  TInfoProcJudCollection = class;
  TInfoProcJudItem = class;
  TideEstabLotCollection = class;
  TideEstabLotItem = class;
  TinfoSimples = class;
  TdetVerbasCollection = class;
  TdetVerbasItem = class;
  TProcJudTrabCollectionItem = class;
  TProcJudTrabCollection = class;
  TPensaoAlimCollectionItem = class;
  TPensaoAlimCollection = class;
  TDetPlanoCollectionItem = class;
  TDetPlanoCollection = class;
  TDetOperCollectionItem = class;
  TDetOperCollection = class;
  TInfoSaudeColet = class;


  TeSocial = class(TPersistent)
  private
    FId: string;
//    FVersao: string; - removido na versão 2.1
  published
    property Id: string read FId write FId;
//    property versao: string read FVersao write FVersao;
  end;

  TIdeFolhaPagto = class(TPersistent)
  private
    FindApuracao: tpIndApuracao;
    FperApur: string;
  published
    property indApuracao: tpIndApuracao read FindApuracao write FindApuracao;
    property perApur: string read FperApur write FperApur;
  end;

  TeSocialCollection = class(TCollection)

  end;

  TAliqGilRat = class(TPersistent)
  private
    FAliqRat: integer;
    FFap: Double;
    FAliqRatAjust: Double;
    FProcAdmJudRat: TProcAdmJudRat;
    FProcAdmJudFap: TProcAdmJudFap;
    function getProcAdmJudRat(): TProcAdmJudRat;
    function getProcAdmJudFat(): TProcAdmJudFap;
  public
    constructor Create;
    destructor Destroy; override;
    function procAdmJudRatInst(): Boolean;
    function procAdmJudFapInst(): Boolean;

    property AliqRat: integer read FAliqRat write FAliqRat;
    property Fap: Double read FFap write FFap;
    property AliqRatAjust: Double read FAliqRatAjust write FAliqRatAjust;
    property ProcAdmJudRat: TProcAdmJudRat read getProcAdmJudRat write FProcAdmJudRat;
    property ProcAdmJudFap: TProcAdmJudFap read getProcAdmJudFat write FProcAdmJudFap;
  end;

  TAlvaraJudicial = class
  private
    FNrProcJud: string;
  public
    property NrProcJud: string read FNrProcJud write FNrProcJud;
  end;

  TAposentadoria = class
  private
    FTrabAposent: string;
  public
    property TrabAposent: string read FTrabAposent write FTrabAposent;
  end;

  TBrasil = class
  private
    FTpLograd: string;
    FDscLograd: string;
    FNrLograd: string;
    FComplemento: string;
    FBairro: string;
    FCep: string;
    FCodMunic: integer;
    FUF: tpuf;
  public
    property TpLograd: string read FTpLograd write FTpLograd;
    property DscLograd: string read FDscLograd write FDscLograd;
    property NrLograd: string read FNrLograd write FNrLograd;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property CodMunic: integer read FCodMunic write FCodMunic;
    property UF: tpuf read FUF write FUF;
  end;

  TCNH = class
  private
    FnrRegCnh: string;
    FDtExped: TDateTime;
    FufCnh: tpuf;
    FDtValid: TDateTime;
    FdtPriHab: TDateTime;
    FcategoriaCnh: tpCnh;
  public
    property nrRegCnh: string read FnrRegCnh write FnrRegCnh;
    property DtExped: TDateTime read FDtExped write FDtExped;
    property ufCnh: tpuf read FufCnh write FufCnh;
    property DtValid: TDateTime read FDtValid write FDtValid;
    property dtPriHab: TDateTime read FdtPriHab write FdtPriHab;
    property categoriaCnh: tpCnh read FcategoriaCnh write FcategoriaCnh;
  end;

  TContato = class(TPersistent)
  private
    FNmCtt: string;
    FCpfCtt: string;
    FFoneFixo: string;
    FFoneCel: string;
    FEmail: string;
  public
    property NmCtt: string read FNmCtt write FNmCtt;
    property CpfCtt: string read FCpfCtt write FCpfCtt;
    property FoneFixo: string read FFoneFixo write FFoneFixo;
    property FoneCel: string read FFoneCel write FFoneCel;
    property Email: string read FEmail write FEmail;
  end;

  TContatoTrabalhador = class
  private
    FFonePrinc: string;
    FFoneAlternat: string;
    FEmailPrinc: string;
    FEmailAlternat: string;
  public
    property FonePrinc: string read FFonePrinc write FFonePrinc;
    property FoneAlternat: string read FFoneAlternat write FFoneAlternat;
    property EmailPrinc: string read FEmailPrinc write FEmailPrinc;
    property EmailAlternat: string read FEmailAlternat write FEmailAlternat;
  end;

  TInfoContrato = class
  private
    FCodCargo: string;
    FCodFuncao: string;
    FCodCateg: integer;

    FRemuneracao: TRemuneracao;
    FDuracao: TDuracao;
    FLocalTrabalho: TLocalTrabalho;
    FHorContratual: THorContratual;
    FInfoAtivDesemp: TInfoAtivDesemp;
    FFiliacaoSindical: TFiliacaoSindical;
    FAlvaraJudicial: TAlvaraJudicial;
  public
    constructor Create;
    destructor Destroy; override;

    property CodCargo: string read FCodCargo write FCodCargo;
    property CodFuncao: string read FCodFuncao write FCodFuncao;
    property CodCateg: integer read FCodCateg write FCodCateg;
    property Remuneracao: TRemuneracao read FRemuneracao write FRemuneracao;
    property Duracao: TDuracao read FDuracao write FDuracao;
    property LocalTrabalho: TLocalTrabalho read FLocalTrabalho write FLocalTrabalho;
    property HorContratual: THorContratual read FHorContratual write FHorContratual;
    property InfoAtivDesemp: TInfoAtivDesemp read FInfoAtivDesemp write FInfoAtivDesemp;
    property FiliacaoSindical: TFiliacaoSindical read FFiliacaoSindical write FFiliacaoSindical;
    property AlvaraJudicial: TAlvaraJudicial read FAlvaraJudicial write FAlvaraJudicial;
  end;

  TCTPS = class
  private
    FNrCtps: string;
    FSerieCtps: string;
    FUfCtps: string;
  public
    property NrCtps: string read FNrCtps write FNrCtps;
    property SerieCtps: string read FSerieCtps write FSerieCtps;
    property UfCtps: string read FUfCtps write FUfCtps;
  end;

  TDependenteCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TDependenteCollectionItem;
    procedure SetItem(Index: Integer; Value: TDependenteCollectionItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TDependenteCollectionItem;
    property Items[Index: Integer]: TDependenteCollectionItem read GetItem write SetItem; default;
  end;

  TDependenteCollectionItem = class(TCollectionItem)
  private
    FtpDep: tpTpDep;
    FnmDep: string;
    FdtNascto: TDateTime;
    FcpfDep: string;
    FdepIRRF: tpSimNao;
    FdepSF: tpSimNao;
   // FDepRPPS: tpSimNao;--removido na versão 2.1
  published
    constructor create; reintroduce;
    property tpDep: tpTpDep read FtpDep write FtpDep;
    property nmDep: string read FnmDep write FnmDep;
    property dtNascto: TDateTime read FdtNascto write FdtNascto;
    property cpfDep: string read FcpfDep write FcpfDep;
    property depIRRF: tpSimNao read FdepIRRF write FdepIRRF;
    property depSF: tpSimNao read FdepSF write FdepSF;
  //  property DepRPPS: tpSimNao read FDepRPPS write FDepRPPS; removido na versão 2.1
  end;

  TDescAtividadeCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TDescAtividadeCollectionItem;
    procedure SetItem(Index: Integer; Value: TDescAtividadeCollectionItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TDescAtividadeCollectionItem;
    property Items[Index: Integer]: TDescAtividadeCollectionItem read GetItem write SetItem; default;
  end;

  TDescAtividadeCollectionItem = class(TCollectionItem)
  private
    FdescAtivDesemp: string;
  public
    constructor create; reintroduce;
    property descAtivDesemp: string read FdescAtivDesemp write FdescAtivDesemp;
  end;

  TDocumentos = class
  private
    FCTPS: TCTPS;
    FRIC: TRIC;
    FRG: TRG;
    FRNE: TRNE;
    FOC: TOC;
    FCNH: TCNH;
  public
    constructor Create;
    destructor Destroy; override;

    property CTPS: TCTPS read FCTPS write FCTPS;
    property RIC: TRIC read FRIC write FRIC;
    property RG: TRG read FRG write FRG;
    property RNE: TRNE read FRNE write FRNE;
    property OC: TOC read FOC write FOC;
    property CNH: TCNH read FCNH write FCNH;
  end;

  TDuracao = class
  private
    FTpContr: tpTpContr;
    FdtTerm: TDateTime;
  public
    property TpContr: tpTpContr read FTpContr write FTpContr;
    property dtTerm: TDateTime read FdtTerm write FdtTerm;
  end;

  TEndereco = class
  private
    FBrasil: TBrasil;
    FExterior: TExterior;
  public
    constructor Create;
    destructor Destroy; override;

    property Brasil: TBrasil read FBrasil write FBrasil;
    property Exterior: TExterior read FExterior write FExterior;
  end;

  TEpiCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TEpiCollectionItem;
    procedure SetItem(Index: Integer; Value: TEpiCollectionItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TEpiCollectionItem;
    property Items[Index: Integer]: TEpiCollectionItem read GetItem write SetItem; default;
  end;

  TEpiCollectionItem = class(TCollectionItem)
  private
    FcaEPI: string;
    FeficaciaEpi : tpSimNao;
    FperiodicTroca: tpSimNao;
    FcondFuncto: tpSimNao;
    Fhigienizacao: tpSimNao;
    FmedProtecao: tpSimNao;
    FprzValid: tpSimNao;
  public
    constructor create; reintroduce;
    property caEPI: string read FcaEPI write FcaEPI;
    property eficaciaEpi : tpSimNao read FeficaciaEpi write FeficaciaEpi;
    property medProtecao: tpSimNao read FmedProtecao write FmedProtecao;
    property condFuncto: tpSimNao read FcondFuncto write FcondFuncto;
    property przValid : tpSimNao read FprzValid write FprzValid;
    property periodicTroca : tpSimNao read FperiodicTroca write FperiodicTroca;
    property higienizacao : tpSimNao read Fhigienizacao write Fhigienizacao;
  end;

  TExterior = class
  private
    FPaisResid: string;
    FDscLograd: string;
    FNrLograd: string;
    FComplemento: string;
    FBairro: string;
    FNmCid: string;
    FCodPostal: string;
  public
    property PaisResid: string read FPaisResid write FPaisResid;
    property DscLograd: string read FDscLograd write FDscLograd;
    property NrLograd: string read FNrLograd write FNrLograd;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property NmCid: string read FNmCid write FNmCid;
    property CodPostal: string read FCodPostal write FCodPostal;
  end;

  TFGTS = class
  private
    FOpcFGTS: tpOpcFGTS;
    FDtOpcFGTS: TDateTime;
  public
    property OpcFGTS: tpOpcFGTS read FOpcFGTS write FOpcFGTS;
    property DtOpcFGTS: TDateTime read FDtOpcFGTS write FDtOpcFGTS;
  end;

  TFiliacaoSindical = class
  private
    FCnpjSindTrab: string;
  public
    property CnpjSindTrab: string read FCnpjSindTrab write FCnpjSindTrab;
  end;

  THorarioCollection = class(TCollection)
  private
    function GetItem(Index: Integer): THorarioCollectionItem;
    procedure SetItem(Index: Integer; Value: THorarioCollectionItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: THorarioCollectionItem;
    property Items[Index: Integer]: THorarioCollectionItem read GetItem write SetItem; default;
  end;

  THorarioCollectionItem = class(TCollectionItem)
  private
    FDia: tpTpDia;
    FCodHorContrat: string;
  public
    constructor create; reintroduce;
    property Dia: tpTpDia read FDia write FDia;
    property CodHorContrat: string read FCodHorContrat write FCodHorContrat;
  end;

  THorContratual = class(TPersistent)
  private
    FQtdHrsSem: integer;
    FTpJornada: tpTpJornada;
    FDscTpJorn: string;
    FHorario: THorarioCollection;
  public
    constructor Create;
    destructor Destroy; override;

    property QtdHrsSem: integer read FQtdHrsSem write FQtdHrsSem;
    property TpJornada: tpTpJornada read FTpJornada write FTpJornada;
    property DscTpJorn: string read FDscTpJorn write FDscTpJorn;
    property horario: THorarioCollection read FHorario write FHorario;
  end;

  TIdeEmpregador = class(TPersistent)
  private
    FTpInsc: tpTpInsc;
    FNrInsc: string;
  public
    property TpInsc: tpTpInsc read FTpInsc write FTpInsc;
    property NrInsc: string read FNrInsc write FNrInsc;
  end;

  TIdeEvento = class(TPersistent)
  private
    FTpAmb: TpTpAmb;
    FProcEmi: TpProcEmi;
    FVerProc: string;
  public
    property TpAmb: TpTpAmb read FTpAmb write FTpAmb;
    property ProcEmi: TpProcEmi read FProcEmi write FProcEmi;
    property VerProc: string read FVerProc write FVerProc;
  end;

  TIdeEvento2 = class(TideEvento)
  private
    FIndRetif: tpIndRetificacao;
    FNrRecibo: string;
  public
    property indRetif: tpIndRetificacao read FIndRetif write FIndRetif;
    property NrRecibo: string read FNrRecibo write FNrRecibo;
  end;

  TIdeEvento3 = class(TideEvento2)
  private
    FIndApuracao: tpIndApuracao;
    FPerApur: string;
  public
    property IndApuracao: tpIndApuracao read FIndApuracao write FIndApuracao;
    property perApur: string read FPerApur write FPerApur;
  end;

  TIdeEvento4 = class(TPersistent)
  private
    FIndApuracao: tpIndApuracao;
    FPerApur: string;
    FTpAmb: TpTpAmb;
    FProcEmi: TpProcEmi;
    FVerProc: string;
  public
    property TpAmb: TpTpAmb read FTpAmb write FTpAmb;
    property ProcEmi: TpProcEmi read FProcEmi write FProcEmi;
    property VerProc: string read FVerProc write FVerProc;
    property IndApuracao: tpIndApuracao read FIndApuracao write FIndApuracao;
    property perApur: string read FPerApur write FPerApur;
  end;

  TIdePeriodo = class(TPersistent)
  private
    FIniValid: string;
    FFimValid: string;
  public
    property IniValid: string read FIniValid write FIniValid;
    property FimValid: string read FFimValid write FFimValid;
  end;

  TIdeTomadorServ = class
  private
    FTpInsc:  Integer;
    FNrInsc: string;
  public
    property TpInsc: Integer read FTpInsc write FTpInsc;
    property NrInsc: string read FNrInsc write FNrInsc;
  end;

  TIdeTrabSubstituido = class
  private
    FCpfTrabSubst:  string;
    FMatricTrabSubst: string;
  public
    property CpfTrabSubst:  string read FCpfTrabSubst write FCpfTrabSubst;
    property MatricTrabSubst: string read FMatricTrabSubst write FMatricTrabSubst;
  end;

  TIdeVinculo = class
  private
    FCpfTrab: string;
    FNisTrab: string;
    FMatricula: string;
  public
    property cpfTrab: string read FcpfTrab write FcpfTrab;
    property nisTrab: string read FNisTrab write FNisTrab;
    property matricula: string read FMatricula write FMatricula;
  end;

  TInfoAtivDesemp = class(TPersistent)
  private
    FDescAtividade: TDescAtividadeCollection;
  public
    constructor Create;
    destructor Destroy; override;

    property DescAtividade: TDescAtividadeCollection read FDescAtividade write FDescAtividade;
  end;

  TInfoDeficiencia = class
  private
    FDefMotora: tpSimNao;
    FDefVisual: tpSimNao;
    FDefMental: tpSimNao;
    FDefIntelectual: tpSimNao;
    FDefAuditiva: tpSimNao;
    FDefFisica: tpSimNao;
    FReabReadap: tpSimNao;
    FObservacao: string;
  public
    property DefFisica: tpSimNao read FDefFisica  write FDefFisica;
    property DefMental: tpSimNao read FDefMental  write FDefMental;
    property DefIntelectual: tpSimNao read FDefIntelectual write FDefIntelectual;
    property DefMotora: tpSimNao read FDefMotora write FDefMotora;
    property DefVisual: tpSimNao read FDefVisual write FDefVisual;
    property DefAuditiva: tpSimNao read FDefAuditiva write FDefAuditiva;
    property ReabReadap: tpSimNao read FReabReadap write FReabReadap;
    property Observacao: string read FObservacao write FObservacao;
  end;

  TLocalTrabGeral = class
  private
    FTpInsc: tpTpInsc;
    FNrInsc: string;
    FDescComp: string;
  public
    property TpInsc: tpTpInsc read FTpInsc write FTpInsc;
    property NrInsc: string read FNrInsc write FNrInsc;
    property DescComp: string read FDescComp write FDescComp;
  end;

  TLocalTrabDom = class
  private
    FTpLograd: integer;
    FDscLograd: string;
    FNrLograd: string;
    FComplemento: string;
    FBairro: string;
    FCep: string;
    FCodMunic: integer;
    FUf: tpuf;
  public
    property TpLograd: integer read FTpLograd write FTpLograd;
    property DscLograd: string read FDscLograd write FDscLograd;
    property NrLograd: string read FNrLograd write FNrLograd;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property CodMunic: integer read FCodMunic write FCodMunic;
    property Uf: tpuf read FUf write FUf;
  end;

  TLocalTrabalho = class
  private
    FLocalTrabGeral: TLocalTrabGeral;
    FLocalTrabDom: TLocalTrabDom;
  public
    constructor Create;
    destructor Destroy; override;

    property LocalTrabGeral: TLocalTrabGeral read FLocalTrabGeral write FLocalTrabGeral;
    property LocalTrabDom: TLocalTrabDom read FLocalTrabDom write FLocalTrabDom;
  end;

  TNascimento = class
  private
    FDtNascto: TDateTime;
    FCodMunic: integer;
    FUF: string;
    FPaisNascto: string;
    FPaisNac: string;
    FNmMae: string;
    FNmPai: string;
  public
    property dtNascto: TDateTime read FDtNascto write FDtNascto;
    property codMunic: integer read FCodMunic write FCodMunic;
    property UF: string read FUF write FUF;
    property PaisNascto: string read FPaisNascto write FPaisNascto;
    property PaisNac: string read FPaisNac write FPaisNac;
    property NmMae: string read FNmMae write FNmMae;
    property NmPai: string read FNmPai write FNmPai;
  end;

  TProcAdmJudFap = class(TPersistent)
  private
    FTpProc: tpTpProc;
    FNrProc: string;
  public
    property tpProc: tpTpProc read FTpProc write FTpProc;
    property nrProc: string read FNrProc write FNrProc;
  end;

  TProcAdmJudRat = class(TPersistent)
  private
    FTpProc: tpTpProc;
    FNrProc: string;
  public
    property tpProc: tpTpProc read FTpProc write FTpProc;
    property nrProc: string read FNrProc write FNrProc;
  end;

  TRemuneracao = class
  private
    FVrSalFx: double;
    FUndSalFixo: tpUndSalFixo;
    FDscSalVar: string;
  public
    property VrSalFx: double read FVrSalFx write FVrSalFx;
    property UndSalFixo: tpUndSalFixo read FUndSalFixo write FUndSalFixo;
    property DscSalVar: string read FDscSalVar write FDscSalVar;
  end;

  TRG = class
  private
    FNrRg: string;
    FOrgaoEmissor: string;
    FDtExped: TDateTime;
  public
    property NrRg: string read FNrRg write FNrRg;
    property OrgaoEmissor: string read FOrgaoEmissor write FOrgaoEmissor;
    property DtExped: TDateTime read FDtExped write FDtExped;
  end;

  TRNE = class
  private
    FNrRne: string;
    FOrgaoEmissor: string;
    FDtExped: TDateTime;
  public
    property NrRne: string read FNrRne write FNrRne;
    property OrgaoEmissor: string read FOrgaoEmissor write FOrgaoEmissor;
    property DtExped: TDateTime read FDtExped write FDtExped;
  end;

  TSucessaoVinc = class
  private
    FCnpj: string;
    FMatricAnt: string;
    FDtIniVinculo: TDateTime;
    FObservacao: string;
  public
    property Cnpj: string read FCnpj write FCnpj;
    property MatricAnt: string read FMatricAnt write FMatricAnt;
    property DtIniVinculo: TDateTime read FDtIniVinculo write FDtIniVinculo;
    property Observacao: string read FObservacao write FObservacao;
  end;

  TOC = class
  private
    FNrOc: string;
    FOrgaoEmissor: string;
    FDtExped: TDateTime;
    FDtValid: TDateTime;
  public
    property NrOc: string read FNrOc write FNrOc;
    property OrgaoEmissor: string read FOrgaoEmissor write FOrgaoEmissor;
    property DtExped: TDateTime read FDtExped write FDtExped;
    property DtValid: TDateTime read FDtValid write FDtValid;
  end;

  TRIC = class
  private
    FNrRic: string;
    FOrgaoEmissor: string;
    FDtExped: TDateTime;
  public
    property NrRic: string read FNrRic write FNrRic;
    property OrgaoEmissor: string read FOrgaoEmissor write FOrgaoEmissor;
    property DtExped: TDateTime read FDtExped write FDtExped;
  end;

  TTrabalhador = class(TPersistent)
  private
    FCpfTrab: string;
    FNisTrab: string;
    FNmTrab: string;
    FSexo: string;
    FRacaCor: integer;
    FEstCiv: integer;
    FGrauInstr: integer;

    FNascimento: TNascimento;
    FDocumentos: TDocumentos;
    FEndereco: TEndereco;
    FTrabEstrangeiro: TTrabEstrangeiro;
    FInfoDeficiencia: TInfoDeficiencia;
    FDependente: TDependenteCollection;
    FAposentadoria: TAposentadoria;
    FContato: TContatoTrabalhador;
  public
    constructor Create;
    destructor Destroy; override;

    property CpfTrab: string read FCpfTrab write FCpfTrab;
    property NisTrab: string read FNisTrab write FNisTrab;
    property NmTrab: string read FNmTrab write FNmTrab;
    property Sexo: string read FSexo write FSexo;
    property RacaCor: integer read FRacaCor write FRacaCor;
    property EstCiv: integer read FEstCiv write FEstCiv;
    property GrauInstr: integer read FGrauInstr write FGrauInstr;
    property Nascimento: TNascimento read FNascimento write FNascimento;
    property Documentos: TDocumentos read FDocumentos write FDocumentos;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property TrabEstrangeiro: TTrabEstrangeiro read FTrabEstrangeiro write FTrabEstrangeiro;
    property InfoDeficiencia: TInfoDeficiencia read FInfoDeficiencia write FInfoDeficiencia;
    property Dependente: TDependenteCollection read FDependente write FDependente;
    property Aposentadoria: TAposentadoria read FAposentadoria write FAposentadoria;
    property Contato: TContatoTrabalhador read FContato write FContato;
  end;

  TTrabEstrangeiro = class
  private
    FDtChegada: TDateTime;
    FClassTrabEstrang: tpClassTrabEstrang;
    FCasadoBr: string;
    FFilhosBr: string;
  public
    property DtChegada: TDateTime read FDtChegada write FDtChegada;
    property ClassTrabEstrang: tpClassTrabEstrang read FClassTrabEstrang write FClassTrabEstrang;
    property CasadoBr: string read FCasadoBr write FCasadoBr;
    property FilhosBr: string read FFilhosBr write FFilhosBr;
  end;

  TTrabTemporario = class
  private
    FmtvContrat: tpMtvContrat;

    FIdeTomadorServ: TIdeTomadorServ;
    FIdeTrabSubstituido: TIdeTrabSubstituido;
  public
    constructor Create;
    destructor Destroy; override;

    property MtvContrat: tpMtvContrat read FmtvContrat write FmtvContrat;
    property IdeTomadorServ: TIdeTomadorServ read FIdeTomadorServ write FIdeTomadorServ;
    property IdeTrabSubstituido: TIdeTrabSubstituido read FIdeTrabSubstituido write FIdeTrabSubstituido;
  end;


  TInfoCeletista = class
  private
    FDtAdm: TDate;
    FTpAdmissao: tpTpAdmissao;
    FIndAdmissao: tpTpIndAdmissao;
    FTpRegJor: tpTpRegJor;
    FNatAtividade: tpNatAtividade;
    FdtBase: Integer;
    FcnpjSindCategProf: string;

    FFGTS: TFGTS;
    FTrabTemporario: TTrabTemporario;
  public
    constructor Create;
    destructor Destroy; override;

    property DtAdm: TDate read FDtAdm write FDtAdm;
    property TpAdmissao: tpTpAdmissao read FTpAdmissao write FTpAdmissao;
    property IndAdmissao: tpTpIndAdmissao read FIndAdmissao write FIndAdmissao;
    property TpRegJor: tpTpRegJor read FTpRegJor write FTpRegJor;
    property NatAtividade: tpNatAtividade read FNatAtividade write FNatAtividade;
    property dtBase: Integer read FdtBase write FdtBase;
    property  cnpjSindCategProf: string read FcnpjSindCategProf write FcnpjSindCategProf;

    property FGTS: TFGTS read FFGTS write FFGTS;
    property TrabTemporario: TTrabTemporario read FTrabTemporario write FTrabTemporario;
  end;

  TInfoEstatutario = class
  private
    FIndProvim: tpIndProvim;
    FTpProv: tpTpProv;
    FDtNomeacao: TDate;
    FDtPosse: TDate;
    FDtExercicio: TDate;

  public
    property IndProvim: tpIndProvim read FIndProvim write FIndProvim;
    property TpProv: tpTpProv read FTpProv write FTpProv;
    property DtNomeacao: TDate read FDtNomeacao write FDtNomeacao;
    property DtPosse: TDate read FDtPosse write FDtPosse;
    property DtExercicio: TDate read FDtExercicio write FDtExercicio;
  end;

  TInfoRegimeTrab = class
  private
    FInfoCeletista: TInfoCeletista;
    FInfoEstatutario: TInfoEstatutario;
  public
    constructor Create;
    destructor Destroy; override;

    property InfoCeletista: TInfoCeletista read FInfoCeletista write FInfoCeletista;
    property InfoEstatutario: TInfoEstatutario read FInfoEstatutario write FInfoEstatutario;
  end;

  TInfoASO = class
  private
    FDtAso: TDate;
    FNrCRM: string;
    FUfCRM: tpuf;
  public
    property DtAso: TDate read FDtAso write FDtAso;
    property NrCRM: string read FNrCRM write FNrCRM;
    property UfCRM: tpuf read FUfCRM write FUfCRM;
  end;

  TAfastamento = class
  private
    FDtIniAfast: TDate;
    FcodMotAfast: String;
  public
    property DtIniAfast: TDate read FDtIniAfast write FDtIniAfast;
    property codMotAfast : String read FcodMotAfast write FcodMotAfast;
  end;

  TDesligamento = class
  private
    FDtDeslig: TDate;
  public
    property DtDeslig: TDate read FDtDeslig write FDtDeslig;
  end;


  TVinculo = class
  private
    FMatricula: string;
    FTpRegTrab: tpTpRegTrab;
    FTpRegPrev: tpTpRegPrev;
    FNrRecInfPrelim: string;

    FInfoRegimeTrab: TInfoRegimeTrab;
    FInfoContrato: TInfoContrato;
    FSucessaoVinc: TSucessaoVinc;
    FAfastamento: TAfastamento;
    FDesligamento: TDesligamento;
    FInfoASO: TInfoASO;
  public
    constructor Create;
    destructor Destroy; override;

    property Matricula: string read FMatricula write FMatricula;
    property TpRegTrab: tpTpRegTrab read FTpRegTrab write FTpRegTrab;
    property TpRegPrev: tpTpRegPrev read FTpRegPrev write FTpRegPrev;
    property NrRecInfPrelim: string read FNrRecInfPrelim write FNrRecInfPrelim;

    property InfoRegimeTrab: TInfoRegimeTrab read FInfoRegimeTrab write FInfoRegimeTrab;
    property InfoContrato: TInfoContrato read FInfoContrato write FInfoContrato;
    property SucessaoVinc: TSucessaoVinc read FSucessaoVinc write FSucessaoVinc;
    property Afastamento: TAfastamento read FAfastamento write FAfastamento;
    property Desligamento: TDesligamento read FDesligamento write FDesligamento;
    property InfoASO: TInfoASO read FInfoASO write FInfoASO;
  end;

  TideTrabalhador = class(TPersistent)  //S-2205;
  private
    FCpfTrab: string;
  public
    property cpfTrab: string read FCpfTrab write FCpfTrab;
  end;

  TideTrabalhador2 = class(TideTrabalhador) //S-2210;S-3000;
  private
    FNisTrab: string;
  public
    property nisTrab: string read FNisTrab write FNisTrab;
  end;

  TideTrabSemVinc = class(TideTrabalhador2)
     private
       FcodCateg : Integer;
     public
       property codCateg : Integer read FcodCateg write FcodCateg;
  end;

  TEmitente = class(TPersistent)
  private
    FnmEmit: string;
    FideOC: tpIdeOC;
    FnrOc: string;
    FufOC: tpuf;
  public
    property nmEmit: string read FnmEmit write FnmEmit;
    property ideOC: tpIdeOC read FideOC write FideOC;
    property nrOc: string read FnrOc write FnrOc;
    property ufOC: tpuf read FufOC write FufOC;
  end;

  TEndExt = class(TPersistent)
   private
    FDscLograd: string;
    FNrLograd: string;
    FComplem: string;
    FBairro: string;
    FNmCid: string;
    FCodPostal: string;
  public
    property dscLograd: string read FDscLograd write FDscLograd;
    property nrLograd: string read FNrLograd write FNrLograd;
    property complem: string read FComplem write FComplem;
    property bairro: string read FBairro write FBairro;
    property nmCid: string read FNmCid write FNmCid;
    property codPostal: string read FCodPostal write FCodPostal;
  end;

  TIdePais = class(TPersistent)
   private
    FCodPais: string;
    FIndNIF: tpIndNIF;
    FNifBenef: string;
  public
    property codPais: string read FCodPais write FCodPais;
    property indNIF: tpIndNIF read FIndNIF write FIndNIF;
    property nifBenef: string read FNifBenef write FNifBenef;
  end;

  TInfoAgNocivo = class(TPersistent)
   private
    FGrauExp: tpGrauExp;
  public
    property grauExp: tpGrauExp read FGrauExp write FGrauExp;
  end;

  TRubricaCollection = class(TCollection)
   private
  public
    function GetItem(Index: Integer): TRubricaCollectionItem;
    procedure SetItem(Index: Integer; Value: TRubricaCollectionItem);
  public
    constructor Create;
    function Add: TRubricaCollectionItem;
    property Items[Index: Integer]: TRubricaCollectionItem read GetItem write SetItem;
  end;

  TRubricaCollectionItem = class(TCollectionItem)
   private
    FCodRubr: string;
    FIdeTabRubr: string;
    FQtdRubr: Double;
    FVrUnit: Double;
    FVrRubr: Double;
  public
    constructor create; reintroduce;
    property codRubr: string read FCodRubr write FCodRubr;
    property ideTabRubr: string read FIdeTabRubr write FIdeTabRubr;
    property qtdRubr: Double read FQtdRubr write FQtdRubr;
    property vrUnit: Double read FVrUnit write FVrUnit;
    property vrRubr: Double read FVrRubr write FVrRubr;
  end;

  TReciboPagamento = class(TCollectionItem) // s1200
   private
    FIdeRecPgto: Integer;
    FvrRec : Double;
  public
    constructor create; reintroduce;
    property ideRecPgto: Integer read FIdeRecPgto write FIdeRecPgto;
    property vrRec : Double read FvrRec write FvrRec;
  end;

  TRecPgtosCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TRecPgtosCollectionItem;
    procedure SetItem(Index: Integer; Value: TRecPgtosCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TRecPgtosCollectionItem;
    property Items[Index: Integer]: TRecPgtosCollectionItem read GetItem write SetItem;
  end;

  TRecPgtosCollectionItem = class(TReciboPagamento) // s2299 ; s2399
   private
    FIdeRecPgto : Integer;
    FVlrPgto: Double;
    FideEstabLot : TIdeEstabLotCollection;
  public
    constructor Create;
    property vlrPgto: Double read FVlrPgto write FVlrPgto;
    property IdeRecPgto: Integer read FIdeRecPgto write FIdeRecPgto;
    property ideEstabLot : TideEstabLotCollection read FideEstabLot write FideEstabLot;
  end;

  TideEstabLotCollection = class(TCollection)
     private
      function GetItem(Index: Integer): TideEstabLotItem;
     procedure SetItem(Index: Integer; Value: TideEstabLotItem);
   public
     constructor create; reintroduce;
     function Add: TideEstabLotItem;
     property Items[Index: Integer]: TideEstabLotItem read GetItem write SetItem;
  end;

  TideEstabLotItem = class(TCollectionItem)
     private
      FtpInsc : tpTpInsc;
      FnrInsc : String;
      FcodLotacao : String;
      FdetVerbas : TdetVerbasCollection;
      FinfoAgNocivo : TInfoAgNocivo;
      FinfoSimples : TinfoSimples;
    public
      constructor Create; reintroduce;

      property tpInsc : tpTpInsc read FtpInsc write FtpInsc;
      property nrInsc : string read FnrInsc write FnrInsc;
      property codLotacao : string read FcodLotacao write FcodLotacao;
      property detVerbas : TdetVerbasCollection read FdetVerbas write FdetVerbas;
      property infoAgNocivo : TInfoAgNocivo read FinfoAgNocivo write FinfoAgNocivo;
      property infoSimples : TinfoSimples read FinfoSimples write FinfoSimples;
  end;

  TInfoAmb = class(TPersistent)
    private
      FcodAmb : String;
      FInfoAtiv: TInfoAtiv;
      FFatRisco: TFatRisco;
      FEPI : TEpiCollection;

      procedure setInfoAtiv(const Value: TInfoAtiv);
      procedure setFatRisco(const Value: TFatRisco);
      procedure setEPI(const Value: TEpiCollection);
    public
      constructor create;
      destructor  Destroy; override;

      property codAmb : String read FcodAmb write FcodAmb;
      property InfoAtiv : TInfoAtiv read FInfoAtiv write setInfoAtiv;
      property FatRisco : TFatRisco read FFatRisco write setFatRisco;
      property EPI : TEpiCollection read FEPI write setEPI;
  end;

  TInfoAtiv = class(TPersistent)
    private
      FdscAtivDes : String;
    public
      property dscAtivDes : String read FdscAtivDes write FdscAtivDes;
  end;

  TFatRisco = class(TPersistent)
    private
      FcodFatRis : String;
      FintConc : String;
      FtecMedicao : String;
      FutilizEPI : Integer;
    public
      property codFatRis: String read FcodFatRis write FcodFatRis;
      property intConc : String read FintConc write FintConc;
      property tecMedicao: String read FtecMedicao write FtecMedicao;
      property utilizEPI : Integer read FutilizEPI write FutilizEPI;
  end;

  TcargoFuncao = class(TPersistent)
    private
      FcodCargo : String;
      FcodFuncao : String;
    public
      property codCargo: String read FcodCargo write FcodCargo;
      property codFuncao: String read FcodFuncao write FcodFuncao;
  end;


  TProcJudTrabCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TProcJudTrabCollectionItem;
    procedure SetItem(Index: Integer; Value: TProcJudTrabCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TProcJudTrabCollectionItem;
    property Items[Index: Integer]: TProcJudTrabCollectionItem read GetItem write SetItem;
  end;

  TProcJudTrabCollectionItem = class(TCollectionItem)
  private
    FTpTrib: tpTpTributo;
    FNrProcJud: string;
  published
    constructor create; reintroduce;
    property tpTrib: tpTpTributo read FTpTrib write FTpTrib;
    property nrProcJud: string read FNrProcJud write FNrProcJud;
  end;


  TinfoEstagiario = class(TPersistent)
    private
      FnatEstagio : TpNatEstagio;
      FnivEstagio : TpNivelEstagio;
      FareaAtuacao : String;
      FnrApol : String;
      FvlrBolsa : Double;
      FdtPrevTerm : TDate;
      FinstEnsino : TinstEnsino;
      FageIntegracao : TageIntegracao;
      FsupervisorEstagio : TsupervisorEstagio;
    public
      constructor Create;
      destructor  Destroy; override;

      property natEstagio : TpNatEstagio read FnatEstagio write FnatEstagio;
      property nivEstagio : TpNivelEstagio read FnivEstagio write FnivEstagio;
      property areaAtuacao : String read FareaAtuacao write FareaAtuacao;
      property nrApol : String read FnrApol write FnrApol;
      property vlrBolsa : Double read FvlrBolsa write FvlrBolsa;
      property dtPrevTerm : TDate read FdtPrevTerm write FdtPrevTerm;
      property instEnsino : TinstEnsino read FinstEnsino write FinstEnsino;
      property ageIntegracao : TageIntegracao read FageIntegracao write FageIntegracao;
      property supervisorEstagio : TsupervisorEstagio read FsupervisorEstagio write FsupervisorEstagio;
  end;

  TinstEnsino = class(TPersistent)
    private
      FcnpjInstEnsino : String;
      FnmRazao : String;
      FdscLograd : String;
      FnrLograd : String;
      Fbairro : String;
      FCep : String;
      FcodMunic : Integer;
      FUf : tpUf;
    public
      property cnpjInstEnsino : String read FcnpjInstEnsino write FcnpjInstEnsino;
      property nmRazao : String read FnmRazao write FnmRazao;
      property dscLograd : String read FdscLograd write FdscLograd;
      property nrLograd : String read FnrLograd write FnrLograd;
      property bairro : String read Fbairro write Fbairro;
      property Cep : String read FCep write FCep;
      property codMunic : Integer read FcodMunic write FcodMunic;
      property Uf : tpUf read FUf write FUf;
  end;

  TageIntegracao = class(TPersistent)
    private
      FcnpjAgntInteg : String;
      FnmRazao : String;
      FdscLograd : String;
      FnrLograd : String;
      Fbairro : String;
      FCep : String;
      FcodMunic : Integer;
      FUf : tpUf;
    public
      property cnpjAgntInteg : String read FcnpjAgntInteg write FcnpjAgntInteg;
      property nmRazao : String read FnmRazao write FnmRazao;
      property dscLograd : String read FdscLograd write FdscLograd;
      property nrLograd : String read FnrLograd write FnrLograd;
      property bairro : String read Fbairro write Fbairro;
      property Cep : String read FCep write FCep;
      property codMunic : Integer read FcodMunic write FcodMunic;
      property Uf : tpUf read FUf write FUf;
  end;

  TsupervisorEstagio = class(TPersistent)
    private
      FcpfSupervisor : String;
      FnmSuperv : String;
    public
      property cpfSupervisor : String read FcpfSupervisor write FcpfSupervisor;
      property nmSuperv : String read FnmSuperv write FnmSuperv;
  end;

    TQuarentena = class(TPersistent)
    private
      FdtFimQuar : TDate;
    public
      property dtFimQuar: TDate read FdtFimQuar write FdtFimQuar;
  end;

  TVerbasResc = class(TPersistent)
    private
      FRecPgtos : TRecPgtosCollection;
      FProcJudTrab : TinfoProcJudCollection;
    public
      constructor Create;
      destructor Destroy; override;

      property RecPgtos: TRecPgtosCollection read FRecPgtos write FRecPgtos;
      property ProcJudTrab: TinfoProcJudCollection read FProcJudTrab write FProcJudTrab;
  end;

  TdetVerbasCollection = class(TCollection)
     private
      function GetItem(Index: Integer): TdetVerbasItem;
      procedure SetItem(Index: Integer; Value: TdetVerbasItem);
    public
      constructor Create(AOwner: TPersistent);
      function Add: TdetVerbasItem;
      property Items[Index: Integer]: TdetVerbasItem read GetItem write SetItem; default;
  end;

  TdetVerbasItem = class(TCollectionItem)
    private
      FcodRubr : String;
      FideTabRubr: String;
      FqtdRubr: Integer;
      FvrUnit: Double;
      FvrRubr: Double;
    public
      property codRubr: String read FcodRubr write FcodRubr;
      property ideTabRubr: String read FideTabRubr write FideTabRubr;
      property qtdRubr: Integer read FqtdRubr write FqtdRubr;
      property vrUnit: Double read FvrUnit write FvrUnit;
      property vrRubr: DOuble read FvrRubr write FvrRubr;
  end;

  TinfoSimples = class(TPersistent)
    private
      FindSimples : tpIndSimples;
    public
      property indSimples : tpIndSimples read FindSimples write FindSimples;
  end;


  TInfoProcJudCollection = class(TCollection)
    private
      function GetItem(Index: Integer): TInfoProcJudItem;
      procedure SetItem(Index: Integer; Value: TInfoProcJudItem);
    public
      constructor Create(AOwner: TPersistent);
      function Add: TInfoProcJudItem;
      property Items[Index: Integer]: TInfoProcJudItem read GetItem write SetItem; default;
  end;

  TInfoProcJudItem=class(TCollectionItem)
  private
    FtpProc : tpTpProc;
    FtpTrib : tpTpTributo;
    FnrProcJud: string;//em S1250 o campo é nrProcJUD e em S1260 é apenas nrProc - deixado nrProcJud para reutilização da classe
    FvrCPNRet: Double;
    FvrRatNRet: Double;
    FvrSenarNRet: Double;
  public
    property tpProc: tpTpProc read FtpProc write FtpProc;
    property tpTrib: tpTpTributo read FtpTrib write FtpTrib;
    property nrProcJud: string read FnrProcJud write FnrProcJud;
    property vrCPNRet: Double read FvrCPNRet write FvrCPNRet;
    property vrRatNRet: Double read FvrRatNRet write FvrRatNRet;
    property vrSenarNRet: Double read FvrSenarNRet write FvrSenarNRet;
  end;

  TPensaoAlimCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TPensaoAlimCollectionItem;
    procedure SetItem(Index: Integer; Value: TPensaoAlimCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TPensaoAlimCollectionItem;
    property Items[Index: Integer]: TPensaoAlimCollectionItem read GetItem write SetItem;
  end;

  TPensaoAlimCollectionItem = class(TCollectionItem)
   private
    FCpfBenef: string;
    FDtNasctoBenef: TDate;
    FNmBenefic: string;
    FVlrPensao: Double;
  public
    constructor create; reintroduce;

    property cpfBenef: string read FCpfBenef write FCpfBenef;
    property dtNasctoBenef: TDate read FDtNasctoBenef write FDtNasctoBenef;
    property nmBenefic: string read FNmBenefic write FNmBenefic;
    property vlrPensao: Double read FVlrPensao write FVlrPensao;
  end;

  TDetPlanoCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TDetPlanoCollectionItem;
    procedure SetItem(Index: Integer; Value: TDetPlanoCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TDetPlanoCollectionItem;
    property Items[Index: Integer]: TDetPlanoCollectionItem read GetItem write SetItem;
  end;

  TDetPlanoCollectionItem = class(TCollectionItem)
   private
    FCpfDep: string;
    FDtNasctoDep: TDate;
    FNmDep: string;
    FRelDep: tpRelDependencia;
    FVlrPgDep: Double;
  public
    constructor create; reintroduce;

    property cpfDep: string read FCpfDep write FCpfDep;
    property dtNasctoDep: TDate read FDtNasctoDep write FDtNasctoDep;
    property nmDep: string read FNmDep write FNmDep;
    property relDep: tpRelDependencia read FRelDep write FRelDep;
    property vlrPgDep: Double read FVlrPgDep write FVlrPgDep;
  end;

  TDetOperCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TDetOperCollectionItem;
    procedure SetItem(Index: Integer; Value: TDetOperCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TDetOperCollectionItem;
    property Items[Index: Integer]: TDetOperCollectionItem read GetItem write SetItem;
  end;

  TDetOperCollectionItem = class(TCollectionItem)
   private
    FCnpjOper: string;
    FRegANS: string;
    FVrPgTit: Double;
    FDetPlanoCollection: TDetPlanoCollection;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    property cnpjOper: string read FCnpjOper write FCnpjOper;
    property regANS: string read FRegANS write FRegANS;
    property vrPgTit: Double read FVrPgTit write FVrPgTit;
    property detPlano: TDetPlanoCollection read FDetPlanoCollection write FDetPlanoCollection;
  end;

  TInfoSaudeColet = class(TPersistent)
   private
    FDetOper: TDetOperCollection;
  public
    constructor Create;
    destructor Destroy;

    property detOper: TDetOperCollection read FDetOper write FDetOper;
  end;

implementation

uses ACBreSocial;

{ TAliqRat }
constructor TAliqGilRat.Create;
begin
  inherited;
  FProcAdmJudRat := nil;
  FProcAdmJudFap := nil;
end;

destructor TAliqGilRat.Destroy;
begin
  FreeAndNil(FProcAdmJudRat);
  FreeAndNil(FProcAdmJudFap);
  inherited;
end;

function TAliqGilRat.getProcAdmJudFat: TProcAdmJudFap;
begin
  if Not(Assigned(FProcAdmJudFap)) then
    FProcAdmJudFap := TProcAdmJudFap.Create;
  Result := FProcAdmJudFap;
end;

function TAliqGilRat.getProcAdmJudRat: TProcAdmJudRat;
begin
  if Not(Assigned(FProcAdmJudRat)) then
    FProcAdmJudRat := TProcAdmJudRat.Create;
  Result := FProcAdmJudRat;
end;

function TAliqGilRat.procAdmJudFapInst: Boolean;
begin
  Result := Assigned(FProcAdmJudFap);
end;

function TAliqGilRat.procAdmJudRatInst: Boolean;
begin
  Result := Assigned(FProcAdmJudRat);
end;

{ TDocumentos }
constructor TDocumentos.Create;
begin
  inherited;
  FCTPS:= TCTPS.Create;
  FRIC:= TRIC.Create;
  FRG:= TRG.Create;
  FRNE:= TRNE.Create;
  FOC:= TOC.Create;
  FCNH:= TCNH.Create;
end;

destructor TDocumentos.Destroy;
begin
  FCTPS.Free;
  FRIC.Free;
  FRG.Free;
  FRNE.Free;
  FOC.Free;
  FCNH.Free;
  inherited;
end;

{ TEndereco }
constructor TEndereco.Create;
begin
  FBrasil:= TBrasil.Create;
  FExterior:= TExterior.Create;
end;

destructor TEndereco.Destroy;
begin
  FBrasil.Free;
  FExterior.Free;
  inherited;
end;

{ TDependenteCollection }
function TDependenteCollection.Add: TDependenteCollectionItem;
begin
  Result := TDependenteCollectionItem(inherited Add);
  Result.Create;
end;

constructor TDependenteCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TDependenteCollectionItem);
end;

function TDependenteCollection.GetItem(
  Index: Integer): TDependenteCollectionItem;
begin
  Result := TDependenteCollectionItem(inherited GetItem(Index));
end;

procedure TDependenteCollection.SetItem(Index: Integer;
  Value: TDependenteCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TTrabalhador }
constructor TTrabalhador.Create;
begin
  inherited;
  FNascimento:= TNascimento.Create;
  FDocumentos:= TDocumentos.Create;
  FEndereco:= TEndereco.Create;
  FTrabEstrangeiro:= TTrabEstrangeiro.Create;
  FInfoDeficiencia:= TInfoDeficiencia.Create;
  FDependente:= TDependenteCollection.Create(Self);
  FAposentadoria:= TAposentadoria.Create;
  FContato:= TContatoTrabalhador.Create;
end;

destructor TTrabalhador.Destroy;
begin
  FNascimento.Free;
  FDocumentos.Free;
  FEndereco.Free;
  FTrabEstrangeiro.Free;
  FInfoDeficiencia.Free;
  FDependente.Free;
  FAposentadoria.Free;
  FContato.Free;
  inherited;
end;

{ TTrabTemporario }
constructor TTrabTemporario.Create;
begin
  FIdeTomadorServ:= TIdeTomadorServ.Create;
  FIdeTrabSubstituido:= TIdeTrabSubstituido.Create;
end;

destructor TTrabTemporario.Destroy;
begin
  FIdeTomadorServ.Free;
  FIdeTrabSubstituido.Free;
  inherited;
end;

{ THorarioCollection }
function THorarioCollection.Add: THorarioCollectionItem;
begin
  Result := THorarioCollectionItem(inherited Add);
  Result.Create;
end;

constructor THorarioCollection.Create(AOwner: TPersistent);
begin
  inherited Create(THorarioCollectionItem);
end;

function THorarioCollection.GetItem(Index: Integer): THorarioCollectionItem;
begin
  Result := THorarioCollectionItem(inherited GetItem(Index));
end;

procedure THorarioCollection.SetItem(Index: Integer;
  Value: THorarioCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ THorContratual }
constructor THorContratual.Create;
begin
  inherited;
  FHorario:= THorarioCollection.Create(Self);
end;

destructor THorContratual.Destroy;
begin
  FHorario.Free;
  inherited;
end;

{ TDescAtividadeCollection }
function TDescAtividadeCollection.Add: TDescAtividadeCollectionItem;
begin
  Result := TDescAtividadeCollectionItem(inherited Add);
  Result.Create;
end;

constructor TDescAtividadeCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TDescAtividadeCollectionItem);
end;

function TDescAtividadeCollection.GetItem(
  Index: Integer): TDescAtividadeCollectionItem;
begin
  Result := TDescAtividadeCollectionItem(inherited GetItem(Index));
end;

procedure TDescAtividadeCollection.SetItem(Index: Integer;
  Value: TDescAtividadeCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoAtivDesemp }
constructor TInfoAtivDesemp.Create;
begin
  inherited;
  FDescAtividade:= TDescAtividadeCollection.Create(Self);
end;

destructor TInfoAtivDesemp.Destroy;
begin
  FDescAtividade.Free;
  inherited;
end;

{ TContrato }
constructor TInfoContrato.Create;
begin
  FRemuneracao:= TRemuneracao.Create;
  FDuracao:= TDuracao.Create;
  FLocalTrabalho:= TLocalTrabalho.Create;
  FHorContratual:= THorContratual.Create;
  FInfoAtivDesemp:= TInfoAtivDesemp.Create;
  FFiliacaoSindical:= TFiliacaoSindical.Create;
  FAlvaraJudicial:= TAlvaraJudicial.Create;
end;

destructor TInfoContrato.Destroy;
begin
  FRemuneracao.Free;
  FDuracao.Free;
  FLocalTrabalho.Free;
  FHorContratual.Free;
  FInfoAtivDesemp.Free;
  FFiliacaoSindical.Free;
  FAlvaraJudicial.Free;
  inherited;
end;

{ TVinculo }
constructor TVinculo.Create;
begin
  FInfoRegimeTrab := TInfoRegimeTrab.Create;
  FInfoContrato:= TInfoContrato.Create;
  FSucessaoVinc:= TSucessaoVinc.Create;
  FAfastamento := TAfastamento.Create;
  FDesligamento := TDesligamento.Create;
  FInfoASO := TInfoASO.Create;
end;

destructor TVinculo.Destroy;
begin
  FInfoRegimeTrab.Free;
  FInfoContrato.Free;
  FSucessaoVinc.Free;
  FAfastamento.Free;
  FDesligamento.Free;
  FInfoASO.Free;
  inherited;
end;

{ TEpiCollection }
function TEpiCollection.Add: TEpiCollectionItem;
begin
  Result := TEpiCollectionItem(inherited Add);
  Result.Create;
end;

constructor TEpiCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TEpiCollectionItem);
end;

function TEpiCollection.GetItem(Index: Integer): TEpiCollectionItem;
begin
  Result := TEpiCollectionItem(inherited GetItem(Index));
end;

procedure TEpiCollection.SetItem(Index: Integer;
  Value: TEpiCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TRubricaCollectionItem }
constructor TRubricaCollectionItem.create;
begin
end;

{ TRubricaCollection }
function TRubricaCollection.Add: TRubricaCollectionItem;
begin
  Result := TRubricaCollectionItem(inherited Add);
  Result.create;
end;

constructor TRubricaCollection.Create;
begin
 inherited Create(TRubricaCollectionItem);
end;

function TRubricaCollection.GetItem(Index: Integer): TRubricaCollectionItem;
begin
  Result := TRubricaCollectionItem(inherited GetItem(Index));
end;

procedure TRubricaCollection.SetItem(Index: Integer;
  Value: TRubricaCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TReciboPagamento }
constructor TReciboPagamento.create;
begin
end;

{ TRecPgtosCollection }
function TRecPgtosCollection.Add: TRecPgtosCollectionItem;
begin
  Result := TRecPgtosCollectionItem(inherited Add);
  Result.create;
end;

constructor TRecPgtosCollection.create;
begin
  inherited create(TRecPgtosCollectionItem);
end;

function TRecPgtosCollection.GetItem(Index: Integer): TRecPgtosCollectionItem;
begin
  Result := TRecPgtosCollectionItem(inherited GetItem(Index));
end;

procedure TRecPgtosCollection.SetItem(Index: Integer;
  Value: TRecPgtosCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TDependenteCollectionItem }
constructor TDependenteCollectionItem.create;
begin
end;

{ THorarioCollectionItem }
constructor THorarioCollectionItem.create;
begin
end;

{ TDescAtividadeCollectionItem }
constructor TDescAtividadeCollectionItem.create;
begin
end;

{ TEpiCollectionItem }
constructor TEpiCollectionItem.create;
begin
end;

{ TInfoRegimeTrab }
constructor TInfoRegimeTrab.Create;
begin
  FInfoCeletista := TInfoCeletista.Create;
  FInfoEstatutario := TInfoEstatutario.Create;
end;

destructor TInfoRegimeTrab.Destroy;
begin
  FInfoCeletista.Free;
  FInfoEstatutario.Free;
  inherited;
end;

{ TInfoCeletista }
constructor TInfoCeletista.Create;
begin
  FFGTS := TFGTS.Create;
  FTrabTemporario := TTrabTemporario.Create;
end;

destructor TInfoCeletista.Destroy;
begin
  FFGTS.Free;
  FTrabTemporario.Free;
  inherited;
end;

{ TLocalTrabalho }
constructor TLocalTrabalho.Create;
begin
  FLocalTrabGeral := TLocalTrabGeral.Create;
  FLocalTrabDom := TLocalTrabDom.Create;
end;

destructor TLocalTrabalho.Destroy;
begin
  FLocalTrabGeral.Free;
  FLocalTrabDom.Free;
  inherited;
end;

{ TInfoAmb }

constructor TInfoAmb.create;
begin
  inherited;
  FInfoAtiv := TInfoAtiv.Create;
  FFatRisco := TFatRisco.Create;
  FEPI      := TEpiCollection.Create(Self);
end;

destructor TInfoAmb.destroy;
begin
  FInfoAtiv.Free;
  FFatRisco.Free
end;

procedure TInfoAmb.setEPI(const Value: TEpiCollection);
begin
  FEPI.Assign(Value);
end;

procedure TInfoAmb.setFatRisco(const Value: TFatRisco);
begin
  FFAtRisco.Assign(Value);
end;

procedure TInfoAmb.setInfoAtiv(const Value: TInfoAtiv);
begin
  FInfoAtiv.Assign(Value);
end;

{ TinfoEstagiario }

constructor TinfoEstagiario.Create;
begin
  inherited;
  FinstEnsino := TinstEnsino.Create;
  FageIntegracao := TageIntegracao.Create;
  FsupervisorEstagio := TsupervisorEstagio.Create;
end;

destructor TinfoEstagiario.Destroy;
begin
  FinstEnsino.Free;
  FageIntegracao.Free;
  FsupervisorEstagio.Free;
  inherited;
end;

{ TVerbasResc }

constructor TVerbasResc.create;
begin
  inherited;
  FRecPgtos := TRecPgtosCollection.Create;
  FProcJudTrab := TinfoProcJudCollection.Create(Self);
end;

destructor TVerbasResc.Destroy;
begin
  FRecPgtos.Free;
  FProcJudTrab.Free;
  inherited;
end;

{ TInfoProcJudCollection }

function TInfoProcJudCollection.Add: TInfoProcJudItem;
begin
  Result:= TinfoProcJudItem(inherited Add);
  Result.Create(Self);
end;

constructor TInfoProcJudCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TinfoProcJudItem);
end;

function TInfoProcJudCollection.GetItem(Index: Integer): TInfoProcJudItem;
begin
  Result := TInfoProcJudItem(inherited GetItem(Index));
end;

procedure TInfoProcJudCollection.SetItem(Index: Integer; Value: TInfoProcJudItem);
begin
  inherited SetItem(Index, Value);
end;

{ TRecPgtosCollectionItem }

constructor TRecPgtosCollectionItem.Create;
begin
  inherited;
  FideEstabLot := TideEstabLotCollection.Create;
end;


{ TdetVerbasCollection }

function TdetVerbasCollection.Add: TdetVerbasItem;
begin
  Result := TdetVerbasItem(inherited Add);
  Result.Create(Self);
end;

constructor TdetVerbasCollection.Create(AOwner: TPersistent);
begin
   inherited Create(TdetVerbasItem);
end;

function TdetVerbasCollection.GetItem(Index: Integer): TdetVerbasItem;
begin
  Result := TdetVerbasItem(inherited GetItem(Index));
end;

procedure TdetVerbasCollection.SetItem(Index: Integer; Value: TdetVerbasItem);
begin
  inherited SetItem(Index, Value);
end;

{ TideEstabLotCollection }

function TideEstabLotCollection.Add: TideEstabLotItem;
begin
  Result := TideEstabLotItem(inherited Add);
  Result.Create;
end;

constructor TideEstabLotCollection.create;
begin
  inherited Create(TideEstabLotItem);
end;

function TideEstabLotCollection.GetItem(Index: Integer): TideEstabLotItem;
begin
  Result := TideEstabLotItem(inherited GetItem(index));
end;

procedure TideEstabLotCollection.SetItem(Index: Integer; Value: TideEstabLotItem);
begin
  inherited SetItem(Index, Value);
end;

{ TideEstabLotItem }

constructor TideEstabLotItem.Create;
begin
  FdetVerbas := TdetVerbasCollection.Create(Self);
  FinfoAgNocivo := TInfoAgNocivo.Create;
  FinfoSimples := TinfoSimples.Create;
end;

{ TProcJudTrab }
constructor TProcJudTrabCollectionItem.create;
begin
end;

{ TProcJudTrabCollection }
function TProcJudTrabCollection.Add: TProcJudTrabCollectionItem;
begin
  Result := TProcJudTrabCollectionItem(inherited Add);
  Result.create;
end;

constructor TProcJudTrabCollection.create;
begin
  inherited create(TProcJudTrabCollectionItem);
end;

function TProcJudTrabCollection.GetItem(
  Index: Integer): TProcJudTrabCollectionItem;
begin
  Result := TProcJudTrabCollectionItem(inherited GetItem(Index));
end;

procedure TProcJudTrabCollection.SetItem(Index: Integer;
  Value: TProcJudTrabCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TPensaoAlimCollection }
function TPensaoAlimCollection.Add: TPensaoAlimCollectionItem;
begin
  Result := TPensaoAlimCollectionItem(inherited Add);
  Result.create;
end;

constructor TPensaoAlimCollection.create;
begin
  inherited create(TPensaoAlimCollectionItem)
end;

function TPensaoAlimCollection.GetItem(
  Index: Integer): TPensaoAlimCollectionItem;
begin
  Result := TPensaoAlimCollectionItem(inherited GetItem(Index));
end;

procedure TPensaoAlimCollection.SetItem(Index: Integer;
  Value: TPensaoAlimCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TPensaoAlimCollectionItem }
constructor TPensaoAlimCollectionItem.create;
begin
end;

{ TDetPlano }
function TDetPlanoCollection.Add: TDetPlanoCollectionItem;
begin
  Result := TDetPlanoCollectionItem(inherited Add);
  Result.create;
end;

constructor TDetPlanoCollection.create;
begin
  inherited create(TDetPlanoCollectionItem);
end;

function TDetPlanoCollection.GetItem(Index: Integer): TDetPlanoCollectionItem;
begin
  Result := TDetPlanoCollectionItem(inherited GetItem(Index));
end;

procedure TDetPlanoCollection.SetItem(Index: Integer;
  Value: TDetPlanoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TDetPlanoCollectionItem }
constructor TDetPlanoCollectionItem.create;
begin
end;

{ TDetOperCollectionItem }
constructor TDetOperCollectionItem.create;
begin
  FDetPlanoCollection := TDetPlanoCollection.create;
end;

destructor TDetOperCollectionItem.destroy;
begin
  FDetPlanoCollection.Free;
  inherited;
end;

{ TDetOperCollection }
function TDetOperCollection.Add: TDetOperCollectionItem;
begin
  Result := TDetOperCollectionItem(inherited Add);
  Result.create;
end;

constructor TDetOperCollection.create;
begin
  inherited create(TDetOperCollectionItem)
end;

function TDetOperCollection.GetItem(Index: Integer): TDetOperCollectionItem;
begin
  Result := TDetOperCollectionItem(inherited GetItem(Index));
end;

procedure TDetOperCollection.SetItem(Index: Integer;
  Value: TDetOperCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoSaudeColet }
constructor TInfoSaudeColet.create;
begin
  FDetOper := TDetOperCollection.create;
  FDetOper.Add;
end;

destructor TInfoSaudeColet.destroy;
begin
  FDetOper.Free;
end;



end.
