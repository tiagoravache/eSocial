{$I ACBr.inc}

unit ACBreSocialUtil;

interface

uses
  Classes,
  ACBrCAPICOM_TLB, ACBrMSXML2_TLB, JwaWinCrypt,
  {$IFDEF FPC}
    LResources, Controls, Graphics, Dialogs,
  {$ELSE}
    StrUtils, Activex,
  {$ENDIF}
    Sysutils;


const
  DSIGNS = 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';
var
  CertStore: IStore3;
  CertStoreMem: IStore3;
  PrivateKey: IPrivateKey;
  Certs: ICertificates2;
  Cert: ICertificate2;
  NumCertCarregado: String;


type
  EACBreSocialException = class(Exception);
  
  eSocialUtil = class
   private
   protected

   public
     class function PosEx(const SubStr, S: AnsiString; Offset: Cardinal = 1): Integer;
     class function PosLast(const SubStr, S: AnsiString ): Integer;
     class function PadE(const AString : string; const nLen : Integer; const Caracter : Char = ' ') : String;
     class function PadD(const AString : string; const nLen : Integer; const Caracter : Char = ' ') : String;
     class function padC(const AString : string; const nLen : Integer; const Caracter : Char = ' ') : String;
     class function SeSenao(ACondicao: Boolean; ATrue, AFalse: Variant) : Variant;
     class function FormatFloat(AValue: Extended; const AFormat: string = ',0.00'): String;
     class function Poem_Zeros(const Texto : String; const Tamanho : Integer) : String;overload;
     class function Poem_Zeros(const Valor : Integer; const Tamanho : Integer) : String;overload;
     class function LasString(AString: String): String;
     class function EstaVazio(const AValue: String): Boolean;overload;
     class procedure EstaVazio(const AValue, AMensagem: String);overload;
     class function NaoEstaVazio(AValue: String): Boolean;
     class function EstaZerado(AValue: Double): Boolean;overload;
     class function EstaZerado(AValue: Integer): Boolean;overload;
     class procedure EstaZerado(AValue: Integer; AMensagem: String);overload;
     class function NaoEstaZerado(AValue: Double): Boolean;overload;
     class function NaoEstaZerado(AValue: Integer): Boolean;overload;
     class function LimpaNumero(AValue: String): String;
     class function TrataString(const AValue: String): String;overload;
     class function TrataString(const AValue: String; const ATamanho: Integer): String;overload;
     class function CortaD(const AString: string; const ATamanho: Integer): String;
     class function CortaE(const AString: string; const ATamanho: Integer): String;
     class function FormatDate(const AString: string): String;overload;
     class function FormatDate(const AData: TDateTime): String;overload;
     class function FormatDateTime(const AString: string): string;
     class function StringToDate(const AString: string): TDateTime;
     class function StringToTime(const AString: string): TDateTime;
     class function TamanhoIgual(const AValue: String; const ATamanho: Integer): Boolean;overload;
     class procedure TamanhoIgual(const AValue: String; const ATamanho: Integer; AMensagem: String);overload;
     class function TamanhoIgual(const AValue: Integer; const ATamanho: Integer): Boolean;overload;
     class procedure TamanhoIgual(const AValue: Integer; const ATamanho: Integer; AMensagem: String);overload;
     class function TamanhoMenor(const AValue: String; const ATamanho: Integer): Boolean;
     class function FormatarCPF(AValue : String ): String;
     class function FormatarCNPJ(AValue : String ): String;
     class function FormatarIE(AIE, AUF: String): String;
     class function FormatarCEP(AValue : String ): String;
     class function FormatarFone(AValue : String ): String;
     class function FormatarChaveAcesso(AValue : String ): String;
     class function StringToFloat(AValue : String ) : Double;
     class function StringToFloatDef(const AValue: String; const DefaultValue: Double): Double;
     class procedure ConfAmbiente;
     class function CollateBr(Str: String): String;
     class function UpperCase2(Str: String): String;
     class function ValidaUFCidade(const UF, Cidade: Integer): Boolean; overload;
     class procedure ValidaUFCidade(const UF, Cidade: Integer; const AMensagem: string); overload;
     class function FormatarCNPJCPF(AValue : String ): String;

     class function Valida(const AXML: AnsiString; var AMsg: AnsiString; const APathSchemas: string = '';cNomeSchema: string=''): Boolean;
     class function ValidaAssinatura(const AXML: AnsiString;  var AMsg: AnsiString): Boolean;
     class function Assinar(const AXML: AnsiString; Certificado: ICertificate2; out AXMLAssinado, FMensagem: AnsiString): Boolean;


   end;

