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

unit eSocial_S2399;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type
  TS2399Collection = class;
  TS2399CollectionItem = class;
  TEvtTSVTermino = class;
  TInfoTSVTermino = class;
  TinfoCompl = class;


  TS2399Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS2399CollectionItem;
    procedure SetItem(Index: Integer; Value: TS2399CollectionItem);
  public
    function Add: TS2399CollectionItem;
    property Items[Index: Integer]: TS2399CollectionItem read GetItem write SetItem; default;
  end;

  TS2399CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtTSVTermino : TEvtTSVTermino;
    procedure setEvtTSVTermino(const Value: TEvtTSVTermino);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtTSVTermino: TEvtTSVTermino read FEvtTSVTermino write setEvtTSVTermino;
  end;

  TEvtTSVTermino = class(TeSocialEvento)
    private
      FIdeEvento: TIdeEvento2;
      FIdeEmpregador: TIdeEmpregador;
      FIdeTrabSemVInc : TideTrabSemVinc;
      FInfoTSVTermino: TInfoTSVTermino;
      procedure GerarInfoTSVTermino(obj: TInfoTSVTermino);
      procedure GerarVerbasResc(obj: TVerbasResc);
      procedure GerarRecPgtos(obj: TRecPgtosCollection);
      procedure GerarQuarentena(obj: TQuarentena);
      procedure GerarInfoComplementares(obj: TinfoCompl);
      procedure GerarIdeTrabSemVinc(obj: TIdeTrabSemVinc);
      procedure GerarIdeEstabLot(obj : TIdeEstabLotCollection);
      procedure GerarProcJudTrab(obj: TinfoProcJudCollection);
      procedure GerarDetVerbas(obj: TdetVerbasCollection);
      procedure GerarInfoAgNocivo(obj: TinfoAgNocivo);
      procedure GerarInfoSimples(obj: TinfoSimples);
     public
      constructor Create(AACBreSocial: TObject);overload;
      destructor Destroy; override;

      function GerarXML: boolean; override;

      property IdeEvento: TIdeEvento2 read FIdeEvento write FIdeEvento;
      property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
      property IdeTrabSemVInc: TideTrabSemVinc read FIdeTrabSemVInc write FIdeTrabSemVInc;
      property InfoTSVTermino: TInfoTSVTermino read FInfoTSVTermino write FInfoTSVTermino;
  end;

  TinfoTSVTermino = class(TPersistent)
    private
      FdtTerm : TDateTime;
      FinfoComplementares: TinfoCompl;
    public
      constructor Create;
      destructor  Destroy; override;

      property dtTerm : TDateTime read FdtTerm write FdtTerm;
      property infoComplementares : TinfoCompl read FinfoComplementares write FinfoComplementares;
  end;

  TinfoCompl = class(TPersistent)
    private
      FmtvDesligTSV : string;
      FverbasResc : TVerbasResc;
      FrecPgtos : TRecPgtosCollection;
      Fquarentena : TQuarentena;
    public
      constructor Create;
      destructor  Destroy; override;

      property mtvDesligTSV : string read FmtvDesligTSV write FmtvDesligTSV;
      property verbasResc : TVerbasResc read FverbasResc write FverbasResc;
      property recpgtos : TRecPgtosCollection read FrecPgtos write FrecPgtos;
      property quarentena : TQuarentena read Fquarentena write Fquarentena;
  end;

implementation

uses
  eSocial_NaoPeriodicos;

{ TS2399Collection }

function TS2399Collection.Add: TS2399CollectionItem;
begin
  Result := TS2399CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2399Collection.GetItem(Index: Integer): TS2399CollectionItem;
begin
  Result := TS2399CollectionItem(inherited GetItem(Index));
end;

procedure TS2399Collection.SetItem(Index: Integer; Value: TS2399CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS2399CollectionItem }

constructor TS2399CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS2399;
  FEvtTSVTermino := TEvtTSVTermino.Create(AOwner);
end;

destructor TS2399CollectionItem.Destroy;
begin
  FEvtTSVTermino.Free;
  inherited;
end;

procedure TS2399CollectionItem.setEvtTSVTermino(const Value: TEvtTSVTermino);
begin
  FEvtTSVTermino.Assign(Value);
end;

{ TEvtTSVTermino }

constructor TEvtTSVTermino.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeTrabSemVInc := TideTrabSemVinc.Create;
  FInfoTSVTermino := TInfoTSVTermino.Create;
end;

destructor TEvtTSVTermino.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeTrabSemVInc.Free;
  FInfoTSVTermino.Free;
  inherited;
end;

procedure TEvtTSVTermino.GerarDetVerbas(obj: TdetVerbasCollection);
var
  i: Integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('detVerbas');
        Gerador.wCampo(tcStr, '', 'codRubr', 0,0,0, obj.Items[i].codRubr);
        Gerador.wCampo(tcStr, '', 'ideTabRubr', 0,0,0, obj.Items[i].ideTabRubr);
        Gerador.wCampo(tcStr, '', 'qtdRubr', 0,0,0, obj.Items[i].qtdRubr);
        Gerador.wCampo(tcDe2, '', 'vrUnit', 0,0,0, obj.Items[i].vrUnit);
        Gerador.wCampo(tcDe2, '', 'vrRubr', 0,0,0, obj.Items[i].vrRubr);
      Gerador.wGrupo('/detVerbas');
    end;
end;

