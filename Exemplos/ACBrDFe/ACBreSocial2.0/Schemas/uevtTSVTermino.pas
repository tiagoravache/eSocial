unit uevtTSVTermino;

Interface
uses
  Classes,
  JanXMLParser2,
  uxmldsig-core-schema,
  uXMLTools;

// targetNameSpace: http://www.esocial.gov.br/schema/evt/evtTSVTermino/v02_00_00
// NameSpacePrefix: 
// Date of Schema : 29/04/2015 15:23:30
// Translationdate: 09/07/2015 13:11:46
//
//   includes ds=http://www.w3.org/2000/09/xmldsig# in 'xmldsig-core-schema.pas'
//   includes xs=http://www.w3.org/2001/XMLSchema

// ordinal types
type
  tcpfTrab = string;
  tnisTrab = string;
  tcodCateg = integer;
  tindRetif = u.tbyte;
  tnrRecibo = string;
  ttpAmb = u.tbyte;
  tprocEmi = u.tbyte;
  tverProc = string;
  ttpInsc = u.tbyte;
  tnrInsc = string;

const
  snTEmpregador = 'TEmpregador';
  snTEmpregador_tpInsc = 'tpInsc';
  snTEmpregador_nrInsc = 'nrInsc';

type
  tTEmpregador = class
  private
    F_NameSpaceAlias: string;
    FtpInsc: u.tbyte; // (E)
    FnrInsc: string; // (E)
  public
    constructor Create; overload;
    constructor Create(aRoot:tJanXMLNode2); overload;
    destructor Destroy; override;
    class function _nsURI_:string;
    procedure Save(aNode:tJanXMLNode2);
    property _NameSpaceAlias: string read F_NameSpaceAlias write F_NameSpaceAlias;
    property tpInsc: u.tbyte read FtpInsc write FtpInsc;
    property nrInsc: string read FnrInsc write FnrInsc;
  end;

const
  snTIdeEveTrab = 'TIdeEveTrab';
  snTIdeEveTrab_indRetif = 'indRetif';
  snTIdeEveTrab_nrRecibo = 'nrRecibo';
  snTIdeEveTrab_tpAmb = 'tpAmb';
  snTIdeEveTrab_procEmi = 'procEmi';
  snTIdeEveTrab_verProc = 'verProc';

type
  tTIdeEveTrab = class
  private
    F_NameSpaceAlias: string;
    FindRetif: u.tbyte; // (E)
    FnrRecibo: string; // (E)
    FnrRecibo_IsSet_: boolean;
    FtpAmb: u.tbyte; // (E)
    FprocEmi: u.tbyte; // (E)
    FverProc: string; // (E)
    procedure SetnrRecibo(value:string);
  public
    constructor Create; overload;
    constructor Create(aRoot:tJanXMLNode2); overload;
    destructor Destroy; override;
    class function _nsURI_:string;
    procedure Save(aNode:tJanXMLNode2);
    property _NameSpaceAlias: string read F_NameSpaceAlias write F_NameSpaceAlias;
    property indRetif: u.tbyte read FindRetif write FindRetif;
    property nrRecibo: string read FnrRecibo write SetnrRecibo;
    property nrRecibo_IsSet_:boolean read FnrRecibo_IsSet_;
    property tpAmb: u.tbyte read FtpAmb write FtpAmb;
    property procEmi: u.tbyte read FprocEmi write FprocEmi;
    property verProc: string read FverProc write FverProc;
  end;

const
  sninfoTSVTermino = 'infoTSVTermino';

type
  tinfoTSVTermino = class
  private
    F_NameSpaceAlias: string;
  public
    constructor Create; overload;
    constructor Create(aRoot:tJanXMLNode2); overload;
    destructor Destroy; override;
    class function _nsURI_:string;
    procedure Save(aNode:tJanXMLNode2);
    property _NameSpaceAlias: string read F_NameSpaceAlias write F_NameSpaceAlias;
  end;

const
  snideTrabSemVinculo = 'ideTrabSemVinculo';
  snideTrabSemVinculo_cpfTrab = 'cpfTrab';
  snideTrabSemVinculo_nisTrab = 'nisTrab';
  snideTrabSemVinculo_codCateg = 'codCateg';

