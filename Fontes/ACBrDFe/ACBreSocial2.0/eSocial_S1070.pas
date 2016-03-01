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

unit eSocial_S1070;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;


type
  TS1070Collection = class;
  TS1070CollectionItem = class;
  TEvtTabProcesso = class;
  TDadosProcJud = class;
  TDadosProcesso = class;
  TInfoProcesso = class;
  TIdeProcesso = class;


  TS1070Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1070CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1070CollectionItem);
  public
    function Add: TS1070CollectionItem;
    property Items[Index: Integer]: TS1070CollectionItem read GetItem write SetItem; default;
  end;

  TS1070CollectionItem = class(TCollectionItem)
   private
    FTipoEvento: TTipoEvento;
    FEvtTabProcesso: TEvtTabProcesso;
    procedure setEvtTabProcesso(const Value: TEvtTabProcesso);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor  Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtTabProcesso: TEvtTabProcesso read FEvtTabProcesso write setEvtTabProcesso;
  end;

  TIdeProcesso = class(TPersistent)
   private
    FTpProc : tpTpProc;
    FNrProc : string;
    FIniValid: string;
    FFimValid: string;
  published
    property tpProc :tpTpProc read FTpProc write FTpProc;
    property nrProc :string read FNrProc write FNrProc;
    property iniValid: string read FIniValid write FIniValid;
    property fimValid: string read FFimValid write FFimValid;
  end;

  TEvtTabProcesso = class(TESocialEvento)
   private
    FModoLancamento: TModoLancamento;
    fIdeEvento: TIdeEvento;
    fIdeEmpregador: TIdeEmpregador;
    fInfoProcesso: TInfoProcesso;

    {Geradores específicos da classe}
    procedure gerarIdeProcesso();
    procedure gerarDadosProcJud();
    procedure gerarDadosProcesso();
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor  Destroy; override;

    function GerarXML: boolean; override;

    property ModoLancamento: TModoLancamento read FModoLancamento write FModoLancamento;
    property IdeEvento: TIdeEvento read fIdeEvento write fIdeEvento;
    property IdeEmpregador: TIdeEmpregador read fIdeEmpregador write fIdeEmpregador;
    property InfoProcesso: TInfoProcesso read fInfoProcesso write fInfoProcesso;
  end;

  TDadosProcJud = class(TPersistent)
   private
    FUfVara: string;
    FCodMunic: integer;
    FIdVara: string;
    FIndAutoria: Integer;
  public
    property UfVara: string read FUfVara write FUfVara;
    property codMunic: integer read FCodMunic write FCodMunic;
    property idVara: string read FIdVara write FIdVara;
    property indAutoria: integer read FIndAutoria write FIndAutoria;
  end;

  TDadosProcesso = class(TPersistent)
   private
    FIndSusp : tpIndSusp;
    FDtDecisao : TDateTime;
    FIndDeposito : tpSimNao;
    fDadosProcJud : TDadosProcJud;
    function getDadosProcJud: TDadosProcJud;
  public
    constructor create;
    destructor Destroy; override;
    function dadosProcJudInst(): Boolean;

    property indSusp: tpIndSusp read FIndSusp write FIndSusp;
    property dtDecisao: TDateTime read FDtDecisao write FDtDecisao;
    property indDeposito: tpSimNao read FIndDeposito write FIndDeposito;
    property DadosProcJud: TDadosProcJud read getDadosProcJud write fDadosProcJud;
  end;

  TInfoProcesso = class
   private
    FIdeProcesso: TIdeProcesso;
    FDadosProcesso: TDadosProcesso;
    FNovaValidade: TIdePeriodo;
    function getDadosProcesso(): TDadosProcesso;
    function getNovaValidade(): TIdePeriodo;
  public
    constructor create;
    destructor Destroy; override;
    function dadosProcessosInst(): Boolean;
    function novaValidadeInst(): Boolean;

    property ideProcesso: TIdeProcesso read FIdeProcesso write FIdeProcesso;
    property dadosProcesso: TDadosProcesso read getDadosProcesso write FDadosProcesso;
    property novaValidade: TIdePeriodo read getNovaValidade write FNovaValidade;
  end;

implementation

uses
  eSocial_Tabelas;

{ TS1070Collection }

function TS1070Collection.Add: TS1070CollectionItem;
begin
  Result := TS1070CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1070Collection.GetItem(Index: Integer): TS1070CollectionItem;
begin
  Result := TS1070CollectionItem(inherited GetItem(Index));
end;

procedure TS1070Collection.SetItem(Index: Integer;
  Value: TS1070CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS1070CollectionItem }

constructor TS1070CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1070;
  FEvtTabProcesso := TEvtTabProcesso.Create(AOwner);
end;

destructor TS1070CollectionItem.Destroy;
begin
  FEvtTabProcesso.Free;
  inherited;
end;

procedure TS1070CollectionItem.setEvtTabProcesso(
  const Value: TEvtTabProcesso);
begin
  FEvtTabProcesso.Assign(Value);
end;

{ TDadosProcesso }

constructor TDadosProcesso.create;
begin
  fDadosProcJud := nil;
end;

function TDadosProcesso.dadosProcJudInst: Boolean;
begin
  Result := Assigned(fDadosProcJud);
end;

destructor TDadosProcesso.destroy;
begin
  FreeAndNil(fDadosProcJud);
  inherited;
