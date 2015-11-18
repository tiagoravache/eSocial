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

unit eSocial_S1299;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type
  TS1299Collection = class;
  TS1299CollectionItem = class;
  TEvtFechaEvPer = class;
  TIdeRespInf = class;
  TInfoApur = class;
  TInfoFech= class;
  TInfoExercAnt = class;

  TS1299Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1299CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1299CollectionItem);
  public
    function Add: TS1299CollectionItem;
    property Items[Index: Integer]: TS1299CollectionItem read GetItem write SetItem; default;
  end;

  TS1299CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtFechaEvPer: TEvtFechaEvPer;
    procedure setEvtFechaEvPer(const Value: TEvtFechaEvPer);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtFechaEvPer: TEvtFechaEvPer read FEvtFechaEvPer write setEvtFechaEvPer;
  end;

  TEvtFechaEvPer = class(TESocialEvento)
  private
    FIdeEvento: TIdeEvento3;
    FIdeEmpregador: TIdeEmpregador;
    FIdeRespInf : TIdeRespInf;
    FInfoApur: TInfoApur;
    FInfoFech: TInfoFech;

    {Geradores específicos da classe}
    procedure GerarIdeRespInf;
    procedure GerarInfoApur;
    procedure GerarInfoFech;
    procedure GerarInfoExercAnt;
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor  Destroy; override;

    function GerarXML: boolean; override;

    property IdeEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property IdeRespInf: TIdeRespInf read FIdeRespInf write FIdeRespInf;
    property InfoApur: TInfoApur read FInfoApur write FInfoApur;
    property InfoFech: TInfoFech read FInfoFech write FInfoFech;
  end;

  TIdeRespInf = class
  private
    FnmResp: string;
    FcpfResp: string;
    Ftelefone: string;
    Femail: string;
  public
    property nmResp: string read FnmResp write FnmResp;
    property cpfResp: string read FcpfResp write FcpfResp;
    property telefone: string read Ftelefone write Ftelefone;
    property email: string read Femail write Femail;
  end;

  TInfoApur = class
  private
    FindApurAliqFap : TpIndApurAliqFap;
  public
    property indApurAliqFap: TpIndApurAliqFap read FindApurAliqFap write FindApurAliqFap;
  end;

  TInfoFech = class
  private
    FevtRemun: TpSimNao;
    FevtPgtos: TpSimNao;
    FevtPgtosNI: TpSimNao;
    FevtAqProd: TpSimNao;
    FevtComProd: TpSimNao;
    FevtContratAvNP: TpSimNao;
    FevtInfoComplPer: TpSimNao;
    FcompSemMovto : string;
    FInfoExercAnt: TInfoExercAnt;
  public
    constructor create;
    destructor destroy; override;

    property evtRemun: TpSimNao read FevtRemun write FevtRemun;
    property evtPgtos: TpSimNao read FevtPgtos write FevtPgtos;
    property evtPgtosNI: TpSimNao read FevtPgtosNI write FevtPgtosNI;
    property evtAqProd: TpSimNao read FevtAqProd write FevtAqProd;
    property evtComProd: TpSimNao read FevtComProd write FevtComProd;
    property evtContratAvNP: TpSimNao read FevtContratAvNP write FevtContratAvNP;
    property evtInfoComplPer: TpSimNao read FevtInfoComplPer write FevtInfoComplPer;
    property compSemMovto : string read FcompSemMovto write FcompSemMovto;
    property InfoExercAnt: TInfoExercAnt read FInfoExercAnt write FInfoExercAnt;
  end;

  TInfoExercAnt = class
  private
    FmovFinancSocios: TpSimNao;
  public
    property movFinancSocios: TpSimNao read FmovFinancSocios write FmovFinancSocios;
  end;

implementation

uses
  eSocial_Periodicos;

{ TS1299Collection }
function TS1299Collection.Add: TS1299CollectionItem;
begin
  Result := TS1299CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1299Collection.GetItem(Index: Integer): TS1299CollectionItem;
begin
  Result := TS1299CollectionItem(inherited GetItem(Index));
end;

