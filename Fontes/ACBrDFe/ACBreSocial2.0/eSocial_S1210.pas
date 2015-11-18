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

unit eSocial_S1210;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador, Controls;

type

  TPgtoExt = class;
  TIdeBenef = class;
  TInfoPgtoCollection = class;
  TInfoPgtoItem = class;
  TdetPgtoFlCollection = class;
  TdetPgtoFlItem = class;
  TdetPgtoRescCollection = class;
  TdetPgtoRescItem = class;
  TEvtPgtos = class;
  TS1210CollectionItem = class;
  TS1210Collection = class;

  TS1210Collection = class(TOwnedCollection)
    private
      function GetItem(Index: Integer): TS1210CollectionItem;
      procedure SetItem(Index: Integer; Value: TS1210CollectionItem);
    public
      function Add: TS1210CollectionItem;
      property Items[Index: Integer]: TS1210CollectionItem read GetItem write SetItem; default;
  end;

  TS1210CollectionItem = class(TCollectionItem)
    private
      FTipoEvento: TTipoEvento;
      FEvtPgtos: TEvtPgtos;
      procedure setEvtPgtos(const Value: TEvtPgtos);
    public
      constructor Create(AOwner: TComponent); reintroduce;
      destructor Destroy; override;
    published
      property TipoEvento: TTipoEvento read FTipoEvento;
      property evtPgtos: TEvtPgtos read FEvtPgtos write setEvtPgtos;
  end;

  TEvtPgtos = class(TeSocialEvento)
    private
      FIdeEvento : TIdeEvento3;
      FIdeEmpregador : TIdeEmpregador;
      FIdeBenef : TIdeBenef;

      {Geradores da classe}
      procedure GerarIdeBenef(objIdeBenef: TIdeBenef);
      procedure GerarInfoPgto(objInfoPgto: TInfoPgtoCollection; i : Integer);
      procedure GerardetPgtoFl(objdetPgtofl: TdetPgtoFlCollection);
      procedure GerardetPgtoResc(objdetPgtoResc: TdetPgtoRescCollection);
      procedure GeraridePgtoExt(objPgtoExt: TPgtoExt);
    public
      constructor Create(AACBreSocial: TObject);overload;
      destructor Destroy; override;

      function GerarXML: Boolean; override;

      property IdeEvento : TIdeEvento3 read FIdeEvento write FIdeEvento;
      property IdeEmpregador : TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
      property IdeBenef : TIdeBenef read FIdeBenef write FIdeBenef;
  end;

  TIdeBenef = class(TPersistent)
    private
      FCpfBenef : String;
      FInfoPgto : TInfoPgtoCollection;
      function getInfoPgto : TInfoPgtoCollection;
    public
      constructor Create;
      destructor  Destroy; override;
      property CpfBenef : String read FCpfBenef write FCpfBenef;
      property InfoPgto : TInfoPgtoCollection read getInfoPgto write FInfoPgto;
  end;

  TInfoPgtoCollection = class(TCollection)
    private
    function GetItem(Index: Integer): TInfoPgtoItem;
    procedure SetItem(Index: Integer; const Value: TInfoPgtoItem);
  public
    constructor Create; reintroduce;
    function Add: TInfoPgtoItem;
    property Items[Index: Integer]: TInfoPgtoItem read GetItem write SetItem;
  end;

  TInfoPgtoItem = class(TCollectionItem)
    private
      FDtPgto      : TDate;
      FIndResBr    : tpSimNao;
      FTpPgto      : tpTpPgto;
      FdetPgtoFl   : TdetPgtoFlCollection;
      FdetPgtoResc : TdetPgtoRescCollection;
      FIdePgtoExt  : TPgtoExt;
      function GetdetPgtoFl : TdetPgtoFlCollection;
      function GetdetPgtoResc : TdetPgtoRescCollection;
      function GetPgtoExt : TPgtoExt;
    public
      constructor Create;
      destructor  Destroy;

      function detPgtoFlInst(): Boolean;
      function detPgtoRescInst(): Boolean;
      function detidePgtoExtInst(): Boolean;

      property DtPgto : TDate read FDtPgto write FDtPgto;
      property IndResBr : TpSimNao read FIndResBr write FIndResBr;
      property TpPgto : tpTpPgto read FTpPgto write FTpPgto;
      property detPgtoFl: TdetPgtoFlCollection read GetdetPgtoFl write FdetPgtoFl;
      property detPgtoResc: TdetPgtoRescCollection read GetdetPgtoResc write FdetPgtoResc;
      property IdePgtoExt : TPgtoExt read GetPgtoExt write FIdePgtoExt;
  end;

  TdetPgtoFlCollection = class(TCollection)
  private
    function GetITem(Index: Integer): TdetPgtoFlItem;
    procedure SetItem(Index: Integer; const Value: TdetPgtoFlItem);
  public
    constructor Create; reintroduce;
    function Add: TdetPgtoFlItem;
    property Items[Index: Integer]: TdetPgtoFlItem read GetItem write SetItem;
  end;

  TdetPgtoFlItem = class(TCollectionItem)
    private
      FperRef : String;
      FvlrPgto: Double;
      FideRecPgto : Integer;
    public
      constructor Create;
      destructor  Destroy;
      property perRef : String read FperRef write FperRef;
      property vlrPgto: Double read FvlrPgto write FvlrPgto;
      property ideRecPgto : Integer read FideRecPgto write FideRecPgto;
  end;

  TdetPgtoRescCollection = class(TCollection)
    private
      function GetItem(Index: Integer): TdetPgtoRescItem;
      procedure SetItem(Index: Integer; const Value: TdetPgtoRescItem);
    public
      constructor Create; reintroduce;
      function Add: TdetPgtoRescItem;
      property Items[Index: Integer]: TdetPgtoRescItem read GetItem write SetITem;
  end;

  TdetPgtoRescItem = class(TCollectionItem)
    private
      FvlrPgto : Double;
      FideRecPgto : Integer;
      FnrRecArq : String;
    public
      constructor Create;
      destructor  Destroy;
      property vlrPgto : Double read FvlrPgto write FVlrPgto;
      property ideRecPgto : Integer read FideRecPgto write FideRecPgto;
      property nrRecArq : String read FnrRecArq write FnrRecArq;
  end;

  TPgtoExt = class(TPersistent)
    private
      FidePais : TIdePais;
      FEndExt : TEndExt;
    public
      constructor create;
      destructor  Destroy; override;

      property idePais: TIdePais read FIdePais write FIdePais;
      property endExt: TEndExt read FEndExt write FEndExt;
  end;


