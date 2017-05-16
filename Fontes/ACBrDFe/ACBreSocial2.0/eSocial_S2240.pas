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

unit eSocial_S2240;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type
  TS2240Collection = class;
  TS2240CollectionItem = class;
  TEvtExpRisco = class;
  TinfoExpRisco = class;
  TiniExpRisco = class;
  TaltExpRisco = class;
  TfimExpRisco = class;
  TExpRisco = class;

  TS2240Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS2240CollectionItem;
    procedure SetItem(Index: Integer; Value: TS2240CollectionItem);
  public
    function Add: TS2240CollectionItem;
    property Items[Index: Integer]: TS2240CollectionItem read GetItem write SetItem; default;
  end;

  TS2240CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtExpRisco: TEvtExpRisco;
    procedure setEvtExpRisco(const Value: TEvtExpRisco);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtExpRisco: TEvtExpRisco read FEvtExpRisco write setEvtExpRisco;
  end;

  TEvtExpRisco = class(TeSocialEvento)
  private
    FIdeEvento: TIdeEvento2;
    FIdeEmpregador: TIdeEmpregador;
    FIdeVinculo: TIdeVinculo;
    FinfoExpRisco: TinfoExpRisco;

    procedure GerarInfoExpRisco(objInfoExpRisco: TInfoExpRisco);
    procedure GerariniExpRisco(objiniExpRisco: TiniExpRisco);
    procedure GeraraltExpRisco(objaltExpRisco: TaltExpRisco);
    procedure GerarfimExpRisco(objfimExpRisco: TfimExpRisco);
    procedure GerarInfoAmb(objInfoAmb : TinfoAmbCollection);
    procedure GerarFatRisco(objFatRisco: TFatRiscoCollection);
    procedure GerarEPI(objEPI: TEpiCollectionItem);
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor  Destroy; override;

    function GerarXML: boolean; override;

    property IdeEvento: TIdeEvento2 read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property IdeVinculo: TIdeVinculo read FIdeVinculo write FIdeVinculo;
    property infoExpRisco: TinfoExpRisco read FinfoExpRisco write FinfoExpRisco;
  end;

  TinfoExpRisco = class
    private
      FiniExpRisco : TiniExpRisco;
      FaltExpRisco : TaltExpRisco;
      FfimExpRisco : TfimExpRisco;
    public
      constructor Create;
      destructor  Destroy; override;

      property iniExpRisco: TiniExpRisco read FiniExpRisco write FiniExpRisco;
      property altExpRisco: TaltExpRisco read FaltExpRisco write FaltExpRisco;
      property fimExpRisco: TfimExpRisco read FfimExpRisco write FfimExpRisco;
  end;

  TExpRisco = class(TPersistent)
    private
      FdtCondicao : TDateTime;
      FInfoAmb : TInfoAmbCollection;

      procedure SetInfoAmb(const Value: TInfoAmbCollection);
    public
      constructor Create;
      destructor  Destroy;

      property dtCondicao : TDateTime read FdtCondicao write FdtCondicao;
      property InfoAmb : TInfoAmbCollection read FInfoAmb write SetInfoAmb;
  end;

  TiniExpRisco = class(TExpRisco);

  TaltExpRisco = class(TExpRisco);

  TfimExpRisco = class
    private
      FinfoAmb: TInfoAmbCollection;
      FdtFimCondicao: TDateTime;
      procedure SetinfoAmb(const Value: TInfoAmbCollection);
    public
      constructor create;
      destructor  destroy; override;
      property dtFimCondicao : TDateTime read FdtFimCondicao write FdtFimCondicao;
      property infoAmb : TInfoAmbCollection read FinfoAmb write SetinfoAmb;
  end;

implementation

uses
  eSocial_NaoPeriodicos;

{ TS2240Collection }

function TS2240Collection.Add: TS2240CollectionItem;
begin
  Result := TS2240CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2240Collection.GetItem(Index: Integer): TS2240CollectionItem;
begin
  Result := TS2240CollectionItem(inherited GetItem(Index));
end;

