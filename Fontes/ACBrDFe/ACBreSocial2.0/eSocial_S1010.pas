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
|* 29/02/2015: Guilherme Costa
|*  - não estava sendo gerada a tag "tpProc"
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S1010;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type
  TS1010Collection = class;
  TS1010CollectionItem = class;
  TEvtTabRubrica = class;
  TInfoRubrica = class;
  TDadosRubrica = class;
  TIdeRubrica = class;
  TIdeProcessoCP = class;
  TIdeProcessoIRRF = class;
  TIdeProcessoFGTS = class;
  TIdeProcessoSind = class;

  TS1010Collection = class(TOwnedCollection)
   private
    function GetItem(Index: Integer): TS1010CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1010CollectionItem);
  public
    function Add: TS1010CollectionItem;
    property Items[Index: Integer]: TS1010CollectionItem read GetItem write SetItem; default;
  end;

  TS1010CollectionItem = class(TCollectionItem)
   private
    FTipoEvento: TTipoEvento;
    FEvtTabRubrica: TEvtTabRubrica;
    procedure setEvtTabRubrica(const Value: TEvtTabRubrica);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtTabRubrica: TEvtTabRubrica read FEvtTabRubrica write setEvtTabRubrica;
  end;

  TEvtTabRubrica = class(TeSocialEvento)
   private
    FModoLancamento: TModoLancamento;
    FIdeEmpregador: TIdeEmpregador;
    FIdeEvento: TIdeEvento;
    FInfoRubrica: TInfoRubrica;

    {Geradores específicos da classe}
    procedure gerarIdeRubrica();
    procedure gerarDadosRubrica();
    procedure gerarIdeProcessoCP();
    procedure gerarIdeProcessoIRRF();
    procedure gerarIdeProcessoFGTS();
    procedure gerarIdeProcessoSIND();
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor Destroy; override;

    function GerarXML: boolean; override;

    property ModoLancamento: TModoLancamento read FModoLancamento write FModoLancamento;
    property IdeEvento: TIdeEvento read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property InfoRubrica: TInfoRubrica read FInfoRubrica write FInfoRubrica;
  end;

  TInfoRubrica = class
   private
    FDadosRubrica: TDadosRubrica;
    FideRubrica: TideRubrica;
    FnovaValidade: TidePeriodo;
    function getDadosRubrica: TDadosRubrica;
    function getNovaValidade: TidePeriodo;
  public
    constructor Create;
    destructor Destroy; override;
    function dadosRubricaInst(): Boolean;
    function novaValidadInst(): Boolean;

    property ideRubrica: TideRubrica read FideRubrica write FideRubrica;
    property DadosRubrica: TDadosRubrica read getDadosRubrica write FDadosRubrica;
    property novaValidade: TidePeriodo read getNovaValidade write FnovaValidade;
  end;

  TDadosRubrica = class
   private
    FDscRubr: string;
    FNatRubr: integer;
    FTpRubr: tpTpRubr;
    FCodIncCP: tpCodIncCP;
    FCodIncIRRF : tpCodIncIRRF;
    FCodIncFGTS : tpCodIncFGTS;
    FCodIncSIND: tpCodIncSIND;
    FRepDSR: tpSimNao;
    FRep13: tpSimNao;
    FRepFerias: tpSimNao;
    FRepAviso: tpSimNao; //repResc na versão 2.0 alterado na 2.1 para repAviso
    FFatorRubr: double;
    FObservacao: string;          
    FIdeProcessoCP: TIdeProcessoCP;
    FIdeProcessoIRRF: TIdeProcessoIRRF;
    FIdeProcessoFGTS: TIdeProcessoFGTS;
    FIdeProcessoSIND: TIdeProcessoSind;
    function getIdeProcessoCP(): TIdeProcessoCP;
    function getIdeProcessoIRRF(): TIdeProcessoIRRF;
    function getIdeProcessoFGTS(): TIdeProcessoFGTS;
    function getIdeProcessoSIND(): TIdeProcessoSind;
  public
    constructor create;
    destructor Destroy; override;
    function ideProcessoCPInst(): Boolean;
    function ideProcessoIRRFInst(): Boolean;
    function ideProcessoFGTSInst(): Boolean;
    function ideProcessoSINDInst(): Boolean;

    property dscRubr: string read FDscRubr write FDscRubr;
    property natRubr: integer read FNatRubr write FNatRubr;
    property tpRubr: tpTpRubr read FTpRubr write FTpRubr;    
    property codIncCP: tpCodIncCP read FCodIncCP write FCodIncCP;
    property codIncIRRF: tpCodIncIRRF read FCodIncIRRF write FCodIncIRRF;
    property codIncFGTS: tpCodIncFGTS read FCodIncFGTS write FCodIncFGTS;
    property codIncSIND: tpCodIncSIND read FCodIncSIND write FCodIncSIND;
    property RepDSR: tpSimNao read FRepDSR write FRepDSR;
    property rep13: tpSimNao read FRep13 write FRep13;
    property repFerias: tpSimNao read FRepFerias write FRepFerias;
    property repAviso: tpSimNao read FRepAviso write FRepAviso;
    property fatorRubr: double read FFatorRubr write FFatorRubr;
    property observacao: string read FObservacao write FObservacao;    
    property IdeProcessoCP: TIdeProcessoCP read getIdeProcessoCP write FIdeProcessoCP;
    property IdeProcessoIRRF: TIdeProcessoIRRF read getIdeProcessoIRRF write FIdeProcessoIRRF;
    property IdeProcessoFGTS: TIdeProcessoFGTS read getIdeProcessoFGTS write FIdeProcessoFGTS;
    property IdeProcessoSIND: TIdeProcessoSind read getIdeProcessoSIND write FIdeProcessoSIND;
  end;

  TIdeRubrica = class(TPersistent)
   private
    FCodRubr: string;
    FIdeTabRubr: string;
    FIniValid: string;
    FFimValid: string;
  public
    property CodRubr: string read FCodRubr write FCodRubr;
    property ideTabRubr: string read FIdeTabRubr write FIdeTabRubr;
    property iniValid: string read FIniValid write FIniValid;
    property fimValid: string read FFimValid write FFimValid;
  end;

  TIdeProcessoCP = class(TPersistent)
   private
    FtpProc: tpTpProc;
    FNrProc: string;
    FExtDecisao: TpExtDecisao;
  public
    property tpProc: tpTpProc read FtpProc write FtpProc;
    property nrProc: string read FNrProc write FNrProc;
    property ExtDecisao: TpExtDecisao read FExtDecisao write FExtDecisao;
  end;

  TIdeProcessoIRRF = class(TPersistent)
   private
    FNrProc: string;
  public
    property nrProc: string read FNrProc write FNrProc;
  end;

  TIdeProcessoFGTS = class(TPersistent)
   private
    FNrProc: string;
  public
    property nrProc: string read FNrProc write FNrProc;
  end;

  TIdeProcessoSind = class(TPersistent)
   private
    FNrProc: string;
  public
    property nrProc: string read FNrProc write FNrProc;
  end;

