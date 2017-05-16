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
