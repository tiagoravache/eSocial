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
|* 01/03/2016: Alterações para validação com o XSD
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S2206;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type

  TS2206Collection = class;
  TS2206CollectionItem = class;
  TEvtAltContratual = class;
  TAltContratual = class;

  TS2206Collection = class(TOwnedCollection)
    private
      function GetItem(Index: Integer): TS2206CollectionItem;
      procedure SetItem(Index: Integer; Value: TS2206CollectionItem);
    public
      function Add: TS2206CollectionItem;
      property Items[Index: Integer]: TS2206CollectionItem read GetItem write SetItem; default;
  end;

  TS2206CollectionItem = class(TCollectionItem)
    private
      FTipoEvento : TTipoEvento;
      FEvtAltContratual: TEvtAltContratual;
      procedure setEvtAltContratual(const Value: TEvtAltContratual);
    public
      constructor Create(AOwner: TComponent); reintroduce;
      destructor  Destroy; override;
    published
      property TipoEvento : TTipoEvento read FTipoEvento;
      property EvtAltContratual : TEvtAltContratual read FEvtAltContratual write setEvtAltContratual;
  end;

  TEvtAltContratual = class(TeSocialEvento)
    private
      FIdeEvento: TIdeEvento2;
      FIdeEmpregador: TIdeEmpregador;
      FIdeVinculo : TIdeVinculo;
      FAltContratual: TAltContratual;
      function  GetAltContratual : TAltContratual;

      {Geradores da Classe - Necessários pois os geradores de ACBreSocialGerador
       possuem campos excedentes que não se aplicam ao S2206}
      procedure GerarAltContratual(objAltContratual: TAltContratual);
      procedure GerarInfoCeletista(objInfoCeletista : TInfoCeletista);
      procedure GerarInfoContrato(ObjInfoContrato : TInfoContrato);
    public
      constructor Create(AACBreSocial: TObject);overload;
      destructor destroy; override;

      function GerarXML: boolean; override;

      property IdeEvento : TIdeEvento2 read FIdeEvento write FIdeEvento;
      property IdeEmpregador : TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
      property IdeVinculo : TIdeVinculo read FIdeVinculo write FIdeVInculo;
      property AltContratual : TAltContratual read GetAltContratual write FAltContratual;
  end;

  TAltContratual = class(TPersistent)
    private
      FdtAlteracao : TDateTime;
      FVinculo     : TVinculo;
      FinfoRegimeTrab : TinfoRegimeTrab;
      FinfoContrato   : TinfoContrato;
    public
      constructor Create;
      destructor  destroy; override;
    published
      property dtALteracao : TDateTime read FdtAlteracao write FdtAlteracao;
      property Vinculo : TVInculo read FVinculo write FVinculo;
      property infoRegimeTrab : TinfoRegimeTrab read FinfoRegimeTrab write FinfoRegimeTrab;
      property infoContrato : TinfoContrato read FinfoContrato write FinfoContrato;
  end;

implementation

uses
  eSocial_NaoPeriodicos;

{ TS2206Collection }

function TS2206Collection.Add: TS2206CollectionItem;
begin
  Result := TS2206CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2206Collection.GetItem(Index: Integer): TS2206CollectionItem;
begin
   Result := TS2206CollectionItem(inherited GetItem(Index));
end;

procedure TS2206Collection.SetItem(Index: Integer; Value: TS2206CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS2206CollectionItem }

constructor TS2206CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS2206;
  FEvtAltContratual := TEvtAltContratual.Create(AOwner);
end;

destructor TS2206CollectionItem.Destroy;
begin
  FEvtAltContratual.Free;
  inherited;
end;

procedure TS2206CollectionItem.setEvtAltContratual(const Value: TEvtAltContratual);
begin
  FEvtAltContratual.Assign(Value)
end;

{ TEvtAltContratual }


constructor TEvtAltContratual.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeVinculo := TIdeVinculo.Create;
  FAltContratual := TAltContratual.Create;