implementation

uses
 ComObj, IniFiles, Variants, DateUtils, ACBrUtil, ACBrConsts;

class function eSocialUtil.EstaVazio(const AValue: String): Boolean;
begin
  Result := (Trim(AValue) = '');
end;

class function eSocialUtil.CortaD(const AString: string;
  const ATamanho: Integer): String;
begin
  Result := copy(AString,1,ATamanho);
end;

class function eSocialUtil.CortaE(const AString: string;
  const ATamanho: Integer): String;
begin
  Result := AString;
  if Length(AString) > ATamanho then
    Result := copy(AString, Length(AString)-ATamanho+1, length(AString));
end;

class procedure eSocialUtil.EstaVazio(const AValue, AMensagem: String);
begin
  if EstaVazio(AValue) then
    raise EACBreSocialException.Create(AMensagem);
end;

class function eSocialUtil.EstaZerado(AValue: Double): Boolean;
begin
  Result := (AValue = 0);
end;

class function eSocialUtil.EstaZerado(AValue: Integer): Boolean;
begin
  Result := (AValue = 0);
end;

class procedure eSocialUtil.EstaZerado(AValue: Integer; AMensagem: String);
begin
  if EstaZerado(AValue) then
    raise EACBreSocialException.Create(AMensagem);
end;

class function eSocialUtil.FormatarCEP(AValue: String): String;
begin
  AValue := Poem_Zeros(LimpaNumero(AValue), 8);

  if StrToInt(AValue) = 0 then
    Result := Space(9)
  else
    Result := copy(AValue, 1, 5) + '-' + copy(AValue, 6, 3);
end;

class function eSocialUtil.FormatarCNPJ(AValue: String): String;
begin
  if Length(AValue) = 0 then
     Result := AValue
  else
  begin
    AValue := LimpaNumero(AValue);
    Result := copy(AValue,1,2) + '.' + copy(AValue,3,3) + '.' +
              copy(AValue,6,3) + '/' + copy(AValue,9,4) + '-' + copy(AValue,13,2) ;
  end;
end;

class function eSocialUtil.FormatarCPF(AValue: String): String;
begin
  if Length(AValue) = 0 then
     Result := AValue
  else
  begin
    AValue := LimpaNumero(AValue);
    Result := copy(AValue,1,3) + '.' + copy(AValue,4 ,3) + '.' +
              copy(AValue,7,3) + '-' + copy(AValue,10,2) ;
  end;
end;

class function eSocialUtil.FormatarFone(AValue: String): String;
var
  lTemp: string;
begin
  // Alterado por Italo em 21/01/2014
  AValue := LimpaNumero(AValue);

  if Length(AValue) = 0 then
     Result := AValue
  else
  begin
    AValue := IntToStr(StrToInt64Def(AValue, 0));
    Result := AValue;
    lTemp  := '';
  end;

  if NaoEstaVazio(AValue) then
  begin
    if copy(AValue, 1, 3) = '800' then
      Result := '0' + copy(AValue, 1, 3) + '-' + copy(AValue, 4, 3) + '-' + copy(AValue, 7, 4)
    else
    case length(AValue) of
      8: Result := '(  )' + copy(AValue, 1, 4) + '-' + copy(AValue, 5, 4);
      9:
      begin
        // Celulares do Municipio de São Paulo tem 9 Digitos e o primeiro é 9
        if copy(AValue, 1, 1) = '9' then
          Result := '(  )' + copy(AValue, 1, 5) + '-' + copy(AValue, 6, 4)
        else
        begin
          ltemp := '0' + copy(AValue, 1, 1);
          Result := '(' + lTemp + ')' + copy(AValue, 2, 4) + '-' + copy(AValue, 6, 4);
        end;
      end;
      12:
      begin // Exemplo: 551133220000
        ltemp := copy(AValue, 1, 4);
        Result := '(' + lTemp + ')' + copy(AValue, 5, 4) + '-' + copy(AValue, 9, 4);
      end;
      13:
      begin // Exemplo: 5511999220000
        ltemp := copy(AValue, 1, 4);
        Result := '(' + lTemp + ')' + copy(AValue, 5, 5) + '-' + copy(AValue, 10, 4);
      end;
    else
    begin
      AValue := Poem_Zeros(AValue, 12);
      if (copy(AValue, 1, 1) = '0') and (copy(AValue, 2, 1) = '0') then
      begin
        ltemp := copy(AValue, 3, 2);
        Result := '(' + lTemp + ')' + copy(AValue, 5, 4) + '-' + copy(AValue, 9, 4);
      end
      else
      begin
        ltemp := copy(AValue, 2, 2);
        Result := '(' + lTemp + ')' + copy(AValue, 4, 5) + '-' + copy(AValue, 9, 4);
      end;
    end;
    end;
  end;
