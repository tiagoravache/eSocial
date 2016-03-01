program Project2;

uses
  Forms,
  Unit2 in 'C:\projetos\Estudos\webservices\eSocialTestes\Unit2.pas' {Form2},
  wsEnviarLoteEventos in 'wsEnviarLoteEventos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
