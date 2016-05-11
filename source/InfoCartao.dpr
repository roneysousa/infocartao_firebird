program InfoCartao;

uses
  Forms,
  uInfoPrincipal in 'uInfoPrincipal.pas' {frmPrincipal},
  uFuncoes in 'uFuncoes.pas',
  udmInfoCartao in 'udmInfoCartao.pas' {dmInfoCartao: TDataModule},
  uCadClientes in 'uCadClientes.pas' {frmCadClientes},
  uLocClientes in 'uLocClientes.pas' {frmLocClientes},
  uConfRelClientes in 'uConfRelClientes.pas' {frmConfRelClientes},
  uCadCredenciado in 'uCadCredenciado.pas' {frmCadCredenciados},
  uLocCred in 'uLocCred.pas' {frmLocCred},
  uCadCartoes in 'uCadCartoes.pas' {frmCadCartoes},
  uLocCartaoCliente in 'uLocCartaoCliente.pas' {frmLocCartao},
  uCadVenda in 'uCadVenda.pas' {frmCadVenda},
  uConsultaVendas in 'uConsultaVendas.pas' {frmConsultaVendas},
  uDesbloqueio in 'uDesbloqueio.pas' {frmDesbloqueio},
  uGerarFatura in 'uGerarFatura.pas' {frmGerarFatura},
  uConsContasReceber in 'uConsContasReceber.pas' {frmConsContasReceber},
  uPagManual in 'uPagManual.pas' {frmPagaManual},
  uSeleClient in 'uSeleClient.pas' {frmSeleCliente},
  udmRelatorios in 'udmRelatorios.pas' {dmRelatorios: TDataModule},
  uPeriodo in 'uPeriodo.pas' {frmPeriodo},
  uEnvelope in 'uEnvelope.pas' {frmEnvelope},
  uPeriodoMovCred in 'uPeriodoMovCred.pas' {frmPeriodoMovCred},
  uVendas in 'uVendas.pas' {frmVendas},
  uCadUsuarios in 'uCadUsuarios.pas' {frmCadUsuarios},
  uLocUsuario in 'uLocUsuario.pas' {frmLocUsuarios},
  udmConsultas in 'udmConsultas.pas' {dmConsultas: TDataModule},
  uLogon in 'uLogon.pas' {frmLogon};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmInfoCartao, dmInfoCartao);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmConsultas, dmConsultas);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