procedure TS2240Collection.SetItem(Index: Integer;
  Value: TS2240CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS2240CollectionItem }

constructor TS2240CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS2240;
  FEvtExpRisco := TEvtExpRisco.Create(AOwner);
end;

destructor TS2240CollectionItem.Destroy;
begin
  FEvtExpRisco.Free;
  inherited;
end;

procedure TS2240CollectionItem.setEvtExpRisco(const Value: TEvtExpRisco);
begin
  FEvtExpRisco.Assign(Value);
end;

{ TEvtAltContratual }

constructor TEvtExpRisco.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeVinculo := TIdeVinculo.Create;
  FInfoExpRisco := TInfoExpRisco.Create;
end;

destructor TEvtExpRisco.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeVinculo.Free;
  FInfoExpRisco.Free;
  inherited;
end;

procedure TEvtExpRisco.GeraraltExpRisco(objaltExpRisco: TaltExpRisco);
begin
  Gerador.wGrupo('altExpRisco');
    Gerador.wCampo(tcDat, '', 'dtAltCondicao', 0,0,0, objAltExpRisco.dtCondicao);
    GerarInfoAmb(objaltExpRisco.InfoAmb);
  Gerador.wGrupo('/altExpRisco');
end;

procedure TEvtExpRisco.GerarEPI(objEPI: TEpiCollectionItem);
begin
  Gerador.wGrupo('epi');
    Gerador.wCampo(tcStr, '', 'caEPI', 0,0,0, objEPI.caEPI);
    Gerador.wCampo(tcStr, '', 'eficaciaEpi', 0,0,0, eSSimNaoToStr(objEPI.eficaciaEpi));
    Gerador.wCampo(tcStr, '', 'medProtecao', 0,0,0, eSSimNaoToStr(objEPI.medProtecao));
    Gerador.wCampo(tcStr, '', 'condFuncto', 0,0,0, eSSimNaoToStr(objEPI.condFuncto));
    Gerador.wCampo(tcStr, '', 'przValid', 0,0,0, eSSimNaoToStr(objEPI.przValid));
    Gerador.wCampo(tcStr, '', 'periodicTroca', 0,0,0, eSSimNaoToStr(objEPI.periodicTroca));
    Gerador.wCampo(tcStr, '', 'higienizacao', 0,0,0, eSSimNaoToStr(objEPI.higienizacao));
  Gerador.wGrupo('/epi');
end;

procedure TEvtExpRisco.GerarFatRisco(objFatRisco: TFatRiscoCollection);
var
  i: Integer;
begin
  for I := 0 to objFatRisco.Count - 1 do
  begin
    Gerador.wGrupo('fatRisco');
      Gerador.wCampo(tcStr, '', 'codFatRis', 0,0,0, objFatRisco.Items[i].codFatRis);
      Gerador.wCampo(tcStr, '', 'intConc', 0,0,0, objFatRisco.Items[i].intConc);
      Gerador.wCampo(tcStr, '', 'tecMedicao', 0,0,0, objFatRisco.Items[i].tecMedicao);
      Gerador.wCampo(tcStr, '', 'utilizEPI', 0,0,0, objFatRisco.Items[i].utilizEPI);
    Gerador.wGrupo('/fatRisco');
  end;
end;

procedure TEvtExpRisco.GerarfimExpRisco(objfimExpRisco: TfimExpRisco);
var
  i: Integer;
begin
  //Gerado a parte pois pede menos campos que os demais grupos do layout.
  Gerador.wGrupo('fimExpRisco');
    Gerador.wCampo(tcDat, '', 'dtFimCondicao', 0,0,0, objfimExpRisco.dtFimCondicao);
    for I := 0 to objfimExpRisco.infoAmb.Count - 1 do
    begin
      Gerador.wGrupo('infoAmb');
        Gerador.wCampo(tcStr, '', 'codAmb', 0,0,0, objfimExpRisco.InfoAmb.items[i].codAmb);
        Gerador.wGrupo('infoAtiv');
         Gerador.wCampo(tcStr, '', 'dscAtivDes', 0,0,0, objfimExpRisco.InfoAmb.items[i].InfoAtiv.dscAtivDes);
        Gerador.wGrupo('/infoAtiv');
      Gerador.wGrupo('/infoAmb');
    end;
  Gerador.wGrupo('/fimExpRisco');