procedure TEvtTSVTermino.GerarIdeEstabLot(obj: TIdeEstabLotCollection);
var
  i : integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('ideEstabLot');
        Gerador.wCampo(tcStr, '', 'tpInsc', 0,0,0, obj.Items[i].tpInsc);
        Gerador.wCampo(tcStr, '', 'nrInsc', 0,0,0, obj.Items[i].nrInsc);
        Gerador.wCampo(tcStr, '', 'codLotacao', 0,0,0, obj.Items[i].codLotacao);
        GerarDetVerbas(obj.Items[i].detVerbas);
        GerarInfoAgNocivo(obj.Items[i].infoAgNocivo);
      Gerador.wGrupo('/ideEstabLot');
    end;
end;

procedure TEvtTSVTermino.GerarIdeTrabSemVinc(obj: TIdeTrabSemVinc);
begin
  Gerador.wGrupo('ideTrabSemVinculo');
    Gerador.wCampo(tcStr, '', 'cpfTrab', 0,0,0, obj.cpfTrab);
    Gerador.wCampo(tcStr, '', 'nisTrab', 0,0,0, obj.nisTrab);
    Gerador.wCampo(tcStr, '', 'codCateg', 0,0,0, obj.codCateg);
  Gerador.wGrupo('/ideTrabSemVinculo');
end;

procedure TEvtTSVTermino.GerarInfoAgNocivo(obj: TinfoAgNocivo);
begin
  Gerador.wGrupo('infoAgNocivo');
    Gerador.wCampo(tcStr, '', 'grauExp', 0,0,0, obj.grauExp);
  Gerador.wGrupo('/infoAgNocivo');
end;

procedure TEvtTSVTermino.GerarInfoComplementares(obj: TinfoCompl);
begin
  Gerador.wGrupo('infoComplementares');
    Gerador.wCampo(tcStr, '', 'mtvDesligTSV', 0,0,0, obj.mtvDesligTSV);
    GerarVerbasResc(obj.verbasResc);
    GerarQuarentena(obj.quarentena);
  Gerador.wGrupo('/infoComplementares');
end;

procedure TEvtTSVTermino.GerarInfoSimples(obj: TinfoSimples);
begin
  Gerador.wGrupo('infoSimples');
    Gerador.wCampo(tcStr, '', 'indSimples', 0,0,0, obj.indSimples);
  Gerador.wGrupo('/infoSimples');
end;

procedure TEvtTSVTermino.GerarInfoTSVTermino(obj: TInfoTSVTermino);
begin
  Gerador.wGrupo('infoTSVTermino');
    Gerador.wCampo(tcDat, '', 'dtTerm', 0,0,0, obj.dtTerm);
    GerarInfoComplementares(obj.infoComplementares);
  Gerador.wGrupo('/infoTSVTermino');
end;

procedure TEvtTSVTermino.GerarProcJudTrab(obj: TinfoProcJudCollection);
var
  i : Integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('procJutTrab');
        Gerador.wCampo(tcStr, '', 'tpTrib', 0,0,0, obj.Items[i].tpTrib);
        Gerador.wCampo(tcDe2, '', 'nrProcJud', 0,0,0, obj.items[i].nrProcJud);
      Gerador.wGrupo('/procJutTrab');
    end;
end;

procedure TEvtTSVTermino.GerarQuarentena(obj: TQuarentena);
begin
  Gerador.wGrupo('quarentena');
    Gerador.wCampo(tcDat, '', 'dtFimQuar', 0,0,0, obj.dtFimQuar);
  Gerador.wGrupo('/quarentena');
end;

procedure TEvtTSVTermino.GerarRecPgtos(obj: TRecPgtosCollection);
var
  i : Integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('recPgtos');
        Gerador.wCampo(tcStr, '', 'ideRecPgto', 0,0,0, obj.Items[i].IdeRecPgto);
        Gerador.wCampo(tcDe2, '', 'vlrPgto', 0,0,0, obj.items[i].vlrPgto);
        GerarIdeEstabLot(obj.Items[i].ideEstabLot);
      Gerador.wGrupo('/recPgtos');
    end;
end;

procedure TEvtTSVTermino.GerarVerbasResc(obj: TVerbasResc);
begin
  Gerador.wGrupo('verbasResc');
    GerarRecPgtos(obj.RecPgtos);
    GerarInfoSimples(obj.RecPgtos.Items[0].ideEstabLot.Items[0].infoSimples);
  Gerador.wGrupo('/verbasResc');
end;

function TEvtTSVTermino.GerarXML: boolean;
begin
  try
  GerarCabecalho('');
    Gerador.wGrupo('evtTSVTermino Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');//versao="'+Self.versao+'"
      //gerarIdVersao(self);
      gerarIdeEvento2(self.IdeEvento);
      gerarIdeEmpregador(self.IdeEmpregador);
      GerarIdeTrabSemVinc(self.IdeTrabSemVInc);
      GerarInfoTSVTermino(Self.InfoTSVTermino);
    Gerador.wGrupo('/evtTSVTermino');
  GerarRodape;
  XML := Assinar(Gerador.ArquivoFormatoXML, 'evtTSVTermino');
  Validar('evtTSVTermino');
except on e:exception do
  raise Exception.Create(e.Message);
end;
Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TinfoTSVTermino }

constructor TinfoTSVTermino.Create;
begin
  inherited;
  FinfoComplementares := TinfoCompl.Create;
end;

destructor TinfoTSVTermino.Destroy;
begin
  FinfoComplementares.Free;
  inherited;
end;

{ TinfoCompl }

constructor TinfoCompl.Create;
begin
  inherited;
  FverbasResc := TVerbasResc.Create;
  FrecPgtos   := TRecPgtosCollection.create;
  Fquarentena := TQuarentena.Create;
end;

destructor TinfoCompl.Destroy;
begin
  FverbasResc.Free;
  FrecPgtos.Free;
  Fquarentena.Free;
  inherited;
end;

end.