type
  tideTrabSemVinculo = class
  private
    F_NameSpaceAlias: string;
    FcpfTrab: string; // (E)
    FnisTrab: string; // (E)
    FnisTrab_IsSet_: boolean;
    FcodCateg: integer; // (E)
    procedure SetnisTrab(value:string);
  public
    constructor Create; overload;
    constructor Create(aRoot:tJanXMLNode2); overload;
    destructor Destroy; override;
    class function _nsURI_:string;
    procedure Save(aNode:tJanXMLNode2);
    property _NameSpaceAlias: string read F_NameSpaceAlias write F_NameSpaceAlias;
    property cpfTrab: string read FcpfTrab write FcpfTrab;
    property nisTrab: string read FnisTrab write SetnisTrab;
    property nisTrab_IsSet_:boolean read FnisTrab_IsSet_;
    property codCateg: integer read FcodCateg write FcodCateg;
  end;

const
  snevtTSVTermino = 'evtTSVTermino';
  snevtTSVTermino_ideEvento = 'ideEvento';
  snevtTSVTermino_ideEmpregador = 'ideEmpregador';
  snevtTSVTermino_ideTrabSemVinculo = 'ideTrabSemVinculo';
  snevtTSVTermino_infoTSVTermino = 'infoTSVTermino';
  anevtTSVTermino_Id = 'Id';
  anevtTSVTermino_versao = 'versao';

type
  tevtTSVTermino = class
  private
    F_NameSpaceAlias: string;
    FideEvento: tTIdeEveTrab; // (E)
    FideEmpregador: tTEmpregador; // (E)
    FideTrabSemVinculo: tideTrabSemVinculo; // (E)
    FinfoTSVTermino: tinfoTSVTermino; // (E)
    FId: string; // (A)
    FId_IsSet_: boolean;
    Fversao: string; // (A)
    Fversao_IsSet_: boolean;
    procedure SetId(value:string);
    procedure Setversao(value:string);
  public
    constructor Create; overload;
    constructor Create(aRoot:tJanXMLNode2); overload;
    destructor Destroy; override;
    class function _nsURI_:string;
    procedure Save(aNode:tJanXMLNode2);
    property _NameSpaceAlias: string read F_NameSpaceAlias write F_NameSpaceAlias;
    property ideEvento: tTIdeEveTrab read FideEvento write FideEvento;
    property ideEmpregador: tTEmpregador read FideEmpregador write FideEmpregador;
    property ideTrabSemVinculo: tideTrabSemVinculo read FideTrabSemVinculo write FideTrabSemVinculo;
    property infoTSVTermino: tinfoTSVTermino read FinfoTSVTermino write FinfoTSVTermino;
    property Id: string read FId write SetId;
    property Id_IsSet_:boolean read FId_IsSet_;
    property versao: string read Fversao write Setversao;
    property versao_IsSet_:boolean read Fversao_IsSet_;
  end;

const
  sneSocial = 'eSocial';
  sneSocial_evtTSVTermino = 'evtTSVTermino';
  sneSocial_Signature = 'Signature';

type
  teSocial = class
  private
    F_NameSpaceAlias: string;
    FevtTSVTermino: tevtTSVTermino; // (E)
    FSignature: tSignature; // (X)
  public
    constructor Create; overload;
    constructor Create(aRoot:tJanXMLNode2); overload;
    destructor Destroy; override;
    class function _nsURI_:string;
    procedure Save(aNode:tJanXMLNode2);
    property _NameSpaceAlias: string read F_NameSpaceAlias write F_NameSpaceAlias;
    property evtTSVTermino: tevtTSVTermino read FevtTSVTermino write FevtTSVTermino;
    property Signature: tSignature read FSignature write FSignature;
  end;

implementation
uses
  SysUtils,
  mylib;

const
  thisNamespaceURI = 'http://www.esocial.gov.br/schema/evt/evtTSVTermino/v02_00_00';
  defNamespaceAlias = '';

{ tTEmpregador }

class function tTEmpregador._nsURI_;
begin
  result := thisNameSpaceURI;
end; // class function _nsURI_

constructor tTEmpregador.Create;
begin
  _NamespaceAlias := defNamespaceAlias;
end; // constructor ...

