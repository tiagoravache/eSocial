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

unit ACBreSocial;

interface

uses
  Classes, SysUtils, ACBrDFe, ACBrDFeException,
  ACBrDFeConfiguracoes, pcnConversao, ACBreSocialLoteEventos, eSocial_Conversao,
  ACBreSocialEventos, ACBreSocialConfiguracoes, ACBreSocialWebServices, ACBrUtil;

const
  ACBRESOCIAL_VERSAO = '2.1.0';

type
  EACBreSocialException = class(EACBrDFeException);

  TACBreSocial = class(TACBrDFe)
  private
    FEventos: TEventos;
    FLoteEventos : TLoteEventos;
    FWebServices: TWebServicesConf;
    FStatus : TStatusACBreSocial;
    function GetConfiguracoes: TConfiguracoeseSocial;
    procedure SetConfiguracoes(AValue: TConfiguracoeseSocial);
  protected
    function CreateConfiguracoes: TConfiguracoes; override;
    function GetAbout: String; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function EnviarEventos(Lote: TLoteEventos): Boolean;
    function NomeServicoToNomeSchema(const NomeServico: String): String; override;

    procedure LerServicoDeParams(LayOutServico: TLayOut;
      var Versao: Double; var URL: String);
    procedure SetStatus(const stNewStatus: TStatusACBreSocial);

    property WebServices: TWebServicesConf read FWebServices write FWebServices;
    property Eventos: TEventos read FEventos write FEventos;
    property Status: TStatusACBreSocial read FStatus;

  published
    property Configuracoes: TConfiguracoeseSocial read GetConfiguracoes write SetConfiguracoes;
  end;


implementation

{ TACBreSocial }

constructor TACBreSocial.Create(AOwner: TComponent);
begin
  inherited;
  FEventos := TEventos.Create(Self);
  FWebServices := TWebServicesConf.Create(Self);
  FLoteEventos := TLoteEventos(Self);
end;

function TACBreSocial.CreateConfiguracoes: TConfiguracoes;
begin
  Result := TConfiguracoeseSocial.Create(Self);
end;

destructor TACBreSocial.Destroy;
begin
  FEventos.Free;
  FWebServices.Free;
  inherited;
end;

function TACBreSocial.EnviarEventos(Lote: TLoteEventos): Boolean;
begin
//
end;

function TACBreSocial.GetAbout: String;
begin
  Result := 'ACBreSocial Ver: ' + ACBRESOCIAL_VERSAO;
end;

function TACBreSocial.GetConfiguracoes: TConfiguracoeseSocial;
begin
  Result := TConfiguracoeseSocial(FPConfiguracoes);
end;

procedure TACBreSocial.LerServicoDeParams(LayOutServico: TLayOut; var Versao: Double; var URL: String);
var
  AUF: String;
begin
  AUF := Configuracoes.WebServices.UF;
  Versao := StrToFloat(ACBRESOCIAL_VERSAO);
  URL := '';
//  LerServicoDeParams(GetNomeModeloDFe, AUF,
//    Configuracoes.WebServices.Ambiente, LayOutToServico(LayOutServico),
//    Versao, URL);
end;

function TACBreSocial.NomeServicoToNomeSchema(const NomeServico: String): String;
begin
  //A Implementar
  {
   Nome dos Serviços:
   EnviarLoteEventos -> envioloteeventos-v1_1_0.xsd
   ConsultarResultadoProcessamento -> consultaloteeventos-v1_0_0.xsd
   Fonte : Manual de Orientação do Desenvolvedor do eSocial Item 5 - WebServices
  }
end;

procedure TACBreSocial.SetConfiguracoes(AValue: TConfiguracoeseSocial);
begin
  FPConfiguracoes := AValue;
end;

procedure TACBreSocial.SetStatus(const stNewStatus: TStatusACBreSocial);
begin
  if stNewStatus <> FStatus then
  begin
    FStatus := stNewStatus;
    if Assigned(OnStatusChange) then
      OnStatusChange(Self);
  end;
end;

end.
