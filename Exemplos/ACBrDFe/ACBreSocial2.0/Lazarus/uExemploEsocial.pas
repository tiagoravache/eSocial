unit uExemploEsocial;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ACBreSocial, eSocial_Conversao;

type

  { TFExemploEsocial }

  TFExemploEsocial = class(TForm)
    ACBreSocial1: TACBreSocial;
    btnGerar: TButton;
    cbAviso: TComboBox;
    cbS1000: TCheckBox;
    cbS1005: TCheckBox;
    cbS1010: TCheckBox;
    cbS1020: TCheckBox;
    cbS1030: TCheckBox;
    cbS1040: TCheckBox;
    cbS1050: TCheckBox;
    cbS1060: TCheckBox;
    cbS1070: TCheckBox;
    cbS1080: TCheckBox;
    cbS1200: TCheckBox;
    cbS1202: TCheckBox;
    cbS1210: TCheckBox;
    cbS1220: TCheckBox;
    cbS1250: TCheckBox;
    cbS1260: TCheckBox;
    cbS1270: TCheckBox;
    cbS1280: TCheckBox;
    cbS1298: TCheckBox;
    cbS1299: TCheckBox;
    cbS1300: TCheckBox;
    cbS2100: TCheckBox;
    cbS2190: TCheckBox;
    cbS2200: TCheckBox;
    cbS2205: TCheckBox;
    cbS2206: TCheckBox;
    cbS2210: TCheckBox;
    cbS2220: TCheckBox;
    cbS2230: TCheckBox;
    cbS2240: TCheckBox;
    cbS2241: TCheckBox;
    cbS2250: TCheckBox;
    cbS2298: TCheckBox;
    cbS2299: TCheckBox;
    cbS2300: TCheckBox;
    cbS2305: TCheckBox;
    cbS2399: TCheckBox;
    cbS3000: TCheckBox;
    cbS4000: TCheckBox;
    cbS4999: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    procedure btnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
    procedure GerareSocial1000;
  public
    { public declarations }
  end;

var
  FExemploEsocial: TFExemploEsocial;

implementation

{$R *.lfm}

{ TFExemploEsocial }

procedure TFExemploEsocial.GerareSocial1000;
var
  i: integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Iniciais.S1000.Add do
    begin
      evtInfoEmpregador.id := '1';
      //      evtInfoEmpregador.Versao := '2.0';

      evtInfoEmpregador.IdeEvento.TpAmb := TpTpAmb(0);
      evtInfoEmpregador.IdeEvento.ProcEmi := TpProcEmi(0);
      evtInfoEmpregador.IdeEvento.VerProc := '1.0';

      evtInfoEmpregador.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtInfoEmpregador.IdeEmpregador.NrInsc := '0123456789';

      evtInfoEmpregador.ModoLancamento := TModoLancamento(i);
      evtInfoEmpregador.InfoEmpregador.IdePeriodo.IniValid := '2015-05';
      evtInfoEmpregador.InfoEmpregador.IdePeriodo.FimValid := '2099-12';

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.NmRazao := 'Empresa Teste';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.ClassTrib := '01';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.NatJurid := '0001';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndCoop := TpIndCoop(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndConstr := TpIndConstr(2);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndDesFolha := TpIndDesFolha(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndOptRegEletron :=
        TpIndOptRegEletron(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.MultTabRubricas := tpSimNao(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.IndEtt := tpSimNao(1);

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoOp.nrSiafi := '12345';

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoOp.infoEnte.nmEnte := 'Ente federativo teste';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoOp.infoEnte.uf := tpuf(ufSP);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoOp.infoEnte.vrSubteto := 100.00;

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.IdeMinLei := tpSiglaMin(1);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.NrCertif := '1111';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtEmisCertif := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtVencCertif := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.NrProtRenov := '10';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtProtRenov := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.DtDou := date;
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.dadosIsencao.PagDou := '111';

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.NmCtt := 'Contato 1';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.CpfCtt := '00000222220';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.FoneFixo := '34335856';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.FoneCel := '991524587';
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.Contato.email :=
        'testecontato@testecontato.com';

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoOrgInternacional.
        IndAcordoIsenMulta := tpIndAcordoIsencaoMulta(1);


      with evtInfoEmpregador.InfoEmpregador.InfoCadastro.SoftwareHouse.Add do
      begin
        CnpjSoftHouse := '00000000000000';
        NmRazao := 'SoftwareHouse Teste';
        NmCont := 'Soft Contato';
        Telefone := '34335856';
        email := 'teste@teste.com';
      end;

      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoComplementares.
        SituacaoPJ.IndSitPJ :=
        tpIndSitPJ(0);
      evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoComplementares.
        SituacaoPF.IndSitPF :=
        tpIndSitPF(0);

      evtInfoEmpregador.infoEmpregador.NovaValidade.IniValid := '2014-05';
      evtInfoEmpregador.infoEmpregador.novaValidade.FimValid := '2099-12';

    end;
  end;
end;


procedure TFExemploEsocial.btnGerarClick(Sender: TObject);
begin

  ACBreSocial1.SSL.SelecionarCertificado;

  if (cbS1000.Checked) then
    GerareSocial1000;

  ACBreSocial1.Eventos.GerarXMLs;
  ACBreSocial1.Eventos.SaveToFiles;
  ACBreSocial1.Eventos.Clear;
end;

procedure TFExemploEsocial.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

end.