implementation

uses
  eSocial_Tabelas;

{ TS1010Collection }

function TS1010Collection.Add: TS1010CollectionItem;
begin
  Result := TS1010CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1010Collection.GetItem(Index: Integer): TS1010CollectionItem;
begin
  Result := TS1010CollectionItem(inherited GetItem(Index));
end;

procedure TS1010Collection.SetItem(Index: Integer;
  Value: TS1010CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS1010CollectionItem }

constructor TS1010CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1010;
  FEvtTabRubrica := TEvtTabRubrica.Create(AOwner);
end;

destructor TS1010CollectionItem.Destroy;
begin
  FEvtTabRubrica.Free;
  inherited;
end;

procedure TS1010CollectionItem.setEvtTabRubrica(
  const Value: TEvtTabRubrica);
begin
  FEvtTabRubrica.Assign(Value);
end;

{ TEvtTabRubrica }

constructor TEvtTabRubrica.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeEvento := TIdeEvento.Create;
  FInfoRubrica := TInfoRubrica.Create;
end;

destructor TEvtTabRubrica.Destroy;
begin
  FIdeEmpregador.Free;
  FIdeEvento.Free;
  FInfoRubrica.Free;
  inherited;
end;

procedure TEvtTabRubrica.gerarDadosRubrica;
begin
  Gerador.wGrupo('dadosRubrica');
    Gerador.wCampo(tcStr, '', 'dscRubr', 0, 0, 0, InfoRubrica.dadosRubrica.dscRubr);
    Gerador.wCampo(tcStr, '', 'natRubr', 0, 0, 0, InfoRubrica.dadosRubrica.natRubr);
    Gerador.wCampo(tcStr, '', 'tpRubr', 0, 0, 0,  eSTpRubrToStr(InfoRubrica.dadosRubrica.tpRubr));
    Gerador.wCampo(tcStr, '', 'codIncCP', 0, 0, 0, eSCodIncCPToStr(InfoRubrica.dadosRubrica.codIncCP));
    Gerador.wCampo(tcStr, '', 'codIncIRRF', 0, 0, 0, eSCodIncIRRFToStr(InfoRubrica.dadosRubrica.codIncIRRF));
    Gerador.wCampo(tcStr, '', 'codIncFGTS', 0, 0, 0, eSCodIncFGTSToStr(InfoRubrica.dadosRubrica.codIncFGTS));
    Gerador.wCampo(tcStr, '', 'codIncSIND', 0, 0, 0, eSCodIncSINDToStr(InfoRubrica.dadosRubrica.codIncSIND));
    Gerador.wCampo(tcStr, '', 'repDSR', 0, 0, 0, eSSimNaoToStr(InfoRubrica.dadosRubrica.repDSR));
    Gerador.wCampo(tcStr, '', 'rep13', 0, 0, 0, eSSimNaoToStr(InfoRubrica.dadosRubrica.rep13));
    Gerador.wCampo(tcStr, '', 'repFerias', 0, 0, 0, eSSimNaoToStr(InfoRubrica.dadosRubrica.repFerias));
    Gerador.wCampo(tcStr, '', 'repAviso', 0, 0, 0, eSSimNaoToStr(InfoRubrica.dadosRubrica.repAviso));

    if InfoRubrica.dadosRubrica.fatorRubr > 0 then
      Gerador.wCampo(tcDe2, '', 'fatorRubr', 0, 0,0, InfoRubrica.dadosRubrica.fatorRubr);

    if (InfoRubrica.dadosRubrica.observacao <> '') then
      Gerador.wCampo(tcStr, '', 'observacao', 0, 0, 0, InfoRubrica.dadosRubrica.observacao);
    gerarideProcessoCP();
    gerarideProcessoIRRF();
    gerarideProcessoFGTS();
    gerarideProcessoSIND();
  Gerador.wGrupo('/dadosRubrica');
