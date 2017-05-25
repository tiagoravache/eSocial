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
    cbS1035: TCheckBox;
    cbS1207: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    procedure btnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
    procedure GerareSocial1000;
    procedure GerareSocial1005;
    procedure GerareSocial1010;
    procedure GerareSocial1020;
    procedure GerareSocial1030;
    procedure GerareSocial1035;
    procedure GerareSocial1040;
    procedure GerareSocial1050;
    procedure GerareSocial1060;
    procedure GerareSocial1070;
    procedure GerareSocial1080;
    procedure GerareSocial2100;
    procedure GerareSocial1200;
    procedure GerareSocial1202;
    procedure GerareSocial1207;
    procedure GerareSocial1210;
    procedure GerareSocial1250;
    procedure GerareSocial1260;
    procedure GerareSocial1270;
    procedure GerareSocial1280;
    procedure GerareSocial1298;
    procedure GerareSocial1299;
    procedure GerareSocial1300;
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

procedure TFExemploEsocial.GerareSocial1005;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Iniciais.S1005.Add do
    begin
      evtTabEstab.id     := '1';
//      evtTabEstab.Versao := '2.0';

      evtTabEstab.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabEstab.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabEstab.IdeEvento.VerProc := '1.0';

      evtTabEstab.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabEstab.IdeEmpregador.NrInsc := '0123456789';

      evtTabEstab.ModoLancamento  := TModoLancamento( i );
      evtTabEstab.infoEstab.IdeEstab.tpInsc   := 1;
      evtTabEstab.infoEstab.IdeEstab.nrInsc   := '012345678901234';
      evtTabEstab.infoEstab.IdeEstab.iniValid := '2015-05';
      evtTabEstab.infoEstab.IdeEstab.fimValid := '2099-12';

      evtTabEstab.infoEstab.DadosEstab.cnaePrep := '2015';

      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.AliqRat      := 1;
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.Fap          := 1.5;
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.AliqRatAjust := 2.5;

      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.tpProc := tpTpProc(1);
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.nrProc := '20150512';
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.codSusp := 1;

      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.tpProc := tpTpProc(1);
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.nrProc := '20150512';
      evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.codSusp := 2;

      evtTabEstab.infoEstab.DadosEstab.infoCaepf.tpCaepf := tcContrIndividual;

      evtTabEstab.infoEstab.DadosEstab.infoObra.indSubstPatrObra := tpIndSubstPatronalObra(1);

      evtTabEstab.infoEstab.DadosEstab.infoTrab.regPt := tpRegPt(3);

      evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.contApr := tpContApr(2);
      evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.nrProcJud := '20150612';
      evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.contEntEd := tpSim;
      with evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.infoEntEduc.Add do
           nrInsc := '0123456789';

      evtTabEstab.infoEstab.DadosEstab.infoTrab.infoPCD.contPCD := tpContPCD(9);
      evtTabEstab.infoEstab.DadosEstab.infoTrab.infoPCD.nrProcJud := '20160131';

      evtTabEstab.infoEstab.NovaValidade.IniValid := '2014-05';
      evtTabEstab.infoEstab.novaValidade.FimValid := '2099-12';
    end;
  end;
end;


procedure TFExemploEsocial.GerareSocial1010;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1010.Add do
    begin
      evtTabRubrica.id     := '1';