end;

class function eSocialUtil.FormatarIE(AIE, AUF: String): String;
Var
  Mascara : String ;
  C : Char ;
  I, J, LenDoc, LenMas : Integer;
Begin
  Result := AIE ;
  if UpperCase( Trim(AIE) ) = 'ISENTO' then
    exit ;

  AUF := UpperCase( AUF ) ;

  LenDoc  := Length( AIE ) ;
  Mascara := StringOfChar('*', LenDoc) ;

  IF AUF = 'AC' Then Mascara := '**.***.***/***-**';
  IF AUF = 'AL' Then Mascara := '*********';
  IF AUF = 'AP' Then Mascara := '*********';
  IF AUF = 'AM' Then Mascara := '**.***.***-*';
  IF AUF = 'BA' Then Mascara := '*******-**';
  IF AUF = 'CE' Then Mascara := '********-*';
  IF AUF = 'DF' Then Mascara := '***********-**';
  IF AUF = 'ES' Then Mascara := '*********';
  IF AUF = 'GO' Then Mascara := '**.***.***-*';
  IF AUF = 'MA' Then Mascara := '*********';
  IF AUF = 'MT' Then Mascara := '**********-*';
  IF AUF = 'MS' Then Mascara := '**.***.***-*';
  IF AUF = 'MG' Then Mascara := '***.***.***/****';
  IF AUF = 'PA' Then Mascara := '**-******-*';
  IF AUF = 'PB' Then Mascara := '********-*';
  IF AUF = 'PR' Then Mascara := '***.*****-**';
  IF AUF = 'PE' Then Mascara := IfThen((LenDoc>9),'**.*.***.*******-*','*******-**');
  IF AUF = 'PI' Then Mascara := '*********';
  IF AUF = 'RJ' Then Mascara := '**.***.**-*';
  IF AUF = 'RN' Then Mascara := IfThen((LenDoc>9),'**.*.***.***-*','**.***.***-*');
  IF AUF = 'RS' Then Mascara := '***/*******';
  IF AUF = 'RO' Then Mascara := IfThen((LenDoc>13),'*************-*','***.*****-*');
  IF AUF = 'RR' Then Mascara := '********-*';
  IF AUF = 'SC' Then Mascara := '***.***.***';
  IF AUF = 'SP' Then Mascara := ifthen((LenDoc>1) and (AIE[1]='P'),'*-********.*/***', '***.***.***.***');
  IF AUF = 'SE' Then Mascara := '**.***.***-*';
  IF AUF = 'TO' Then Mascara := IfThen((LenDoc=11),'**.**.******-*','**.***.***-*');

  Result := '';
  LenMas := Length( Mascara ) ;
  J := LenMas ;

  For I := LenMas downto 1 do
  begin
    C := Mascara[I] ;

    if C = '*' then
    begin
      if J <= ( LenMas - LenDoc ) then
        C := '0'
      else
        C := AIE[( J - ( LenMas - LenDoc ) )] ;

      Dec( J ) ;
    end;
    Result := C + Result;
  End;
  Result := Trim( Result );
end;

class function eSocialUtil.FormatDate(const AString: string): String;
var
  vTemp: TDateTime;
  {$IFDEF VER140} //D6
  {$ELSE}
    vFormatSettings : TFormatSettings;
  {$ENDIF}
begin
  try
    {$IFDEF VER140} //D6
      DateSeparator := '/';
      ShortDateFormat := 'dd/mm/yyyy';
    {$ELSE}
      vFormatSettings.DateSeparator   := '-';
      vFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    //vTemp := StrToDate(AString, FFormato);
    {$ENDIF}

    vTemp := StrToDate(AString);
    if vTemp = 0 then
      Result := ''
    else
      Result := DateToStr(vTemp);
  except
    Result := '';
  end;
end;

class function eSocialUtil.FormatDate(const AData: TDateTime): String;
var
  vTemp: String;
  {$IFDEF VER140} //delphi6
  {$ELSE}
    FFormato : TFormatSettings;
  {$ENDIF}
begin
  try
    {$IFDEF VER140} //delphi6
      DateSeparator := '/';
      ShortDateFormat := 'dd/mm/yyyy';
    {$ELSE}
      FFormato.DateSeparator   := '-';
      FFormato.ShortDateFormat := 'yyyy-mm-dd';
    {$ENDIF}

   	vTemp := DateToStr(AData);
    if AData = 0 then
      Result := ''
    else
      Result := vTemp;
  except
    Result := '';
  end;