constructor tTEmpregador.Create(aRoot:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  sn: string;
  i: integer;
  thisURI: string;
begin
  F_NameSpaceAlias := aRoot.NameSpace;
  xn := aRoot.FirstChild;
  while Assigned(xn) do
  begin
    sn := NamePart(xn.name);
    thisURI := xn.namespaceURI;
    if (sn = snTEmpregador_tpInsc) then
      tpInsc :=  xn.text // u.tbyte
    else if (sn = snTEmpregador_nrInsc) then
      nrInsc :=  xn.text // string
    else;
    xn := xn.NextSibling;
  end; // while Assigned(xn) do ...
end; // constructor ...

destructor tTEmpregador.Destroy;
begin
  inherited;
end; // destructor ...

procedure tTEmpregador.Save(aNode:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  i: integer;
begin
  if aNode.name = '' then
    aNode.name := nsName(_NameSpaceAlias, 'TEmpregador')
  else if pos(colon, aNode.name) = 0 then
    aNode.name := nsName(_NameSpaceAlias, aNode.name);

  if _NameSpaceAlias <> '' then
  begin
    xn := aNode;
    while Assigned(xn.ParentNode) do
      xn := xn.ParentNode;
    xn.attribute['xmlns:' + _NameSpaceAlias] := thisNameSpaceURI;
  end;

  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTEmpregador_tpInsc));
  xn.text := FtpInsc;
  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTEmpregador_nrInsc));
  xn.text := FnrInsc;
end; // procedure save

{ tTIdeEveTrab }

class function tTIdeEveTrab._nsURI_;
begin
  result := thisNameSpaceURI;
end; // class function _nsURI_

constructor tTIdeEveTrab.Create;
begin
  _NamespaceAlias := defNamespaceAlias;
end; // constructor ...

constructor tTIdeEveTrab.Create(aRoot:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  sn: string;
  i: integer;
  thisURI: string;
begin
  F_NameSpaceAlias := aRoot.NameSpace;
  xn := aRoot.FirstChild;
  while Assigned(xn) do
  begin
    sn := NamePart(xn.name);
    thisURI := xn.namespaceURI;
    if (sn = snTIdeEveTrab_indRetif) then
      indRetif :=  xn.text // u.tbyte
    else if (sn = snTIdeEveTrab_nrRecibo) then
      nrRecibo :=  xn.text // string
    else if (sn = snTIdeEveTrab_tpAmb) then
      tpAmb :=  xn.text // u.tbyte
    else if (sn = snTIdeEveTrab_procEmi) then
      procEmi :=  xn.text // u.tbyte
    else if (sn = snTIdeEveTrab_verProc) then
      verProc :=  xn.text // string
    else;
    xn := xn.NextSibling;
  end; // while Assigned(xn) do ...
end; // constructor ...

destructor tTIdeEveTrab.Destroy;
begin
  inherited;
end; // destructor ...

procedure tTIdeEveTrab.SetnrRecibo(value:string);
begin
  FnrRecibo := value;
  FnrRecibo_IsSet_ := true;
end;

procedure tTIdeEveTrab.Save(aNode:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  i: integer;
begin
  if aNode.name = '' then
    aNode.name := nsName(_NameSpaceAlias, 'TIdeEveTrab')
  else if pos(colon, aNode.name) = 0 then
    aNode.name := nsName(_NameSpaceAlias, aNode.name);

  if _NameSpaceAlias <> '' then
  begin
    xn := aNode;
    while Assigned(xn.ParentNode) do
      xn := xn.ParentNode;
    xn.attribute['xmlns:' + _NameSpaceAlias] := thisNameSpaceURI;
  end;

  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTIdeEveTrab_indRetif));
  xn.text := FindRetif;
  if nrRecibo_IsSet_ then
  begin
    xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTIdeEveTrab_nrRecibo));
    xn.text := FnrRecibo;
  end;
  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTIdeEveTrab_tpAmb));
  xn.text := FtpAmb;
  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTIdeEveTrab_procEmi));
  xn.text := FprocEmi;
  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snTIdeEveTrab_verProc));
  xn.text := FverProc;
end; // procedure save

{ tinfoTSVTermino }

class function tinfoTSVTermino._nsURI_;
begin
  result := thisNameSpaceURI;
end; // class function _nsURI_

constructor tinfoTSVTermino.Create;
begin
  _NamespaceAlias := defNamespaceAlias;
end; // constructor ...

