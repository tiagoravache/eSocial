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

unit eSocial_S2230;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao, ACBreSocialConsts,
  ACBreSocialGerador;

type
  TS2230Collection = class;
  TS2230CollectionItem = class;
  TEvtAfastTemp = class;
  TinfoAfastamento = class;
  TiniAfastamento = class;
  TaltAfastamento = class;
  TfimAfastamento = class;
  TinfoAtestado = class;
  TinfoCessao = class;
  TinfoMandSind = class;

  TS2230Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS2230CollectionItem;
    procedure SetItem(Index: Integer; Value: TS2230CollectionItem);
  public
    function Add: TS2230CollectionItem;
    property Items[Index: Integer]: TS2230CollectionItem read GetItem write SetItem; default;
  end;

  TS2230CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtAfastTemp: TEvtAfastTemp;

    procedure setEvtAfastTemp(const Value: TEvtAfastTemp);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtAfastTemp: TEvtAfastTemp read FEvtAfastTemp write setEvtAfastTemp;
  end;

  TEvtAfastTemp = class(TeSocialEvento)
    private
      FIdeEvento : TIdeEvento2;
      FIdeEmpregador : TIdeEmpregador;
      FIdeVinculo : TIdeVinculo;
      FinfoAfastamento : TinfoAfastamento;

      procedure GerarInfoAfastamento(objInfoAfast: TinfoAfastamento);
      procedure GerarInfoAtestado(objInfoAtestado: TinfoAtestado);
      procedure GerarInfoCessao(objInfoCessao: TinfoCessao);
      procedure GerarInfoMandSind(objInfoMandSind: TInfoMandSind);
      procedure GerarAltAfast(objAltAfast: TaltAfastamento);
      procedure GerarFimAfast(objFimAfast: TfimAfastamento);
    public
      constructor Create(AACBreSocial: TObject);overload;
      destructor  Destroy; override;

      function GerarXML: boolean; override;

      property IdeEvento: TIdeEvento2 read FIdeEvento write FIdeEvento;
      property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
      property IdeVinculo: TIdeVinculo read FIdeVinculo write FIdeVinculo;
      property infoAfastamento: TinfoAfastamento read FinfoAfastamento write FinfoAfastamento;
  end;

  TinfoAfastamento = class(TPersistent)
    private
      FiniAfastamento : TiniAfastamento;
      FaltAfastamento : TaltAfastamento;
      FfimAfastamento : TfimAfastamento;
    public
      constructor create;
      destructor  destroy; override;

      property iniAfastamento: TiniAfastamento read FiniAfastamento write FiniAfastamento;
      property altAfastamento: TaltAfastamento read FaltAfastamento write FaltAfastamento;
      property fimAfastamento: TfimAfastamento read FfimAfastamento write FfimAfastamento;
  end;

  tiniAfastamento = class(TAfastamento)
    private
//      FcodMotAfast: String;--Herda de TAfastamento v 2.1
      FtpAcidTransito: tpTpAcidTransito;
      FObservacao: String;
      FinfoAtestado: TinfoAtestado;
      FinfoCessao: TinfoCessao;
      FinfoMandSind: TinfoMandSind;
//      procedure setinfoAtestado(const Value: TinfoAtestado);
//      procedure setinfoCessao(const Value: TinfoCessao);
    public
      constructor create;
      destructor  destroy; override;

//      property codMotAfast: String read FcodMotAfast write FcodMotAfast; -- Herda de TAfastamento v 2.1
      property tpAcidTransito: tpTpAcidTransito read FtpAcidTransito write FtpAcidTransito;
      property Observacao: String read FObservacao write FObservacao;
      property infoAtestado: TinfoAtestado read FinfoAtestado write FinfoAtestado;
      property infoCessao: TinfoCessao read FinfoCessao write FinfoCessao;
      property infoMandSind : TinfoMandSind read FinfoMandSind write FinfoMandSind;
  end;

  TinfoAtestado = class(TPersistent)
    private
      FcodCID : String;
      FqtDiasAfast : Integer;
      FEmitente : TEmitente;
    public
      constructor create;
      destructor  destroy; override;

      property codCID: String read FCodCId write FcodCID;
      property qtDiasAfast: Integer read FqtDiasAfast write FqtDiasAfast;
      property Emitente: TEmitente read FEmitente write FEmitente;
  end;

  TinfoCessao = class(TPersistent)
    private
      FcnpjCess : String;
      FinfOnus : tpInfOnus;
    public
      property cnpjCess: String read FcnpjCess write FcnpjCess;
      property infOnus: tpInfOnus read FinfOnus write FinfOnus;
  end;

  TinfoMandSind = class(TPersistent)
    private
      FcnpjSind : String;
      FinfOnusRemun: tpOnusRemun;
    public
      property cnpjSind: String read FcnpjSind write FcnpjSind;
      property infOnusRemun: tpOnusRemun read FinfOnusRemun write FinfOnusRemun;
  end;

  TaltAfastamento = class(TPersistent) //alteração do motivo do afastamento
    private
      FdtAltMot: TDateTime;
      FcodMotAnt : String;
      FcodMotAfast: String;
      FindEfRetroativo: tpSimNao;
    public
      property dtAltMot: TDateTime read FdtAltMot write FdtAltMot;
      property codMotAnt: String read FcodMotAnt write FcodMotAnt;
      property codMotAfast: String read FcodMotAfast write FcodMotAfast;
      property indEfRetroativo: tpSimNao read FindEfRetroativo write FindEfRetroativo;
  end;

  TfimAfastamento = class(TPersistent)
    private
      FdtTermAfast : TDateTime;
      FcodMotAfast : String;
      FObservacao  : String;
    public
      property dtTermAfast: TDateTime read FdtTermAfast write FdtTermAfast;
      property codMotAfast: String read FcodMotAfast write FcodMotAfast;
      property Observacao: String read FObservacao write FObservacao;
  end;


