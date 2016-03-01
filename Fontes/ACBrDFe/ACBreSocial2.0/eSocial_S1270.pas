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
|*  - Passado o namespace para geração do cabeçalho
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S1270;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type
  TS1270Collection = class;
  TS1270CollectionItem = class;
  TEvtContratAvNP = class;
  TInfoRemunAvNP=class;
  TIdeSindItem = class;
  TIdeSindColecao = class;
  TRemunAvNPItem = class;
  TRemunAvNPColecao = class;


  TS1270Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1270CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1270CollectionItem);
  public
    function Add: TS1270CollectionItem;
    property Items[Index: Integer]: TS1270CollectionItem read GetItem write SetItem; default;
  end;

  TS1270CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtContratAvNP: TEvtContratAvNP;
    procedure setEvtContratAvNP(const Value: TEvtContratAvNP);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtContratAvNP: TEvtContratAvNP read FEvtContratAvNP write setEvtContratAvNP;
  end;

  TEvtContratAvNP = class(TESocialEvento)
  private
    FIdeEvento: TIdeEvento3;
    FIdeEmpregador: TIdeEmpregador;
    FInfoRemunAvNP: TInfoRemunAvNP;

    {Geradores específicos da classe}
    procedure GerarInfoRemunAvNP();
    procedure GerarIdeSind();
    procedure GerarRemunAvNP(pRemunAvNPColecao: TRemunAvNPColecao);
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor Destroy; override;

    function GerarXML: boolean; override;

    property IdeEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property InfoRemunAvNP: TInfoRemunAvNP read FInfoRemunAvNP write FInfoRemunAvNP;
  end;

  TInfoRemunAvNP=class(TPersistent)
  private
    FIdeSind: TIdeSindColecao;
  public
    constructor create;
    destructor destroy; override;

    property IdeSind: TIdeSindColecao read FIdeSind write FIdeSind;
  end;

  TIdeSindColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TIdeSindItem;
    procedure SetItem(Index: Integer; const Value: TIdeSindItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TIdeSindItem;
    property Items[Index: Integer]: TIdeSindItem read GetItem write SetItem;
  end;

  TIdeSindItem = class(TCollectionItem)
  private
    FcnpjSind: string;
    FfpasSind: integer;
    FcodTercs: string;
    FRemunAvNP: TRemunAvNPColecao;
  public
    constructor create; reintroduce;
    destructor destroy; override;

    property cnpjSind: string read FcnpjSind write FcnpjSind;
    property fpasSind: integer read FfpasSind write FfpasSind;
    property codTercs: string read FcodTercs write FcodTercs;
    property RemunAvNP: TRemunAvNPColecao read FRemunAvNP write FRemunAvNP;
  end;


  TRemunAvNPColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TRemunAvNPItem;
    procedure SetItem(Index: Integer; const Value: TRemunAvNPItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TRemunAvNPItem;
    property Items[Index: Integer]: TRemunAvNPItem read GetItem write SetItem;
  end;

  TRemunAvNPItem = class(TCollectionItem)
  private
    FtpInsc: TpTpInscEstab;
    FnrInsc: string;
    FvlrRemun: Double;
    Fvr13: Double;
    FvrDescCP: Double;
  public
    property tpInsc: TpTpInscEstab read FtpInsc write FtpInsc;
    property nrInsc: string read FnrInsc write FnrInsc;
    property vlrRemun: Double read FvlrRemun write FvlrRemun;
    property vr13: Double read Fvr13 write Fvr13;
    property vrDescCP: Double read FvrDescCP write FvrDescCP;
  end;

implementation

uses
  eSocial_Periodicos;

{ TS1270Collection }
function TS1270Collection.Add: TS1270CollectionItem;
begin
  Result := TS1270CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1270Collection.GetItem(Index: Integer): TS1270CollectionItem;
begin
  Result := TS1270CollectionItem(inherited GetItem(Index));
end;

procedure TS1270Collection.SetItem(Index: Integer;
  Value: TS1270CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{TS1270CollectionItem}
constructor TS1270CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento     := teS1270;
  FEvtContratAvNP := TEvtContratAvNP.Create(AOwner);
end;

destructor TS1270CollectionItem.Destroy;
begin
  FEvtContratAvNP.Free;
  inherited;
end;

procedure TS1270CollectionItem.setEvtContratAvNP(const Value: TEvtContratAvNP);
begin
  FEvtContratAvNP.Assign(Value);
end;

{ TEvtContratAvNP }
constructor TEvtContratAvNP.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento     := TIdeEvento3.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FInfoRemunAvNP := TInfoRemunAvNP.create;
end;

destructor TEvtContratAvNP.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FInfoRemunAvNP.Free;
  inherited;
end;

procedure TEvtContratAvNP.GerarIdeSind;
var
  iIdeSindItem: Integer;
begin
  for iIdeSindItem := 0 to InfoRemunAvNP.IdeSind.Count - 1 do
  begin
    Gerador.wGrupo('ideSind');
      Gerador.wCampo(tcStr, '', 'cnpjSind', 0, 0, 0, InfoRemunAvNP.IdeSind.Items[iIdeSindItem].cnpjSind);
      Gerador.wCampo(tcStr, '', 'fpasSind', 0, 0, 0, InfoRemunAvNP.IdeSind.Items[iIdeSindItem].fpasSind);
      Gerador.wCampo(tcStr, '', 'codTercs', 0, 0, 0, InfoRemunAvNP.IdeSind.Items[iIdeSindItem].codTercs);
      GerarRemunAvNP(InfoRemunAvNP.IdeSind.Items[iIdeSindItem].RemunAvNP);
    Gerador.wGrupo('/ideSind');
  end;
end;

procedure TEvtContratAvNP.GerarInfoRemunAvNP;
begin
  Gerador.wGrupo('infoRemunAvNP');
    GerarIdeSind;
  Gerador.wGrupo('/infoRemunAvNP');
end;

procedure TEvtContratAvNP.GerarRemunAvNP(pRemunAvNPColecao: TRemunAvNPColecao);
var
  i: integer;
begin
  for i := 0 to pRemunAvNPColecao.Count - 1 do
  begin
    Gerador.wGrupo('remunAvNP');
      Gerador.wCampo(tcStr, '', 'tpInsc',   0, 0, 0, eSTpInscEstabToStr(pRemunAvNPColecao.Items[i].tpInsc));
      Gerador.wCampo(tcStr, '', 'nrInsc',   0, 0, 0, pRemunAvNPColecao.Items[i].nrInsc);
      Gerador.wCampo(tcDe2, '', 'vlrRemun', 0, 0, 0, pRemunAvNPColecao.Items[i].vlrRemun);
      Gerador.wCampo(tcDe2, '', 'vr13',     0, 0, 0, pRemunAvNPColecao.Items[i].vr13);
      Gerador.wCampo(tcDe2, '', 'vrDescCP', 0, 0, 0, pRemunAvNPColecao.Items[i].vrDescCP);
    Gerador.wGrupo('/remunAvNP');
  end;
end;

function TEvtContratAvNP.GerarXML: boolean;
begin
  try
    GerarCabecalho('evtContratAvNP');
      Gerador.wGrupo('evtContratAvNP Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
        gerarIdeEvento3(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        GerarInfoRemunAvNP;
      Gerador.wGrupo('/evtContratAvNP');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtContratAvNP');
    Validar('evtContratAvNP');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TIdeSindColecao }
function TIdeSindColecao.Add: TIdeSindItem;
begin
  Result := TIdeSindItem(inherited add);
  Result.Create;
end;

constructor TIdeSindColecao.create(AOwner: TPersistent);
begin
  inherited create(TIdeSindItem)
end;

function TIdeSindColecao.GetItem(Index: Integer): TIdeSindItem;
begin
  Result := TIdeSindItem(inherited GetItem(Index));
end;

procedure TIdeSindColecao.SetItem(Index: Integer; const Value: TIdeSindItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoRemunAvNP }
constructor TInfoRemunAvNP.create;
begin
  inherited;
  FIdeSind := TIdeSindColecao.Create(self);
end;

destructor TInfoRemunAvNP.destroy;
begin
  FIdeSind.Free;
  inherited;
end;

{ TIdeSindItem }
constructor TIdeSindItem.create;
begin
  FRemunAvNP := TRemunAvNPColecao.Create(self);
end;

destructor TIdeSindItem.destroy;
begin
  FRemunAvNP.Free;
  inherited;
end;

{ TRemunAvNPColecao }
function TRemunAvNPColecao.Add: TRemunAvNPItem;
begin
  Result := TRemunAvNPItem(inherited Add);
end;

constructor TRemunAvNPColecao.Create(AOwner: TPersistent);
begin
  inherited Create(TRemunAvNPItem);
end;

function TRemunAvNPColecao.GetItem(Index: Integer): TRemunAvNPItem;
begin
  Result := TRemunAvNPItem(inherited GetItem(Index));
end;

procedure TRemunAvNPColecao.SetItem(Index: Integer;
  const Value: TRemunAvNPItem);
begin
  inherited SetItem(Index, Value);
end;

end.