end;

function TDadosProcesso.getDadosProcJud: TDadosProcJud;
begin
  if Not(Assigned(fDadosProcJud)) then
    fDadosProcJud := TDadosProcJud.Create;
  Result := fDadosProcJud;
end;

{ TInfoProcesso }

constructor TInfoProcesso.create;
begin
  FIdeProcesso := TIdeProcesso.Create;
  FDadosProcesso := nil;
  FNovaValidade := nil;
end;

function TInfoProcesso.dadosProcessosInst: Boolean;
begin
  Result := Assigned(FDadosProcesso);
end;

destructor TInfoProcesso.destroy;
begin
  FIdeProcesso.Free;
  FreeAndNil(FDadosProcesso);
  FreeAndNil(FNovaValidade);
  inherited;
end;

function TInfoProcesso.getDadosProcesso: TDadosProcesso;
begin
  if Not(Assigned(FDadosProcesso)) then
    FDadosProcesso := TDadosProcesso.create;
  Result := FDadosProcesso;
end;

function TInfoProcesso.getNovaValidade: TIdePeriodo;
begin
  if Not(Assigned(FNovaValidade)) then
    FNovaValidade := TIdePeriodo.Create;
  Result := FNovaValidade;
end;

function TInfoProcesso.novaValidadeInst: Boolean;
begin
  Result := Assigned(FNovaValidade);
end;

{ TEvtTabProcesso }

constructor TEvtTabProcesso.Create(AACBreSocial: TObject);
begin
  inherited;
  fIdeEvento := TIdeEvento.Create;
  fIdeEmpregador := TIdeEmpregador.Create;
  fInfoProcesso := TInfoProcesso.Create;
end;

destructor TEvtTabProcesso.Destroy;
begin
  fIdeEvento.Free;
  fIdeEmpregador.Free;
  fInfoProcesso.Free;
  inherited;
end;

procedure TEvtTabProcesso.gerarDadosProcesso;
begin
  Gerador.wGrupo('dadosProcesso');
    Gerador.wCampo(tcStr, '', 'indSusp', 0, 0, 0, eSIndSuspToStr(self.InfoProcesso.DadosProcesso.indSusp));
    Gerador.wCampo(tcDat, '', 'dtDecisao', 0, 0, 0, self.InfoProcesso.DadosProcesso.dtDecisao);
    Gerador.wCampo(tcStr, '', 'indDeposito', 0, 0, 0, eSSimNaoToStr(self.InfoProcesso.DadosProcesso.indDeposito));
    gerarDadosProcJud();
  Gerador.wGrupo('/dadosProcesso');
end;

procedure TEvtTabProcesso.gerarDadosProcJud;
begin
  if (InfoProcesso.DadosProcesso.dadosProcJudInst()) then
  begin
    Gerador.wGrupo('dadosProcJud');
      Gerador.wCampo(tcStr, '', 'ufVara', 0, 0, 0, self.InfoProcesso.DadosProcesso.DadosProcJud.ufVara);
      Gerador.wCampo(tcStr, '', 'codMunic', 0, 0, 0, self.InfoProcesso.DadosProcesso.DadosProcJud.codMunic);
      Gerador.wCampo(tcStr, '', 'idVara', 0, 0, 0, self.InfoProcesso.DadosProcesso.DadosProcJud.idVara);
      Gerador.wCampo(tcStr, '', 'indAutoria', 0, 0, 0, self.InfoProcesso.DadosProcesso.DadosProcJud.indAutoria);
    Gerador.wGrupo('/dadosProcJud');
  end;
end;

procedure TEvtTabProcesso.gerarIdeProcesso;
begin
  Gerador.wGrupo('ideProcesso');
    Gerador.wCampo(tcStr, '', 'tpProc', 0, 0, 0, eSTpProcessoToStr(self.InfoProcesso.ideProcesso.tpProc));
    Gerador.wCampo(tcStr, '', 'nrProc', 0, 0, 0, self.InfoProcesso.ideProcesso.nrProc);
    Gerador.wCampo(tcStr, '', 'iniValid', 0, 0, 0, self.InfoProcesso.ideProcesso.iniValid);
    Gerador.wCampo(tcStr, '', 'fimValid', 0, 0, 0, self.InfoProcesso.ideProcesso.fimValid);
  Gerador.wGrupo('/ideProcesso');
end;

function TEvtTabProcesso.GerarXML: boolean;
begin
  try
    gerarCabecalho('');
      Gerador.wGrupo('evtTabProcesso Id="'+ GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0) +'"');
        //gerarIdVersao(self);
        gerarIdeEvento(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        Gerador.wGrupo('infoProcesso');
          gerarModoAbertura(Self.ModoLancamento);
            gerarIdeProcesso();
            if Self.ModoLancamento <> mlExclusao then
            begin
              gerarDadosProcesso();
              if Self.ModoLancamento = mlAlteracao then
                if (InfoProcesso.novaValidadeInst()) then
                  GerarIdePeriodo(self.InfoProcesso.NovaValidade);
            end;
          gerarModoFechamento(Self.ModoLancamento);
        Gerador.wGrupo('/infoProcesso');
      Gerador.wGrupo('/evtTabProcesso');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtTabProcesso');
    Validar('evtTabProcesso');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

end.