procedure TS1299Collection.SetItem(Index: Integer; Value: TS1299CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{TS1299CollectionItem}
constructor TS1299CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1299;
  FEvtFechaEvPer := TEvtFechaEvPer.Create(AOwner);
end;

destructor TS1299CollectionItem.Destroy;
begin
  FEvtFechaEvPer.Free;
  inherited;
end;

procedure TS1299CollectionItem.setEvtFechaEvPer(const Value: TEvtFechaEvPer);
begin
  FEvtFechaEvPer.Assign(Value);
end;

{ TEvtSolicTotal }
constructor TEvtFechaEvPer.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento3.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeRespInf := TIdeRespInf.Create;
  FInfoApur := TInfoApur.Create;
  FInfoFech := TInfoFech.Create;
end;

destructor TEvtFechaEvPer.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeRespInf.Free;
  FInfoApur.Free;
  FInfoFech.Free;
  inherited;
end;

procedure TEvtFechaEvPer.GerarIdeRespInf;
begin
  Gerador.wGrupo('ideRespInf');
    Gerador.wCampo(tcStr, '', 'nmResp', 0, 0, 0, self.IdeRespInf.nmResp);
    Gerador.wCampo(tcStr, '', 'cpfResp', 0, 0, 0, self.IdeRespInf.cpfResp);
    Gerador.wCampo(tcStr, '', 'telefone', 0, 0, 0, self.IdeRespInf.telefone);
    Gerador.wCampo(tcStr, '', 'email', 0, 0, 0, self.IdeRespInf.email);
  Gerador.wGrupo('/ideRespInf');
end;

procedure TEvtFechaEvPer.GerarInfoApur;
begin
  Gerador.wGrupo('infoApur');
    Gerador.wCampo(tcStr, '', 'indApurAliqFap', 0, 0, 0, eSIndApurAliqFapToStr(self.InfoApur.indApurAliqFap));
  Gerador.wGrupo('/infoApur');
end;

procedure TEvtFechaEvPer.GerarInfoExercAnt;
begin
  Gerador.wGrupo('infoExercAnt');
    Gerador.wCampo(tcStr, '', 'movFinancSocios', 0, 0, 0, eSSimNaoToStr(self.InfoFech.InfoExercAnt.movFinancSocios));
  Gerador.wGrupo('/infoExercAnt');
end;

procedure TEvtFechaEvPer.GerarInfoFech;
begin
  Gerador.wGrupo('infoFech');
    Gerador.wCampo(tcStr, '', 'evtRemun', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtRemun));
    Gerador.wCampo(tcStr, '', 'evtPgtos', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtPgtos));
    Gerador.wCampo(tcStr, '', 'evtPgtosNI', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtPgtosNI));
    Gerador.wCampo(tcStr, '', 'evtAqProd', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtAqProd));
    Gerador.wCampo(tcStr, '', 'evtComProd', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtComProd));
    Gerador.wCampo(tcStr, '', 'evtContratAvNP', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtContratAvNP));
    Gerador.wCampo(tcStr, '', 'evtInfoComplPer', 0, 0, 0, eSSimNaoToStr(self.InfoFech.evtInfoComplPer));

    if ((eSSimNaoToStr(self.InfoFech.evtRemun)        = 'N') and
        (eSSimNaoToStr(self.InfoFech.evtPgtos)        = 'N') and
        (eSSimNaoToStr(self.InfoFech.evtPgtosNI)      = 'N') and
        (eSSimNaoToStr(self.InfoFech.evtAqProd)       = 'N') and
        (eSSimNaoToStr(self.InfoFech.evtComProd)      = 'N') and
        (eSSimNaoToStr(self.InfoFech.evtContratAvNP)  = 'N') and
        (eSSimNaoToStr(self.InfoFech.evtInfoComplPer) = 'N')) then
      Gerador.wCampo(tcStr, '', 'compSemMovto', 0, 0, 0, self.InfoFech.compSemMovto);

    if ((eSSimNaoToStr(self.InfoFech.InfoExercAnt.movFinancSocios) = 'S' ) or
        (eSSimNaoToStr(self.InfoFech.InfoExercAnt.movFinancSocios) = 'N' ))  then
      GerarInfoExercAnt();
  Gerador.wGrupo('/infoFech');
end;

function TEvtFechaEvPer.GerarXML: boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtFechaEvPer Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
        //gerarIdVersao(self);
        GerarIdeEvento3(self.IdeEvento, False);
        gerarIdeEmpregador(self.IdeEmpregador);
        GerarIdeRespInf;
        GerarInfoApur;
        GerarInfoFech;
      Gerador.wGrupo('/evtFechaEvPer');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtFechaEvPer');
    Validar('evtFechaEvPer');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TInfoFech }

constructor TInfoFech.create;
begin
  inherited;
  FInfoExercAnt := TInfoExercAnt.Create;
end;

destructor TInfoFech.destroy;
begin
  FInfoExercAnt.Free;
  inherited;
end;

end.
