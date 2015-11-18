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

unit eSocial_S1200;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao, ACBrUtil, Dialogs,
  ACBreSocialGerador, Controls;

type

  TPgtoExt = class;
  TItensRemunCollection = class;
  TRemunPerCollection = class;
  TRemunPerCollectionItem = class;
  TRemunPerApur = class;
  TRemunPerAnt = class;
  TIdeEstabLotCollection = class;
  TIdeEstabLotCollectionItem = class;
  TIdePeriodoCollectionItem = class;
  TIdePeriodoCollection = class;
  TeS1200RecPgtos = class;
  TeS1200RecPgtos1CollectionItem = class;
  TeS1200RecPgtos1Collection = class;
  TeS1200RecPgtos2CollectionItem = class;
  TeS1200RecPgtos2Collection = class;
  TIdeADCCollectionItem = class;
  TIdeADCCollection = class;
  TInfoPerAnt = class;
  TInfoPerApur = class;
  TeS1200IdeTrabalhador = class;
  TInfoComplem = class;
  TRemunOutrEmprCollectionItem = class;
  TRemunOutrEmprCollection = class;
  TInfoMV = class;
  TEvtRemun = class;
  TS1200CollectionItem = class;
  TS1200Collection = class;
  

  TS1200Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1200CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1200CollectionItem);
  public
    function Add: TS1200CollectionItem;
    property Items[Index: Integer]: TS1200CollectionItem read GetItem write SetItem; default;
  end;

  TS1200CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtRemun: TEvtRemun;
    procedure setEvtRemun(const Value: TEvtRemun);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property evtRemun: TEvtRemun read FEvtRemun write setEvtRemun;
  end;

  TEvtRemun = class(TeSocialEvento)
  private
    FIdeEvento: TIdeEvento3;
    FIdeEmpregador: TIdeEmpregador;
    FIdeTrabalhador: TeS1200IdeTrabalhador;
    FInfoPerApur: TInfoPerApur;
    FInfoPerAnt: TInfoPerAnt;
    function getInfoPerAnt: TInfoPerAnt;
    function getInfoPerApur: TInfoPerApur;
    {Geradores específicos desta classe}

    procedure GerarIdeEstabLot(objIdeEstabLot: TIdeEstabLotCollection; nomeRemunPer: string = 'remunPerApur');
    procedure GerarRemunPer(objRemunPer: TRemunPerCollection; nomeRemunPer: string = 'remunPerApur');
    procedure GerarIdePeriodo(objIdePeriodo: TIdePeriodoCollection);
    procedure GerarRecPgtos1(objRecPgtosCollection: TeS1200RecPgtos1Collection);
    procedure GerarRecPgtos2(objRecPgtosCollection: TeS1200RecPgtos2Collection);
    procedure GerarIdeADC(objIdeADC: TideADCCollection);

    procedure GerarRemunOutrEmpr(objRemunOutrEmpr: TRemunOutrEmprCollection);
    procedure GerarIdeTrabalhador();
    procedure GerarInfoMV();
    procedure GerarInfoComplem();   
    procedure GerarInfoPerApur();
    procedure GerarInfoPerAnt();
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor  Destroy; override;
    function infoPerApurInst(): Boolean;
    function infoPerAntInst(): Boolean;

    function GerarXML: boolean; override;

    property ideEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property ideEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property ideTrabalhador: TeS1200IdeTrabalhador read FIdeTrabalhador write FIdeTrabalhador;
    property infoPerApur: TInfoPerApur read getInfoPerApur write FInfoPerApur;
    property infoPerAnt: TInfoPerAnt read getInfoPerAnt write FInfoPerAnt;
  end;
  
  TPgtoExt = class(TPersistent)
   private
    FIdePais: TIdePais;
    FEndExt: TEndExt;
  public
    constructor create;
    destructor destroy; override;

    property idePais: TIdePais read FIdePais write FIdePais;
    property endExt: TEndExt read FEndExt write FEndExt;
  end;



  TItensRemunCollection = class(TRubricaCollection);

  TRemunPerCollection = class(TCollection)
   private
    FNomeGrupoXML: string;
    function GetItem(Index: Integer): TRemunPerCollectionItem;
    procedure SetItem(Index: Integer; Value: TRemunPerCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TRemunPerCollectionItem;  
    property Items[Index: Integer]: TRemunPerCollectionItem read GetItem write SetItem;
    property grupoXML: string read FNomeGrupoXML;
  end;

  TRemunPerApur = class(TRemunPerCollection);

  TRemunPerAnt = class(TRemunPerCollection);

  TRemunPerCollectionItem = class(TCollectionItem)
   private
    FMatricula: string;
    FCodCateg: Integer;
    FIndSimples: tpIndSimples;
    FItensRemun: TItensRemunCollection;
    FInfoSaudeColet: TInfoSaudeColet;
    FInfoAgNocivo: TInfoAgNocivo;
    FPensaoAlim: TPensaoAlimCollection;
    function getInfoAgNocivo: TInfoAgNocivo;
    function getInfoSaudeColet: TInfoSaudeColet;
  public
    constructor create;
    destructor destroy; override;
    function infoAgNocivoInst(): Boolean;
    function infoSaudeColetInst(): Boolean;

    property matricula: string read FMatricula write FMatricula;
    property codCateg: Integer read FCodCateg write FCodCateg;
    property indSimples: tpIndSimples read FIndSimples write FIndSimples;
    property itensRemun: TItensRemunCollection read FItensRemun write FItensRemun;
    property infoSaudeColet: TInfoSaudeColet read getInfoSaudeColet write FInfoSaudeColet;
    property infoAgNocivo: TInfoAgNocivo read getInfoAgNocivo write FInfoAgNocivo;
    property pensaoAlim: TPensaoAlimCollection read FPensaoAlim write FPensaoAlim;
  end;

  TIdeEstabLotCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TIdeEstabLotCollectionItem;
    procedure SetItem(Index: Integer; Value: TIdeEstabLotCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TIdeEstabLotCollectionItem;
    property Items[Index: Integer]: TIdeEstabLotCollectionItem read GetItem write SetItem;
  end;

  TIdeEstabLotCollectionItem = class(TCollectionItem)
   private
    FTpInsc: TpTpInsc;
    FNrInsc: string;
    FCodLotacao: string;
    FRemunPerApur: TRemunPerCollection;
    FRemunPerAnt: TRemunPerCollection;
  public
    constructor create;
    destructor destroy; override;

    property tpInsc: TpTPInsc read FTpInsc write FTpInsc;
    property nrInsc: string read FNrInsc write FNrInsc;
    property codLotacao: string read FCodLotacao write FCodLotacao;
    property remunPerApur: TRemunPerCollection read FRemunPerApur write FRemunPerApur;
    property remunPerAnt : TRemunPerCollection read FRemunPerAnt write FremunPerAnt;
  end;

  TIdePeriodoCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TIdePeriodoCollectionItem;
    procedure SetItem(Index: Integer; Value: TIdePeriodoCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TIdePeriodoCollectionItem;
    property Items[Index: Integer]: TIdePeriodoCollectionItem read GetItem write SetItem;
  end;

  TIdePeriodoCollectionItem = class(TCollectionItem)
   private
    FPerRef: string;
    FIdeEstabLot: TIdeEstabLotCollection;
  public
    constructor create; reintroduce;
    destructor destroy; override;
    property perRef: string read FPerRef write FPerRef;
    property ideEstabLot: TIdeEstabLotCollection read FIdeEstabLot write FIdeEstabLot;
  end;

  TeS1200RecPgtos = class(TReciboPagamento);

  TeS1200RecPgtos1Collection = class(TCollection)
   private
    function GetItem(Index: Integer): TeS1200RecPgtos1CollectionItem;
    procedure SetItem(Index: Integer; Value: TeS1200RecPgtos1CollectionItem);
  public
    constructor create; reintroduce;
    function Add: TeS1200RecPgtos1CollectionItem;
    property Items[Index: Integer]: TeS1200RecPgtos1CollectionItem read GetItem write SetItem;
  end;

  TeS1200RecPgtos1CollectionItem = class(TeS1200RecPgtos)
   private
    FIdeEstabLot: TIdeEstabLotCollection;
  public
    constructor create; reintroduce;
    destructor destroy; override;
    property ideEstabLot: TIdeEstabLotCollection read FIdeEstabLot write FIdeEstabLot;
  end;

  TeS1200RecPgtos2Collection = class(TCollection)
   private
    function GetItem(Index: Integer): TeS1200RecPgtos2CollectionItem;
    procedure SetItem(Index: Integer; Value: TeS1200RecPgtos2CollectionItem);
  public
    constructor create; reintroduce;
    function Add: TeS1200RecPgtos2CollectionItem;
    property Items[Index: Integer]: TeS1200RecPgtos2CollectionItem read GetItem write SetItem;
  end;

  TeS1200RecPgtos2CollectionItem = class(TeS1200RecPgtos)
   private
    FIdePeriodo: TIdePeriodoCollection;
  public
    constructor create; reintroduce;
    destructor destroy; override;
    property idePeriodo: TIdePeriodoCollection read FIdePeriodo write FIdePeriodo;
  end;

  TIdeADCCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TIdeADCCollectionItem;
    procedure SetItem(Index: Integer; Value: TIdeADCCollectionItem);
  public
    constructor create; reintroduce;
    function add: TIdeADCCollectionItem;
    property Items[Index: Integer]: TIdeADCCollectionItem read GetItem write SetItem;
  end;

  TIdeADCCollectionItem = class(TCollectionItem)
   private
    FDtAcConv: TDate;
    FTpAcConv: tpTpAcConv;
    FRecPgtos: TeS1200RecPgtos2Collection;
  public
    constructor create; reintroduce;
    destructor destroy; override;

    property dtAcConv: TDate read FDtAcConv write FDtAcConv;
    property tpAcConv: tpTpAcConv read FTpAcConv write FTpAcConv;
    property recPgtos: TeS1200RecPgtos2Collection read FRecPgtos write FRecPgtos;
  end;

  TInfoPerAnt = class(TPersistent)
   private
    FIdeADC: TIdeADCCollection;
  public
    constructor create; 
    destructor destroy; override;
    property ideADC: TIdeADCCollection read FIdeADC write FIdeADC;
  end;

  TInfoPerApur = class(TPersistent)
   private
    FRecPgtos: TeS1200RecPgtos1Collection;
  public
    constructor create;
    destructor Destroy; override;
    property recPgtos: TeS1200RecPgtos1Collection read FRecPgtos write FRecPgtos;
  end;

  TeS1200IdeTrabalhador = class(TideTrabalhador2) //S-1200
   private
    FQtdDepSF: integer;
    FQtdDepIRRF: Integer;
    FInfoMV: TInfoMV;
    FInfoComplem: TInfoComplem;
    FProcJudTrab: TProcJudTrabCollection;
    function getInfoComplem: TInfoComplem;
    function getInfoMV: TInfoMV;
  public
    constructor create;
    destructor Destroy; override;
    function infoMVInst(): Boolean;
    function infoComplemInst(): Boolean;

    property qtdDepSF: Integer read FqtdDepSF write FqtdDepSF;
    property qtdDepIRRF: Integer read FqtdDepIRRF write FqtdDepIRRF;
    property infoMV: TInfoMV read getInfoMV write FInfoMV;
    property infoComplem: TInfoComplem read getInfoComplem write FInfoComplem;
    property procJudTrab: TProcJudTrabCollection read FProcJudTrab write FProcJudTrab;
  end;

  TInfoComplem = class(TPersistent)
   private
    FNmTrab: string;
    FDtNascto: TDate;
    FCodCBO: string;
    FNatAtividade: tpNatAtividade;
    FQtdDiasTrab: Integer;
  public
    property nmTrab: string read FNmTrab write FNmTrab;
    property dtNascto: TDate read FDtNascto write FDtNascto;
    property codCBO: string read FCodCBO write FCodCBO;
    property natAtividade: tpNatAtividade read FNatAtividade write FNatAtividade;
    property qtdDiasTrab: Integer read FQtdDiasTrab write FQtdDiasTrab;
  end;

  TRemunOutrEmprCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TRemunOutrEmprCollectionItem;
    procedure SetItem(Index: Integer; Value: TRemunOutrEmprCollectionItem);
  public
    constructor create; reintroduce;
    function add: TRemunOutrEmprCollectionItem;
    property Items[Index: Integer]: TRemunOutrEmprCollectionItem read GetItem write SetItem;
  end;

  TRemunOutrEmprCollectionItem = class(TCollectionItem)
   private
    FTpInsc: tpTpInsc;
    FNrInsc: string;
    FVlrRemunOE: Double;
  public
    constructor create; reintroduce;
    property tpInsc: tpTpInsc read FTpInsc write FTpInsc;
    property nrInsc: string read FNrInsc write FNrInsc;
    property vlrRemunOE: Double read FVlrRemunOE write FVlrRemunOE;  
  end;

  TInfoMV = class(TPersistent)
   private
    FIndMV: tpIndMV;
    FRemunOutrEmpr: TRemunOutrEmprCollection;
  public
    constructor create;
    destructor Destroy; override;
    property indMV: tpIndMV read FIndMV write FIndMV;
    property remunOutrEmpr: TRemunOutrEmprCollection read FRemunOutrEmpr write FRemunOutrEmpr;
  end;

implementation

uses
  eSocial_Periodicos;

{ TPgtoExt }
constructor TPgtoExt.create;
begin
  FIdePais := TIdePais.Create;
  FEndExt := TEndExt.Create;
end;

destructor TPgtoExt.destroy;
begin
  FIdePais.Free;
  FEndExt.Free;
  inherited;
end;

{ TRemunPerCollectionItem }
constructor TRemunPerCollectionItem.create;
begin
  FItensRemun := TItensRemunCollection.Create;
  FItensRemun.Add;
  FInfoSaudeColet := nil;
  FInfoAgNocivo := nil;
  FPensaoAlim := TPensaoAlimCollection.create;
end;

destructor TRemunPerCollectionItem.destroy;
begin
  FItensRemun.Free;
  FreeAndNil(FInfoSaudeColet);
  FreeAndNil(FInfoAgNocivo);
  FPensaoAlim.Free;
  inherited;
end;

function TRemunPerCollectionItem.getInfoAgNocivo: TInfoAgNocivo;
begin
  if Not(Assigned(FInfoAgNocivo)) then
    FInfoAgNocivo := TInfoAgNocivo.Create;
  Result := FInfoAgNocivo;
end;

function TRemunPerCollectionItem.getInfoSaudeColet: TInfoSaudeColet;
begin
  if Not(Assigned(FInfoSaudeColet)) then
    FInfoSaudeColet := TInfoSaudeColet.create;
  Result := FInfoSaudeColet;
end;


function TRemunPerCollectionItem.infoAgNocivoInst: Boolean;
begin
  Result := Assigned(FInfoAgNocivo);
end;

function TRemunPerCollectionItem.infoSaudeColetInst: Boolean;
begin
  Result := Assigned(FInfoSaudeColet);
end;


{ TRemunPerCollection }
function TRemunPerCollection.Add: TRemunPerCollectionItem;
begin
  Result := TRemunPerCollectionItem(inherited Add);
  Result.create;
end;

constructor TRemunPerCollection.create();
begin
  inherited create(TRemunPerCollectionItem);
end;

function TRemunPerCollection.GetItem(Index: Integer): TRemunPerCollectionItem;
begin
  Result := TRemunPerCollectionItem(inherited GetItem(Index));
end;

procedure TRemunPerCollection.SetItem(Index: Integer;
  Value: TRemunPerCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TIdeEstabLot }
constructor TIdeEstabLotCollectionItem.create;
begin
  FRemunPerApur := TRemunPerCollection.create;
  FRemunPerApur.Add;
  FRemunPerAnt := TRemunPerCollection.create;
  FRemunPerAnt.Add;
end;

destructor TIdeEstabLotCollectionItem.destroy;
begin
  FRemunPerApur.Free;
  FremunPerAnt.Free;
  inherited;
end;

{ TIdeEstabLotCollection }
function TIdeEstabLotCollection.Add: TIdeEstabLotCollectionItem;
begin
  Result := TIdeEstabLotCollectionItem(inherited Add);
  Result.create;
end;

constructor TIdeEstabLotCollection.create;
begin
  inherited create(TIdeEstabLotCollectionItem);
end;

function TIdeEstabLotCollection.GetItem(
  Index: Integer): TIdeEstabLotCollectionItem;
begin
  Result := TIdeEstabLotCollectionItem(inherited GetItem(Index));
end;

procedure TIdeEstabLotCollection.SetItem(Index: Integer;
  Value: TIdeEstabLotCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TIdePeriodoCollectionItem }
constructor TIdePeriodoCollectionItem.create;
begin
  FIdeEstabLot := TIdeEstabLotCollection.create;
  FIdeEstabLot.Add;
end;

destructor TIdePeriodoCollectionItem.destroy;
begin
  FIdeEstabLot.Free;
  inherited;
end;

{ TIdePeriodoCollection }
function TIdePeriodoCollection.Add: TIdePeriodoCollectionItem;
begin
  Result := TIdePeriodoCollectionItem(inherited Add);
  Result.create;
end;

constructor TIdePeriodoCollection.create;
begin
  inherited create(TIdePeriodoCollectionItem);
end;

function TIdePeriodoCollection.GetItem(
  Index: Integer): TIdePeriodoCollectionItem;
begin
  Result := TIdePeriodoCollectionItem(inherited GetItem(Index));
end;

procedure TIdePeriodoCollection.SetItem(Index: Integer;
  Value: TIdePeriodoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TeS1200RecPgtos1Item }
constructor TeS1200RecPgtos1CollectionItem.create;
begin
  inherited create;
  FIdeEstabLot := TIdeEstabLotCollection.create;
  FIdeEstabLot.Add;
end;

destructor TeS1200RecPgtos1CollectionItem.destroy;
begin
  FIdeEstabLot.Free;
  inherited;
end;

{ TeS1200RecPgtos1Collection }
function TeS1200RecPgtos1Collection.Add: TeS1200RecPgtos1CollectionItem;
begin
  Result := TeS1200RecPgtos1CollectionItem(inherited Add);
  Result.create;
end;

constructor TeS1200RecPgtos1Collection.create;
begin
  inherited create(TeS1200RecPgtos1CollectionItem);
end;

function TeS1200RecPgtos1Collection.GetItem(
  Index: Integer): TeS1200RecPgtos1CollectionItem;
begin
  Result := TeS1200RecPgtos1CollectionItem(inherited GetItem(Index));
end;

procedure TeS1200RecPgtos1Collection.SetItem(Index: Integer;
  Value: TeS1200RecPgtos1CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TeS1200RecPgtos2CollectionItem }
constructor TeS1200RecPgtos2CollectionItem.create;
begin
  inherited create;
  FIdePeriodo := TIdePeriodoCollection.create;
  FIdePeriodo.Add;
end;

destructor TeS1200RecPgtos2CollectionItem.destroy;
begin
  FIdePeriodo.Free;
  inherited;
end;

{ TeS1200RecPgtos2Collection }
function TeS1200RecPgtos2Collection.Add: TeS1200RecPgtos2CollectionItem;
begin
  Result := TeS1200RecPgtos2CollectionItem(inherited Add);
  Result.create;
end;

constructor TeS1200RecPgtos2Collection.create;
begin
  inherited create(TeS1200RecPgtos2CollectionItem)
end;

function TeS1200RecPgtos2Collection.GetItem(
  Index: Integer): TeS1200RecPgtos2CollectionItem;
begin
  Result := TeS1200RecPgtos2CollectionItem(inherited GetItem(Index));
end;

procedure TeS1200RecPgtos2Collection.SetItem(Index: Integer;
  Value: TeS1200RecPgtos2CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TIdeADCCollectionItem }
constructor TIdeADCCollectionItem.create;
begin
  FRecPgtos := TeS1200RecPgtos2Collection.create;
  FRecPgtos.Add;
end;

destructor TIdeADCCollectionItem.destroy;
begin
  FRecPgtos.Free;
  inherited;
end;

{ TIdeADCCollection }
function TIdeADCCollection.add: TIdeADCCollectionItem;
begin
  Result := TIdeADCCollectionItem(inherited add);
  Result.create;
end;

constructor TIdeADCCollection.create;
begin
  inherited create(TIdeADCCollectionItem);
end;

function TIdeADCCollection.GetItem(Index: Integer): TIdeADCCollectionItem;
begin
  Result := TIdeADCCollectionItem(inherited GetItem(Index));
end;

procedure TIdeADCCollection.SetItem(Index: Integer;
  Value: TIdeADCCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoPerAnt }
constructor TInfoPerAnt.create;
begin
  inherited;
  FIdeADC := TIdeADCCollection.create;
  FIdeADC.add;
end;

destructor TInfoPerAnt.destroy;
begin
  FIdeADC.Free;
  inherited;
end;

{ TInfoPerApur }
constructor TInfoPerApur.create;
begin
  inherited;
  FRecPgtos := TeS1200RecPgtos1Collection.create;
  FRecPgtos.Add;
end;

destructor TInfoPerApur.destroy;
begin
  FRecPgtos.Free;
  inherited;
end;

{ TideTrabalhador }
constructor TeS1200IdeTrabalhador.create;
begin
  FInfoMV := nil;
  FInfoComplem := nil;
  FProcJudTrab := TProcJudTrabCollection.create;
end;

destructor TeS1200IdeTrabalhador.destroy;
begin
  FreeAndNil(FInfoMV);
  FreeAndNil(FInfoComplem);
  FProcJudTrab.Free;
  inherited;
end;


function TeS1200IdeTrabalhador.getInfoComplem: TInfoComplem;
begin
  if Not(Assigned(FInfoComplem)) then
    FInfoComplem := TInfoComplem.Create;
  Result := FInfoComplem;
end;

function TeS1200IdeTrabalhador.getInfoMV: TInfoMV;
begin
  if Not(Assigned(FInfoMV)) then
    FInfoMV := TInfoMV.create;
  Result := FInfoMV;
end;

function TeS1200IdeTrabalhador.infoComplemInst: Boolean;
begin
  Result := Assigned(FInfoComplem);
end;

function TeS1200IdeTrabalhador.infoMVInst: Boolean;
begin
  Result := Assigned(FInfoMV);
end;

{ TRemunOutrEmpr }
constructor TRemunOutrEmprCollectionItem.create;
begin
end;

{ TRemunOutrEmprCollection }
function TRemunOutrEmprCollection.add: TRemunOutrEmprCollectionItem;
begin
  Result := TRemunOutrEmprCollectionItem(inherited add);
  Result.create;
end;

constructor TRemunOutrEmprCollection.create;
begin
  inherited create(TRemunOutrEmprCollectionItem);
end;

function TRemunOutrEmprCollection.GetItem(
  Index: Integer): TRemunOutrEmprCollectionItem;
begin
  Result := TRemunOutrEmprCollectionItem(inherited GetItem(Index));
end;

procedure TRemunOutrEmprCollection.SetItem(Index: Integer;
  Value: TRemunOutrEmprCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoMV }
constructor TInfoMV.create;
begin
  FRemunOutrEmpr := TRemunOutrEmprCollection.create;  
end;

destructor TInfoMV.destroy;
begin
  FRemunOutrEmpr.Free;
  inherited;
end;

{ TEvtRemun }
constructor TEvtRemun.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento3.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeTrabalhador := TeS1200IdeTrabalhador.create;
  FInfoPerApur := nil;
  FInfoPerAnt := nil;
end;

destructor TEvtRemun.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeTrabalhador.Free;
  FreeAndNil(FInfoPerApur);
  FreeAndNil(FInfoPerAnt);
  inherited;
end;

procedure TEvtRemun.GerarIdeADC(objIdeADC: TideADCCollection);
var
  iIdeADC: Integer;
begin
  for iIdeADC := 0 to objIdeADC.Count - 1 do
  begin
    Gerador.wGrupo('ideADC');
      Gerador.wCampo(tcDat, '', 'dtAcConv', 0, 0, 0, objIdeADC.Items[iIdeADC].dtAcConv);
      Gerador.wCampo(tcStr, '', 'tpAcConv', 0, 0, 0, eSTpAcConvToStr(objIdeADC.Items[iIdeADC].tpAcConv));
      GerarRecPgtos2(objIdeADC.Items[iIdeADC].recPgtos);
    Gerador.wGrupo('/ideADC');
  end;
end;

procedure TEvtRemun.GerarIdeEstabLot(objIdeEstabLot: TIdeEstabLotCollection; nomeRemunPer: string = 'remunPerApur');
var
  iIdeEstabLot: Integer;
begin
  for iIdeEstabLot := 0 to objIdeEstabLot.Count - 1 do
  begin
    Gerador.wGrupo('ideEstabLot');
      Gerador.wCampo(tcInt, '', 'tpInsc', 0, 0, 0, objIdeEstabLot.Items[iIdeEstabLot].tpInsc);
      Gerador.wCampo(tcStr, '', 'nrInsc', 0, 0, 0, objIdeEstabLot.Items[iIdeEstabLot].nrInsc);
      Gerador.wCampo(tcStr, '', 'codLotacao', 0, 0, 0, objIdeEstabLot.Items[iIdeEstabLot].codLotacao);
      GerarRemunPer(objIdeEstabLot.Items[iIdeEstabLot].remunPerApur, nomeRemunPer);
    Gerador.wGrupo('/ideEstabLot');
  end;
end;

procedure TEvtRemun.GerarIdePeriodo(objIdePeriodo: TIdePeriodoCollection);
var
  iIdePeriodo: Integer;
begin
  for iIdePeriodo := 0 to objIdePeriodo.Count - 1 do
  begin
    Gerador.wGrupo('idePeriodo');
      Gerador.wCampo(tcStr, '', 'perRef', 0, 0, 0, objIdePeriodo.Items[iIdePeriodo].perRef);
      GerarIdeEstabLot(objIdePeriodo.Items[iIdePeriodo].ideEstabLot, 'remunPerAnt');
    Gerador.wGrupo('/idePeriodo');
  end;
end;

procedure TEvtRemun.GerarIdeTrabalhador;
begin
  Gerador.wGrupo('ideTrabalhador');
    Gerador.wCampo(tcStr, '', 'cpfTrab', 0, 0, 0, ideTrabalhador.cpfTrab);
    Gerador.wCampo(tcStr, '', 'nisTrab', 0, 0, 0, ideTrabalhador.nisTrab);
    Gerador.wCampo(tcInt, '', 'qtdDepSF', 0, 0, 0, ideTrabalhador.qtdDepSF);
    Gerador.wCampo(tcInt, '', 'qtdDepIRRF', 0, 0, 0, ideTrabalhador.qtdDepIRRF);
    if (ideTrabalhador.infoMVInst()) then
      GerarInfoMV();
    if (ideTrabalhador.infoComplemInst()) then
      GerarInfoComplem();
    GerarProcJudTrab(ideTrabalhador.procJudTrab);
  Gerador.wGrupo('/ideTrabalhador');
end;

procedure TEvtRemun.GerarInfoComplem;
begin
  Gerador.wGrupo('infoComplem');
    Gerador.wCampo(tcStr, '', 'nmTrab', 0, 0, 0, ideTrabalhador.infoComplem.nmTrab);
    Gerador.wCampo(tcDat, '', 'dtNascto', 0, 0, 0, ideTrabalhador.infoComplem.dtNascto);
    Gerador.wCampo(tcStr, '', 'codCBO', 0, 0, 0, ideTrabalhador.infoComplem.codCBO);
    Gerador.wCampo(tcStr, '', 'natAtividade', 0, 0, 0, eSNatAtividadeToStr(ideTrabalhador.infoComplem.natAtividade));
    Gerador.wCampo(tcInt, '', 'qtdDiasTrab', 0, 0, 0, ideTrabalhador.infoComplem.qtdDiasTrab);
  Gerador.wGrupo('/infoComplem');
end;

procedure TEvtRemun.GerarInfoMV;
begin
  Gerador.wGrupo('infoMV');
    Gerador.wCampo(tcStr, '', 'indMV', 0, 0, 0, eSIndMVToStr(ideTrabalhador.infoMV.indMV));
    GerarRemunOutrEmpr(ideTrabalhador.infoMV.remunOutrEmpr);
  Gerador.wGrupo('/infoMV');
end;

procedure TEvtRemun.GerarInfoPerAnt;
begin
  Gerador.wGrupo('infoPerAnt');
    GerarIdeADC(FInfoPerAnt.ideADC);
  Gerador.wGrupo('/infoPerAnt');
end;

procedure TEvtRemun.GerarInfoPerApur;
begin
  Gerador.wGrupo('infoPerApur');
    GerarRecPgtos1(FInfoPerApur.recPgtos);
  Gerador.wGrupo('/infoPerApur');
end;

procedure TEvtRemun.GerarRecPgtos1(objRecPgtosCollection: TeS1200RecPgtos1Collection);
var
  iRecPqtos1: Integer;
begin
  for iRecPqtos1 := 0 to objRecPgtosCollection.Count - 1 do
  begin
    Gerador.wGrupo('recPgtos');
      Gerador.wCampo(tcInt, '', 'ideRecPgto', 0, 0, 0, objRecPgtosCollection.Items[iRecPqtos1].ideRecPgto);
      GerarIdeEstabLot(objRecPgtosCollection.Items[iRecPqtos1].ideEstabLot, 'remunPerApur');
    Gerador.wGrupo('/recPgtos');
  end;
end;

procedure TEvtRemun.GerarRecPgtos2(objRecPgtosCollection: TeS1200RecPgtos2Collection);
var
  iRecPqtos2: Integer;
begin
  for iRecPqtos2 := 0 to objRecPgtosCollection.Count - 1 do
  begin
    Gerador.wGrupo('recPgtos');
      Gerador.wCampo(tcInt, '', 'ideRecPgto', 0, 0, 0, objRecPgtosCollection.Items[iRecPqtos2].ideRecPgto);
      Gerador.wCampo(tcDe2, '', 'vrRec', 0,0,0, objRecPgtosCollection.Items[iRecPqtos2].vrRec);
      GerarIdePeriodo(objRecPgtosCollection.Items[iRecPqtos2].idePeriodo);
    Gerador.wGrupo('/recPgtos');
  end;
end;

procedure TEvtRemun.GerarRemunOutrEmpr(objRemunOutrEmpr: TRemunOutrEmprCollection);
var
  iRemunOutrEmpr: Integer;
begin
  for iRemunOutrEmpr := 0 to objRemunOutrEmpr.Count - 1 do
  begin
    Gerador.wGrupo('remunOutrEmpr');
      Gerador.wCampo(tcStr, '', 'tpInsc', 0, 0, 0, eSTpInscricaoToStr(objRemunOutrEmpr.Items[iRemunOutrEmpr].tpInsc));
      Gerador.wCampo(tcStr, '', 'nrInsc', 0, 0, 0, objRemunOutrEmpr.Items[iRemunOutrEmpr].nrInsc);
      Gerador.wCampo(tcDe2, '', 'vlrRemunOE', 0, 0, 0, objRemunOutrEmpr.Items[iRemunOutrEmpr].vlrRemunOE);      
    Gerador.wGrupo('/remunOutrEmpr');
  end;
end;

procedure TEvtRemun.GerarRemunPer(objRemunPer: TRemunPerCollection; nomeRemunPer: string = 'remunPerApur');
var
  iRemunPer: Integer;
begin
  for iRemunPer := 0 to objRemunPer.Count - 1 do
  begin
    Gerador.wGrupo(nomeRemunPer);
      Gerador.wCampo(tcStr, '', 'matricula', 0, 0, 0, objRemunPer.Items[iRemunPer].matricula);
      Gerador.wCampo(tcInt, '', 'codCateg', 0, 0, 0, objRemunPer.Items[iRemunPer].codCateg);
      //indSimples deixou de ser obrigatório ocorre 0-1 vzs;
      Gerador.wCampo(tcStr, '', 'indSimples', 0, 0, 0, eSIndSimplesToStr(objRemunPer.Items[iRemunPer].indSimples));
      GerarItensRemun(objRemunPer.Items[iRemunPer].itensRemun, 'itensRemun');
      if (nomeRemunPer = 'remunPerApur') then
      begin
        if objRemunPer.Items[iRemunPer].infoSaudeColetInst() then
          GerarInfoSaudeColet(objRemunPer.Items[iRemunPer].infoSaudeColet);
      end;
      if (objRemunPer.Items[iRemunPer].infoAgNocivoInst()) then
        GerarInfoAgNocivo(objRemunPer.Items[iRemunPer].infoAgNocivo);
      GerarPensaoAlim(objRemunPer.Items[iRemunPer].pensaoAlim);
    Gerador.wGrupo('/' + nomeRemunPer);
  end;
end;

function TEvtRemun.GerarXML: boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtRemun Id="'+ GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0) +'"');
        GerarIdeEvento3(Self.IdeEvento);
        GerarIdeEmpregador(Self.ideEmpregador);
        GerarIdeTrabalhador();
        if (infoPerApurInst()) then
          GerarInfoPerApur();
        if (infoPerAntInst()) then
          GerarInfoPerAnt();        
      Gerador.wGrupo('/evtRemun');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtRemun');
    Validar('evtRemun');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

function TEvtRemun.getInfoPerAnt: TInfoPerAnt;
begin
  if Not(Assigned(FInfoPerAnt)) then
    FInfoPerAnt := TInfoPerAnt.create;
  Result := FInfoPerAnt;
end;

function TEvtRemun.getInfoPerApur: TInfoPerApur;
begin
  if Not(Assigned(FInfoPerApur)) then
    FInfoPerApur := TInfoPerApur.create;  
  Result := FInfoPerApur;
end;

function TEvtRemun.infoPerAntInst: Boolean;
begin
  Result := Assigned(FInfoPerAnt);
end;

function TEvtRemun.infoPerApurInst: Boolean;
begin
  Result := Assigned(FInfoPerApur);
end;

{ TS1200CollectionItem }
constructor TS1200CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1200;
  FEvtRemun := TEvtRemun.Create(AOwner);
end;

destructor TS1200CollectionItem.Destroy;
begin
  FEvtRemun.free;
  inherited;
end;

procedure TS1200CollectionItem.setEvtRemun(const Value: TEvtRemun);
begin
  FEvtRemun.Assign(Value);
end;

{ TS1200Collection }
function TS1200Collection.Add: TS1200CollectionItem;
begin
  Result := TS1200CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
  Showmessage(Self.Owner.ClassName);
end;

function TS1200Collection.GetItem(Index: Integer): TS1200CollectionItem;
begin
  Result := TS1200CollectionItem(inherited GetItem(Index));
end;

procedure TS1200Collection.SetItem(Index: Integer; Value: TS1200CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

end.