end;

procedure TEvtExpRisco.GerarInfoAmb(objInfoAmb: TinfoAmbCollection);
var
  j, i : integer;
begin
  for j := 0 to objInfoAmb.Count - 1 do
  begin
    Gerador.wGrupo('infoAmb');
      Gerador.wCampo(tcStr, '', 'codAmb', 0,0,0, objInfoAmb.items[j].codAmb);
      Gerador.wGrupo('infoAtiv');
        Gerador.wCampo(tcStr, '', 'dscAtivDes', 0,0,0, objInfoAmb.items[j].InfoAtiv.dscAtivDes);
      Gerador.wGrupo('/infoAtiv');
      GerarFatRisco(objInfoAmb.items[j].FatRisco);
      for i := 0 to objInfoAmb.items[j].EPI.Count -1 do
        GerarEPI(objInfoAmb.items[j].EPI.Items[i]);
    Gerador.wGrupo('/infoAmb');
  end;
end;

procedure TEvtExpRisco.GerarInfoExpRisco(objInfoExpRisco: TInfoExpRisco);
begin
  Gerador.wGrupo('infoExpRisco');
    if (objInfoExpRisco.iniExpRisco.dtCondicao > 0) then
      GerariniExpRisco(objInfoExpRisco.iniExpRisco);
    if (objInfoExpRisco.altExpRisco.dtCondicao > 0) then
      GeraraltExpRisco(objInfoExpRisco.altExpRisco);
    if (objInfoExpRisco.fimExpRisco.dtFimCondicao > 0) then
      GerarfimExpRisco(objInfoExpRisco.fimExpRisco);
  Gerador.wGrupo('/infoExpRisco');
end;

procedure TEvtExpRisco.GerariniExpRisco(objiniExpRisco: TiniExpRisco);
begin
  Gerador.wGrupo('iniExpRisco');
    Gerador.wCampo(tcDat, '', 'dtIniCondicao', 0,0,0, objiniExpRisco.dtCondicao);
    GerarInfoAmb(objiniExpRisco.InfoAmb);
  Gerador.wGrupo('/iniExpRisco');
end;

function TEvtExpRisco.GerarXML: boolean;
begin
  try
    GerarCabecalho('evtExpRisco');
      Gerador.wGrupo('evtExpRisco Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');//versao="'+Self.versao+'"';
        //gerarIdVersao(self);
        gerarIdeEvento2(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        gerarIdeVinculo(self.IdeVinculo);
        GerarInfoExpRisco(self.InfoExpRisco);
      Gerador.wGrupo('/evtExpRisco');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtExpRisco');
    Validar('evtExpRisco');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TExpRisco }

constructor TExpRisco.create;
begin
  inherited;
  FInfoAmb := TInfoAmbCollection.Create;
end;

destructor TExpRisco.destroy;
begin
  FinfoAmb.Free;
  inherited;
end;

procedure TExpRisco.SetInfoAmb(const Value: TInfoAmbCollection);
begin
  FInfoAmb.Assign(Value);
end;

{ TfimExpRisco }

constructor TfimExpRisco.create;
begin
  inherited;
  FinfoAmb := TInfoAmbCollection.Create;
end;

destructor TfimExpRisco.destroy;
begin
  FInfoAmb.Free;
  inherited;
end;

procedure TfimExpRisco.SetinfoAmb(const Value: TInfoAmbCollection);
begin
  FinfoAmb := Value;
end;

{ TinfoExpRisco }

constructor TinfoExpRisco.create;
begin
  inherited;
  FiniExpRisco := TiniExpRisco.Create;
  FaltExpRisco := TaltExpRisco.Create;
  FfimExpRisco := TfimExpRisco.Create;
end;

destructor TinfoExpRisco.destroy;
begin
  FiniExpRisco.Free;
  FaltExpRisco.Free;
  FfimExpRisco.Free;
  inherited;
end;

end.