implementation

uses
  eSocial_Periodicos;

{ TS1210Collection }

function TS1210Collection.Add: TS1210CollectionItem;
begin
  Result := TS1210CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1210Collection.GetItem(Index: Integer): TS1210CollectionItem;
begin
  Result := TS1210CollectionItem(inherited GetItem(Index));
end;

procedure TS1210Collection.SetItem(Index: Integer; Value: TS1210CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS1210CollectionItem }

constructor TS1210CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1210;
  FEvtPgtos   := TEvtPgtos.Create(AOwner);
end;

destructor TS1210CollectionItem.Destroy;
begin
  FEvtPgtos.Free;
  inherited;
end;

procedure TS1210CollectionItem.setEvtPgtos(const Value: TEvtPgtos);
begin
  FEvtPgtos.Assign(Value);
end;

{ TEvtPgtos }

constructor TEvtPgtos.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento3.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeBenef := TIdeBenef.Create;
end;

destructor TEvtPgtos.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeBenef.Free;
  inherited;
end;

procedure TEvtPgtos.GerardetPgtoFl(objdetPgtofl: TdetPgtoFlCollection);
var
  i: Integer;
begin
  for i := 0 to objdetPgtofl.Count - 1 do
  begin
    Gerador.wGrupo('detPgtoFl');
      Gerador.wCampo(tcStr, '', 'perRef', 0, 0, 0, objdetPgtofl.Items[i].perRef);
      Gerador.wCampo(tcInt, '', 'ideRecPgto', 0, 0, 0, objdetPgtofl.Items[i].ideRecPgto);
      Gerador.wCampo(tcDe2, '', 'vlrPgto', 0, 0, 0, objdetPgtoFl.items[i].vlrPgto);
    Gerador.wGrupo('/detPgtoFl');
  end;
