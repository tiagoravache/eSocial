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
|* 01/03/2016: Guilherme Costa
|*  - Alterações para validação com o XSD
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S1202;

interface

uses
  SysUtils, Classes, eSocial_Common, eSocial_Conversao, pcnConversao, ACBreSocialGerador,
  Controls;

type

  TEvtRmnRPPS = class;
  TS1202CollectionItem = class;
  TS1202Collection = class;

  //classes especificas do 1202
  TeS1202IdeTrabalhador = class;
  TInfoPerApur = class;
  TInfoPerAnt = class;
  TItensRemunCollection= class;
  TRecPgtosPerApurCollectionItem = class;
  TRecPgtosPerApurCollection = class;
  TRecPgtosPerAntCollectionItem = class;
  TRecPgtosPerAntCollection = class;
  TIdePeriodoCollectionItem = class;
  TIdePeriodoCollection = class;
  TRemunPerCollection = class;
  TRemunPerCollectionItem = class;
  TRemunPerApur = class;
  TRemunPerAnt = class;


  TS1202Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1202CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1202CollectionItem);
  public
    function Add: TS1202CollectionItem;
    property Items[Index: Integer]: TS1202CollectionItem read GetItem write SetItem; default;
  end;

  TS1202CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtRmnRPPS: TEvtRmnRPPS;
    procedure seTEvtRmnRPPS(const Value: TEvtRmnRPPS);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtRmnRPPS: TEvtRmnRPPS read FEvtRmnRPPS write seTEvtRmnRPPS;
  end;

  TEvtRmnRPPS = class(TeSocialEvento)
  private
    FIdeEvento: TIdeEvento3;
    FIdeEmpregador: TIdeEmpregador;
    FIdeTrabalhador: TeS1202IdeTrabalhador;

    procedure GerarIdeTrabalhador();
    procedure GerarInfoPerApur();
    procedure GerarInfoPerAnt();
    procedure GerarRecPgtoPerApur(oRecPgtoPerApur: TRecPgtosPerApurCollection);
    procedure GerarRecPgtoPerAnt(oRecPgtoPerAnt: TRecPgtosPerAntCollection);
    procedure GerarRemunPer(objRemunPer: TRemunPerCollection; nomeRemunPer: string = 'remunPerApur');
    procedure GerarIdePeriodo(objIdePeriodo: TIdePeriodoCollection);
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor  Destroy; override;
    function GerarXML: boolean; override;

    property ideEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property ideEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property ideTrabalhador: TeS1202IdeTrabalhador read FIdeTrabalhador write FIdeTrabalhador;
  end;

  TeS1202IdeTrabalhador = class(TideTrabalhador2) //S-1202
   private
    FQtdDepIRRF: Integer;
    FProcJudTrab: TProcJudTrabCollection;
    FInfoPerApur: TInfoPerApur;
    FInfoPerAnt: TInfoPerAnt;

    function getInfoPerApur: TInfoPerApur;
    function getInfoPerAnt: TInfoPerAnt;
  public
    constructor create;
    destructor Destroy; override;

    function infoPerApurInst(): Boolean;
    function infoPerAntInst(): Boolean;

    property qtdDepIRRF: Integer read FqtdDepIRRF write FqtdDepIRRF;
    property procJudTrab: TProcJudTrabCollection read FProcJudTrab write FProcJudTrab;
    property infoPerApur: TInfoPerApur read getInfoPerApur write FInfoPerApur;
    property infoPerAnt: TInfoPerAnt read getInfoPerAnt write FInfoPerAnt;
  end;

  TInfoPerApur = class(TPersistent)
  private
     FRecPgtos: TRecPgtosPerApurCollection;
  public
    constructor create;
    destructor Destroy; override;
    property recPgtos: TRecPgtosPerApurCollection read FRecPgtos write FRecPgtos;
  end;

  TInfoPerAnt = class(TPersistent)
  private
    FRecPgtos: TRecPgtosPerAntCollection;
  public
    constructor create;
    destructor Destroy; override;
    property recPgtos: TRecPgtosPerAntCollection read FRecPgtos write FRecPgtos;
  end;


  TItensRemunCollection = class(TRubricaCollection);


  TRecPgtosPerApurCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TRecPgtosPerApurCollectionItem;
    procedure SetItem(Index: Integer; Value: TRecPgtosPerApurCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TRecPgtosPerApurCollectionItem;
    property Items[Index: Integer]: TRecPgtosPerApurCollectionItem read GetItem write SetItem;
  end;

  TRecPgtosPerApurCollectionItem = class(TReciboPagamento)
  private
    FRemunPerApur :TRemunPerCollection;
  public
    constructor create; reintroduce;
    destructor destroy; override;
    property remunPerApur: TRemunPerCollection read FRemunPerApur write FRemunPerApur;
  end;


  TRecPgtosPerAntCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TRecPgtosPerAntCollectionItem;
    procedure SetItem(Index: Integer; Value: TRecPgtosPerAntCollectionItem);
  public
    constructor create; reintroduce;
    function Add: TRecPgtosPerAntCollectionItem;
    property Items[Index: Integer]: TRecPgtosPerAntCollectionItem read GetItem write SetItem;
  end;

  TRecPgtosPerAntCollectionItem = class(TReciboPagamento)
  private
    FIdePeriodo: TIdePeriodoCollection;
  public
    constructor create; reintroduce;
    destructor destroy; override;
    property idePeriodo: TIdePeriodoCollection read FIdePeriodo write FIdePeriodo;
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
    FRemunPerAnt :TRemunPerCollection;
  public
    constructor create; reintroduce;
    destructor destroy; override;
    property perRef: string read FPerRef write FPerRef;
    property remunPerAnt: TRemunPerCollection read FRemunPerAnt write FRemunPerAnt;
  end;

  TRemunPerCollection = class(TCollection)
   private
    function GetItem(Index: Integer): TRemunPerCollectionItem;
    procedure SetItem(Index: Integer; Value: TRemunPerCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TRemunPerCollectionItem;
    property Items[Index: Integer]: TRemunPerCollectionItem read GetItem write SetItem;
  end;

  TRemunPerCollectionItem = class(TCollectionItem)
   private
    FMatricula: string;
    FCodCateg: Integer;
    FItensRemun: TItensRemunCollection;
    FInfoSaudeColet: TInfoSaudeColet;
    FPensaoAlim: TPensaoAlimCollection;
    function getInfoSaudeColet: TInfoSaudeColet;
  public
    constructor create;
    destructor destroy; override;
    function infoSaudeColetInst(): Boolean;

    property matricula: string read FMatricula write FMatricula;
    property codCateg: Integer read FCodCateg write FCodCateg;
    property itensRemun: TItensRemunCollection read FItensRemun write FItensRemun;
    property infoSaudeColet: TInfoSaudeColet read getInfoSaudeColet write FInfoSaudeColet;
    property pensaoAlim: TPensaoAlimCollection read FPensaoAlim write FPensaoAlim;
  end;

  TRemunPerApur = class(TRemunPerCollection);

  TRemunPerAnt = class(TRemunPerCollection);


implementation

uses
  eSocial_Periodicos;

{ TS1202CollectionItem }
constructor TS1202CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1202;
  FEvtRmnRPPS := TEvtRmnRPPS.Create(AOwner);
end;

destructor TS1202CollectionItem.Destroy;
begin
  FEvtRmnRPPS.free;
  inherited;
end;

procedure TS1202CollectionItem.setEvtRmnRPPS(const Value: TEvtRmnRPPS);
begin
  FEvtRmnRPPS.Assign(Value);
end;

{ TS1202Collection }
function TS1202Collection.Add: TS1202CollectionItem;
begin
  Result := TS1202CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1202Collection.GetItem(Index: Integer): TS1202CollectionItem;
begin
  Result := TS1202CollectionItem(inherited GetItem(Index));
end;

procedure TS1202Collection.SetItem(Index: Integer; Value: TS1202CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TEvtRemun }
constructor TEvtRmnRPPS.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento3.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeTrabalhador := TeS1202IdeTrabalhador.Create;
end;

destructor TEvtRmnRPPS.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeTrabalhador.Free;
  inherited;
end;

procedure TEvtRmnRPPS.GerarIdePeriodo(objIdePeriodo: TIdePeriodoCollection);
var
  iIdePeriodo: Integer;
begin
  for iIdePeriodo := 0 to objIdePeriodo.Count - 1 do
  begin
    Gerador.wGrupo('idePeriodo');
      Gerador.wCampo(tcStr, '', 'perRef', 0, 0, 0, objIdePeriodo.Items[iIdePeriodo].perRef);
      GerarRemunPer(objIdePeriodo.Items[iIdePeriodo].remunPerAnt, 'remunPerAnt');
    Gerador.wGrupo('/idePeriodo');
  end;
end;

procedure TEvtRmnRPPS.GerarIdeTrabalhador;
begin
  Gerador.wGrupo('ideTrabalhador');
    Gerador.wCampo(tcStr, '', 'cpfTrab', 0, 0, 0, ideTrabalhador.cpfTrab);
    Gerador.wCampo(tcStr, '', 'nisTrab', 0, 0, 0, ideTrabalhador.nisTrab);
    Gerador.wCampo(tcInt, '', 'qtdDepIRRF', 0, 0, 1, ideTrabalhador.qtdDepIRRF);

    GerarProcJudTrab(ideTrabalhador.procJudTrab);
    GerarInfoPerApur();
    GerarInfoPerAnt();
  Gerador.wGrupo('/ideTrabalhador');

end;

function TEvtRmnRPPS.GerarXML: boolean;
var
  SL : TSTringList;
begin
  try
    SL := TStringList.Create;
    GerarCabecalho('evtRemunRPPS');
      Gerador.wGrupo('evtRmnRPPS Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
      //Gerador.wGrupo('evtRmnRPPS');
        //GerarIdVersao(Self);
        GerarIdeEvento3(Self.IdeEvento);
        GerarIdeEmpregador(Self.ideEmpregador);
        gerarIdeTrabalhador();
      Gerador.wGrupo('/evtRmnRPPS');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtRmnRPPS');
    SL.Add(XML);
    SL.SaveToFile('c:\teste.xml');
    Validar('evtRemunRPPS');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;
  SL.Free;
  Result := (Gerador.ArquivoFormatoXML <> '')
end;


{ TeS1202IdeTrabalhador }

constructor TeS1202IdeTrabalhador.Create;
begin
  inherited;
  FProcJudTrab := TProcJudTrabCollection.create;
  FInfoPerApur := TInfoPerApur.Create;
end;

destructor TeS1202IdeTrabalhador.Destroy;
begin
  FProcJudTrab.Free;
  FInfoPerApur.Free;
  inherited;
end;

procedure TEvtRmnRPPS.GerarInfoPerAnt;
begin
  Gerador.wGrupo('infoPerAnt');
    GerarRecPgtoPerAnt(ideTrabalhador.infoPerAnt.recPgtos);
  Gerador.wGrupo('/infoPerAnt');
end;

procedure TEvtRmnRPPS.GerarInfoPerApur;
begin
  Gerador.wGrupo('infoPerApur');
    GerarRecPgtoPerApur(ideTrabalhador.infoPerApur.recPgtos);
  Gerador.wGrupo('/infoPerApur');
end;

procedure TEvtRmnRPPS.GerarRecPgtoPerAnt(oRecPgtoPerAnt: TRecPgtosPerAntCollection);
var
  iRecPqtosPerAnt: Integer;
begin
  for iRecPqtosPerAnt := 0 to oRecPgtoPerAnt.Count - 1 do
  begin
    Gerador.wGrupo('recPgtos');
      Gerador.wCampo(tcInt, '', 'ideRecPgto', 0, 0, 0, oRecPgtoPerAnt.Items[iRecPqtosPerAnt].ideRecPgto);
      Gerador.wCampo(tcDe2, '', 'vrRec', 0, 0, 0, oRecPgtoPerAnt.Items[iRecPqtosPerAnt].vrRec);
      GerarIdePeriodo(oRecPgtoPerAnt.Items[iRecPqtosPerAnt].idePeriodo);
    Gerador.wGrupo('/recPgtos');
  end;

end;

procedure TEvtRmnRPPS.GerarRecPgtoPerApur(oRecPgtoPerApur: TRecPgtosPerApurCollection);
var
  iRecPqtosPerApur: Integer;
begin
  for iRecPqtosPerApur := 0 to oRecPgtoPerApur.Count - 1 do
  begin
    Gerador.wGrupo('recPgtos');
      Gerador.wCampo(tcInt, '', 'ideRecPgto', 0, 0, 0, oRecPgtoPerApur.Items[iRecPqtosPerApur].ideRecPgto);
      Gerador.wCampo(tcDe2, '', 'vrRec', 0, 0, 0, oRecPgtoPerApur.Items[iRecPqtosPerApur].vrRec);
      GerarRemunPer(oRecPgtoPerApur.Items[iRecPqtosPerApur].remunPerApur);
    Gerador.wGrupo('/recPgtos');
  end;
end;

procedure TEvtRmnRPPS.GerarRemunPer(objRemunPer: TRemunPerCollection;
  nomeRemunPer: string);
var
  iRemunPer: Integer;
begin
  for iRemunPer := 0 to objRemunPer.Count - 1 do
  begin
    Gerador.wGrupo(nomeRemunPer);
      Gerador.wCampo(tcStr, '', 'matricula', 0, 0, 0, objRemunPer.Items[iRemunPer].matricula);
      Gerador.wCampo(tcInt, '', 'codCateg', 0, 0, 0, objRemunPer.Items[iRemunPer].codCateg);

      GerarItensRemun(objRemunPer.Items[iRemunPer].itensRemun, 'itensRemun');
      if (nomeRemunPer = 'remunPerApur') then
      begin
        if objRemunPer.Items[iRemunPer].infoSaudeColetInst() then
          GerarInfoSaudeColet(objRemunPer.Items[iRemunPer].infoSaudeColet);
      end;
      GerarPensaoAlim(objRemunPer.Items[iRemunPer].pensaoAlim);
    Gerador.wGrupo('/' + nomeRemunPer);
  end;
end;

function TeS1202IdeTrabalhador.getInfoPerAnt: TInfoPerAnt;
begin
  if Not(Assigned(FInfoPerAnt)) then
    FInfoPerAnt := TInfoPerAnt.create;
  Result := FInfoPerAnt;
end;

function TeS1202IdeTrabalhador.getInfoPerApur: TInfoPerApur;
begin
  if Not(Assigned(FInfoPerApur)) then
    FInfoPerApur := TInfoPerApur.create;
  Result := FInfoPerApur;
end;

function TeS1202IdeTrabalhador.infoPerAntInst: Boolean;
begin
  Result := Assigned(FInfoPerAnt);
end;

function TeS1202IdeTrabalhador.infoPerApurInst: Boolean;
begin
   Result := Assigned(FInfoPerApur);
end;

{ TInfoPerApur }

constructor TInfoPerApur.create;
begin
  inherited;
  FRecPgtos := TRecPgtosPerApurCollection.Create;
end;

destructor TInfoPerApur.Destroy;
begin
  FRecPgtos.Free;
  inherited;
end;

{ TRecPgtosPerApurCollection }
function TRecPgtosPerApurCollection.Add: TRecPgtosPerApurCollectionItem;
begin
  Result := TRecPgtosPerApurCollectionItem(inherited Add);
  Result.create;
end;

constructor TRecPgtosPerApurCollection.create;
begin
  inherited create(TRecPgtosPerApurCollectionItem)
end;

function TRecPgtosPerApurCollection.GetItem(
  Index: Integer): TRecPgtosPerApurCollectionItem;
begin
  Result := TRecPgtosPerApurCollectionItem(inherited GetItem(Index));
end;

procedure TRecPgtosPerApurCollection.SetItem(Index: Integer;
  Value: TRecPgtosPerApurCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoPerAnt }
constructor TInfoPerAnt.create;
begin
  inherited;
  FRecPgtos := TRecPgtosPerAntCollection.Create;
end;

destructor TInfoPerAnt.Destroy;
begin
  FRecPgtos.Free;
  inherited;
end;

{ TRecPgtosPerAntCollection }
function TRecPgtosPerAntCollection.Add: TRecPgtosPerAntCollectionItem;
begin
  Result := TRecPgtosPerAntCollectionItem(inherited Add);
  Result.create;
end;

constructor TRecPgtosPerAntCollection.create;
begin
  inherited create(TRecPgtosPerAntCollectionItem)
end;

function TRecPgtosPerAntCollection.GetItem(
  Index: Integer): TRecPgtosPerAntCollectionItem;
begin
  Result := TRecPgtosPerAntCollectionItem(inherited GetItem(Index));
end;

procedure TRecPgtosPerAntCollection.SetItem(Index: Integer;
  Value: TRecPgtosPerAntCollectionItem);
begin
  inherited SetItem(Index, Value);
end;


{ TRecPgtosPerAntCollectionItem }

constructor TRecPgtosPerAntCollectionItem.create;
begin
  inherited;
  FIdePeriodo := TIdePeriodoCollection.create;
end;

destructor TRecPgtosPerAntCollectionItem.destroy;
begin
  FIdePeriodo.Free;
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

{ TIdePeriodoCollectionItem }

constructor TIdePeriodoCollectionItem.create;
begin
  FRemunPerAnt := TRemunPerCollection.create;
end;

destructor TIdePeriodoCollectionItem.destroy;
begin
  FRemunPerAnt.Free;
  inherited;
end;

{ TRemunPerCollection }

function TRemunPerCollection.Add: TRemunPerCollectionItem;
begin
  Result := TRemunPerCollectionItem(inherited Add);
  Result.create;
end;

constructor TRemunPerCollection.create;
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

{ TRemunPerCollectionItem }

constructor TRemunPerCollectionItem.create;
begin
  FItensRemun := TItensRemunCollection.Create;
  FInfoSaudeColet := nil;
  FPensaoAlim := TPensaoAlimCollection.create;
end;

destructor TRemunPerCollectionItem.destroy;
begin
  FItensRemun.Free;
  FreeAndNil(FInfoSaudeColet);
  FPensaoAlim.Free;
  inherited;
end;

function TRemunPerCollectionItem.getInfoSaudeColet: TInfoSaudeColet;
begin
  if Not(Assigned(FInfoSaudeColet)) then
    FInfoSaudeColet := TInfoSaudeColet.create;
  Result := FInfoSaudeColet;
end;

function TRemunPerCollectionItem.infoSaudeColetInst: Boolean;
begin
  Result := Assigned(FInfoSaudeColet);
end;

{ TRecPgtosPerApurCollectionItem }

constructor TRecPgtosPerApurCollectionItem.create;
begin
  inherited;
  FRemunPerApur := TRemunPerCollection.Create;
end;

destructor TRecPgtosPerApurCollectionItem.destroy;
begin
  FRemunPerApur.Free;
  inherited;
end;

end.