end;

procedure TEvtTabRubrica.gerarIdeProcessoCP;
begin
  if (InfoRubrica.DadosRubrica.ideProcessoCPInst()) then
  begin
    Gerador.wGrupo('ideProcessoCP');
      Gerador.wCampo(tcStr, '', 'tpProc', 0, 0, 0, eSTpProcessoToStr(InfoRubrica.DadosRubrica.IdeProcessoCP.tpProc));
      Gerador.wCampo(tcStr, '', 'nrProc', 0, 0, 0, InfoRubrica.DadosRubrica.IdeProcessoCP.nrProc);
      Gerador.wCampo(tcStr, '', 'extDecisao', 0, 0, 0, eSExtDecisaoToStr(InfoRubrica.DadosRubrica.IdeProcessoCP.extDecisao));
    Gerador.wGrupo('/ideProcessoCP');
  end;
end;

procedure TEvtTabRubrica.gerarIdeProcessoFGTS;
begin
  if (InfoRubrica.DadosRubrica.ideProcessoFGTSInst()) then
  begin
    Gerador.wGrupo('ideProcessoFGTS');
      Gerador.wCampo(tcStr, '', 'nrProc', 0, 0, 0, InfoRubrica.DadosRubrica.IdeProcessoFGTS.nrProc);
    Gerador.wGrupo('/ideProcessoFGTS');
  end;
end;

procedure TEvtTabRubrica.gerarIdeProcessoIRRF;
begin
  if (InfoRubrica.DadosRubrica.ideProcessoIRRFInst()) then
  begin
    Gerador.wGrupo('ideProcessoIRRF');
      Gerador.wCampo(tcStr, '', 'nrProc', 0, 0, 0, InfoRubrica.DadosRubrica.IdeProcessoIRRF.nrProc);
    Gerador.wGrupo('/ideProcessoIRRF');
  end;
end;

procedure TEvtTabRubrica.gerarideProcessoSIND;
begin
  if (InfoRubrica.DadosRubrica.ideProcessoSINDInst()) then
  begin
    Gerador.wGrupo('ideProcessoSIND');
      Gerador.wCampo(tcStr, '', 'nrProc', 0, 0, 0, InfoRubrica.DadosRubrica.IdeProcessoSIND.nrProc);
    Gerador.wGrupo('/ideProcessoSIND');
  end;
end;

procedure TEvtTabRubrica.gerarIdeRubrica;
begin
  Gerador.wGrupo('ideRubrica');
    Gerador.wCampo(tcStr, '', 'codRubr', 0, 0, 0, InfoRubrica.IdeRubrica.CodRubr);

    if (infoRubrica.ideRubrica.ideTabRubr <> '') then
      Gerador.wCampo(tcStr, '', 'ideTabRubr', 0, 0, 0, infoRubrica.ideRubrica.ideTabRubr);
    Gerador.wCampo(tcStr, '', 'iniValid', 0, 0, 0, infoRubrica.ideRubrica.iniValid);
    Gerador.wCampo(tcStr, '', 'fimValid', 0, 0, 0, infoRubrica.IdeRubrica.fimValid);
  Gerador.wGrupo('/ideRubrica');