end;

class function eSocialUtil.FormatDateTime(const AString: string): string;
var
  vTemp : TDateTime;
  {$IFDEF VER140} //delphi6
  {$ELSE}
    vFormatSettings: TFormatSettings;
  {$ENDIF}
begin
  try
    {$IFDEF VER140} //delphi6
      DateSeparator   := '/';
      ShortDateFormat := 'dd/mm/yyyy';
      ShortTimeFormat := 'hh:nn:ss';
    {$ELSE}
      vFormatSettings.DateSeparator   := '-';
      vFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
      //vTemp := StrToDate(AString, FFormato);
    {$ENDIF}

    vTemp := StrToDateTime(AString);
    if vTemp = 0 then
      Result := ''
    else
      Result := DateTimeToStr(vTemp);
  except
    Result := '';
  end;
end;

class function eSocialUtil.FormatFloat(AValue: Extended;
  const AFormat: string): String;
  {$IFDEF VER140} //D6
  {$ELSE}
    var
      vFormatSettings: TFormatSettings;
  {$ENDIF}
begin
  {$IFDEF VER140} //D6
    DecimalSeparator  := ',';
    ThousandSeparator := '.';
    Result := SysUtils.FormatFloat(AFormat, AValue);
  {$ELSE}
    vFormatSettings.DecimalSeparator  := ',';
    vFormatSettings.ThousandSeparator := '.';
    Result := SysUtils.FormatFloat(AFormat, AValue, vFormatSettings);
  {$ENDIF}
end;

class function eSocialUtil.LasString(AString: String): String;
begin
  Result := Copy(AString, Length(AString), Length(AString));
end;

class function eSocialUtil.LimpaNumero(AValue: String): String;
var
  A : Integer ;
begin
  Result := '' ;
  For A := 1 to length(AValue) do
  begin
    {$IFDEF DELPHI12_UP}
    if CharInSet(AValue[A], ['0'..'9']) then
    {$ELSE}
    if (AValue[A] in ['0'..'9']) then
    {$ENDIF}
       Result := Result + AValue[A];
  end ;
end;

class function eSocialUtil.NaoEstaVazio(AValue: String): Boolean;
begin
  Result := not(EstaVazio(AValue));
end;

class function eSocialUtil.NaoEstaZerado(AValue: Double): Boolean;
begin
  Result := not(EstaZerado(AValue));
end;

class function eSocialUtil.NaoEstaZerado(AValue: Integer): Boolean;
begin
  Result := not(EstaZerado(AValue));
end;

class function eSocialUtil.padC(const AString: string; const nLen: Integer;
  const Caracter: Char): String;
Var nCharLeft : Integer;
    D : Double;
begin
  Result    := copy(AString,1,nLen);
  D         := (nLen - Length( Result )) / 2;
  nCharLeft := Trunc( D );
  Result    := PadE( StringOfChar(Caracter, nCharLeft)+Result, nLen, Caracter);
end;

class function eSocialUtil.PadD(const AString: string; const nLen: Integer;
  const Caracter: Char): String;
begin
  Result := copy(AString,1,nLen);
  Result := StringOfChar(Caracter, (nLen - Length(Result))) + Result;
end;

class function eSocialUtil.PadE(const AString: string; const nLen: Integer;
  const Caracter: Char): String;
begin
  Result := copy(AString, 1, nLen);
  Result := Result + StringOfChar(Caracter, (nLen - Length(Result)));
end;

class function eSocialUtil.Poem_Zeros(const Texto: String;
  const Tamanho: Integer): String;
begin
  Result := PadD(Trim(Texto),Tamanho,'0');
end;

class function eSocialUtil.Poem_Zeros(const Valor, Tamanho: Integer): String;
begin
  Result := PadD(IntToStr(Valor), Tamanho, '0');
end;

class function eSocialUtil.PosEx(const SubStr, S: AnsiString; Offset: Cardinal = 1): Integer;
var
  I, X           : Integer;
  Len, LenSubStr : Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;

class function eSocialUtil.PosLast(const SubStr, S: AnsiString): Integer;
var
  P : Integer;
begin
  Result := 0;
  P := Pos(SubStr, S);

  while P <> 0 do
  begin
    Result := P;
    P := PosEx(SubStr, S, P + 1);
  end;
end;

class function eSocialUtil.SeSenao(ACondicao: Boolean; ATrue,
  AFalse: Variant): Variant;
begin
  Result := AFalse;
  if ACondicao then
    Result := ATrue;
