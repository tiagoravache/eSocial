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

unit ACBreSocialLoteEventos;

interface

uses
  Classes, SysUtils, Dialogs, StrUtils, eSocial_Common,
  ACBreSocialConfiguracoes, ACBrDFeUtil, ACBreSocialGerador, ACBrUtil,
  pcnConversao, pcnAuxiliar, pcnLeitor, pcnGerador, synautil, eSocial_Conversao;


type
  TItemLoteEventos = class(TCollectionItem)
  private
    FACBreSocial : TComponent;
    FNomeArq : String;
    FEvento : TTipoEvento;
    FXML : AnsiString;
    FLeitor : TLeitor;
  public
    constructor Create(AOwner: TComponent);
    property NomeArq : String read FNomeArq write FNomeArq;
  end;


  TLoteEventos = class(TOwnedCollection)
  private
    FACBreSocial : TComponent;
    FIdeEmpregador : TIdeEmpregador;
    FIdeTransmissor : TIdeTransmissor;
    FGerador : TGerador;
    FXML : String;
    function GetItem(Index: integer): TItemLoteEventos;
    procedure SetItem(Index: integer; const Value: TItemLoteEventos);
  public
    constructor Create(AOwner: TComponent);
    function Add : TItemLoteEventos;

    function LoadFromFile(CaminhoArquivo: String): Boolean;
    function LoadFromStream(AStream: TStringStream): Boolean;
    function LoadFromString(AXMLString: String): Boolean;
    procedure GerarXML();

    property Items[Index: Integer] : TItemLoteEventos read GetItem write SetItem;
    property IdeEmpregador : TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property IdeTransmissor : TIdeTransmissor read FIdeTransmissor write FIdeTransmissor;
    property XML : String read FXML write FXML;

  end;

implementation

{ TLoteEventos }

function TLoteEventos.Add: TItemLoteEventos;
begin
  Result := TItemLoteEventos(inherited Add);
  Result.create(TComponent(Self.Owner));
end;

constructor TLoteEventos.Create(AOwner: TComponent);
begin
  FACBreSocial    := AOwner;
  FIdeEmpregador  := TIdeEmpregador.Create;
  FIdeTransmissor := TIdeTransmissor.Create;
  FGerador        := TGerador.Create;
end;

procedure TLoteEventos.GerarXML;
begin
  FGerador.wGrupo('');
end;

function TLoteEventos.GetItem(Index: integer): TItemLoteEventos;
begin
  Result := TItemLoteEventos(inherited GetItem(Index));
end;

function TLoteEventos.LoadFromFile(CaminhoArquivo: String): Boolean;
var
  ArquivoXML: TStringList;
  XML: String;
  XMLOriginal: AnsiString;
  i: integer;
begin
  Result := False;
  ArquivoXML := TStringList.Create;
  try
    ArquivoXML.LoadFromFile(CaminhoArquivo);
    XMLOriginal := ArquivoXML.Text;

    // Converte de UTF8 para a String nativa da IDE //
    XML := DecodeToString(XMLOriginal, True);
    LoadFromString(XML);

    for i := 0 to Self.Count - 1 do
      Self.Items[i].NomeArq := CaminhoArquivo; //NomeArq deve pertencer à classe TItemLoteEventos!!!!

    Result := True;
  finally
    ArquivoXML.Free;
  end;
end;

function TLoteEventos.LoadFromStream(AStream: TStringStream): Boolean;
var
  XMLOriginal: AnsiString;
begin
  Result := False;
  AStream.Position := 0;
  XMLOriginal := ReadStrFromStream(AStream, AStream.Size);

  Result := Self.LoadFromString(String(XMLOriginal));
end;

function TLoteEventos.LoadFromString(AXMLString: String): Boolean;
var
  AXML: AnsiString;
  P, N: integer;

  function PoseSocial: integer;
  begin
    Result := pos('</eSocial>', AXMLString);
  end;

begin
  N := PoseSocial;
  while N > 0 do
    begin
      P := pos('</eSocial>', AXMLString);
      if P > 0 then
      begin
        AXML := copy(AXMLString, 1, P + 10);
        AXMLString := Trim(copy(AXMLString, P + 10, length(AXMLString)));
      end
      else
      begin
        AXML := copy(AXMLString, 1, N + 6);
        AXMLString := Trim(copy(AXMLString, N + 6, length(AXMLString)));
      end;

      with Self.Add do
      begin
        FXML := AXML;
//        LerXML(AXML);//está na classe NotaFiscal - verificar implementação!

  //      if AGerarNFe then // Recalcula o XML
  //        GerarXML;
      end;

      N := PoseSocial;
    end;

  Result := Self.Count > 0;
end;

procedure TLoteEventos.SetItem(Index: integer; const Value: TItemLoteEventos);
begin
  inherited SetItem(Index, Value);
end;

{ TItemLoteEventos }

constructor TItemLoteEventos.Create(AOwner: TComponent);
begin
  FACBreSocial := AOwner;
end;

end.