constructor tinfoTSVTermino.Create(aRoot:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  sn: string;
  i: integer;
  thisURI: string;
begin
  F_NameSpaceAlias := aRoot.NameSpace;
end; // constructor ...

destructor tinfoTSVTermino.Destroy;
begin
  inherited;
end; // destructor ...

procedure tinfoTSVTermino.Save(aNode:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  i: integer;
begin
  if aNode.name = '' then
    aNode.name := nsName(_NameSpaceAlias, 'infoTSVTermino')
  else if pos(colon, aNode.name) = 0 then
    aNode.name := nsName(_NameSpaceAlias, aNode.name);

  if _NameSpaceAlias <> '' then
  begin
    xn := aNode;
    while Assigned(xn.ParentNode) do
      xn := xn.ParentNode;
    xn.attribute['xmlns:' + _NameSpaceAlias] := thisNameSpaceURI;
  end;

end; // procedure save

{ tideTrabSemVinculo }

class function tideTrabSemVinculo._nsURI_;
begin
  result := thisNameSpaceURI;
end; // class function _nsURI_

constructor tideTrabSemVinculo.Create;
begin
  _NamespaceAlias := defNamespaceAlias;
end; // constructor ...

constructor tideTrabSemVinculo.Create(aRoot:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  sn: string;
  i: integer;
  thisURI: string;
begin
  F_NameSpaceAlias := aRoot.NameSpace;
  xn := aRoot.FirstChild;
  while Assigned(xn) do
  begin
    sn := NamePart(xn.name);
    thisURI := xn.namespaceURI;
    if (sn = snideTrabSemVinculo_cpfTrab) then
      cpfTrab :=  xn.text // string
    else if (sn = snideTrabSemVinculo_nisTrab) then
      nisTrab :=  xn.text // string
    else if (sn = snideTrabSemVinculo_codCateg) then
      codCateg := StrToIntDef(xn.text, 0)
    else;
    xn := xn.NextSibling;
  end; // while Assigned(xn) do ...
end; // constructor ...

destructor tideTrabSemVinculo.Destroy;
begin
  inherited;
end; // destructor ...

procedure tideTrabSemVinculo.SetnisTrab(value:string);
begin
  FnisTrab := value;
  FnisTrab_IsSet_ := true;
end;

procedure tideTrabSemVinculo.Save(aNode:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  i: integer;
begin
  if aNode.name = '' then
    aNode.name := nsName(_NameSpaceAlias, 'ideTrabSemVinculo')
  else if pos(colon, aNode.name) = 0 then
    aNode.name := nsName(_NameSpaceAlias, aNode.name);

  if _NameSpaceAlias <> '' then
  begin
    xn := aNode;
    while Assigned(xn.ParentNode) do
      xn := xn.ParentNode;
    xn.attribute['xmlns:' + _NameSpaceAlias] := thisNameSpaceURI;
  end;

  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snideTrabSemVinculo_cpfTrab));
  xn.text := FcpfTrab;
  if nisTrab_IsSet_ then
  begin
    xn := aNode.addChildByName(nsName(_NameSpaceAlias, snideTrabSemVinculo_nisTrab));
    xn.text := FnisTrab;
  end;
  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snideTrabSemVinculo_codCateg));
  xn.text := IntToStr(FcodCateg);
end; // procedure save

{ tevtTSVTermino }

class function tevtTSVTermino._nsURI_;
begin
  result := thisNameSpaceURI;
end; // class function _nsURI_

constructor tevtTSVTermino.Create;
begin
  _NamespaceAlias := defNamespaceAlias;
end; // constructor ...