end;

class function eSocialUtil.StringToDate(const AString: string): TDateTime;
begin
  if (AString = '0') or (AString = '') then
     Result := 0
  else
     Result := StrToDate(AString);
end;

class function eSocialUtil.StringToFloat(AValue: String): Double;
begin
  AValue := Trim( AValue );

  if DecimalSeparator <> '.' then
    AValue := StringReplace(AValue,'.',DecimalSeparator,[rfReplaceAll]);

  if DecimalSeparator <> ',' then
    AValue := StringReplace(AValue,',',DecimalSeparator,[rfReplaceAll]);

  Result := StrToFloat(AValue);
end;

class function eSocialUtil.StringToFloatDef(const AValue: String;
  const DefaultValue: Double): Double;
begin
  try
    Result := StringToFloat( AValue ) ;
  except
    Result := DefaultValue ;
  end ;
end;

class function eSocialUtil.StringToTime(const AString: string): TDateTime;
begin
  if (AString = '0') or (AString = '') then
    Result := 0
  else
    Result := StrToTime(AString);
end;

class function eSocialUtil.TrataString(const AValue: String): String;
var
  A : Integer ;
begin
  Result := '' ;
  For A := 1 to length(AValue) do
  begin
    case Ord(AValue[A]) of
      60  : Result := Result + '&lt;';  //<
      62  : Result := Result + '&gt;';  //>
      38  : Result := Result + '&amp;'; //&
      34  : Result := Result + '&quot;';//"
      39  : Result := Result + '&#39;'; //'
      32  : begin          // Retira espaços duplos
              if ( Ord(AValue[Pred(A)]) <> 32 ) then
                 Result := Result + ' ';
            end;
      193 : Result := Result + 'A';//Á
      224 : Result := Result + 'a';//à
      226 : Result := Result + 'a';//â
      234 : Result := Result + 'e';//ê
      244 : Result := Result + 'o';//ô
      251 : Result := Result + 'u';//û
      227 : Result := Result + 'a';//ã
      245 : Result := Result + 'o';//õ
      225 : Result := Result + 'a';//á
      233 : Result := Result + 'e';//é
      237 : Result := Result + 'i';//í
      243 : Result := Result + 'o';//ó
      250 : Result := Result + 'u';//ú
      231 : Result := Result + 'c';//ç
      252 : Result := Result + 'u';//ü
      192 : Result := Result + 'A';//À
      194 : Result := Result + 'A';//Â
      202 : Result := Result + 'E';//Ê
      212 : Result := Result + 'O';//Ô
      219 : Result := Result + 'U';//Û
      195 : Result := Result + 'A';//Ã
      213 : Result := Result + 'O';//Õ
      201 : Result := Result + 'E';//É
      205 : Result := Result + 'I';//Í
      211 : Result := Result + 'O';//Ó
      218 : Result := Result + 'U';//Ú
      199 : Result := Result + 'C';//Ç
      220 : Result := Result + 'U';//Ü
    else
      Result := Result + AValue[A];
    end;
  end;
  Result := Trim(Result);
end;

class function eSocialUtil.TamanhoIgual(const AValue: String;
  const ATamanho: Integer): Boolean;
begin
  Result := (Length(AValue)= ATamanho);
end;

class procedure eSocialUtil.TamanhoIgual(const AValue: String;
  const ATamanho: Integer; AMensagem: String);
begin
  if not(TamanhoIgual(AValue, ATamanho)) then
    raise EACBreSocialException.Create(AMensagem);
end;

class function eSocialUtil.TamanhoIgual(const AValue, ATamanho: Integer): Boolean;
begin
  Result := (Length(IntToStr(AValue))= ATamanho);
end;

class procedure eSocialUtil.TamanhoIgual(const AValue, ATamanho: Integer;
  AMensagem: String);
begin
  if not(TamanhoIgual(AValue, ATamanho)) then
    raise EACBreSocialException.Create(AMensagem);
end;

class function eSocialUtil.TamanhoMenor(const AValue: String;
  const ATamanho: Integer): Boolean;
begin
  Result := (Length(AValue) < ATamanho);
end;

class function eSocialUtil.TrataString(const AValue: String;
  const ATamanho: Integer): String;
begin
  Result := TrataString(CortaD(AValue, ATamanho));
end;

class procedure eSocialUtil.ConfAmbiente;
  {$IFDEF VER140} //delphi6
  {$ELSE}
    var
      vFormatSettings: TFormatSettings;
  {$ENDIF}