end;

procedure TEvtPgtos.GerardetPgtoResc(objdetPgtoResc: TdetPgtoRescCollection);
var
  i: Integer;
begin
  for I := 0 to objdetPgtoResc.Count - 1 do
  begin
    Gerador.wGrupo('detPgtoResc');
      Gerador.wCampo(tcInt, '', 'ideRecPgto', 0, 0, 0, objdetPgtoResc.Items[i].ideRecPgto);
      Gerador.wCampo(tcStr, '', 'nrRecArq', 0, 0, 0, objdetPgtoResc.Items[i].nrRecArq);
      Gerador.wCampo(tcDe2, '', 'vlrPgto', 0, 0, 0, objdetPgtoResc.Items[i].vlrPgto);
    Gerador.wGrupo('/detPgtoResc');
  end;
end;

procedure TEvtPgtos.GerarIdeBenef(objIdeBenef : TIdeBenef);
begin
  Gerador.wGrupo('ideBenef');
    Gerador.wCampo(tcStr, '', 'cpfBenef', 0, 0, 0, objIdeBenef.cpfBenef);
    GerarInfoPgto(objIdeBenef.InfoPgto,0);
  Gerador.wGrupo('/ideBenef');
end;

procedure TEvtPgtos.GeraridePgtoExt(objPgtoExt: TPgtoExt);
begin
  Gerador.wGrupo('pgtoExt');
    GerarIdePais(objPgtoExt.idePais);
    GerarEndExt(objPgtoExt.endExt);
  Gerador.wGrupo('/pgtoExt');
end;

procedure TEvtPgtos.GerarInfoPgto(objInfoPgto: TInfoPgtoCollection; i : Integer);
begin
  Gerador.wGrupo('infoPgto');
    Gerador.wCampo(tcDat, '', 'dtPgto', 0, 0, 0, objInfoPgto.Items[i].dtPgto);
    Gerador.wCampo(tcStr, '', 'indResBr', 0, 0, 0, objInfoPgto.Items[i].indResBr);
    Gerador.wCampo(tcStr, '', 'tpPgto', 0, 0, 0, objInfoPgto.Items[i].tpPgto);
    if (objInfoPgto.Items[i].tpPgto=tpPgtoFl) then
     begin
       if (objInfoPgto.Items[i].detPgtoFlInst()) then
          GerardetPgtoFl(objInfoPgto.Items[i].detPgtoFl);
     end
    else if (objInfoPgto.Items[i].tpPgto in [tpPgtoResc2299, tpPgtoResc2399]) then
      begin
        if (objInfoPgto.Items[i].detPgtoRescInst()) then
          GerardetPgtoResc(objInfoPgto.Items[i].detPgtoResc);
      end;
    if (objInfoPgto.Items[i].indResBr = tpNao) then
      begin
        if (objInfoPgto.Items[i].detidePgtoExtInst) then
          GeraridePgtoExt(objInfoPgto.Items[i].idePgtoExt);
      end;
  Gerador.wGrupo('/infoPgto');
end;

function TEvtPgtos.GerarXML: Boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtPgtos Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');
        //GerarIdVersao(Self);
        GerarIdeEvento3(Self.IdeEvento);
        GerarIdeEmpregador(Self.ideEmpregador);
        GerarIdeBenef(Self.IdeBenef);
      Gerador.wGrupo('/evtPgtos');
    GerarRodape;
    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtPgtos');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;
  Result := (Gerador.ArquivoFormatoXML <> '')
end;


{ TIdeBenef }

constructor TIdeBenef.create;
begin
  inherited;
  FInfoPgto := TInfoPgtoCollection.Create;
end;

destructor TIdeBenef.destroy;
begin
  FInfoPgto.Free;
  inherited;
end;


function TIdeBenef.getInfoPgto: TInfoPgtoCollection;
begin
  if (not Assigned(FInfoPgto)) then
    Result := TInfoPgtoCollection.Create;
  Result := FInfoPgto;
end;

{ TInfoPgtoCollection }