end;

function TEvtTabRubrica.GerarXML: boolean;
begin
  try
    gerarCabecalho('evtTabRubrica');
      Gerador.wGrupo('evtTabRubrica Id="'+ GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0) +'"');
        //gerarIdVersao(self);
        gerarIdeEvento(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        Gerador.wGrupo('infoRubrica');
          gerarModoAbertura(Self.ModoLancamento);
            gerarIdeRubrica();
            if Self.ModoLancamento <> mlExclusao then
            begin
              gerarDadosRubrica();
              if (ModoLancamento = mlAlteracao) then
                if (InfoRubrica.novaValidadInst()) then
                  GerarIdePeriodo(InfoRubrica.novaValidade, 'novaValidade');
            end;
          gerarModoFechamento(Self.ModoLancamento);
        Gerador.wGrupo('/infoRubrica');
      Gerador.wGrupo('/evtTabRubrica');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtTabRubrica');
    Validar('evtTabRubrica');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TInfoRubrica }

constructor TInfoRubrica.create;
begin
  FideRubrica := TideRubrica.Create;
  FDadosRubrica := nil;
  FnovaValidade := nil;
end;

function TInfoRubrica.dadosRubricaInst: Boolean;
begin
  Result := Assigned(FDadosRubrica);
end;

destructor TInfoRubrica.destroy;
begin
  FDadosRubrica.Free;
  FideRubrica.Free;
  FnovaValidade.Free;
  inherited;
end;

function TInfoRubrica.getDadosRubrica: TDadosRubrica;
begin
  if Not(Assigned(FDadosRubrica)) then
    FDadosRubrica := TDadosRubrica.create;
  Result := FDadosRubrica;
end;

function TInfoRubrica.getNovaValidade: TidePeriodo;
begin
  if Not(Assigned(FnovaValidade)) then
    FnovaValidade := TIdePeriodo.Create;
  Result := FnovaValidade;
end;

function TInfoRubrica.novaValidadInst: Boolean;
begin
  Result := Assigned(FnovaValidade);
end;

{ TDadosRubrica }

constructor TDadosRubrica.create;
begin
  FIdeProcessoCP := nil;
  FIdeProcessoIRRF := nil;
  FIdeProcessoFGTS := nil;
  FIdeProcessoSIND := nil;
end;

destructor TDadosRubrica.destroy;
begin
  FreeAndNil(FIdeProcessoCP);
  FreeAndNil(FIdeProcessoIRRF);
  FreeAndNil(FIdeProcessoFGTS);
  FreeAndNil(FIdeProcessoSIND);
  inherited;
end;

function TDadosRubrica.getIdeProcessoCP: TIdeProcessoCP;
begin
  if Not(Assigned(FIdeProcessoCP)) then
    FIdeProcessoCP := TIdeProcessoCP.Create;
  Result := FIdeProcessoCP;
end;

function TDadosRubrica.getIdeProcessoFGTS: TIdeProcessoFGTS;
begin
  if Not(Assigned(FIdeProcessoFGTS)) then
    FIdeProcessoFGTS := TIdeProcessoFGTS.Create;
  Result := FIdeProcessoFGTS;
end;

function TDadosRubrica.getIdeProcessoIRRF: TIdeProcessoIRRF;
begin
  if Not(Assigned(FIdeProcessoIRRF)) then
    FIdeProcessoIRRF := TIdeProcessoIRRF.Create;
  Result := FIdeProcessoIRRF;
end;

function TDadosRubrica.getIdeProcessoSIND: TIdeProcessoSind;
begin
  if Not(Assigned(FIdeProcessoSIND)) then
    FIdeProcessoSIND := TIdeProcessoSind.Create;
  Result := FIdeProcessoSIND;
end;

function TDadosRubrica.ideProcessoCPInst: Boolean;
begin
  Result := Assigned(FIdeProcessoCP);
end;

function TDadosRubrica.ideProcessoFGTSInst: Boolean;
begin
  Result := Assigned(FIdeProcessoFGTS);
end;

function TDadosRubrica.ideProcessoIRRFInst: Boolean;
begin
  Result := Assigned(FIdeProcessoIRRF);
end;

function TDadosRubrica.ideProcessoSINDInst: Boolean;
begin
  Result := Assigned(FIdeProcessoSIND);
end;

end.