constructor tevtTSVTermino.Create(aRoot:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  sn: string;
  i: integer;
  thisURI: string;
begin
  F_NameSpaceAlias := aRoot.NameSpace;
  for i:=0 to aRoot.attributecount -1 do
  begin
    sn := NamePart(aRoot.attributeName[i]);
    if sn = anevtTSVTermino_Id then
      Id := aRoot.attribute[i]; // string
    if sn = anevtTSVTermino_versao then
      versao := aRoot.attribute[i]; // string
  end;

  xn := aRoot.FirstChild;
  while Assigned(xn) do
  begin
    sn := NamePart(xn.name);
    thisURI := xn.namespaceURI;
    if (sn = snevtTSVTermino_ideEvento) then
      ideEvento :=  xn.text // tTIdeEveTrab
    else if (sn = snevtTSVTermino_ideEmpregador) then
      ideEmpregador :=  xn.text // tTEmpregador
    else if (sn = snevtTSVTermino_ideTrabSemVinculo)
      and ((thisURI='') or (tideTrabSemVinculo._nsURI_ = thisURI)) then
      FideTrabSemVinculo := tideTrabSemVinculo.Create(xn)
    else if (sn = snevtTSVTermino_infoTSVTermino)
      and ((thisURI='') or (tinfoTSVTermino._nsURI_ = thisURI)) then
      FinfoTSVTermino := tinfoTSVTermino.Create(xn)
    else;
    xn := xn.NextSibling;
  end; // while Assigned(xn) do ...
end; // constructor ...

destructor tevtTSVTermino.Destroy;
begin
  FideTrabSemVinculo.Free;
  FinfoTSVTermino.Free;
  inherited;
end; // destructor ...

procedure tevtTSVTermino.SetId(value:string);
begin
  FId := value;
  FId_IsSet_ := true;
end;

procedure tevtTSVTermino.Setversao(value:string);
begin
  Fversao := value;
  Fversao_IsSet_ := true;
end;

procedure tevtTSVTermino.Save(aNode:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  i: integer;
begin
  if aNode.name = '' then
    aNode.name := nsName(_NameSpaceAlias, 'evtTSVTermino')
  else if pos(colon, aNode.name) = 0 then
    aNode.name := nsName(_NameSpaceAlias, aNode.name);

  if _NameSpaceAlias <> '' then
  begin
    xn := aNode;
    while Assigned(xn.ParentNode) do
      xn := xn.ParentNode;
    xn.attribute['xmlns:' + _NameSpaceAlias] := thisNameSpaceURI;
  end;

  if Id_IsSet_ then
    aNode.attribute[anevtTSVTermino_Id] := FId;
  if versao_IsSet_ then
    aNode.attribute[anevtTSVTermino_versao] := Fversao;

  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snevtTSVTermino_ideEvento));
  xn.text := FideEvento;
  xn := aNode.addChildByName(nsName(_NameSpaceAlias, snevtTSVTermino_ideEmpregador));
  xn.text := FideEmpregador;
  if Assigned(FideTrabSemVinculo) then
  begin
    xn := aNode.addChildByName(snevtTSVTermino_ideTrabSemVinculo);
    FideTrabSemVinculo.Save(xn);
  end;
  if Assigned(FinfoTSVTermino) then
  begin
    xn := aNode.addChildByName(snevtTSVTermino_infoTSVTermino);
    FinfoTSVTermino.Save(xn);
  end;
end; // procedure save

{ teSocial }

class function teSocial._nsURI_;
begin
  result := thisNameSpaceURI;
end; // class function _nsURI_

constructor teSocial.Create;
begin
  _NamespaceAlias := defNamespaceAlias;
end; // constructor ...

constructor teSocial.Create(aRoot:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  sn: string;
  i: integer;
  thisURI: string;
begin
  F_NameSpaceAlias := aRoot.NameSpace;
  xn := aRoot.FirstChild;
  while Assigned(xn) do
  begin
    sn := NamePart(xn.name);
    thisURI := xn.namespaceURI;
    if (sn = sneSocial_evtTSVTermino)
      and ((thisURI='') or (tevtTSVTermino._nsURI_ = thisURI)) then
      FevtTSVTermino := tevtTSVTermino.Create(xn)
    else if (sn = sneSocial_Signature)
      and ((thisURI='') or (tSignature._nsURI_ = thisURI)) then
      FSignature := tSignature.Create(xn)
    else;
    xn := xn.NextSibling;
  end; // while Assigned(xn) do ...
end; // constructor ...

destructor teSocial.Destroy;
begin
  FevtTSVTermino.Free;
  FSignature.Free;
  inherited;
end; // destructor ...

procedure teSocial.Save(aNode:tJanXMLNode2);
var
  xn: tJanXMLNode2;
  i: integer;
begin
  if aNode.name = '' then
    aNode.name := nsName(_NameSpaceAlias, 'eSocial')
  else if pos(colon, aNode.name) = 0 then
    aNode.name := nsName(_NameSpaceAlias, aNode.name);

  if _NameSpaceAlias <> '' then
  begin
    xn := aNode;
    while Assigned(xn.ParentNode) do
      xn := xn.ParentNode;
    xn.attribute['xmlns:' + _NameSpaceAlias] := thisNameSpaceURI;
  end;

  if Assigned(FevtTSVTermino) then
  begin
    xn := aNode.addChildByName(sneSocial_evtTSVTermino);
    FevtTSVTermino.Save(xn);
  end;
  if Assigned(FSignature) then
  begin
    xn := aNode.addChildByName(sneSocial_Signature);
    FSignature.Save(xn);
  end;
end; // procedure save

end.