begin
  {$IFDEF VER140} //delphi6
    DecimalSeparator := ',';
  {$ELSE}
    vFormatSettings.DecimalSeparator := ',';
  {$ENDIF}
end;

class function eSocialUtil.CollateBr(Str: String): String;
var
   i, wTamanho: integer;
   wChar, wResultado: Char;
begin
  result   := '';
  wtamanho := Length(Str);
  i        := 1;
  while (i <= wtamanho) do
  begin
    wChar := Str[i];
    case wChar of
      'á', 'â', 'ã', 'à', 'ä', 'å',
      'Á', 'Â', 'Ã', 'À', 'Ä', 'Å': wResultado := 'A';
      'é', 'ê', 'è', 'ë',
      'É', 'Ê', 'È', 'Ë': wResultado := 'E';
      'í', 'î', 'ì', 'ï',
      'Í', 'Î', 'Ì', 'Ï': wResultado := 'I';
      'ó', 'ô', 'õ', 'ò', 'ö',
      'Ó', 'Ô', 'Õ', 'Ò', 'Ö': wResultado := 'O';
      'ú', 'û', 'ù', 'ü',
      'Ú', 'Û', 'Ù', 'Ü': wResultado := 'U';
      'ç', 'Ç': wResultado := 'C';
      'ñ', 'Ñ': wResultado := 'N';
      'ý', 'ÿ', 'Ý', 'Y': wResultado := 'Y';
    else
      wResultado := wChar;
    end;
    i      := i + 1;
    Result := Result + wResultado;
  end;
  Result := UpperCase(Result);
end;

class function eSocialUtil.UpperCase2(Str: String): String;
var
   i, wTamanho: integer;
   wChar, wResultado: Char;
begin
  result   := '';
  wtamanho := Length(Str);
  i        := 1;
  while (i <= wtamanho) do
  begin
    wChar := Str[i];
    case wChar of
      'á','Á': wResultado := 'Á';
      'ã','Ã': wResultado := 'Ã';
      'à','À': wResultado := 'À';
      'â','Â': wResultado := 'Â';
      'ä','Ä': wResultado := 'Ä';
      'å','Å': wResultado := 'Å';
      'é','É': wResultado := 'É';
      'è','È': wResultado := 'È';
      'ê','Ê': wResultado := 'Ê';
      'ë','Ë': wResultado := 'Ë';
      'í','Í': wResultado := 'Í';
      'ì','Ì': wResultado := 'Ì';
      'î','Î': wResultado := 'Î';
      'ï','Ï': wResultado := 'Ï';
      'ó','Ó': wResultado := 'Ó';
      'õ','Õ': wResultado := 'Õ';
      'ò','Ò': wResultado := 'Ò';
      'ô','Ô': wResultado := 'Ô';
      'ö','Ö': wResultado := 'Ö';
      'ú','Ú': wResultado := 'Ú';
      'ù','Ù': wResultado := 'Ù';
      'û','Û': wResultado := 'Û';
      'ü','Ü': wResultado := 'Ü';
      'ç', 'Ç': wResultado := 'Ç';
      'ñ', 'Ñ': wResultado := 'Ñ';
      'ý', 'ÿ', 'Ý', 'Y': wResultado := 'Y';
    else
      wResultado := wChar;
    end;
    i      := i + 1;
    Result := Result + wResultado;
  end;
  Result := UpperCase(Result);
end;

class function eSocialUtil.ValidaUFCidade(const UF, Cidade: Integer): Boolean;
begin
  Result := (Copy(IntToStr(UF), 1, 2) = Copy(IntToStr(Cidade), 1, 2));
end;

class procedure eSocialUtil.ValidaUFCidade(const UF, Cidade: Integer;
  const AMensagem: string);
begin
  if not (ValidaUFCidade(UF, Cidade)) then
    raise EACBreSocialException.Create(AMensagem);
end;

class function eSocialUtil.FormatarChaveAcesso(AValue: String): String;
begin
  //
end;

class function eSocialUtil.FormatarCNPJCPF(AValue: String): String;
begin
  AValue := OnlyNumber(AValue);
  if Length(AValue) = 0 then
     Result := AValue
  else
  begin
    if Length(AValue) = 14 then
     Result := FormatarCNPJ(AValue)
    else
     Result := FormatarCPF(AValue);
  end;
end;

function AssinarMSXML(XML: AnsiString; Certificado: ICertificate2; out XMLAssinado: AnsiString): Boolean;
var
  I, J, PosIni, PosFim: Integer;
  URI: string;
  xmlHeaderAntes, xmlHeaderDepois: AnsiString;
  xmldoc: IXMLDOMDocument3;
  xmldsig: IXMLDigitalSignature;
  dsigKey: IXMLDSigKey;
  signedKey: IXMLDSigKey;