function TInfoPgtoCollection.Add: TInfoPgtoItem;
begin
  Result := TInfoPgtoItem(inherited add);
end;

constructor TInfoPgtoCollection.Create;
begin
  inherited create(TInfoPgtoItem);
end;

function TInfoPgtoCollection.GetItem(Index: Integer): TInfoPgtoItem;
begin
  Result := TInfoPgtoItem(inherited GetItem(Index));
end;

procedure TInfoPgtoCollection.SetItem(Index: Integer; const Value: TInfoPgtoItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoPgtoItem }

constructor TInfoPgtoItem.create;
begin
//  inherited
  FdetPgtoFl := TdetPgtoFlCollection.Create;
  FdetPgtoResc := TdetPgtoRescCollection.Create;
  FIdePgtoExt := TPgtoExt.Create;
  end;

destructor TInfoPgtoItem.destroy;
begin
  FdetPgtoFl.Free;
  FdetPgtoResc.Free;
  FIdePgtoExt.Free;
  inherited;
end;

function TInfoPgtoItem.detidePgtoExtInst: Boolean;
begin
  Result := Assigned(FidePgtoExt);
end;

function TInfoPgtoItem.detPgtoFlInst: Boolean;
begin
  Result := Assigned(FdetPgtoFl);
end;

function TInfoPgtoItem.detPgtoRescInst: Boolean;
begin
  Result := Assigned(FdetPgtoResc);
end;

function TInfoPgtoItem.GetdetPgtoFl: TdetPgtoFlCollection;
begin
  if not (Assigned(FdetPgtoFl)) then
    FdetPgtoFl := TdetPgtoFlCollection.Create;
  Result := FdetPgtoFl;
end;

function TInfoPgtoItem.GetdetPgtoResc: TdetPgtoRescCollection;
begin
  if not (Assigned(FdetPgtoResc)) then
    FdetPgtoResc := TdetPgtoRescCollection.Create;
  Result := FdetPgtoResc;
end;

function TInfoPgtoItem.GetPgtoExt: TPgtoExt;
begin
  if not (Assigned(FIdePgtoExt)) then
    FIdePgtoExt := TPgtoExt.Create;
  Result := FIdePgtoExt;
end;

{ TPgtoExt }

constructor TPgtoExt.create;
begin
  FIdePais := TIdePais.Create;
  FEndExt := TEndExt.Create;
end;

destructor TPgtoExt.destroy;
begin
  FIdePais.Free;
  FEndExt.Free;
  inherited;
end;

{ TdetPgtoFlCollection }

function TdetPgtoFlCollection.add: TdetPgtoFlItem;
begin
  result := TdetPgtoFlItem(inherited add);
end;

constructor TdetPgtoFlCollection.Create;
begin
  inherited create(TdetPgtoFlItem);
end;

function TdetPgtoFlCollection.GetItem(Index: Integer): TdetPgtoFlItem;
begin
  Result := TdetPgtoFlItem(inherited GetItem(Index));
end;

procedure TdetPgtoFlCollection.SetItem(Index: Integer; const Value: TdetPgtoFlItem);
begin
  inherited SetItem(Index, Value);
end;

{ TdetPgtoFlItem }

constructor TdetPgtoFlItem.create;
begin
//  inherited
end;

destructor TdetPgtoFlItem.destroy;
begin
  inherited;
end;


{ TdetPgtoRescCollection }

function TdetPgtoRescCollection.add: TdetPgtoRescItem;
begin
  result := TdetPgtoRescItem(inherited add);
end;

constructor TdetPgtoRescCollection.Create;
begin
  inherited create(TdetPgtoRescItem);
end;

function TdetPgtoRescCollection.GetItem(Index: Integer): TdetPgtoRescItem;
begin
  Result := TdetPgtoRescItem(inherited GetItem(Index));
end;

procedure TdetPgtoRescCollection.SetItem(Index: Integer; const Value: TdetPgtoRescItem);
begin
  inherited SetItem(Index, Value);
end;

{ TdetPgtoRescItem }

constructor TdetPgtoRescItem.Create;
begin
//  inherited;
end;

destructor TdetPgtoRescItem.Destroy;
begin
  inherited;
end;

end.