//      evtTabRubrica.Versao := '2.0';

      evtTabRubrica.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabRubrica.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabRubrica.IdeEvento.VerProc := '1.0';

      evtTabRubrica.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabRubrica.IdeEmpregador.NrInsc := '0123456789';

      evtTabRubrica.ModoLancamento  := TModoLancamento( i );

      evtTabRubrica.infoRubrica.IdeRubrica.CodRubr    := '5445';
      evtTabRubrica.infoRubrica.IdeRubrica.ideTabRubr := '100000';
      evtTabRubrica.infoRubrica.IdeRubrica.iniValid   := '2015-05';
      evtTabRubrica.infoRubrica.IdeRubrica.fimValid   := '2015-06';

      evtTabRubrica.infoRubrica.DadosRubrica.dscRubr    := 'Teste de S-1010';
      evtTabRubrica.infoRubrica.DadosRubrica.natRubr    := 1022;
      evtTabRubrica.infoRubrica.DadosRubrica.tpRubr     := tpTpRubr(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncCP   := tpCodIncCP(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncIRRF := tpCodIncIRRF(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncFGTS := tpCodIncFGTS(1);
      evtTabRubrica.infoRubrica.DadosRubrica.codIncSIND := tpCodIncSIND(1);
      evtTabRubrica.infoRubrica.DadosRubrica.RepDSR     := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.Rep13      := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.RepFerias  := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.repAviso   := tpSimNao(1);
      evtTabRubrica.infoRubrica.DadosRubrica.observacao := 'Rubrica Teste';

      with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.add do
      begin
        nrProc     := '1020';
        ExtDecisao := tpExtDecisao(1);
        codSusp := 1;
      end;

      with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoIRRF.add do
      begin
        nrProc := '1020';
        codSusp := 2;
      end;

      with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoFGTS.add do
      begin
        nrProc := '50740';
        codSusp := 3;
      end;

      with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoSIND.add do
      begin
        nrProc := '50';
        codSusp := 4;
      end;

      if (EvtTabRubrica.ModoLancamento = mlAlteracao) then
        begin
          evtTabRubrica.InfoRubrica.novaValidade.IniValid := '2015-05';
          evtTabRubrica.InfoRubrica.novaValidade.FimValid := '2099-12';
        end;
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1020;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1020.Add do
    begin
      evtTabLotacao.id     := '1';
//      evtTabLotacao.Versao := '2.0';

      evtTabLotacao.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabLotacao.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabLotacao.IdeEvento.VerProc := '1.0';

      evtTabLotacao.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabLotacao.IdeEmpregador.NrInsc := '0123456789';

      evtTabLotacao.ModoLancamento  := TModoLancamento( i );

      evtTabLotacao.infoLotacao.IdeLotacao.codLotacao := '300000';
      evtTabLotacao.infoLotacao.IdeLotacao.iniValid   := '2015-06';
      evtTabLotacao.infoLotacao.IdeLotacao.fimValid   := '2099-12';

      evtTabLotacao.infoLotacao.DadosLotacao.tpLotacao := '01';
      evtTabLotacao.infoLotacao.DadosLotacao.tpInsc    := tiCAEPF;
      evtTabLotacao.infoLotacao.DadosLotacao.nrInsc    := '6564646565';

      evtTabLotacao.infoLotacao.DadosLotacao.fPasLotacao.Fpas     := '515';
      evtTabLotacao.infoLotacao.DadosLotacao.fPasLotacao.codTercs := '0015';
      evtTabLotacao.infoLotacao.DadosLotacao.fPasLotacao.codTercsSusp := '0506';

      with evtTabLotacao.infoLotacao.dadosLotacao.fPasLotacao.infoProcJudTerceiros.procJudTerceiro.Add do
      begin
        codTerc   := '1111';
        nrProcJud := '1234567891239-1345';
        codSusp := 1;
      end;

      with evtTabLotacao.infoLotacao.dadosLotacao.fPasLotacao.infoProcJudTerceiros.procJudTerceiro.Add do
      begin
        codTerc   := '2222';
        nrProcJud := '1234567891239-1345';
        codSusp := 2;
      end;

      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.tpInscContrat := tpTpInscContratante(0);
      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.NrInscContrat := '74563214500045';
      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.tpInscProp    := TpTpInscProp(0);
      evtTabLotacao.infoLotacao.DadosLotacao.InfoEmprParcial.nrInscProp    := '654234523416';

      evtTabLotacao.infoLotacao.novaValidade.IniValid := '2015-06';
      evtTabLotacao.infoLotacao.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1030;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1030.Add do
    begin
      evtTabCargo.id     := '1';
 //     evtTabCargo.Versao := '2.0';

      evtTabCargo.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabCargo.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabCargo.IdeEvento.VerProc := '1.0';

      evtTabCargo.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabCargo.IdeEmpregador.NrInsc := '0123456789';

      evtTabCargo.ModoLancamento := TModoLancamento( i );

      evtTabCargo.infoCargo.IdeCargo.CodCargo := '37';
      evtTabCargo.infoCargo.ideCargo.iniValid := '2015-05';
      evtTabCargo.infoCargo.ideCargo.fimValid := '2099-12';

      evtTabCargo.infoCargo.DadosCargo.nmCargo := 'Programador';
      evtTabCargo.infoCargo.DadosCargo.codCBO  := '500000';

      evtTabCargo.infoCargo.DadosCargo.cargoPublico.acumCargo   := tpAcumCargo(0);
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.contagemEsp := tpContagemEsp(0);
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.dedicExcl   := tpSimNao(0);

      evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.nrLei    := '11111';
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.dtLei    := Now;
      evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.sitCargo := tpSitCargo(0);

      evtTabCargo.infoCargo.NovaValidade.IniValid := '2015-05';
      evtTabCargo.infoCargo.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1035;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1035.Add do
    begin
      evtTabCarreira.id := '1';
 //     evtTabCargo.Versao := '2.0';

      evtTabCarreira.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabCarreira.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabCarreira.IdeEvento.VerProc := '1.0';

      evtTabCarreira.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabCarreira.IdeEmpregador.NrInsc := '0123456789';

      evtTabCarreira.ModoLancamento := TModoLancamento( i );

      evtTabCarreira.InfoCarreira.ideCarreira.codCarreira := '1';
      evtTabCarreira.InfoCarreira.ideCarreira.iniValid := '2015-05';
      evtTabCarreira.InfoCarreira.ideCarreira.iniValid := '2099-12';

      evtTabCarreira.InfoCarreira.dadosCarreira.dscCarreira := 'Juiz';
      evtTabCarreira.InfoCarreira.dadosCarreira.leiCarr := 'lei89489/77';
      evtTabCarreira.InfoCarreira.dadosCarreira.dtLeiCarr := now;
      evtTabCarreira.InfoCarreira.dadosCarreira.sitCarr := tpSitCarr(0);

      evtTabCarreira.InfoCarreira.NovaValidade.IniValid := '2015-05';
      evtTabCarreira.InfoCarreira.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1040;
var
  i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1040.Add do
    begin
      evtTabFuncao.id     := '1';
//      evtTabFuncao.Versao := '2.0';

      evtTabFuncao.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabFuncao.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabFuncao.IdeEvento.VerProc := '1.0';

      evtTabFuncao.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabFuncao.IdeEmpregador.NrInsc := '0123456789';

      evtTabFuncao.ModoLancamento := TModoLancamento( i );

      evtTabFuncao.InfoFuncao.IdeFuncao.CodFuncao := '1';
      evtTabFuncao.InfoFuncao.IdeFuncao.iniValid  := '2015-05';
      evtTabFuncao.InfoFuncao.IdeFuncao.fimValid  := '2099-12';

      evtTabFuncao.InfoFuncao.DadosFuncao.dscFuncao := 'PROGRAMADOR';
      evtTabFuncao.InfoFuncao.DadosFuncao.codCBO    := '5000';

      evtTabFuncao.InfoFuncao.NovaValidade.IniValid := '2015-05';
      evtTabFuncao.InfoFuncao.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1050;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1050.Add do
    begin
      evtTabHorContratual.id     := '1';
//      evtTabHorContratual.Versao := '2.0';

      evtTabHorContratual.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabHorContratual.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabHorContratual.IdeEvento.VerProc := '1.0';

      evtTabHorContratual.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabHorContratual.IdeEmpregador.NrInsc := '0123456789';

      evtTabHorContratual.ModoLancamento := TModoLancamento( i );

      evtTabHorContratual.InfoHorContratual.ideHorContratual.codHorContrat := '1';
      evtTabHorContratual.InfoHorContratual.ideHorContratual.iniValid      := '2015-05';
      evtTabHorContratual.InfoHorContratual.ideHorContratual.fimValid      := '2099-12';

      evtTabHorContratual.InfoHorContratual.dadosHorContratual.hrEntr         := '0800';
      evtTabHorContratual.InfoHorContratual.dadosHorContratual.hrSaida        := '1800';
      evtTabHorContratual.InfoHorContratual.dadosHorContratual.durJornada     := 525;
      evtTabHorContratual.InfoHorContratual.dadosHorContratual.perHorFlexivel := tpSimNao(1);


      with evtTabHorContratual.InfoHorContratual.dadosHorContratual.horarioIntervalo.Add do
      begin
        tpInterv   := tptpIntervalo(0);
        durInterv  := 90;
        iniInterv  := '1200';
        termInterv := '1330';
      end;

      with evtTabHorContratual.InfoHorContratual.dadosHorContratual.horarioIntervalo.Add do
      begin
        tpInterv   := tptpIntervalo(1);
        durInterv  := 15;
        iniInterv  := '1645';
        termInterv := '1700';
      end;

      evtTabHorContratual.InfoHorContratual.novaValidade.IniValid := '2015-05';
      evtTabHorContratual.InfoHorContratual.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1060;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1060.Add do
    begin
      EvtTabAmbiente.id     := '1';
//      EvtTabAmbiente.Versao := '2.0';

      EvtTabAmbiente.IdeEvento.TpAmb   := TpTpAmb(0);
      EvtTabAmbiente.IdeEvento.ProcEmi := TpProcEmi(0);
      EvtTabAmbiente.IdeEvento.VerProc := '1.0';

      EvtTabAmbiente.IdeEmpregador.TpInsc := tpTpInsc(1);
      EvtTabAmbiente.IdeEmpregador.NrInsc := '0123456789';

      EvtTabAmbiente.ModoLancamento := TModoLancamento( i );

      EvtTabAmbiente.infoAmbiente.ideAmbiente.codAmb   := '123456';
      EvtTabAmbiente.infoAmbiente.ideAmbiente.iniValid := '2015-05';
      EvtTabAmbiente.infoAmbiente.ideAmbiente.fimValid := '2099-12';

      EvtTabAmbiente.infoAmbiente.dadosAmbiente.dscAmb   := 'DESCRICAO';
      EvtTabAmbiente.infoAmbiente.dadosAmbiente.localAmb := tpLocalAmb(0);
      EvtTabAmbiente.infoAmbiente.dadosAmbiente.tpInsc   := tpTpInscAmbTab(0);
      EvtTabAmbiente.infoAmbiente.dadosAmbiente.nrInsc   := '123456789';

      with EvtTabAmbiente.infoAmbiente.dadosAmbiente.fatorRisco.add do
        codFatRis := '1111';


      with EvtTabAmbiente.infoAmbiente.dadosAmbiente.fatorRisco.add do
        codFatRis := '2222';

      with EvtTabAmbiente.infoAmbiente.dadosAmbiente.fatorRisco.add do
        codFatRis := '3333';

      EvtTabAmbiente.infoAmbiente.novaValidade.IniValid := '2015-06';
      EvtTabAmbiente.infoAmbiente.novaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1070;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1070.Add do
    begin
      evtTabProcesso.id     := '1';
//      evtTabProcesso.Versao := '2.0';

      evtTabProcesso.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabProcesso.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabProcesso.IdeEvento.VerProc := '1.0';

      evtTabProcesso.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabProcesso.IdeEmpregador.NrInsc := '0123456789';

      evtTabProcesso.ModoLancamento := TModoLancamento( i );

      evtTabProcesso.InfoProcesso.IdeProcesso.tpProc   := tpTpProc(0);
      evtTabProcesso.InfoProcesso.IdeProcesso.nrProc   := '5000';
      evtTabProcesso.InfoProcesso.IdeProcesso.iniValid := '2014-05';
      evtTabProcesso.InfoProcesso.IdeProcesso.fimValid := '2015-06';


      evtTabProcesso.InfoProcesso.DadosProc.IndAutoria := tpindAutoria(0);
      evtTabProcesso.InfoProcesso.DadosProc.indMatProc := tpIndMatProc(0);

      evtTabProcesso.InfoProcesso.DadosProc.DadosProcJud.UfVara     := 'PR';
      evtTabProcesso.InfoProcesso.DadosProc.DadosProcJud.codMunic   := 5075;
      evtTabProcesso.InfoProcesso.DadosProc.DadosProcJud.IdVara     := '20';

      with evtTabProcesso.InfoProcesso.DadosProc.infoSusp.add do
      begin
        codSusp := 1;
        indSusp := tpIndSusp(0);
        dtDecisao := now;
        indDeposito := tpNao;
      end;

      evtTabProcesso.InfoProcesso.NovaValidade.IniValid := '2015-10';
      evtTabProcesso.InfoProcesso.NovaValidade.FimValid := '2016-10';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1080;
var
i : Integer;
begin
  for I := 0 to 2 do
  begin
    with ACBreSocial1.Eventos.Tabelas.S1080.Add do
    begin
      evtTabOperPortuario.id     := '1';
//      evtTabOperPortuario.Versao := '2.0';

      evtTabOperPortuario.IdeEvento.TpAmb   := TpTpAmb(0);
      evtTabOperPortuario.IdeEvento.ProcEmi := TpProcEmi(0);
      evtTabOperPortuario.IdeEvento.VerProc := '1.0';

      evtTabOperPortuario.IdeEmpregador.TpInsc := tpTpInsc(1);
      evtTabOperPortuario.IdeEmpregador.NrInsc := '0123456789';

      evtTabOperPortuario.ModoLancamento := TModoLancamento( i );

      evtTabOperPortuario.InfoOperPortuario.IdeOperPortuario.cnpjOpPortuario := '29813268000156';
      evtTabOperPortuario.InfoOperPortuario.IdeOperPortuario.iniValid        := '2015-05';
      evtTabOperPortuario.InfoOperPortuario.IdeOperPortuario.fimValid        := '2099-12';

      evtTabOperPortuario.InfoOperPortuario.DadosOperPortuario.aliqRat      := 5;
      evtTabOperPortuario.InfoOperPortuario.DadosOperPortuario.fap          := 0.5;
      evtTabOperPortuario.InfoOperPortuario.DadosOperPortuario.aliqRatAjust := 5.5;

      evtTabOperPortuario.InfoOperPortuario.NovaValidade.IniValid := '2015-05';
      evtTabOperPortuario.InfoOperPortuario.NovaValidade.FimValid := '2099-12';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial2100;
begin
  with ACBreSocial1.Eventos.Iniciais.S2100.Add do
  begin
    EvtCadInicial.id     := '1';
//    EvtCadInicial.Versao := '2.0';

    EvtCadInicial.IdeEvento.indRetif := tpIndRetificacao(0);
    EvtCadInicial.IdeEvento.NrRecibo := '65.5454.987798798798';
    EvtCadInicial.IdeEvento.TpAmb    := TpTpAmb(0);
    EvtCadInicial.IdeEvento.ProcEmi  := TpProcEmi(0);
    EvtCadInicial.IdeEvento.VerProc  := '1.0';

    EvtCadInicial.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtCadInicial.IdeEmpregador.NrInsc := '0123456789';

    EvtCadInicial.Trabalhador.CpfTrab   := '54564654564';
    EvtCadInicial.Trabalhador.NisTrab   := '65464646464';
    EvtCadInicial.Trabalhador.NmTrab    := 'Empregado teste';
    EvtCadInicial.Trabalhador.Sexo      := 'M';
    EvtCadInicial.Trabalhador.RacaCor   := 1;
    EvtCadInicial.Trabalhador.EstCiv    := 1;
    EvtCadInicial.Trabalhador.GrauInstr := 10;
    EvtCadInicial.Trabalhador.nmSoc     := 'Nome Social';

    EvtCadInicial.Trabalhador.Nascimento.DtNascto   := date;
    EvtCadInicial.Trabalhador.Nascimento.codMunic   := 51268;
    EvtCadInicial.Trabalhador.Nascimento.UF         := 'PR';
    EvtCadInicial.Trabalhador.Nascimento.PaisNascto := '565';
    EvtCadInicial.Trabalhador.Nascimento.PaisNac    := '545';
    EvtCadInicial.Trabalhador.Nascimento.NmMae      := 'teste mae';
    EvtCadInicial.Trabalhador.Nascimento.NmPai      := 'teste pai';

    EvtCadInicial.Trabalhador.Documentos.CTPS.NrCtps    := '56454';
    EvtCadInicial.Trabalhador.Documentos.CTPS.SerieCtps := '646';
    EvtCadInicial.Trabalhador.Documentos.CTPS.UfCtps    := 'PR';

    EvtCadInicial.Trabalhador.Documentos.RIC.NrRic        := '123123';
    EvtCadInicial.Trabalhador.Documentos.RIC.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.RIC.DtExped      := date;

    EvtCadInicial.Trabalhador.Documentos.RG.NrRg         := '123123';
    EvtCadInicial.Trabalhador.Documentos.RG.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.RG.DtExped      := date;

    EvtCadInicial.Trabalhador.Documentos.RNE.NrRne        := '123123';
    EvtCadInicial.Trabalhador.Documentos.RNE.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.RNE.DtExped      := date;

    EvtCadInicial.Trabalhador.Documentos.OC.NrOc         := '999';
    EvtCadInicial.Trabalhador.Documentos.OC.OrgaoEmissor := 'SSP';
    EvtCadInicial.Trabalhador.Documentos.OC.DtExped      := Date;
    EvtCadInicial.Trabalhador.Documentos.OC.DtValid      := Date;

    EvtCadInicial.Trabalhador.Documentos.CNH.nrRegCnh     := '999';
    EvtCadInicial.Trabalhador.Documentos.CNH.DtExped      := Date;
    EvtCadInicial.Trabalhador.Documentos.CNH.ufCnh        := tpuf(ufPR);
    EvtCadInicial.Trabalhador.Documentos.CNH.DtValid      := Date;
    EvtCadInicial.Trabalhador.Documentos.CNH.dtPriHab     := Date;
    EvtCadInicial.Trabalhador.Documentos.CNH.categoriaCnh := tpCnh(cnA);

    EvtCadInicial.Trabalhador.Endereco.Brasil.TpLograd    := 'RUA';
    EvtCadInicial.Trabalhador.Endereco.Brasil.DscLograd   := 'TESTE';
    EvtCadInicial.Trabalhador.Endereco.Brasil.NrLograd    := '777';
    EvtCadInicial.Trabalhador.Endereco.Brasil.Complemento := 'AP 101';
    EvtCadInicial.Trabalhador.Endereco.Brasil.Bairro      := 'CENTRO';
    EvtCadInicial.Trabalhador.Endereco.Brasil.Cep         := '85500000';
    EvtCadInicial.Trabalhador.Endereco.Brasil.CodMunic    := 11111;
    EvtCadInicial.Trabalhador.Endereco.Brasil.UF          := tpuf(ufPR);

    EvtCadInicial.Trabalhador.Endereco.Exterior.PaisResid   := '545';
    EvtCadInicial.Trabalhador.Endereco.Exterior.DscLograd   := 'TESTE';
    EvtCadInicial.Trabalhador.Endereco.Exterior.NrLograd    := '777';
    EvtCadInicial.Trabalhador.Endereco.Exterior.Complemento := 'AP 101';
    EvtCadInicial.Trabalhador.Endereco.Exterior.Bairro      := 'CENTRO';
    EvtCadInicial.Trabalhador.Endereco.Exterior.NmCid       := 'CIDADE EXTERIOR';
    EvtCadInicial.Trabalhador.Endereco.Exterior.CodPostal   := '50000';

    EvtCadInicial.Trabalhador.TrabEstrangeiro.DtChegada        := Date;
    EvtCadInicial.Trabalhador.TrabEstrangeiro.ClassTrabEstrang := tpClassTrabEstrang(ctVistoPermanente);
    EvtCadInicial.Trabalhador.TrabEstrangeiro.CasadoBr         := 'N';
    EvtCadInicial.Trabalhador.TrabEstrangeiro.FilhosBr         := 'N';

    EvtCadInicial.Trabalhador.InfoDeficiencia.DefFisica      := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefVisual      := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefAuditiva    := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefMental      := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.DefIntelectual := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.ReabReadap     := tpSimNao(tpSim);
    EvtCadInicial.Trabalhador.InfoDeficiencia.infoCota       := tpNao;
    EvtCadInicial.Trabalhador.InfoDeficiencia.Observacao     := 'sem deficiencia';

    with EvtCadInicial.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdConjuge);
      nmDep    := 'Dependente 1';
      dtNascto := Date;
      cpfDep   := '57548758778';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
      depPlan  := tpSim;
      incTrab  := tpNao;
    end;

    with EvtCadInicial.Trabalhador.Dependente.Add do
    begin
      tpDep    := tpTpDep(tdFilhoOuEnteadoAte21Anos);
      nmDep    := 'Dependente 2';
      dtNascto := Date;
      cpfDep   := '57548758778';
      depIRRF  := tpSimNao(tpSim);
      depSF    := tpSimNao(tpNao);
      depPlan  := tpSim;
      incTrab  := tpNao;
    end;

    EvtCadInicial.Trabalhador.Aposentadoria.TrabAposent := tpNao;

    EvtCadInicial.Trabalhador.Contato.FonePrinc     := '91067240';
    EvtCadInicial.Trabalhador.Contato.FoneAlternat  := '91067240';
    EvtCadInicial.Trabalhador.Contato.EmailPrinc    := 'TESTE@email.com.br';
    EvtCadInicial.Trabalhador.Contato.EmailAlternat := 'teste@teste.com';

    EvtCadInicial.Vinculo.Matricula := '54545';
    EvtCadInicial.Vinculo.TpRegTrab := tpTpRegTrab(1);
    EvtCadInicial.Vinculo.TpRegPrev := tpTpRegPrev(1);

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.DtAdm             := Date;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.TpAdmissao        := tpTpAdmissao(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.IndAdmissao       := tpTpIndAdmissao(iaNormal);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.TpRegJor          := tpTpRegJor(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.NatAtividade      := tpNatAtividade(navUrbano);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.dtBase            := 03;
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.cnpjSindCategProf := '12345678901234';

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.FGTS.OpcFGTS   := tpOpcFGTS(ofOptante);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.FGTS.DtOpcFGTS := Date;

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.hipLeg := tpMtvContrat(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.justContr := 'Produção de panetones para o natal';
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.tpinclContr := tpInclContr(0);

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.TpInsc := tpTpInsc(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.NrInsc := '564564656';
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.ideEstabVinc.TpInsc := tpTpInsc(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTomadorServ.ideEstabVinc.NrInsc := '444564656';

    with EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.trabTemporario.IdeTrabSubstituido.Add do
      CpfTrabSubst := '12345678901';

    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.aprend.TpInsc := tpTpInsc(1);
    EvtCadInicial.Vinculo.InfoRegimeTrab.InfoCeletista.aprend.NrInsc := '233564656';

    //Enviar apenas um tipo de regime
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.IndProvim   := tpIndProvim(ipNormal);
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.TpProv      := tpTpProv(tpNomeacaoCargoEfetivo);
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.DtNomeacao  := Date;
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.DtPosse     := Date;
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.DtExercicio := Date;
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.tpPlanRP := tpPlanRP(0);
    //EvtCadInicial.Vinculo.InfoRegimeTrab.InfoEstatutario.infoDecJud.nrProcJud := '313032130';


    EvtCadInicial.Vinculo.InfoContrato.CodCargo  := '545';
    EvtCadInicial.Vinculo.InfoContrato.CodFuncao := '5456';
    EvtCadInicial.Vinculo.InfoContrato.CodCateg  := 111;
    EvtCadInicial.Vinculo.InfoContrato.codCarreira := '1';
    EvtCadInicial.Vinculo.InfoContrato.dtIngrCarr := now;

    EvtCadInicial.Vinculo.InfoContrato.Remuneracao.VrSalFx    := 5000;
    EvtCadInicial.Vinculo.InfoContrato.Remuneracao.UndSalFixo := tpUndSalFixo(5);
    EvtCadInicial.Vinculo.InfoContrato.Remuneracao.DscSalVar  := 'nada a declarar';

    EvtCadInicial.Vinculo.InfoContrato.Duracao.TpContr := tpTpContr(1);
    EvtCadInicial.Vinculo.InfoContrato.Duracao.dtTerm  := Date;

    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.TpInsc   := tiCNPJ;
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.NrInsc   := '213864656';
    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabGeral.DescComp := 'Descricao logal geral teste';

//    Informar apenas para trabalhador doméstico
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.TpLograd    := '123';
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.DscLograd   := 'LOCAL DOMESTICO';
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.NrLograd    := '111';
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Complemento := 'Complemento';
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Bairro      := 'Bairro';
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Cep         := '85202630';
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.CodMunic    := 123;
//    EvtCadInicial.Vinculo.InfoContrato.LocalTrabalho.LocalTrabDom.Uf          := tpuf(ufPR);

    EvtCadInicial.Vinculo.InfoContrato.HorContratual.QtdHrsSem := 44;
    EvtCadInicial.Vinculo.InfoContrato.HorContratual.TpJornada := tpTpJornada(1);
    EvtCadInicial.Vinculo.InfoContrato.HorContratual.DscTpJorn := 'horario contratual';
    EvtCadInicial.Vinculo.InfoContrato.HorContratual.tmpParc := tpNao;

    with EvtCadInicial.Vinculo.InfoContrato.HorContratual.horario.Add do
    begin
      Dia := tpTpDia(diSegundaFeira);
      CodHorContrat := '54';
    end;

    with EvtCadInicial.Vinculo.InfoContrato.HorContratual.horario.Add do
    begin
      Dia := tpTpDia(diTercaFeira);
      CodHorContrat := '10';
    end;

    EvtCadInicial.Vinculo.InfoContrato.FiliacaoSindical.CnpjSindTrab := '22345600015212';
    EvtCadInicial.Vinculo.InfoContrato.AlvaraJudicial.NrProcJud      := '123';
    EvtCadInicial.Vinculo.SucessaoVinc.Cnpj := '12354654000155';
    EvtCadInicial.Vinculo.SucessaoVinc.MatricAnt     := '123';
    EvtCadInicial.Vinculo.SucessaoVinc.DtIniVinculo  := Date;
    EvtCadInicial.Vinculo.SucessaoVinc.Observacao    := 'transferido';

    evtCadInicial.vinculo.Afastamento.DtIniAfast := Date;
    evtCadInicial.vinculo.Afastamento.codMotAfast := '15';
    evtCadInicial.vinculo.Desligamento.DtDeslig  := Date;
  end;
end;

procedure TFExemploEsocial.GerareSocial1200;
begin
  with ACBreSocial1.Eventos.Periodicos.S1200.Add do
  begin
    evtRemun.id     := '1';
//      evtRemun.versao := '2.0';

    evtRemun.ideEvento.indRetif    := ireOriginal;
    //evtRemun.ideEvento.NrRecibo  := '4564654'; Numero do recibo que será retificado.
    evtRemun.ideEvento.IndApuracao := tpIndApuracao(iapuMensal);
    evtRemun.ideEvento.perApur     := '052015';
    evtRemun.ideEvento.TpAmb       := taProducao;
    evtRemun.ideEvento.ProcEmi     := peAplicEmpregador;
    evtRemun.ideEvento.VerProc     := '1.0';

    evtRemun.ideEmpregador.TpInsc  := tiCNPJ;
    evtRemun.ideEmpregador.NrInsc  := '012345678987654';

    evtRemun.ideTrabalhador.cpfTrab    := '01234567890';
    evtRemun.ideTrabalhador.nisTrab    := '09876543210';

    evtRemun.ideTrabalhador.infoMV.indMV := imvDescontadaempregador;

    {Os Grupos abaixo são opcionais
    O grupo abaixocorresponde a funcionários que tenham dois empregos em empresas diferentes }
    with evtRemun.ideTrabalhador.infoMV.remunOutrEmpr.add do
    begin
      tpInsc     := tiCNPJ;
      nrInsc     := '01234567890123';
      codCateg   := 222;
      vlrRemunOE := 1230.10;
    end;

   //o grupo abaixo corresponde apenas a trabalhadores cuja categoria não está sujeita ao evento de admissão
   //   ou TSV-início
    evtRemun.ideTrabalhador.infoComplem.nmTrab       := 'João das Neves';
    evtRemun.ideTrabalhador.infoComplem.dtNascto     := Date;
    evtRemun.ideTrabalhador.infoComplem.codCBO       := '000001';
    evtRemun.ideTrabalhador.infoComplem.natAtividade := navUrbano;
    evtRemun.ideTrabalhador.infoComplem.qtdDiasTrab  := 10;

    //os dados abaixo só devem ser informados em caso do processo existir e houver decisão que incida sobre as
    //  contribuições
    with evtRemun.ideTrabalhador.procJudTrab.Add do
    begin
      tpTrib := tptrevidenciaria;
      nrProcJud := '95135703320156150258';
      codSusp := 1;
    end;
    with evtRemun.dmDev.add do
    begin
      ideDmDev := '1';
      codCateg := 111;
      with infoPerApur.ideEstabLot.add do
      begin
        tpInsc     := tiCNPJ;
        nrInsc     := '012345678987654';
        codLotacao := 'SACI54321';
        qtdDiasAv  := 22;
        with remunPerApur.Add do
        begin
          matricula := 'A1234';
          indSimples:= idsIntegralmente;
          with itensRemun.Add do
          begin
            codRubr := '987654';
            //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
            qtdRubr := 100;
            fatorRubr := 50;
            vrUnit  := 3296.35;
            vrRubr  := 3330.30;
          end;
          with infoSaudeColet.detOper.Add do
          begin
            cnpjOper := '01234567898765';
            regANS   := 'A1B2C3';
            vrPgTit  := 1.50;
            with detPlano.Add do
            begin
              cpfDep   := '01234567898';
              nmDep    := 'José das Areias';
              dtNascto := Date;
              vlrPgDep := 0.75;
            end;
          end;

          infoAgNocivo.grauExp := ge1;
        end;
      end;
      with infoPerAnt.ideADC.add do
      begin
        dtAcConv := now;
        tpAcConv := tacLegislacaoFederalEstadualMunicipalDistrital;
        dtEfAcConv := now;
        dsc := 'Dissídio';
        with idePeriodo.Add do
        begin
          perRef := '201504';
          with ideEstabLot.Add do
          begin
            tpInsc     := tiCNPJ;
            nrInsc     := '01234567898765';
            codLotacao := 'TESTE123';
            with remunPerAnt.Add do
            begin
              matricula  := 'A1234';
              indSimples := idsIntegralmente;
              with itensRemun.Add do
              begin
                codRubr := '987654';
                //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
                qtdRubr := 100;
                fatorRubr := 50;
                vrUnit  := 3296.35;
                vrRubr  := 3330.30;
              end;

              infoAgNocivo.grauExp := ge1;

            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1202;
begin
  with ACBreSocial1.Eventos.Periodicos.S1202.Add do
  begin
    EvtRmnRPPS.id     := '1';
//      evtRemun.versao := '2.0';

    EvtRmnRPPS.ideEvento.indRetif    := ireOriginal;
    //evtRemun.ideEvento.NrRecibo  := '4564654'; Numero do recibo que será retificado.
    EvtRmnRPPS.ideEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtRmnRPPS.ideEvento.perApur     := '052015';
    EvtRmnRPPS.ideEvento.TpAmb       := taProducao;
    EvtRmnRPPS.ideEvento.ProcEmi     := peAplicEmpregador;
    EvtRmnRPPS.ideEvento.VerProc     := '1.0';

    EvtRmnRPPS.ideEmpregador.TpInsc  := tiCNPJ;
    EvtRmnRPPS.ideEmpregador.NrInsc  := '012345678987654';

    EvtRmnRPPS.ideTrabalhador.cpfTrab := '01234567890';
    EvtRmnRPPS.ideTrabalhador.nisTrab := '09876543210';
    EvtRmnRPPS.ideTrabalhador.qtdDepFP := 0;

    //os dados abaixo só devem ser informados em caso do processo existir e houver decisão que incida sobre as  contribuições
    with EvtRmnRPPS.ideTrabalhador.procJudTrab.Add do
    begin
      tpTrib := tptrevidenciaria;
      nrProcJud := '95135703320156150258';
      codSusp := 1;
    end;

    with EvtRmnRPPS.dmDev.add do
    begin
      ideDmDev := '1';
      with infoPerApur.ideEstab.add do
      begin
        tpInsc := tiCNPJ;
        nrInsc := '012345678987654';
        with remunPerApur.Add do
        begin
          matricula := 'A1234';
          codCateg  := 101;
          with itensRemun.Add do
          begin
            codRubr := '987654';
            //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
            qtdRubr := 100;
            fatorRubr := 50;
            vrUnit  := 3296.35;
            vrRubr  := 3330.30;
          end;

          with infoSaudeColet.detOper.Add do
          begin
            cnpjOper := '01234567898765';
            regANS   := 'A1B2C3';
            vrPgTit  := 1.50;
            with detPlano.Add do
            begin
              cpfDep   := '01234567898';
              dtNascto := now;
              nmDep    := 'José das Areias';
              vlrPgDep := 0.75;
            end;
          end;
        end;
      end;
      with infoPerAnt.ideADC.add do
      begin
        dtLei := now;
        nrLei := '321321/2017';
        dtEf  := now;
        with idePeriodo.add do
        begin
          perRef := '2015-03';
          with ideEstab.add do
          begin
            tpInsc := tiCNPJ;
            nrInsc := '01234567898765';
            with remunPerAnt.Add do
            begin
              matricula  := 'A1234';
              codCateg   := 101;
              with itensRemun.Add do
              begin
                codRubr := '987654';
                //ideTabRubr := 'E380'; deve ser preenchido apenas quando multTabRubricas = S
                qtdRubr := 100;
                fatorRubr := 50;
                vrUnit  := 3296.35;
                vrRubr  := 3330.30;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1207;
begin
  with ACBreSocial1.Eventos.Periodicos.S1207.Add do
  begin
    evtBenPrRP.id     := '1';
//    EvtCadInicial.Versao := '2.0';

    evtBenPrRP.IdeEvento.indRetif := tpIndRetificacao(0);
    evtBenPrRP.IdeEvento.NrRecibo := '65.5454.987798798798';
    evtBenPrRP.IdeEvento.IndApuracao:= iapuMensal;
    evtBenPrRP.IdeEvento.perApur := '2017-05';
    evtBenPrRP.IdeEvento.TpAmb    := TpTpAmb(0);
    evtBenPrRP.IdeEvento.ProcEmi  := TpProcEmi(0);
    evtBenPrRP.IdeEvento.VerProc  := '1.0';

    evtBenPrRP.IdeEmpregador.TpInsc := tpTpInsc(1);
    evtBenPrRP.IdeEmpregador.NrInsc := '0123456789';

    evtBenPrRP.ideBenef.cpfBenef := '88888888888';

    with evtBenPrRP.dmDev.add do
    begin
      tpBenef := 01;
      nrBenefic := '3132132';
      ideDmDev := '1';
      with itens.add do
      begin
        codRubr := '1';
        //ideTabRubr:='0';
        vrRubr := 110.53;
      end;

      with itens.add do
      begin
        codRubr := '2';
        //ideTabRubr:='0';
        vrRubr := 2568.89;
      end;
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1210;
var
  I : Integer;
begin
  with AcbreSocial1.Eventos.Periodicos.S1210.Add do
  begin
    EvtPgtos.id := '1';
//      EvtPgtos.versao := '2.0';

    EvtPgtos.IdeEvento.indRetif := ireOriginal;
//    EvtPgtos.IdeEvento.NrRecibo := 'A.00.NNNNNNNNNNNNNNNNNNN'; - obrigatório se indRetif = ireRetificacao.
    EvtPgtos.IdeEvento.IndApuracao := iapuMensal;
    EvtPgtos.IdeEvento.perApur := '052015';
    EvtPgtos.IdeEvento.TpAmb := taProducao;
    EvtPgtos.IdeEvento.ProcEmi := peAplicEmpregador;
    EvtPgtos.IdeEvento.VerProc := '1.0';

    EvtPgtos.IdeEmpregador.TpInsc := tiCNPJ;
    EvtPgtos.IdeEmpregador.NrInsc := '9632587410123';

    EvtPgtos.IdeBenef.CpfBenef := '01478523690';
    EvtPgtos.IdeBenef.deps.vrDedDep := 100.50;
    with EvtPgtos.IdeBenef.InfoPgto.Add do
    begin
      DtPgto := StrToDate('10/06/2015');
      tpPgto := tpPgtoFl;
      IndResBr := tpNao;
      //-OS GRUPOS ABAIXO SÃO OPCIONAIS
      //grupo detPgtoFl agora é um collection
      with detPgtoFl.Add do
      begin
        perRef := '052015';
        ideDmDev := '2';
        indPagtoTt := tpSim;
        vrLiq := 12365.43;
        nrRecArq := '132156156';
        with retPagtoTot.Add do
        begin
          codRubr := '1';
          ideTabRubr:='0';
          qtdRubr := 1.5;
          fatorRubr := 50;
          vrUnit := 100.10;
          vrRubr := 1001.00;
          with penAlim.add do
          begin
            cpfBenef := '12345698745';
            dtNasctoBenef := now;
            nmBenefic := 'Beneficiário da pensão';
            vlrPensao := 556.32;
          end;
        end;
        with infoPgtoParc.add do
        begin
          codRubr := '2';
          ideTabRubr := '0';
          qtdRubr := 1.5;
          fatorRubr := 0.5;
          vrUnit := 56.85;
          vrRubr := 560.85;
        end;
      end;
      detPgtoBenPr.perRef := '2017-01';
      detPgtoBenPr.ideDmDev := '1';
      detPgtoBenPr.indPgtoTt := tpNao;
      detPgtoBenPr.vrLiq := 1500.21;
      with detPgtoBenPr.retPgtoTot.add do
      begin
        codRubr := '321';
        ideTabRubr := '0';
        qtdRubr := 1.5;
        fatorRubr := 50.65;
        vrUnit := 500.85;
        vrRubr := 5001.65;
      end;
      with detPgtoBenPr.infoPgtoParc.add do
      begin
        codRubr := '555';
        ideTabRubr := '0';
        qtdRubr := 2;
        fatorRubr := 40.11;
        vrUnit := 842.85;
        vrRubr := 774.65;
      end;
      with detPgtoFer.add do
      begin
        codCateg := 111;
        dtIniGoz := now;
        qtDias := 30;
        vrLiq := 2500.32;
        with detRubrFer.add do
        begin
          codRubr := '888';
          ideTabRubr := '0';
          qtdRubr := 1;
          fatorRubr := 100;
          vrUnit := 144.33;
          vrRubr := 2500.32;
          with penAlim.add do
          begin
            cpfBenef := '44455588899';
            dtNasctoBenef := now;
            nmBenefic := 'Beneficiário de Pensão nas Férias';
            vlrPensao := 250.32;
          end;
        end;
      end;
      with detPgtoAnt.add do
      begin
        codCateg := 111;
        perRef := '2017-01';
        with infoPgtoAnt.add do
        begin
          tpBcIRRF := tpCodIncIRRF(0);
          vrBcIRRF := 2500.32;
        end;
      end;

      //grupo idePgtoExt
      idePgtoExt.idePais.codPais := '116';
      IdePgtoExt.idePais.indNIF := infBeneficiaNIF;
      IdePgtoExt.idePais.nifBenef := 'ABCDEFGH123456789';
      IdePgtoExt.endExt.dscLograd := 'Abbey Road St';
      IdePgtoExt.endExt.nrLograd := '93';
      IdePgtoExt.endExt.complem := 'apto 11';
      IdePgtoExt.endExt.bairro := 'Sgt Peppers';
      IdePgtoExt.endExt.nmCid := 'Liverpool';
      IdePgtoExt.endExt.codPostal := '9999999999';
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1250;
begin
  with ACBreSocial1.Eventos.Periodicos.S1250.Add do
  begin
    EvtAqProd.id     := '1';
//    EvtAqProd.Versao := '2.0';

    EvtAqProd.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtAqProd.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtAqProd.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtAqProd.IdeEvento.perApur     := '2015-06';
    EvtAqProd.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtAqProd.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtAqProd.IdeEvento.VerProc     := '1.0';

    EvtAqProd.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtAqProd.IdeEmpregador.NrInsc := '0123456789';

    EvtAqProd.InfoAquisProd.IdeEstabAdquir.tpInscAdq := tpTpInsc(0);
    EvtAqProd.InfoAquisProd.IdeEstabAdquir.nrInscAdq := '12345678910001';

    with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Add do
    begin
      indAquis := tpIdAquis(0);
      vlrTotAquis := 520000.80;

      with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Add do
      begin
        tpInscProd  := tpTpInsc(0);
        nrInscProd  := '98765432100015';
        vlrBruto    := 4000.54;
        vrCPDescPR  := 3850.32;
        vrRatDescPR := 500.30;
        vrSenarDesc := 2500.30;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '64896549898789';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].InfoProcJud.Add do
          begin
            nrProcJud   := '56464897';
            codSusp     := 333;
            vrCPNRet    := 99999.99;
            vrRatNRet   := 88888.88;
            vrSenarNRet := 77777.77;
          end;
      end;


      with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Add do
      begin
        tpInscProd  := tpTpInsc(0);
        nrInscProd  := '98765432100015';
        vlrBruto    := 4000.54;
        vrCPDescPR  := 3850.32;
        vrRatDescPR := 500.30;
        vrSenarDesc := 2500.30;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[1].Nfs.Add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;

        with EvtAqProd.InfoAquisProd.IdeEstabAdquir.TpAquis.Items[0].IdeProdutor.Items[0].InfoProcJud.Add do
          begin
            nrProcJud   := '56464897';
            codSusp     := 222;
            vrCPNRet    := 99999.99;
            vrRatNRet   := 88888.88;
            vrSenarNRet := 77777.77;
          end;
      end;

    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1260;
begin
  with ACBreSocial1.Eventos.Periodicos.S1260.Add do
  begin
    EvtComProd.id     := '1';
//    EvtComProd.Versao := '2.0';

    EvtComProd.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtComProd.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtComProd.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtComProd.IdeEvento.perApur     := '2015-06';
    EvtComProd.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtComProd.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtComProd.IdeEvento.VerProc     := '1.0';

    EvtComProd.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtComProd.IdeEmpregador.NrInsc := '0123456789';

    EvtComProd.InfoComProd.IdeEstabel.nrInscEstabRural := '123456789';

    with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Add do
    begin
      indComerc := tpIndComerc(0);
      vrTotCom  := 5000.80;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
        with nfs.add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[0].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
        with nfs.add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;
      end;
    end;

    with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Add do
    begin
      indComerc := tpIndComerc(1);
      vrTotCom  := 5000.80;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        //vrRetPR  := 9999.99;--excluido na versão 2.1
      end;

      with EvtComProd.InfoComProd.IdeEstabel.TpComerc.Items[1].IdeAdquir.Add do
      begin
        tpInsc   := tpTpInsc(0);
        nrInsc   := '99999999999999';
        vrComerc := 8888.88;
        vrRetPR  := 9999.99;
        with nfs.add do
        begin
          serie       := '00004';
          nrDocto     := '648965498987894';
          dtEmisNF    := now;
          vlrBruto    := 4000.54;
          vrCPDescPR  := 3850.32;
          vrRatDescPR := 500.30;
          vrSenarDesc := 2500.30;
        end;
      end;
    end;
    with EvtComProd.InfoComProd.IdeEstabel do
      begin
        nrInscEstabRural := '123654987123';
        with TpComerc.Add do
          begin
            indComerc := icComProdPorProdRuralPFInclusiveSegEspEfetuadaDirVarejoConsFinal;
            vrTotCom := 123456.65;
            with IdeAdquir.Add do
              begin
                tpInsc := tiCNPJ;
                nrInsc := '12345678901';
                vrComerc := 1234569.98;
                vrRetPR := 123654.78;
              end;
            with InfoProcJud.Add do
              begin
                 tpProc := tpAdministrativo;
                 tpTrib := tptIRRF;
                 nrProcJud := '1236548796521';
                 codSusp := 444;
                 vrCPNRet := 123.65;
                 vrRatNRet := 123.65;
                 vrSenarNRet := 123.65;
                 vrCPSusp := 123.65;
                 vrRatSusp := 123.65;
                 vrSenarSusp := 123.63;
              end;
          end;
      end;

  end;
end;

procedure TFExemploEsocial.GerareSocial1270;
begin
  with ACBreSocial1.Eventos.Periodicos.S1270.Add do
  begin
    EvtContratAvNP.id     := '1';
//    EvtContratAvNP.Versao := '2.0';

    EvtContratAvNP.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtContratAvNP.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtContratAvNP.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtContratAvNP.IdeEvento.perApur     := '2015-06';
    EvtContratAvNP.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtContratAvNP.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtContratAvNP.IdeEvento.VerProc     := '1.0';

    EvtContratAvNP.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtContratAvNP.IdeEmpregador.NrInsc := '0123456789';

    with EvtContratAvNP.RemunAvNP.Add do
    begin
      tpInsc   := tpTpInscEstab(0);
      nrInsc   := '98765432100015';
      codLotacao := '1';
      vrBcCp00 := 650.65;
      vrBcCp15 := 650.65;
      vrBcCp20 := 650.65;
      vrBcCp25 := 650.65;
      vrBcCp13 := 650.65;
      vrBcFgts := 894.65;
      vrDescCP := 500.30;
    end;

    with EvtContratAvNP.RemunAvNP.Add do
    begin
      tpInsc   := tpTpInscEstab(1);
      nrInsc   := '65432198700015';
      codLotacao := '1';
      vrBcCp00 := 650.65;
      vrBcCp15 := 650.65;
      vrBcCp20 := 650.65;
      vrBcCp25 := 650.65;
      vrBcCp13 := 650.65;
      vrBcFgts := 894.65;
      vrDescCP := 500.30;
    end;


    with EvtContratAvNP.RemunAvNP.Add do
    begin
      tpInsc   := tpTpInscEstab(2);
      nrInsc   := '98765432100015';
      codLotacao := '1';
      vrBcCp00 := 650.65;
      vrBcCp15 := 650.65;
      vrBcCp20 := 650.65;
      vrBcCp25 := 650.65;
      vrBcCp13 := 650.65;
      vrBcFgts := 894.65;
      vrDescCP := 500.30;
    end;

    with EvtContratAvNP.RemunAvNP.Add do
    begin
      tpInsc   := tpTpInscEstab(1);
      nrInsc   := '11111111111111';
      codLotacao := '1';
      vrBcCp00 := 650.65;
      vrBcCp15 := 650.65;
      vrBcCp20 := 650.65;
      vrBcCp25 := 650.65;
      vrBcCp13 := 650.65;
      vrBcFgts := 894.65;
      vrDescCP := 500.30;
    end;
  end;
end;

procedure TFExemploEsocial.GerareSocial1280;
begin
  with ACBreSocial1.Eventos.Periodicos.S1280.Add do
  begin
    EvtInfoComplPer.id     := '1';
//    EvtInfoComplPer.Versao := '2.0';

    EvtInfoComplPer.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtInfoComplPer.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtInfoComplPer.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtInfoComplPer.IdeEvento.perApur     := '2015-06';
    EvtInfoComplPer.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtInfoComplPer.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtInfoComplPer.IdeEvento.VerProc     := '1.0';

    EvtInfoComplPer.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtInfoComplPer.IdeEmpregador.NrInsc := '0123456789';

    EvtInfoComplPer.InfoSubstPatr.indSubstPatr   := tpIndSubstPatrOpPort(0);
    EvtInfoComplPer.InfoSubstPatr.percRedContrib := 500.20;

    with EvtInfoComplPer.InfoSubstPatrOpPort.Add do
    begin
      cnpjOpPortuario      := '12345678900112';
    end;

    with EvtInfoComplPer.InfoSubstPatrOpPort.Add do
    begin
      cnpjOpPortuario      := '98765432100014';
    end;

    EvtInfoComplPer.InfoAtivConcom.fatorMes := 999.99;
    EvtInfoComplPer.InfoAtivConcom.fator13  := 111.11;
  end;
end;

procedure TFExemploEsocial.GerareSocial1298;
begin
  with ACBreSocial1.Eventos.Periodicos.S1298.Add do
  begin
    EvtReabreEvPer.id     := '1';
//    EvtReabreEvPer.Versao := '2.0';

    EvtReabreEvPer.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtReabreEvPer.IdeEvento.perApur     := '2015-06';
    EvtReabreEvPer.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtReabreEvPer.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtReabreEvPer.IdeEvento.VerProc     := '1.0';

    EvtReabreEvPer.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtReabreEvPer.IdeEmpregador.NrInsc := '0123456789';
  end;
end;

procedure TFExemploEsocial.GerareSocial1299;
begin
  with ACBreSocial1.Eventos.Periodicos.S1299.Add do
  begin
    EvtFechaEvPer.id     := '1';
//    EvtFechaEvPer.Versao := '2.0';

    EvtFechaEvPer.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtFechaEvPer.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtFechaEvPer.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtFechaEvPer.IdeEvento.perApur     := '2015-06';
    EvtFechaEvPer.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtFechaEvPer.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtFechaEvPer.IdeEvento.VerProc     := '1.0';

    EvtFechaEvPer.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtFechaEvPer.IdeEmpregador.NrInsc := '0123456789';

    EvtFechaEvPer.IdeRespInf.nmResp   := 'Responsavel teste';
    EvtFechaEvPer.IdeRespInf.cpfResp  := '12345678950';
    EvtFechaEvPer.IdeRespInf.telefone := '46 - 22222222';
    EvtFechaEvPer.IdeRespInf.email    := 'Responsavelteste@email.com';

    EvtFechaEvPer.InfoFech.evtRemun        := tpSimNao(0);
    EvtFechaEvPer.InfoFech.evtPgtos        := tpSimNao(1);
    EvtFechaEvPer.InfoFech.evtAqProd       := tpSimNao(1);
    EvtFechaEvPer.InfoFech.evtComProd      := tpSimNao(0);
    EvtFechaEvPer.InfoFech.evtContratAvNP  := tpSimNao(1);
    EvtFechaEvPer.InfoFech.evtInfoComplPer := tpSimNao(0);
    EvtFechaEvPer.InfoFech.compSemMovto    := '07-2015';

    EvtFechaEvPer.InfoFech.InfoExercAnt.movFinancSocios := tpSimNao(0);
  end;
end;

procedure TFExemploEsocial.GerareSocial1300;
begin
  with ACBreSocial1.Eventos.Periodicos.S1300.Add do
  begin
    EvtContrSindPatr.id     := '1';
//    EvtContrSindPatr.Versao := '2.0';

    EvtContrSindPatr.IdeEvento.indRetif    := tpIndRetificacao(0);
    EvtContrSindPatr.IdeEvento.NrRecibo    := '65.5454.987798798798';
    EvtContrSindPatr.IdeEvento.IndApuracao := tpIndApuracao(iapuMensal);
    EvtContrSindPatr.IdeEvento.perApur     := '2015-06';
    EvtContrSindPatr.IdeEvento.TpAmb       := TpTpAmb(0);
    EvtContrSindPatr.IdeEvento.ProcEmi     := TpProcEmi(0);
    EvtContrSindPatr.IdeEvento.VerProc     := '1.0';

    EvtContrSindPatr.IdeEmpregador.TpInsc := tpTpInsc(1);
    EvtContrSindPatr.IdeEmpregador.NrInsc := '0123456789';

    with EvtContrSindPatr.ContribSind.Add do
    begin
      cnpjSindic      := '01234567891111';
      tpContribSind   := tpTpContribSind(0);
      vlrContribSind  := 1500.50;
    end;
  end;
end;

procedure TFExemploEsocial.btnGerarClick(Sender: TObject);
begin

  ACBreSocial1.SSL.SelecionarCertificado;

  if (cbS1000.Checked) then
    GerareSocial1000;

  if (cbS1005.Checked) then
    GerareSocial1005;

  if (cbS1010.checked) then
    GerareSocial1010;

  if (cbS1020.Checked) then
    GerareSocial1020;

  if (cbS1030.Checked) then
    GerareSocial1030;

  if (cbS1035.checked) then
    GerareSocial1035;

  if (cbS1040.checked) then
    GerareSocial1040;

  if (cbS1050.checked) then
    GerareSocial1050;

  if (cbS1060.checked) then
    GerareSocial1060;

  if (cbS1070.checked) then
    GerareSocial1070;

  if (cbS1080.checked) then
    GerareSocial1080;

  if (cbS2100.checked) then
    GerareSocial2100;

  if (cbS1200.checked) then
    GerareSocial1200;

  if (cbS1202.checked) then
    GerareSocial1202;

  if (cbS1207.checked) then
    GerareSocial1207;

  if (cbS1210.checked) then
    GerareSocial1210;

  if (cbS1250.checked) then
    GerareSocial1250;

  if (cbS1260.checked) then
    GerareSocial1260;

  if (cbS1270.checked) then
    GerareSocial1270;

  if (cbS1280.checked) then
    GerareSocial1280;

  if (cbS1298.checked) then
    GerareSocial1298;

  if (cbS1299.checked) then
    GerareSocial1299;

  if (cbS1300.checked) then
    GerareSocial1300;

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
