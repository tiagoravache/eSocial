{******************************************************************************}
{ Projeto: Componente ACBreSocial                                              }
{  Biblioteca multiplataforma de componentes Delphi para envio dos eventos do  }
{ eSocial - http://www.esocial.gov.br/                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doa��o do componente para o Projeto ACBr
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S2220;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao, ACBreSocialConsts,
  ACBreSocialGerador;

type
  TS2220Collection = class;
  TS2220CollectionItem = class;
  TEvtASO = class;
  TAso = class;
  TExameColecaoItem = class;
  TExameColecao = class;
  TRespMonit = class;
  TMonitBiolog = class;
  TResultMonitItem = class;
  TResultMonitColecao = class;
  TMedico = class;
  TCrm = class;
  TIdeServSaude = class;
  
  TS2220Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS2220CollectionItem;
    procedure SetItem(Index: Integer; Value: TS2220CollectionItem);
  public
    function Add: TS2220CollectionItem;
    property Items[Index: Integer]: TS2220CollectionItem read GetItem write SetItem; default;
  end;

  TS2220CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtASO: TEvtASO;

    procedure setEvtASO(const Value: TEvtASO);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtASO: TEvtASO read FEvtASO write setEvtASO;
  end;

  TEvtASO = class(TeSocialEvento)
  private
    FIdeEvento: TIdeEvento2;
    FIdeEmpregador: TIdeEmpregador;
    FIdeVinculo: TIdeVinculo;
    FAso: TAso;

    procedure gerarExame;
    procedure gerarMedico;
    procedure gerarCRM;
    procedure gerarAso;
    procedure gerarIdeServSaude;
    procedure gerarMonitBiolog;
    procedure gerarRespMonit;
    procedure gerarResultMonit;
  public
    constructor Create(AACBreSocial: TObject); overload;
    destructor Destroy; override;

    function GerarXML: boolean; override;

    property IdeEvento: TIdeEvento2 read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property IdeVinculo: TIdeVinculo read FIdeVinculo write FIdeVinculo;
    property Aso: TAso read FAso write FAso;
  end;

  TAso = class(TPersistent)
  private
    FDtAso: TDateTime;
    FtpAso: tpTpAso;
    FResAso: tpResAso;

    FExame: TExameColecao;
    FMonitBiolog: TMonitBiolog;
    FIdeServSaude: TIdeServSaude;
  public
    constructor create;
    destructor destroy; override;

    property DtAso: TDateTime read FDtAso write FDtAso;
    property tpAso: tpTpAso read FtpAso write FtpAso;
    property ResAso: tpResAso read FResAso write FResAso;
    property Exame: TExameColecao read FExame write FExame;
    property MonitBiolog: TMonitBiolog read FMonitBiolog write FMonitBiolog;
    property IdeServSaude: TIdeServSaude read FIdeServSaude write FIdeServSaude;
  end;

  TExameColecaoItem = class(TCollectionItem)
  private
    FDtExm: TDateTime;
    FProcRealizado: integer;
  public
    property DtExm: TDateTime read FDtExm write FDtExm;
    property ProcRealizado: integer read FProcRealizado write FProcRealizado;
  end;

  TExameColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TExameColecaoItem;
    procedure SetItem(Index: Integer; const Value: TExameColecaoItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TExameColecaoItem;
    property Items[Index: Integer]: TExameColecaoItem read GetItem write SetItem;
  end;

  TRespMonit = class
  private
    FNisResp: string;
    FNrConsClasse: string;
    FUfConsClasse: tpuf;
  public
    property NisResp: string read FNisResp write FNisResp;
    property NrConsClasse: string read FNrConsClasse write FNrConsClasse;
    property UfConsClasse: tpuf read FUfConsClasse write FUfConsClasse;
  end;

  TMonitBiolog = class(TPersistent)
  private
    FResultMonit: TResultMonitColecao;
    FRespMonit: TRespMonit;
  public
    constructor create;
    destructor destroy; override;

    property ResultMonit: TResultMonitColecao read FResultMonit write FResultMonit;
    property RespMonit: TRespMonit read FRespMonit write FRespMonit;
  end;

  TResultMonitItem = class(TCollectionItem)
  private
    FCodAgntQuim: string;
    FmatBiolog: TpMatBiolog;
    FcodAnalise: string;
    FinterprExm: tpInterprExm;
    FordExame: tpOrdExame;
    FdtIniMonit: TDateTime;
    FdtFimMonit: TDateTime;
    FindResult: tpIndResult;
  published
    property CodAgntQuim: string read FCodAgntQuim write FCodAgntQuim;
    property MatBiolog: TpMatBiolog read FmatBiolog write FmatBiolog;
    property codAnalise: string read FcodAnalise write FcodAnalise;
    property interprExm: tpInterprExm read FinterprExm write FinterprExm;
    property ordExame: tpOrdExame read FordExame write FordExame;
    property dtIniMonit: TDateTime read FdtIniMonit write FdtIniMonit;
    property dtFimMonit: TDateTime read FdtFimMonit write FdtFimMonit;
    property indResult: tpIndResult read FindResult write FindResult;
  end;

  TResultMonitColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TResultMonitItem;
    procedure SetItem(Index: Integer; const Value: TResultMonitItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TResultMonitItem;
    property Items[Index: Integer]: TResultMonitItem read GetItem write SetItem;
  end;

  TIdeServSaude = class
  private
    FCodCNES: string;
//    FFrmCtt: string; removido na vers�o 2.1
    FEmail: string;
    FMedico: TMedico;
  public
    constructor create;
    destructor destroy; override;
  published
    property CodCNES: string read FCodCNES write FCodCNES;
//    property FrmCtt: string read FFrmCtt write FFrmCtt; -- removido na vers�o 2.1
    property Email: string read FEmail write FEmail;
    property Medico: TMedico read FMedico write FMedico;
  end;

  TCrm = class
  private
    FNrCRM: string;
    FUfCRM: tpuf;
  published
    property NrCRM: string read FNrCRM write FNrCRM;
    property UfCRM: tpuf read FUfCRM write FUfCRM;
  end;


  TMedico = class
  private
    FNmMed: string;
    FFrmCtt: string;
    FCRM: TCRM;
  public
    constructor create;
    destructor destroy; override;
  public
    property NmMed: string read FNmMed write FNmMed;
    property FrmCtt: string read FFrmCtt write FFrmCtt;
    property CRM: TCRM read FCRM write FCRM;
  end;


implementation

uses
  eSocial_NaoPeriodicos;

{ TS2220Collection }

function TS2220Collection.Add: TS2220CollectionItem;
begin
  Result := TS2220CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2220Collection.GetItem(Index: Integer): TS2220CollectionItem;
begin
  Result := TS2220CollectionItem(inherited GetItem(Index));
end;

procedure TS2220Collection.SetItem(Index: Integer;
  Value: TS2220CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS2220CollectionItem }

constructor TS2220CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS2220;
  FEvtASO     := TEvtASO.Create(AOwner);
end;

destructor TS2220CollectionItem.Destroy;
begin
  FEvtASO.Free;
  inherited;
end;

procedure TS2220CollectionItem.setEvtASO(const Value: TEvtASO);
begin
  FEvtASO.Assign(Value);
end;

{ TAso }

constructor TAso.create;
begin
  inherited;
  FExame := TExameColecao.Create(self);
  FMonitBiolog := TMonitBiolog.Create;
  FIdeServSaude := TIdeServSaude.create;
end;

destructor TAso.destroy;
begin
  FExame.Free;
  FMonitBiolog.Free;
  FIdeServSaude.Free;
  inherited;
end;

{ TExameColecao }

function TExameColecao.Add: TExameColecaoItem;
begin
  Result := TExameColecaoItem(inherited Add);
end;

constructor TExameColecao.Create(AOwner: TPersistent);
begin
  inherited Create(TExameColecaoItem);
end;

function TExameColecao.GetItem(Index: Integer): TExameColecaoItem;
begin
  Result := TExameColecaoItem(inherited GetItem(Index));
end;

procedure TExameColecao.SetItem(Index: Integer;
  const Value: TExameColecaoItem);
begin
  inherited SetItem(Index, Value);
end;

{ TMonitBiologica }

constructor TMonitBiolog.create;
begin
  inherited;
  FResultMonit := TResultMonitColecao.Create(self);
  FRespMonit := TRespMonit.Create();
end;

destructor TMonitBiolog.destroy;
begin
  FResultMonit.Free;
  FRespMonit.Free;
  inherited;
end;

{ TResultMonitoracaoColecao }

function TResultMonitColecao.Add: TResultMonitItem;
begin
  Result := TResultMonitItem(inherited Add);
end;

constructor TResultMonitColecao.Create(AOwner: TPersistent);
begin
  inherited Create(TResultMonitItem);
end;

function TResultMonitColecao.GetItem(
  Index: Integer): TResultMonitItem;
begin
  Result := TResultMonitItem(inherited GetItem(Index));
end;

procedure TResultMonitColecao.SetItem(Index: Integer;
  const Value: TResultMonitItem);
begin
  inherited SetItem(Index, Value);
end;

{ TEvtASO }

constructor TEvtASO.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeVinculo := TIdeVinculo.Create;
  FAso := TAso.Create;
end;

destructor TEvtASO.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeVinculo.Free;
  FAso.Free;
  inherited;
end;

procedure TEvtASO.gerarAso;
begin
  Gerador.wGrupo('ASO');
    Gerador.wCampo(tcDat, '', 'dtAso', 0, 0, 0, self.Aso.DtAso);
    Gerador.wCampo(tcStr, '', 'tpAso', 0, 0, 0, eSTpAsoToStr(self.Aso.tpAso));
    Gerador.wCampo(tcStr, '', 'resAso', 0, 0, 0, eSResAsoToStr(self.Aso.ResAso));
    gerarExame;
    gerarMonitBiolog;
    gerarIdeServSaude;
  Gerador.wGrupo('/ASO');
end;

procedure TEvtASO.gerarCRM;
begin
  Gerador.wGrupo('crm');
    Gerador.wCampo(tcStr, '', 'nrCRM  ', 0, 0, 0, self.Aso.IdeServSaude.Medico.CRM.NrCRM);

    if (eSufToStr(self.Aso.IdeServSaude.Medico.CRM.UfCRM) <> '') then
      Gerador.wCampo(tcStr, '', 'ufCRM  ', 0, 0, 0, eSufToStr(self.Aso.IdeServSaude.Medico.CRM.UfCRM));
  Gerador.wGrupo('/crm');
end;

procedure TEvtASO.gerarExame;
var
  iContador: integer;
begin
  for iCOntador:= 0 to self.Aso.Exame.Count-1 do
  begin
    Gerador.wGrupo('exame');
      Gerador.wCampo(tcDat, '', 'dtExm', 0, 0, 0, self.Aso.Exame.Items[iContador].dtExm);
      Gerador.wCampo(tcStr, '', 'procRealizado', 0, 0, 0, self.Aso.Exame.Items[iContador].procRealizado);
    Gerador.wGrupo('/exame');
  end;
end;

procedure TEvtASO.gerarIdeServSaude;
begin
  Gerador.wGrupo('ideServSaude');
    if (self.Aso.IdeServSaude.CodCNES <> '') then
      Gerador.wCampo(tcStr, '', 'codCNES  ', 0, 0, 0, self.Aso.IdeServSaude.CodCNES);

   // Gerador.wCampo(tcStr, '', 'frmCtt  ', 0, 0, 0, self.Aso.IdeServSaude.FrmCtt);- removido na vers�o 2.1

    if (self.Aso.IdeServSaude.Email <> '') then
      Gerador.wCampo(tcStr, '', 'email  ', 0, 0, 0, self.Aso.IdeServSaude.Email);
    gerarMedico;
  Gerador.wGrupo('/ideServSaude');
end;

procedure TEvtASO.gerarMedico;
begin
  Gerador.wGrupo('medico');
    Gerador.wCampo(tcStr, '', 'nmMed', 0, 0, 0, self.Aso.IdeServSaude.Medico.NmMed);
    Gerador.wCampo(tcStr, '', 'frmCtt', 0, 0, 0, self.Aso.IdeServSaude.Medico.FrmCtt);
    gerarCRM;
  Gerador.wGrupo('/medico');
end;

procedure TEvtASO.gerarMonitBiolog;
begin
  Gerador.wGrupo('monitBiologica');
    gerarResultMonit;
    gerarRespMonit;
  Gerador.wGrupo('/monitBiologica');
end;

procedure TEvtASO.gerarRespMonit;
begin
  Gerador.wGrupo('respMonit');
    Gerador.wCampo(tcStr, '', 'nisResp', 0, 0, 0, self.Aso.MonitBiolog.RespMonit.nisResp);
    Gerador.wCampo(tcStr, '', 'nrConsClasse', 0, 0, 0, self.Aso.MonitBiolog.RespMonit.NrConsClasse);

    if (eSufToStr(self.Aso.MonitBiolog.RespMonit.UfConsClasse) <> '') then
      Gerador.wCampo(tcStr, '', 'ufConsClasse', 0, 0, 0, eSufToStr(self.Aso.MonitBiolog.RespMonit.UfConsClasse));
  Gerador.wGrupo('/respMonit');
end;

procedure TEvtASO.gerarResultMonit;
var
  iContador: integer;
begin
  for iCOntador:= 0 to self.Aso.MonitBiolog.ResultMonit.Count-1 do
  begin
    Gerador.wGrupo('resultMonit');
      Gerador.wCampo(tcStr, '', 'codAgntQuim', 0, 0, 0, self.Aso.MonitBiolog.ResultMonit.Items[iContador].codAgntQuim);
      Gerador.wCampo(tcStr, '', 'matBiolog', 0, 0, 0, eSMatBiologToStr(self.Aso.MonitBiolog.ResultMonit.Items[iContador].matBiolog));
      Gerador.wCampo(tcStr, '', 'codAnalise', 0, 0, 0, self.Aso.MonitBiolog.ResultMonit.Items[iContador].codAnalise);
      Gerador.wCampo(tcStr, '', 'interprExm', 0, 0, 0, eSInterprExmToStr(self.Aso.MonitBiolog.ResultMonit.Items[iContador].interprExm));
      Gerador.wCampo(tcStr, '', 'ordExame', 0, 0, 0, eSOrdExameToStr(self.Aso.MonitBiolog.ResultMonit.Items[iContador].ordExame));
      Gerador.wCampo(tcDat, '', 'dtIniMonit', 0, 0, 0, self.Aso.MonitBiolog.ResultMonit.Items[iContador].dtIniMonit);

      if (DateToStr(self.Aso.MonitBiolog.ResultMonit.Items[iContador].dtFimMonit) <> dDataBrancoNula) then
        Gerador.wCampo(tcDat, '', 'dtFimMonit', 0, 0, 0, self.Aso.MonitBiolog.ResultMonit.Items[iContador].dtFimMonit);

      if (eSIndResultToStr(self.Aso.MonitBiolog.ResultMonit.Items[iContador].indResult) <> '') then
        Gerador.wCampo(tcStr, '', 'indResult', 0, 0, 0, eSIndResultToStr(self.Aso.MonitBiolog.ResultMonit.Items[iContador].indResult));
    Gerador.wGrupo('/resultMonit');
  end;
end;

function TEvtASO.GerarXML: boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtASO Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
        //gerarIdVersao(self);
        gerarIdeEvento2(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        gerarIdeVinculo(self.IdeVinculo);
        gerarAso;
      Gerador.wGrupo('/evtASO');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtASO');
    Validar('evtASO');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TMedico }

constructor TMedico.create;
begin
  FCRM := TCRM.Create;
end;

destructor TMedico.destroy;
begin
  FCRM.Free;
  inherited;
end;

{ TIdeServSaude }

constructor TIdeServSaude.create;
begin
  FMedico := TMedico.create;
end;

destructor TIdeServSaude.destroy;
begin
  FMedico.Free;
  inherited;
end;

end.
 