implementation

uses
  eSocial_NaoPeriodicos;

{ TS2230Collection }

function TS2230Collection.Add: TS2230CollectionItem;
begin
  Result := TS2230CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2230Collection.GetItem(Index: Integer): TS2230CollectionItem;
begin
  Result := TS2230CollectionItem(inherited GetItem(Index));
end;

procedure TS2230Collection.SetItem(Index: Integer; Value: TS2230CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS2230CollectionItem }

constructor TS2230CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS2230;
  FEvtAfastTemp := TEvtAfastTemp.Create(AOwner);
end;

destructor TS2230CollectionItem.Destroy;
begin
  FEvtAfastTemp.Free;
  inherited;
end;

procedure TS2230CollectionItem.setEvtAfastTemp(const Value: TEvtAfastTemp);
begin
  FEvtAfastTemp.Assign(Value);
end;

{ TEvtAfastTemp }

constructor TEvtAfastTemp.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeVinculo := TIdeVinculo.Create;
  FinfoAfastamento := TinfoAfastamento.Create;
end;

destructor TEvtAfastTemp.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FideVinculo.Free;
  FinfoAfastamento.Free;
  inherited;
end;

procedure TEvtAfastTemp.GerarInfoAfastamento(objInfoAfast: TinfoAfastamento);
begin
  Gerador.wGrupo('infoAfastamento');
    Gerador.wGrupo('iniAfastamento');
      Gerador.wCampo(tcDat, '', 'dtIniAfast', 0,0,0, objInfoAfast.iniAfastamento.DtIniAfast);
      Gerador.wCampo(tcStr, '', 'codMotAfast', 0,0,0, objInfoAfast.iniAfastamento.codMotAfast);
      Gerador.wCampo(tcStr, '', 'tpAcidTransito', 0,0,0, objInfoAfast.iniAfastamento.tpAcidTransito);
      Gerador.wCampo(tcStr, '', 'observacao', 0,0,0, objInfoAfast.iniAfastamento.Observacao);
      if Assigned(objInfoAfast.iniAfastamento.infoAtestado) then
        GerarInfoAtestado(objInfoAfast.iniAfastamento.infoAtestado);
      if Assigned(objInfoAfast.iniAfastamento.infoCessao) then
        GerarInfoCessao(objInfoAfast.iniAfastamento.infoCessao);
      if Assigned(objInfoAfast.iniAfastamento.infoMandSind) then
        GerarInfoMandSind(objInfoAfast.iniAfastamento.infoMandSind);
    Gerador.wGrupo('/iniAfastamento');
    GerarAltAfast(objInfoAfast.altAfastamento);
    GerarFimAfast(objInfoAfast.fimAfastamento);
  Gerador.wGrupo('/infoAfastamento');
end;

procedure TEvtAfastTemp.GerarInfoAtestado(objInfoAtestado: TinfoAtestado);
begin
  Gerador.wGrupo('infoAtestado');
    Gerador.wCampo(tcStr, '', 'codCID', 0,0,0, objInfoAtestado.codCID);
    Gerador.wCampo(tcInt, '', 'qtdDiasAfast', 0,0,0, objInfoAtestado.qtDiasAfast);
    Gerador.wGrupo('emitente');
      Gerador.wCampo(tcStr, '', 'nmEmit', 0,0,0, objInfoAtestado.Emitente.nmEmit);
      Gerador.wCampo(tcStr, '', 'ideOC', 0,0,0, objInfoAtestado.Emitente.ideOC);
      Gerador.wCampo(tcStr, '', 'nrOc', 0,0,0, objInfoAtestado.Emitente.nrOc);
      Gerador.wCampo(tcStr, '', 'ufOC', 0,0,0, objInfoAtestado.Emitente.ufOC);
    Gerador.wGrupo('/emitente');
  Gerador.wGrupo('/infoAtestado');