end;

destructor TEvtAltContratual.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FAltContratual.Free;
  inherited;
end;

procedure TEvtAltContratual.GerarAltContratual(objAltContratual: TAltContratual);
begin
  Gerador.wGrupo('altContratual');
    Gerador.wCampo(tcDat, '', 'dtAlteracao', 0, 0, 0, objAltContratual.dtALteracao);
    GerarVinculo(objAltContratual.Vinculo, 3);
    Gerador.wGrupo('infoRegimeTrab');
      GerarInfoCeletista(objAltContratual.infoRegimeTrab.InfoCeletista);
    Gerador.wGrupo('/infoRegimeTrab');
    GerarInfoContrato(objAltContratual.InfoContrato);
  Gerador.wGrupo('/altContratual');
end;

procedure TEvtAltContratual.GerarInfoCeletista(objInfoCeletista: TInfoCeletista);
begin
  Gerador.wGrupo('infoCeletista');
    Gerador.wCampo(tcStr, '', 'tpRegJor', 0,0,0, objInfoCeletista.TpRegJor);
    Gerador.wCampo(tcStr, '', 'natAtividade', 0,0,0, objInfoCeletista.NatAtividade);
    Gerador.wCampo(tcStr, '', 'dtBase', 0,0,0, objInfoCeletista.dtBase);
    Gerador.wCampo(tcStr, '', 'cnpjSindCategProf', 0,0,0, objInfoCeletista.cnpjSindCategProf);
  Gerador.wGrupo('/infoCeletista');
end;

procedure TEvtAltContratual.GerarInfoContrato(ObjInfoContrato: TInfoContrato);
begin
  Gerador.wGrupo('infoContrato');
    if (objInfoContrato.CodCargo <> '')  then
      Gerador.wCampo(tcStr, '', 'codCargo  ', 0, 0, 0, objInfoContrato.CodCargo);

    if (objInfoContrato.CodFuncao <> '') then
      Gerador.wCampo(tcStr, '', 'codFuncao  ', 0, 0, 0, objInfoContrato.CodFuncao);

    Gerador.wCampo(tcStr, '', 'codCateg  ', 0, 0, 0, objInfoContrato.CodCateg);
    GerarRemuneracao(objInfoContrato.Remuneracao);
    GerarDuracao(objInfoContrato.Duracao);
    GerarLocalTrabalho(objInfoContrato.LocalTrabalho);
    GerarHorContratual(objInfoContrato.HorContratual);
    GerarFiliacaoSindical(objInfoContrato.FiliacaoSindical);
    GerarAlvaraJudicial(objInfoContrato.AlvaraJudicial);
  Gerador.wGrupo('/infoContrato');
end;

function TEvtAltContratual.GerarXML: boolean;
begin
  try
    GerarCabecalho('evtAltContratual');
      Gerador.wGrupo('evtAltContratual Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
        //GerarIdVersao(Self);
        GerarIdeEvento2(self.IdeEvento);
        GerarIdeEmpregador(self.IdeEmpregador);
        GerarIdeVinculo(Self.IdeVinculo);
        GerarAltContratual(FAltContratual);
      Gerador.wGrupo('/evtAltContratual');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtAltContratual');
    Validar('evtAltContratual');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

function TEvtAltContratual.GetAltContratual: TAltContratual;
begin
  if Not(Assigned(FAltContratual)) then
    FAltContratual := TAltContratual.Create;
  Result := FAltContratual;
end;

{ TAltContratual }

constructor TAltContratual.Create;
begin
  inherited;
  FVinculo := TVinculo.Create;
  FinfoRegimeTrab := TinfoRegimeTrab.Create;
  FinfoContrato   := TinfoContrato.Create;
end;

destructor TAltContratual.destroy;
begin
  FVinculo.Free;
  FinfoRegimeTrab.Free;
  FinfoContrato.Free;
  inherited;
end;

end.