begin
  Result := False;
  CoInitialize(nil);
  try
    if Pos('<Signature', XML) <= 0 then
    begin
      I := eSocialUtil.PosEx('Id=', XML, 6);
      if I = 0 then
        raise Exception.Create('Não encontrei inicio do URI: Id=');
      I := eSocialUtil.PosEx('"', XML, I + 2);
      if I = 0 then
        raise Exception.Create('Não encontrei inicio do URI: aspas inicial');
      J := eSocialUtil.PosEx('"', XML, I + 1);
      if J = 0 then
        raise Exception.Create('Não encontrei inicio do URI: aspas final');

      URI := copy(XML, I + 1, J - I - 1);

      XML := copy(XML,1,pos('</eSocial>',XML)-1);

      XML := XML + '<Signature xmlns="http://www.w3.org/2000/09/xmldsig#"><SignedInfo><CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" /><SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />';
      XML := XML + '<Reference URI="">';
      XML := XML + '<Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" /><Transform Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" /></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />';
      XML := XML + '<DigestValue></DigestValue></Reference></SignedInfo><SignatureValue></SignatureValue><KeyInfo></KeyInfo></Signature>';

      XML := XML + '</eSocial>';
    end;

    // Lendo Header antes de assinar //
    xmlHeaderAntes := '';
    I := pos('?>', XML);
    if I > 0 then
      xmlHeaderAntes := copy(XML, 1, I + 1);

    xmldoc := CoDOMDocument50.Create;
    xmldoc.async := False;
    xmldoc.validateOnParse    := False;
    xmldoc.preserveWhiteSpace := True;

    xmldsig := CoMXDigitalSignature50.Create;

    if (not xmldoc.loadXML(XML)) then
      raise Exception.Create('Não foi possível carregar o arquivo: ' + XML);

    xmldoc.setProperty('SelectionNamespaces', DSIGNS);
    xmldsig.signature := xmldoc.selectSingleNode('.//ds:Signature');

    if (xmldsig.signature = nil) then
      raise Exception.Create('Falha ao setar assinatura.');

    if (xmldsig.signature = nil) then
      raise Exception.Create('É preciso carregar o template antes de assinar.');

    if NumCertCarregado <> Certificado.SerialNumber then
      CertStoreMem := nil;

    if CertStoreMem = nil then
    begin
      CertStore := CoStore.Create;
      CertStore.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_READ_ONLY);

      CertStoreMem := CoStore.Create;
      CertStoreMem.Open(CAPICOM_MEMORY_STORE, 'Memoria', CAPICOM_STORE_OPEN_READ_ONLY);

      Certs := CertStore.Certificates as ICertificates2;
      for i := 1 to Certs.Count do
      begin
        Cert := IInterface(Certs.Item[i]) as ICertificate2;
        if Cert.SerialNumber = Certificado.SerialNumber then
        begin
          CertStoreMem.Add(Cert);
          NumCertCarregado := Certificado.SerialNumber;
        end;
      end;
    end;

    OleCheck(IDispatch(Certificado.PrivateKey).QueryInterface(IPrivateKey, PrivateKey));
    xmldsig.store := CertStoreMem;

    dsigKey := xmldsig.createKeyFromCSP(PrivateKey.ProviderType, PrivateKey.ProviderName, PrivateKey.ContainerName, 0);
    if (dsigKey = nil) then
      raise Exception.Create('Erro ao criar a chave do CSP.');

    signedKey := xmldsig.sign(dsigKey, $00000002);
    if (signedKey <> nil) then
    begin
      XMLAssinado := xmldoc.xml;
      XMLAssinado := StringReplace(XMLAssinado, #10, '', [rfReplaceAll]);
      XMLAssinado := StringReplace(XMLAssinado, #13, '', [rfReplaceAll]);
      PosIni      := Pos('<SignatureValue>', XMLAssinado) + length('<SignatureValue>');
      XMLAssinado := copy(XMLAssinado, 1, PosIni - 1) + StringReplace(copy(XMLAssinado, PosIni, length(XMLAssinado)), ' ', '', [rfReplaceAll]);
      PosIni      := Pos('<X509Certificate>', XMLAssinado) - 1;
      PosFim      := eSocialUtil.PosLast('<X509Certificate>', XMLAssinado);

      XMLAssinado := copy(XMLAssinado, 1, PosIni) + copy(XMLAssinado, PosFim, length(XMLAssinado));
    end
    else
      raise Exception.Create('Assinatura Falhou.');

    if xmlHeaderAntes <> '' then
    begin
      I := pos('?>', XMLAssinado);
      if I > 0 then
      begin
        xmlHeaderDepois := copy(XMLAssinado, 1, I + 1);
        if xmlHeaderAntes <> xmlHeaderDepois then
          XMLAssinado := StuffString(XMLAssinado, 1, length(xmlHeaderDepois), xmlHeaderAntes);
      end
      else
        XMLAssinado := xmlHeaderAntes + XMLAssinado;
    end;

   dsigKey   := nil;
   signedKey := nil;
   xmldoc    := nil;
   xmldsig   := nil;

   Result := True;
  finally
   CoUninitialize;
  end;
end;

class function eSocialUtil.Assinar(const AXML: AnsiString;
  Certificado: ICertificate2; out AXMLAssinado, FMensagem: AnsiString): Boolean;
begin
  Result := AssinarMSXML(AXML, Certificado, AXMLAssinado);
end;

function ValidaMSXML(XML: AnsiString; out Msg: AnsiString;
 const APathSchemas: string = '';cNomeSchema: string=''): Boolean;
var
  DOMDocument: IXMLDOMDocument2;
  ParseError: IXMLDOMParseError;
  Schema: XMLSchemaCache;
  Tipo, I: Integer;
  schema_filename: String;
begin
  Result := False;
  CoInitialize(nil);
  try
    DOMDocument                  := CoDOMDocument50.Create;
    DOMDocument.async            := False;
    DOMDocument.resolveExternals := False;
    DOMDocument.validateOnParse  := True;
    DOMDocument.loadXML(XML);

    Schema := CoXMLSchemaCache50.Create;

    if not DirectoryExists(APathSchemas) then
      raise Exception.Create('Diretório de Schemas não encontrado'+sLineBreak+ APathSchemas);

    schema_filename := PathWithDelim(APathSchemas) + cNomeSchema;

    if not FilesExists(schema_filename) then
       raise Exception.Create('Arquivo ' + schema_filename + ' não encontrado');

    //Ver o caminho futuramente do esocial
    //Schema.add('http://www.fazenda.pr.gov.br/sefaws', schema_filename);

    DOMDocument.schemas := Schema;
    ParseError          := DOMDocument.validate;
    Result              := (ParseError.errorCode = 0);
    Msg                 := ParseError.reason;
    DOMDocument         := nil;
    ParseError          := nil;
    Schema              := nil;
  finally
    CoUninitialize;
  end;
end;

class function eSocialUtil.Valida(const AXML: AnsiString; var AMsg: AnsiString;
  const APathSchemas: string='';cNomeSchema: string=''): Boolean;
begin
  Result := ValidaMSXML(AXML, AMsg, APathSchemas, cNomeSchema)
end;

function ValidaAssinaturaMSXML(XML: AnsiString; out Msg: AnsiString): Boolean;
var
  xmldoc: IXMLDOMDocument3;
  xmldsig: IXMLDigitalSignature;
  pKeyInfo: IXMLDOMNode;
  pKey, pKeyOut: IXMLDSigKey;
begin
  xmldoc  := CoDOMDocument50.Create;
  xmldsig := CoMXDigitalSignature50.Create;

  xmldoc.async              := False;
  xmldoc.validateOnParse    := False;
  xmldoc.preserveWhiteSpace := True;

  if (not xmldoc.loadXML(XML)) then
    raise Exception.Create('Não foi possível carregar o arquivo: '+XML);

  try
    xmldoc.setProperty('SelectionNamespaces', DSIGNS);
    xmldsig.signature := xmldoc.selectSingleNode('.//ds:Signature');

    if (xmldsig.signature = nil) then
      raise Exception.Create('Não foi possível carregar o ler a assinatura: '+XML);

    pKeyInfo := xmldoc.selectSingleNode('.//ds:KeyInfo/ds:X509Data');

    pKey := xmldsig.createKeyFromNode(pKeyInfo);

    try
      pKeyOut := xmldsig.verify(pKey);
    except
      on E: Exception do
        Msg := 'Erro ao verificar assinatura do arquivo: '+ E.Message;
    end;
  finally
    Result := (pKeyOut <> nil);

    pKeyOut  := nil;
    pKey     := nil;
    pKeyInfo := nil;
    xmldsig  := nil;
    xmldoc   := nil;
  end;
end;

class function eSocialUtil.ValidaAssinatura(const AXML: AnsiString;
  var AMsg: AnsiString): Boolean;
begin
  Result := ValidaAssinaturaMSXML(AXML,AMsg);
end;


end.