end;

procedure TEvtAfastTemp.GerarInfoCessao(objInfoCessao: TinfoCessao);
begin
  Gerador.wGrupo('infoCessao');
    Gerador.wCampo(tcStr, '', 'cnpjCess', 0,0,0, objInfoCessao.cnpjCess);
    Gerador.wCampo(tcStr, '', 'infOnus', 0,0,0, objInfoCessao.infOnus);
  Gerador.wGrupo('/infoCessao');
end;

procedure TEvtAfastTemp.GerarInfoMandSind(objInfoMandSind: TInfoMandSind);
begin
  Gerador.wGrupo('infoMandSind');
    Gerador.wCampo(tcStr, '', 'cnpjSind', 0,0,0, objInfoMandSind.cnpjSind);
    Gerador.wCampo(tcStr, '', 'infOnusRemun', 0,0,0, objInfoMandSind.infOnusRemun);
  Gerador.wGrupo('/infoMandSind');
end;

function TEvtAfastTemp.GerarXML: boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtAfastTemp Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
        //gerarIdVersao(self);
        gerarIdeEvento2(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        gerarIdeVinculo(self.IdeVinculo);
        GerarInfoAfastamento(FinfoAfastamento);
      Gerador.wGrupo('/evtAfastTemp');
    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtAfastTemp');
    Validar('evtAfastTemp');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

procedure TEvtAfastTemp.GerarAltAfast(objAltAfast: TaltAfastamento);
begin
  if (Assigned(objAltAfast)) then
  begin
      Gerador.wGrupo('altAfastamento');
        Gerador.wCampo(tcDat, '', 'dtAltMot', 0,0,0, objAltAfast.dtAltMot);
        Gerador.wCampo(tcStr, '', 'codMotAnt', 0,0,0, objAltAfast.codMotAnt);
        Gerador.wCampo(tcStr, '', 'codMotAfast', 0,0,0, objAltAfast.codMotAfast);
        Gerador.wCampo(tcStr, '', 'indEfRetroativo', 0,0,0, objAltAfast.indEfRetroativo);
      Gerador.wGrupo('/altAfastamento');
    end;
end;

procedure TEvtAfastTemp.GerarFimAfast(objFimAfast: TfimAfastamento);
begin
  if (Assigned(objFimAfast)) then
    begin
      Gerador.wGrupo('fimAfastamento');
        Gerador.wCampo(tcDat, '', 'dtTermAfast', 0,0,0, objFimAfast.dtTermAfast);
        Gerador.wCampo(tcStr, '', 'codMotAfast', 0,0,0, objFimAfast.codMotAfast);
        Gerador.wCampo(tcStr, '', 'observacao', 0,0,0, objFimAfast.Observacao);
      Gerador.wGrupo('/fimAfastamento');
    end;
end;

{ TinfoAfastamento }

constructor TinfoAfastamento.create;
begin
  inherited;
  FiniAfastamento := TiniAfastamento.Create;
  FaltAfastamento := TaltAfastamento.Create;
  FfimAfastamento := TfimAfastamento.Create;
end;

destructor TinfoAfastamento.destroy;
begin
   FiniAfastamento.Free;
   FaltAfastamento.Free;
   FfimAfastamento.Free;
   inherited;
end;

{ tiniAfastamento }

constructor tiniAfastamento.create;
begin
  inherited;
  FinfoAtestado := TinfoAtestado.Create;
  FinfoCessao := TinfoCessao.Create;
  FinfoMandSind := TinfoMandSind.Create;
end;

destructor tiniAfastamento.destroy;
begin
  FInfoAtestado.Free;
  FinfoCessao.Free;
  FinfoMandSind.Free;
  inherited;
end;

//procedure tiniAfastamento.setinfoAtestado(const Value: TinfoAtestado);
//begin
//  FinfoAtestado.Assign(Value);
//end;
//
//procedure tiniAfastamento.setinfoCessao(const Value: TinfoCessao);
//begin
//  FinfoCessao.Assign(Value);
//end;

{ TinfoAtestado }

constructor TinfoAtestado.create;
begin
  inherited;
  FEmitente := TEmitente.Create;
end;

destructor TinfoAtestado.destroy;
begin
  FEmitente.Free;
  inherited;
end;

end.
