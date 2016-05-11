// Sistema : InfoCart�o
// BD : Firebird
// Administra��o de cart�o de cr�dito
// PROGRAMADOR : Roney Erdemann
// Date : 14/04/2005
// Hora : 11:16

unit uInfoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin,typinfo,ImgList, StdCtrls,
  ExtCtrls, RXShell,uCadClientes,uCadCredenciado,uCadCartoes,uCadVenda
  , uConsultaVendas,uDesbloqueio, uGerarFatura, uConsContasReceber, uPagManual,
  jpeg;

{  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin,typinfo,, ImgList,uCadCredeciados,
  uCadCartoes, StdCtrls,uCadBancos,uConsultaVendas,uDesbloqueio,uEstratoCliente,
  uCadVenda,uContasReceber,uConfiguracoes,uGerarFatura,uPagManual,uCadUsuarios,
  uEmissaEtiquetas,uConsContasReceber, WinSkinData, ExtCtrls, XPMenu,
  RXShell;
}

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuMovimento: TMenuItem;
    mnuFinanceiro: TMenuItem;
    mnuRelatorio: TMenuItem;
    mnuUtilitarios: TMenuItem;
    mnuSobre: TMenuItem;
    StatusBar1: TStatusBar;
    barraFerram: TToolBar;
    mnuClienteItem: TMenuItem;
    mnuCredenciadosItem: TMenuItem;
    mnuAnlisedeCartaoItem: TMenuItem;
    mnuCartoesItem: TMenuItem;
    N1: TMenuItem;
    mnuSair: TMenuItem;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    btCliente: TToolButton;
    tbSair: TToolButton;
    ToolButton3: TToolButton;
    mnuJanela: TMenuItem;
    mnuCascataItem: TMenuItem;
    mnuLadoaLadoItem: TMenuItem;
    mnuMinimizarTodasItem: TMenuItem;
    mnuFecharTodasItem: TMenuItem;
    mnuNavegacao: TMenuItem;
    mnuPrimeiroItem: TMenuItem;
    mnuAnteriorItem: TMenuItem;
    mnuProximoItem: TMenuItem;
    mnuUltimo: TMenuItem;
    N2: TMenuItem;
    mnuAdicionarItem: TMenuItem;
    mnuEditarItem: TMenuItem;
    mnuExcluirItem: TMenuItem;
    N3: TMenuItem;
    mnuGravarItem: TMenuItem;
    mnuCancelarItem: TMenuItem;
    N4: TMenuItem;
    mnuLocalizarItem: TMenuItem;
    mnuRelCadastroItem: TMenuItem;
    mnuRelGerencialItem: TMenuItem;
    mnuCartesporClienteItem: TMenuItem;
    mnuEtiquetasdeClientesItem: TMenuItem;
    mnuTabelasItem: TMenuItem;
    mnuBancosItem: TMenuItem;
    mnuNaturezaItem: TMenuItem;
    mnuModalidadesItem: TMenuItem;
    mnuFeriadosItem: TMenuItem;
    btCartao: TToolButton;
    btCredenciado: TToolButton;
    btAnalise: TToolButton;
    mnuConsultaItem: TMenuItem;
    mnuDesbloqueioItem: TMenuItem;
    mnuMoviCaixaSubItem: TMenuItem;
    mnuEstratoClienteSubItem: TMenuItem;
    mnuVendaItem: TMenuItem;
    mnuCancelamentoVendaItem: TMenuItem;
    Caixa1: TMenuItem;
    mnuAberturaSubItem: TMenuItem;
    mnuFechamentoItem: TMenuItem;
    ContasaReceber1: TMenuItem;
    mnuCartaItem: TMenuItem;
    mnuAvisoItem: TMenuItem;
    mnuReciboItem: TMenuItem;
    mnuCongfiguracoesItem: TMenuItem;
    mnuEmissaoBoletosItem: TMenuItem;
    mnuContasSubItem: TMenuItem;
    mnuPagamentodeBoletosItem: TMenuItem;
    mnuAutomticaItem: TMenuItem;
    mnuManualItem: TMenuItem;
    mnuContasaReceberporClienteSubItem: TMenuItem;
    mnuContasRecebidasSubItem: TMenuItem;
    mnuUsuariosSubItem: TMenuItem;
    ToolButton5: TToolButton;
    OpenDialog1: TOpenDialog;
    mnuSitucaoSubItem: TMenuItem;
    mnuMovNaturezaSubItem: TMenuItem;
    mnuTotalGeralNaturezaSubItem: TMenuItem;
    mnuMovCaixaModaSubItem: TMenuItem;
    mnuMovVendaCredSubItem: TMenuItem;
    N5: TMenuItem;
    mnuContasVencidasSubItem: TMenuItem;
    mnuContasAVencerSubItem: TMenuItem;
    mnuContasRecebidas: TMenuItem;
    btVenda: TToolButton;
    btDesbloquear: TToolButton;
    btCancelaVenda: TToolButton;
    Image1: TImage;
    mnuReciboSubItem2: TMenuItem;
    mnuReciboSubItem3: TMenuItem;
    mnuApresentacaoItem: TMenuItem;
    btConsulta: TToolButton;
    EnvelopedeCliente1: TMenuItem;
    RxTrayIcon1: TRxTrayIcon;
    mnuFichadeClientesItem: TMenuItem;
    N6: TMenuItem;
    BoletosAbertos1: TMenuItem;
    procedure mnuSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure mnuClienteItemClick(Sender: TObject);
    procedure mnuCascataItemClick(Sender: TObject);
    procedure mnuLadoaLadoItemClick(Sender: TObject);
    procedure mnuMinimizarTodasItemClick(Sender: TObject);
    procedure mnuFecharTodasItemClick(Sender: TObject);
    procedure mnuPrimeiroItemClick(Sender: TObject);
    procedure mnuAnteriorItemClick(Sender: TObject);
    procedure mnuProximoItemClick(Sender: TObject);
    procedure mnuUltimoClick(Sender: TObject);
    procedure mnuAdicionarItemClick(Sender: TObject);
    procedure mnuEditarItemClick(Sender: TObject);
    procedure mnuExcluirItemClick(Sender: TObject);
    procedure mnuGravarItemClick(Sender: TObject);
    procedure mnuCancelarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuLocalizarItemClick(Sender: TObject);
    procedure mnuCredenciadosItemClick(Sender: TObject);
    procedure mnuAnlisedeCartaoItemClick(Sender: TObject);
    procedure mnuCartoesItemClick(Sender: TObject);
    procedure mnuCartesporClienteItemClick(Sender: TObject);
    procedure mnuBancosItemClick(Sender: TObject);
    procedure mnuConsultaItemClick(Sender: TObject);
    procedure mnuNaturezaItemClick(Sender: TObject);
    procedure mnuModalidadesItemClick(Sender: TObject);
    procedure mnuFeriadosItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuDesbloqueioItemClick(Sender: TObject);
    procedure mnuEstratoClienteSubItemClick(Sender: TObject);
    procedure mnuVendaItemClick(Sender: TObject);
    procedure mnuCancelamentoVendaItemClick(Sender: TObject);
    procedure mnuAberturaSubItemClick(Sender: TObject);
    procedure mnuFechamentoItemClick(Sender: TObject);
    procedure mnuAvisoItemClick(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure mnuCongfiguracoesItemClick(Sender: TObject);
    procedure mnuEmissaoBoletosItemClick(Sender: TObject);
    procedure mnuContasSubItemClick(Sender: TObject);
    procedure mnuManualItemClick(Sender: TObject);
    procedure mnuContasaReceberporClienteSubItemClick(Sender: TObject);
    procedure mnuContasRecebidasSubItemClick(Sender: TObject);
    procedure mnuAutomticaItemClick(Sender: TObject);
    procedure mnuUsuariosSubItemClick(Sender: TObject);
    procedure mnuEtiquetasdeClientesItemClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuSitucaoSubItemClick(Sender: TObject);
    procedure mnuMoviCaixaSubItemClick(Sender: TObject);
    procedure mnuContasVencidasSubItemClick(Sender: TObject);
    procedure mnuContasAVencerSubItemClick(Sender: TObject);
    procedure mnuContasRecebidasClick(Sender: TObject);
    procedure mnuTotalGeralNaturezaSubItemClick(Sender: TObject);
    procedure mnuSobreClick(Sender: TObject);
    procedure mnuMovVendaCredSubItemClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnuMovNaturezaSubItemClick(Sender: TObject);
    procedure mnuMovCaixaModaSubItemClick(Sender: TObject);
    procedure mnuReciboSubItem2Click(Sender: TObject);
    procedure mnuReciboSubItem3Click(Sender: TObject);
    procedure mnuApresentacaoItemClick(Sender: TObject);
    procedure mnuEnvNFaturaSubItemClick(Sender: TObject);
    procedure EnvelopedeCliente1Click(Sender: TObject);
    procedure mnuFichadeClientesItemClick(Sender: TObject);
    procedure BoletosAbertos1Click(Sender: TObject);
  private
    function DataExtenso(Data:TDateTime): String;
    procedure DisplayHint(Sender: TObject);
    Procedure Autenticar;
    { Private declarations }
  public
    { Public declarations }
    Function ExisteForm(pForm:TForm):boolean;
    Function PasswordInputBox(const ACaption, APrompt:string): string;
    Function Acesso(M_CDACES, M_NMFORM: String): Boolean;
    Procedure ATUALIZAR_ACESSOS;
  end;

Const
    M_USERMASTER = 'ADMIN';
    M_SNMASTER   = 'ADMIN';
    M_AUTEN      = 'SuperSonic';

var
  JanelaAtiva:String;
  M_CDUSUA,M_NMUSUA, M_NMEMPR : String;
  frmPrincipal: TfrmPrincipal;
  frmCadClientes : TfrmCadClientes;
  frmCadCredenciados : TfrmCadCredenciados;
  frmCadCartoes : TfrmCadCartoes;
  frmCadVenda : TfrmCadVenda;
  frmConsultaVendas : TfrmConsultaVendas;
  frmDesbloqueio : TfrmDesbloqueio;
  frmGerarFatura : TfrmGerarFatura;
  frmConsContasReceber : TfrmConsContasReceber;
  frmPagaManual : TfrmPagaManual;

{  frmCadBancos : TfrmCadBancos;
  frmDesbloqueio : TfrmDesbloqueio;
  frmEstratoCliente : TfrmEstratoCliente;
  frmContas : TfrmContas;
  frmConfiguracao : TfrmConfiguracao;

  frmCadUsuarios : TfrmCadUsuarios;
  frmEtiquetas : TfrmEtiquetas;
  frmConsContasReceber : TfrmConsContasReceber;}

implementation

uses udmInfoCartao, uSeleClient, uVendas, uPeriodoMovCred, uEnvelope,
  uConfRelClientes, uCadUsuarios, uLogon;

const
ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
ScreenHeight: LongInt = 600;

{uses uDMcartao, uSeleClient, uCadNatureza, uCadModa, uCadFeriado,uFuncoes,
  uAberturaCaixa, uContaReceber, uBaixaAuto, uRelEtiqueta, uLogon1,
  uSituacaoCaixa, uPeriodo, uSobreCartao, uPeriodoMovCred, uRelReciboMod2,
  uEnvelope, uConfigFichaClien, uRelBoletoAberto;}

{const
ScreenWidth: LongInt  = 1024;  //I designed my form in 800x600 mode.
ScreenHeight: LongInt = 768;}


{$R *.dfm}

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
     If Application.MessageBox('Sair do Sistema?',
         'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          Application.Terminate; 
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If Application.MessageBox('Sair do Sistema?',
     'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
        Canclose:=False;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
     ATUALIZAR_ACESSOS;
     //
     M_CDUSUA := '001';
     M_NMUSUA := 'INFOG2';
     //
     mnuNavegacao.Enabled :=  False;
     // Barra de status
     StatusBar1.Panels[3].Text := M_CDUSUA + ' - '+ M_NMUSUA;
     //DataExtenso(Date);
     StatusBar1.Panels[0].Text := ExtractFilePath( Application.ExeName );
end;

function TfrmPrincipal.DataExtenso(Data: TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Ter�a-feira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'S�bado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Mar�o';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia] + ', ' +
  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

procedure TfrmPrincipal.mnuClienteItemClick(Sender: TObject);
begin
    mnuFecharTodasItemClick(Sender);
    //
    dmInfoCartao.cdsClientes.Close;
    With dmInfoCartao.dstClientes do
    Begin
         Active := False;
         CommandText := 'Select * from ACCCLI Where (CLI_CDCLIE = :pCDCLIE)';
         Params.ParamByName('pCDCLIE').AsString := dmInfoCartao.mscodigo('CLI_CDCLIE','ACCCLI');
         Active := True;
    End;
    dmInfoCartao.cdsClientes.Open;
    //
    If ExisteForm(frmCadClientes) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmCadClientes := TfrmCadClientes.Create(Self);
       frmCadClientes.tbsAnalise.tabVisible := False;
       uCadClientes.M_FLANAL := 'N';
       LockWindowUpdate(0);
    End
    Else
    begin
        frmCadClientes.BringToFront;
        frmCadClientes.tbsAnalise.tabVisible := False;
        uCadClientes.M_FLANAL := 'N';
        frmCadClientes.Focused;
    End;
end;

function TfrmPrincipal.ExisteForm(pForm: TForm): boolean;
Var
    I:integer;
begin
    ExisteForm := False;
    For I:= 0 to Screen.FormCount -1 do
        If Screen.Forms[I] = pForm Then
        begin
            ExisteForm := True;
            Break;
        End;
end;

procedure TfrmPrincipal.mnuCascataItemClick(Sender: TObject);
begin
      //Coloca todas as janelas abertas em cascata.
       Cascade;
end;

procedure TfrmPrincipal.mnuLadoaLadoItemClick(Sender: TObject);
begin
      //Coloca todas as janelas abertas em lado a lado.
        Tile;
end;

procedure TfrmPrincipal.mnuMinimizarTodasItemClick(Sender: TObject);
//minimizar todas as janelas abertas.
Var
   I:integer;
begin
   For I:=MdiChildCount-1 downto 0 do
        MdiChildren[I].WindowState:=wsMinimized;
end;

procedure TfrmPrincipal.mnuFecharTodasItemClick(Sender: TObject);
//Fechar todas as janelas abertas.
var
  I: Integer;
begin
  with frmPrincipal do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
end;

procedure TfrmPrincipal.mnuPrimeiroItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btPrimeiroClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btPrimeiroClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btPrimeiroClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btPrimeiroClick(Sender);}
end;

procedure TfrmPrincipal.mnuAnteriorItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btAnteriorClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btAnteriorClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btAnteriorClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btAnteriorClick(Sender);}
end;

procedure TfrmPrincipal.mnuProximoItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btProximoClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btProximoClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btProximoClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btProximoClick(Sender);}
end;

procedure TfrmPrincipal.mnuUltimoClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btUltimoClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btUltimoClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btUltimoClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btUltimoClick(Sender);}
end;

procedure TfrmPrincipal.mnuAdicionarItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btAdicionarClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btAdicionarClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btAdicionarClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btAdicionarClick(Sender);}
end;

procedure TfrmPrincipal.mnuEditarItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btEditarClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btEditarClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btEditarClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btEditarClick(Sender);}
end;

procedure TfrmPrincipal.mnuExcluirItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btExcluirClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btExcluirClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btExcluirClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btExcluirClick(Sender);}
end;

procedure TfrmPrincipal.mnuGravarItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btGravarClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btGravarClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btGravarClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btGravarClick(Sender);}
end;

procedure TfrmPrincipal.mnuCancelarItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
        frmCadCliente.btCancelarClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btCancelarClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btCancelarClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btCancelarClick(Sender);}
end;

procedure TfrmPrincipal.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := Application.Hint;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  scaled := true;
  if (screen.width <> ScreenWidth) then
  begin
    height := longint(height) * longint(screen.height) DIV ScreenHeight;
    width := longint(width) * longint(screen.width) DIV ScreenWidth;
    scaleBy(screen.width, ScreenWidth);
  end;
     //
     ShortDateFormat := 'dd/mm/yyyy';
     Application.OnHint := DisplayHint;
     //
     Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
     Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + StatusBar1.Height);
end;

procedure TfrmPrincipal.mnuLocalizarItemClick(Sender: TObject);
begin
{     If JanelaAtiva = 'CAD_CLIENTE' Then
          frmCadCliente.btLocalizarClick(Sender);
     If JanelaAtiva = 'CAD_CREDECIADO' Then
        frmCadCredeciados.btLocalizarClick(Sender);
     If JanelaAtiva = 'CAD_CARTAO' Then
        frmCadCartao.btLocalizarClick(Sender);
     If (JanelaAtiva = 'CAD_USUARIO') Then
        frmCadUsuarios.btLocalizarClick(Sender);}
end;

procedure TfrmPrincipal.mnuCredenciadosItemClick(Sender: TObject);
begin
    If ExisteForm(frmCadCredenciados) = False Then
    begin
       mnuFecharTodasItemClick(Sender);
       LockWindowUpdate(Handle);
       frmCadCredenciados := TfrmCadCredenciados.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmCadCredenciados.BringToFront;
        frmCadCredenciados.Focused;
    End;
end;

procedure TfrmPrincipal.mnuAnlisedeCartaoItemClick(Sender: TObject);
begin
    mnuFecharTodasItemClick(Sender);
    //
    {dmInfoCartao.dstClientes.CommandText := 'Select * from ACCCLI Where CLI_FLSITU='
                           +QuotedStr('A')+' order by CLI_NMCLIE';}
    //
    dmInfoCartao.cdsClientes.Close;
    With dmInfoCartao.dstClientes do
    Begin
         Active := False;
         CommandText := 'Select * from ACCCLI Where (CLI_CDCLIE = :pCDCLIE)';
         CommandText := CommandText + ' and (CLI_FLSITU='+QuotedStr('A')+')';
         Params.ParamByName('pCDCLIE').AsString := dmInfoCartao.mscodigo('CLI_CDCLIE','ACCCLI');
         Active := True;
    End;
    dmInfoCartao.cdsClientes.Open;
    //
    If ExisteForm(frmCadClientes) = False Then
    begin
       mnuFecharTodasItemClick(Sender);
       LockWindowUpdate(Handle);
       frmCadClientes := TfrmCadClientes.Create(Self);
       uCadClientes.M_FLANAL := 'S';
       //
       With frmCadClientes do
       begin
            Caption := 'Analise de credito';
            tbsAnalise.tabVisible := True;
            Label48.Visible := False;
            Label66.Visible := False;
            dbcSituacao.Visible := False;
            lbl_porcentagem.Visible := False;
            dbeVLDESC.Visible := False;
            //
            btAdicionar.Visible := False;
            btExcluir.Visible := False;
            //
            btEditar.Left    := 8;
            btLocalizar.Left := 88;
       End;
       //
       LockWindowUpdate(0);
    End
    Else
    begin
       With frmCadClientes do
       begin
            Caption := 'An�lise de cr�dito';
            uCadClientes.M_FLANAL := 'S';
            BringToFront;
            tbsAnalise.tabVisible := True;
            Focused;
       End;
    End;
end;

procedure TfrmPrincipal.mnuCartoesItemClick(Sender: TObject);
begin
    dmInfoCartao.cdsCartoes.Close;
    With dmInfoCartao.dstCartoes do
    Begin
         Active := False;
         CommandText := 'Select * from ACCCAR Where (CAR_NRCART = :pNRCART)';
         Params.ParamByName('pNRCART').AsString := dmInfoCartao.mscodigo('CAR_NRCART','ACCCAR');
         Active := True;
    End;
    dmInfoCartao.cdsCartoes.Open;
    //
    If ExisteForm(frmCadCartoes) = False Then
    begin
       //mnuFecharTodasItemClick(Sender);
       LockWindowUpdate(Handle);
       frmCadCartoes := TfrmCadCartoes.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmCadCartoes.BringToFront;
        frmCadCartoes.Focused;
    End;
end;

procedure TfrmPrincipal.mnuCartesporClienteItemClick(Sender: TObject);
begin
      Application.CreateForm(TfrmSeleCliente, frmSeleCliente); //Carrega form na mem�ria
      //frmSeleCliente.GridCliente.DataSource := frmSeleCliente.dsClientes;
      frmSeleCliente.Caption := 'RELA��ES DE CART�ES POR CLIENTE';
      frmSeleCliente.ShowModal;             //Mostra form em modo exclusivo
      frmSeleCliente.Free;                  //  Libera Mem�ria
end;

function TfrmPrincipal.PasswordInputBox(const ACaption,
  APrompt: string): string;
// InputBox para entrada de Senhas (com caracter *)
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      PasswordChar := '*';
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := Value;
    end;
  finally
    Form.Free;
    Form:=nil;
  end;
end;

procedure TfrmPrincipal.Autenticar;
Var
   Masters: textfile;
begin
     If PasswordInputBox('Registro','Digite senha de registro') = M_AUTEN then
     begin
             try
                AssignFile(Masters, 'c:\Windows\CFGNS.G2');
                if not FileExists('c:\Windows\CFGNS.G2') then Rewrite(Masters,'c:\Windows\CFGNS.G2');
                    Append(Masters);
                    WriteLn(Masters, 'Sistema legalmente registrado. '+DatetoStr(Date)+' - '+TimeToStr(Time));
                    WriteLn(Masters, 'Copyright NetCart por InfoG2 � - Tecnologia em Sistemas...');
                    WriteLn(Masters, '2004 - Todos os direitos reservados - OK.');
                    // Mensagem para o usu�rio
                    Application.MessageBox('Registro do sistema registrado com sucesso!!!',
                                  'ATEN��O', MB_OK+MB_ICONINFORMATION);
                    Exit;
             finally
                    CloseFile(Masters);
             End;
     End
     Else
     begin
           Application.MessageBox('Este sistema n�o est� registrado!!!',
                                  'Senha incorreta...', MB_OK+MB_ICONSTOP);
           Application.Terminate;
     end;
end;

procedure TfrmPrincipal.mnuBancosItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmCadBancos, frmCadBancos);  //Carrega form na mem�ria
      frmCadBancos.ShowModal;   //Mostra form em modo exclusivo
      frmCadBancos.Free;        //Libera Mem�ria  }

{    If ExisteForm(frmCadBancos) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmCadBancos := TfrmCadBancos.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmCadBancos.BringToFront;
        frmCadBancos.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuConsultaItemClick(Sender: TObject);
begin
    If ExisteForm(frmConsultaVendas) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmConsultaVendas := TfrmConsultaVendas.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmConsultaVendas.BringToFront;
        frmConsultaVendas.Focused;
    End;
end;

procedure TfrmPrincipal.mnuNaturezaItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmCadNatureza, frmCadNatureza);   // Carrega form na mem�ria
      frmCadNatureza.ShowModal;   // Mostra form em modo exclusivo
      frmCadNatureza.Free;    //  Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuModalidadesItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmCadModalidade, frmCadModalidade);  //Carrega form na mem�ria
      frmCadModalidade.ShowModal;         // Mostra form em modo exclusivo
      frmCadModalidade.Free;              // Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuFeriadosItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmCadFeriados, frmCadFeriados);  // Carrega form na mem�ria
      frmCadFeriados.ShowModal;               // Mostra form em modo exclusivo
      frmCadFeriados.Free;                  // Libera Mem�ria}
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
i: integer;
begin
     {with dmCartao.Session do
     begin
        for i:= 0 to DatabaseCount - 1 do
            Databases[I].Close;
     end;}
     //
     Action := caFree;
end;

procedure TfrmPrincipal.mnuDesbloqueioItemClick(Sender: TObject);
begin
    mnuFecharTodasItemClick(Sender);
    //
    If ExisteForm(frmDesbloqueio) = False Then
    begin
         LockWindowUpdate(Handle);
         frmDesbloqueio := TfrmDesbloqueio.Create(Self);
         LockWindowUpdate(0);
    End
    Else
    begin
         frmDesbloqueio.BringToFront;
         frmDesbloqueio.Focused;
    End;
end;

procedure TfrmPrincipal.mnuEstratoClienteSubItemClick(Sender: TObject);
begin
{    If ExisteForm(frmEstratoCliente) = False Then
    begin
       //mnuFecharTodasItemClick(Sender);
       LockWindowUpdate(Handle);
       frmEstratoCliente := TfrmEstratoCliente.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmEstratoCliente.BringToFront;
        frmEstratoCliente.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuVendaItemClick(Sender: TObject);
begin
    Try
       Application.CreateForm(TfrmVendas, frmVendas);
       frmVendas.WindowState := wsMaximized;
       frmVendas.ShowModal;
    Finally
       frmVendas.Free;
    End;

   { If ExisteForm(frmCadVenda) = False Then
    begin
       LockWindowUpdate(Handle);
       frmCadVenda := TfrmCadVenda.Create(Self);
       frmCadVenda.Caption := 'VENDA';
       LockWindowUpdate(0);
    End
    Else
    begin
        frmCadVenda.BringToFront;
        frmCadVenda.Caption := 'VENDA';
        frmCadVenda.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuCancelamentoVendaItemClick(Sender: TObject);
begin
    Try
       Application.CreateForm(TfrmVendas, frmVendas);
       frmVendas.WindowState := wsMaximized;
       frmVendas.Caption := 'CANCELAMENTO DE VENDA';
       frmVendas.pnlDadosPessoais.Visible := False;
       frmVendas.btConfirmar.Visible := False;
       frmVendas.btCancelar.Visible  := False;
       frmVendas.edNRCART.Visible  := False;
       frmVendas.edNRCART2.Left    := frmVendas.edNRCART.Left;
       frmVendas.edNRCART2.Top     := frmVendas.edNRCART.Top;
       frmVendas.edNRCART2.Visible := True;
       frmVendas.ShowModal;
    Finally
       frmVendas.Free;
    End;
{    If ExisteForm(frmCadVenda) = False Then
    begin
       LockWindowUpdate(Handle);
       //dmCartao.tbMovimento.Open;
       frmCadVenda := TfrmCadVenda.Create(Self);
       frmCadVenda.Caption := 'CANCELAMENTO DE VENDA';
       frmCadVenda.edNRCART.Visible  := False;
       frmCadVenda.edNRCART2.Left    := frmCadVenda.edNRCART.Left;
       frmCadVenda.edNRCART2.Top     := frmCadVenda.edNRCART.Top;
       frmCadVenda.edNRCART2.Visible := True;
       frmCadVenda.edNRCART2.SetFocus;
       LockWindowUpdate(0);
    End
    Else
    begin
        frmCadVenda.BringToFront;
        frmCadVenda.Caption := 'CANCELAMENTO DE VENDA';
        frmCadVenda.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuAberturaSubItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa );  //  Carrega form na mem�ria
      frmAberturaCaixa.Caption := 'Abertura do Caixa';
      frmAberturaCaixa.ShowModal;             //  Mostra form em modo exclusivo
      frmAberturaCaixa.Free;            //  Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuFechamentoItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa);   //Carrega form na mem�ria
      frmAberturaCaixa.Caption := 'Fechamento do Caixa';
      frmAberturaCaixa.ShowModal;           // Mostra form em modo exclusivo
      frmAberturaCaixa.Free;                // Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuAvisoItemClick(Sender: TObject);
begin
     Application.CreateForm(TfrmSeleCliente, frmSeleCliente);     //Carrega form na mem�ria
     Try
         frmSeleCliente.Caption := 'CARTA DE AVISO PARA CLIENTE';
         frmSeleCliente.ShowModal;          // Mostra form em modo exclusivo}
     Except
         frmSeleCliente.Free;                //Libera Mem�ria
     End;
end;

procedure TfrmPrincipal.Recibo1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmSeleCliente, frmSeleCliente); //Carrega form na mem�ria
     frmSeleCliente.Caption := 'RECIBO DE CLIENTE';
     frmSeleCliente.ShowModal;    // Mostra form em modo exclusivo
     frmSeleCliente.Free;         // Libera Mem�ria
end;

procedure TfrmPrincipal.mnuCongfiguracoesItemClick(Sender: TObject);
begin
    mnuFecharTodasItemClick(Sender);
    //
{    If ExisteForm(frmConfiguracao) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmConfiguracao := TfrmConfiguracao.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmConfiguracao.BringToFront;
        frmConfiguracao.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuEmissaoBoletosItemClick(Sender: TObject);
begin
    mnuFecharTodasItemClick(Sender);
    //
    If ExisteForm(frmGerarFatura) = False Then
    begin
       LockWindowUpdate(Handle);
       frmGerarFatura := TfrmGerarFatura.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmGerarFatura.BringToFront;
        frmGerarFatura.Focused;
    End;
end;

procedure TfrmPrincipal.mnuContasSubItemClick(Sender: TObject);
begin
{    If ExisteForm(frmContas) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmContas := TfrmContas.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmContas.BringToFront;
        frmContas.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuManualItemClick(Sender: TObject);
begin
    If ExisteForm(frmPagaManual) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmPagaManual := TfrmPagaManual.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmPagaManual.BringToFront;
        frmPagaManual.Focused;
    End;
end;

procedure TfrmPrincipal.mnuContasaReceberporClienteSubItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmContaReceber,frmContaReceber );  //Carrega form na mem�ria
      frmContaReceber.Caption := 'Conta a Receber por Cliente - Boleto';
      frmContaReceber.ShowModal;   //Mostra form em modo exclusivo
      frmContaReceber.Free; // Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuContasRecebidasSubItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmContaReceber,frmContaReceber );  //Carrega form na mem�ria
      frmContaReceber.Caption := 'Conta Recebidas via CEF - Boleto';
      frmContaReceber.ShowModal;   //Mostra form em modo exclusivo
      frmContaReceber.Free;    // Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuAutomticaItemClick(Sender: TObject);
begin
{      Application.CreateForm(TfrmBaixaAuto,frmBaixaAuto);  //  Carrega form na mem�ria
      frmBaixaAuto.ShowModal;    // Mostra form em modo exclusivo
      frmBaixaAuto.Free;         // Libera Mem�ria}
end;

function TfrmPrincipal.Acesso(M_CDACES, M_NMFORM: String): Boolean;
begin
{    If (dmCartao.tbAcesso.Active = False) Then
       dmCartao.tbAcesso.Open;
    If (dmCartao.tbAcesso.Locate('ACE_CDUSUA;ACE_NMFORM;ACE_ACESSO',
           VarArrayOf([M_CDACES, M_NMFORM, 'True']),[])) Then
        result := True          // Liberar o Acesso
    Else
        result := False;
    dmCartao.tbAcesso.Close;}
end;

procedure TfrmPrincipal.mnuUsuariosSubItemClick(Sender: TObject);
begin
     Application.CreateForm(TfrmCadUsuarios, frmCadUsuarios);  //  Carrega form na mem�ria
     Try
        frmCadUsuarios.ShowModal;    // Mostra form em modo exclusivo
     Finally
        frmCadUsuarios.Free;         // Libera Mem�ria
     End;
end;

procedure TfrmPrincipal.mnuEtiquetasdeClientesItemClick(Sender: TObject);
begin
{    If ExisteForm(frmEtiquetas) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmEtiquetas := TfrmEtiquetas.Create(Self);
       LockWindowUpdate(0);
    End
    Else
    begin
        frmEtiquetas.BringToFront;
        frmEtiquetas.Focused;
    End;}
end;

procedure TfrmPrincipal.ToolButton4Click(Sender: TObject);
begin
    If OpenDialog1.Execute Then
    begin
       { SkinData1.Active   := False;
        SkinData1.SkinFile := OpenDialog1.FileName;
        SkinData1.Active   := True;}
    End;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
{    Application.CreateForm(TfrmLogon, frmLogon);
    Try
         frmLogon.ShowModal;
    finally
         frmLogon.Free;
    End;}
end;

procedure TfrmPrincipal.mnuSitucaoSubItemClick(Sender: TObject);
begin
{    Application.CreateForm(TfrmSituacao, frmSituacao);
    frmSituacao.ShowModal;
    frmSituacao.Free;}
end;

procedure TfrmPrincipal.mnuMoviCaixaSubItemClick(Sender: TObject);
begin
{  Try
    Application.CreateForm(TfrmPeriodo, frmPeriodo);
    frmPeriodo.ShowModal;
  Finally
    frmPeriodo.Free;
  End;}
end;

procedure TfrmPrincipal.mnuContasVencidasSubItemClick(Sender: TObject);
begin
    If ExisteForm(frmConsContasReceber) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmConsContasReceber := TfrmConsContasReceber.Create(Self);
       frmConsContasReceber.Caption := 'Consultas de Contas a Receber - Vencidas';
       uConsContasReceber.M_NRCONS := '1';
       frmConsContasReceber.lbl_Titulo.Caption := frmConsContasReceber.Caption;
       LockWindowUpdate(0);
    End
    Else
    begin
        frmConsContasReceber.BringToFront;
        frmConsContasReceber.Caption := 'Consultas de Contas a Receber - Vencidas';
        uConsContasReceber.M_NRCONS := '1';
        frmConsContasReceber.lbl_Titulo.Caption := frmConsContasReceber.Caption;
        frmConsContasReceber.Focused;
    End;
end;

procedure TfrmPrincipal.mnuContasAVencerSubItemClick(Sender: TObject);
begin
{    If ExisteForm(frmConsContasReceber) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmConsContasReceber := TfrmConsContasReceber.Create(Self);
       frmConsContasReceber.Caption := 'Consultas de Contas a Receber - A Vencer';
       uConsContasReceber.M_NRCONS  := '2';
       frmConsContasReceber.lbl_Titulo.Caption := frmConsContasReceber.Caption;
       LockWindowUpdate(0);
    End
    Else
    begin
        frmConsContasReceber.BringToFront;
        frmConsContasReceber.Caption := 'Consultas de Contas a Receber - A Vencer';
        uConsContasReceber.M_NRCONS  := '2';
        frmConsContasReceber.lbl_Titulo.Caption := frmConsContasReceber.Caption;
        frmConsContasReceber.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuContasRecebidasClick(Sender: TObject);
begin
{    If ExisteForm(frmConsContasReceber) = False Then
    begin
       //FecharTodas1Click(Sender);
       LockWindowUpdate(Handle);
       frmConsContasReceber := TfrmConsContasReceber.Create(Self);
       frmConsContasReceber.Caption := 'Consultas de Contas a Receber - Recebidas';
       uConsContasReceber.M_NRCONS  := '3';
       frmConsContasReceber.lbl_Titulo.Caption := frmConsContasReceber.Caption;
       LockWindowUpdate(0);
    End
    Else
    begin
        frmConsContasReceber.BringToFront;
        frmConsContasReceber.Caption := 'Consultas de Contas a Receber - Recebidas';
        uConsContasReceber.M_NRCONS  := '3';
        frmConsContasReceber.lbl_Titulo.Caption := frmConsContasReceber.Caption;
        frmConsContasReceber.Focused;
    End;}
end;

procedure TfrmPrincipal.mnuTotalGeralNaturezaSubItemClick(Sender: TObject);
begin
{  Try
    Application.CreateForm(TfrmPeriodo, frmPeriodo);
    frmPeriodo.Caption := 'Total Geral das Naturezas';
    frmPeriodo.ShowModal;
  Finally
    frmPeriodo.Free;
  End;}
end;

procedure TfrmPrincipal.mnuSobreClick(Sender: TObject);
begin
{  Try
      Application.CreateForm(TfrmSobre, frmSobre);
      frmSobre.ShowModal;
  Finally
      frmSobre.Free;
  End;}
end;

procedure TfrmPrincipal.mnuMovVendaCredSubItemClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmPeriodoMovCred,frmPeriodoMovCred);
      frmPeriodoMovCred.ShowModal;
  Finally
      frmPeriodoMovCred.Free;
  End;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
{     If (dmCartao.tbParam.Active = False) Then
       dmCartao.tbParam.Open;
     //
     dmCartao.tbParam.Edit;
     Image1.Picture.Assign(dmCartao.tbParamPAR_IMLOGO);
     dmCartao.tbParam.Cancel;
     dmCartao.tbParam.Close;}
     //
     Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
     Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + StatusBar1.Height);
end;

procedure TfrmPrincipal.mnuMovNaturezaSubItemClick(Sender: TObject);
begin
     ShowMessage('Modulo n�o conclu�do...');
end;

procedure TfrmPrincipal.mnuMovCaixaModaSubItemClick(Sender: TObject);
begin
     ShowMessage('Modulo n�o conclu�do...');
end;

procedure TfrmPrincipal.mnuReciboSubItem2Click(Sender: TObject);
begin
{     Application.CreateForm(TfrmRelReciboMod2, frmRelReciboMod2);  // Carrega form na mem�ria
     //
     frmRelReciboMod2.txtMes.Caption := uFuncoes.DataExtenso(Date()) ;
     //
     frmRelReciboMod2.qrReciboMod2.Preview;    //Mostra form em modo exclusivo}
end;

procedure TfrmPrincipal.mnuReciboSubItem3Click(Sender: TObject);
begin
     Application.CreateForm(TfrmSeleCliente, frmSeleCliente);  //Carrega form na mem�ria
     frmSeleCliente.Caption := 'RECEBIMENTO DE CLIENTE';
     frmSeleCliente.ShowModal;    // Mostra form em modo exclusivo
     frmSeleCliente.Free;         // Libera Mem�ria}
end;

procedure TfrmPrincipal.mnuApresentacaoItemClick(Sender: TObject);
begin
     Application.CreateForm(TfrmSeleCliente, frmSeleCliente);  //Carrega form na mem�ria
     frmSeleCliente.Caption := 'APRESENTA��O DO CART�O';
     frmSeleCliente.ShowModal;          // Mostra form em modo exclusivo
     frmSeleCliente.Free;                  //  Libera Mem�ria
end;

procedure TfrmPrincipal.mnuEnvNFaturaSubItemClick(Sender: TObject);
begin
{     Application.CreateForm(TfrmEnvelope, frmEnvelope);  //  Carrega form na mem�ria
     Try
       If (dmCartao.tbBoleto.Active = False) Then
           dmCartao.tbBoleto.Open;
           dmCartao.tbBoleto.IndexFieldNames := 'BOL_NMSACA';
       //
       frmEnvelope.Caption := 'Envelope: Fatura';
       frmEnvelope.tsCliente.TabVisible := False;
       frmEnvelope.tsFatura.TabVisible  := True;
       frmEnvelope.ShowModal;    // Mostra form em modo exclusivo
     Finally
       frmSeleCliente.Free;    // Libera Mem�ria
     End;}
end;

procedure TfrmPrincipal.ATUALIZAR_ACESSOS;
begin
     // Modulo cadastro de clientes
{     If not Acesso(M_CDUSUA,'frmCadCliente') Then
     begin
          mnuClienteItem.Enabled := False;
          btCliente.Enabled      := False;}
     {End;
     // Modulo cadastro de credenciado
     If not Acesso(M_CDUSUA,'frmCadCredeciados') Then
     begin
          mnuCredenciadosItem.Enabled := False;
          btCredenciado.Enabled       := False;}
     {End;
     // Modulo Analise de cart�o
     If not Acesso(M_CDUSUA,'frmCadClienteAna') Then
     begin
          mnuAnlisedeCartaoItem.Enabled := False;
          btAnalise.Enabled             := False;
     {End;
     // Modulo cadastro de cart�o
     If not Acesso(M_CDUSUA,'frmCadCartao') Then
     begin
          mnuCartoesItem.Enabled := False;
          btCartao.Enabled       := False;}
     {End;
     // Modulo vendas
     If not Acesso(M_CDUSUA,'frmCadVenda') Then
     begin
          mnuVendaItem.Enabled := False;
          btVenda.Enabled      := False;
     {End;
     // Modulo desbloqueio de Cart�o
     If not Acesso(M_CDUSUA,'frmDesbloqueio') Then
     begin
          mnuDesbloqueioItem.Enabled := False;
          btDesbloquear.Enabled      := False;
     {End;
     // Modulo cancelar venda
     If not Acesso(M_CDUSUA,'frmCadVendaCancelar') Then
     begin
          mnuCancelamentoVendaItem.Enabled := False;
          btCancelaVenda.Enabled           := False;
     {End;
     // Modulo Consulta
     If not Acesso(M_CDUSUA,'frmConsultaVendas') Then
     begin
          mnuConsultaItem.Enabled := False;
          btConsulta.Enabled      := False;
     {End;
     // Modulo abertura de caixa
     If not Acesso(M_CDUSUA,'frmAberturaCaixa') Then}
          mnuAberturaSubItem.Enabled := False;
     // Modulo fechamento de caixa
     {If not Acesso(M_CDUSUA,'frmFechamentoCaixa') Then}
          mnuFechamentoItem.Enabled := False;
     // Modulo Situa��o do caixa
     //If not Acesso(M_CDUSUA,'frmSituacao') Then
          mnuSitucaoSubItem.Enabled := False;
     // Modulo contas de Boletos
     {If not Acesso(M_CDUSUA,'frmContas') Then
          mnuContasSubItem.Enabled := False;}
     // Consulta Contas as vencer
     //If not Acesso(M_CDUSUA,'frmContasRecAvencer') Then
          mnuContasAVencerSubItem.Enabled := False;
     // Consulta Contas Recebidas
     //If not Acesso(M_CDUSUA,'frmContasRecebidas') Then
          mnuContasRecebidas.Enabled := False;
     // Consulta Contas as Vencidas
     //If not Acesso(M_CDUSUA,'frmContasVencidas') Then
         // mnuContasVencidasSubItem.Enabled := False;
     // Modulo Emiss�o de boletos
     //If not Acesso(M_CDUSUA,'frmGerarFatura') Then
          //mnuEmissaoBoletosItem.Enabled := False;
     // Modulo Baixa automatica
     //If not Acesso(M_CDUSUA,'frmBaixaAuto') Then
          mnuAutomticaItem.Enabled := False;
     // Modulo Baixa manual
     //If not Acesso(M_CDUSUA,'frmPagaManual') Then
         // mnuManualItem.Enabled := False;
     // Modulo Relatorio/Cadastro/Cart�o por cliente
     {If not Acesso(M_CDUSUA,'frmRelCartoesCliente') Then
          mnuCartesporClienteItem.Enabled := False;}
     //
     {If not Acesso(M_CDUSUA,'frmEtiquetas') Then
          mnuEtiquetasdeClientesItem.Enabled := False;
     // Modulo envelope Clientes
     If not Acesso(M_CDUSUA,'frmEnvelopeCli') Then
          mnuEnvClienteSubItem.Enabled := False;
     // Modulo envelope Fatura
     If not Acesso(M_CDUSUA,'frmEnvelopeFat') Then
          mnuEnvNFaturaSubItem.Enabled := False;
     // Modulo Relatorio/Carta/Apresenta��o
     If not Acesso(M_CDUSUA,'frmRelApresCartao') Then
          mnuApresentacaoItem.Enabled := False;
     // Modulo Relatorio/Carta/Aviso
     If not Acesso(M_CDUSUA,'frmRelAviso') Then
          mnuAvisoItem.Enabled := False;
     // Modulo Relatorio/Carta/Recibo
     If not Acesso(M_CDUSUA,'frmRelRecibo') Then
          mnuReciboItem.Enabled := False;
     // Modulo Relatorio/Carta/Recibo 2
     If not Acesso(M_CDUSUA,'frmRelReciboMod2') Then
          mnuReciboSubItem2.Enabled := False;
     // Modulo Relatorio/Carta/Recibo 3
     If not Acesso(M_CDUSUA,'frmRelReciboMod3') Then
          mnuReciboSubItem3.Enabled := False;
     // Modulo Relatorio/Gerencial/Movimento do Caixa
     If not Acesso(M_CDUSUA,'frmRelMovCaixa') Then
          mnuMoviCaixaSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/Movimento por Natureza
     If not Acesso(M_CDUSUA,'frmRelMovNatureza') Then
          mnuMovNaturezaSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/ Tota geral por Natureza
     If not Acesso(M_CDUSUA,'frmRelTotGerNatureza') Then
          mnuTotalGeralNaturezaSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/ Movimento do caixa por modalidade
     If not Acesso(M_CDUSUA,'frmRelMovCaixaModa') Then
          mnuMovCaixaModaSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/ Estrato de cliente
     If not Acesso(M_CDUSUA,'frmEstratoCliente') Then
          mnuEstratoClienteSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/Movimento de Vendas por Cred�nciado
     If not Acesso(M_CDUSUA,'frmRelMovVenCred') Then
          mnuMovVendaCredSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/Contas a Receber por Cliente
     If not Acesso(M_CDUSUA,'frmRelRecebeCliente') Then
          mnuContasaReceberporClienteSubItem.Enabled := False;
     // Modulo Relatorio/Gerencial/Contas a Receber da CEF
     If not Acesso(M_CDUSUA,'frmRelRecebidasCEF') Then
          mnuContasRecebidasSubItem.Enabled := False;
     // Modulo cadastro de bancos
     If not Acesso(M_CDUSUA,'frmCadBancos') Then
          mnuBancosItem.Enabled := False;
     // Modulo cadastro de Naturezas
     If not Acesso(M_CDUSUA,'frmCadNatureza') Then
          mnuNaturezaItem.Enabled := False;
     // Modulo cadastro de  Modalidade
     If not Acesso(M_CDUSUA,'frmCadModalidade') Then
          mnuModalidadesItem.Enabled := False;
     // Modulo cadastro de Feriados
     If not Acesso(M_CDUSUA,'frmCadFeriados') Then
          mnuFeriadosItem.Enabled := False;
     // Modulo cadastro de Usuarios
     If not Acesso(M_CDUSUA,'frmCadUsuarios') Then
          mnuUsuariosSubItem.Enabled := False;
     // Modulo de configuracao do sistema
     If not Acesso(M_CDUSUA,'frmConfiguracao') Then
          mnuCongfiguracoesItem.Enabled := False;}
end;

procedure TfrmPrincipal.EnvelopedeCliente1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmEnvelope, frmEnvelope);  // Carrega form na mem�ria
     Try
        //
        frmEnvelope.Caption := 'Envelope: Cliente';
        frmEnvelope.ShowModal;   // Mostra form em modo exclusivo
     Finally
        frmEnvelope.Free;  // Libera Mem�ria
     End;
end;

procedure TfrmPrincipal.mnuFichadeClientesItemClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmConfRelClientes, frmConfRelClientes);
      frmConfRelClientes.Caption := 'Ficha de cliente';
      frmConfRelClientes.ShowModal;
  Finally
      frmConfRelClientes.Free;
  End;
end;

procedure TfrmPrincipal.BoletosAbertos1Click(Sender: TObject);
Var
    V_NRFATU : String;
begin
{     V_NRFATU := InputBox('Boletos Abertos', 'Digite o n�mero da fatura?', '');
     V_NRFATU := uFuncoes.StrZero(V_NRFATU,10);
     If uFuncoes.Empty(V_NRFATU) Then
         Exit;
     //
     If (dmCartao.tbACCBOL.Active = False) Then
         dmCartao.tbACCBOL.Open;
     //
     If not (dmCartao.tbACCBOL.Locate('BOL_NRFATU',V_NRFATU,[])) Then
     begin
          Application.MessageBox('N.� de Fatura n�o existe!!!',
           'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Exit;
     End;
     //
     Application.CreateForm(TfrmRelBoletosAbertos, frmRelBoletosAbertos);    // Carrega form na mem�ria
     //
     If (dmCartao.tbParam.Active = False) Then
         dmCartao.tbParam.Open;
     //
     With frmRelBoletosAbertos do
     begin
          txtEmpresa.Caption   := dmCartao.tbParam.fieldByName('PAR_NMEMPR').AsString;
          txtSistema.Caption   := 'INFOG2 SISTEMAS - NETCART�O';
          txtRelatorio.Caption := 'RELAT�RIO.: BOLETOS EM ABERTOS';
          txtUsuario.Caption   := 'USU�RIO...: '+uPrincipal.M_NMUSUA;
          txtNRFATU.Caption    := 'N.� DA FATURA..: '+V_NRFATU;
     End;
     //
     With frmRelBoletosAbertos.qryBoletos do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from ACCBOL');
          SQL.Add('Where BOL_NRFATU='+QuotedStr(V_NRFATU));
          SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
          SQL.Add('order by BOL_NMSACA');
          Prepare;
          Open;
     End;
     //
     frmRelBoletosAbertos.txtDTDOCU.Caption := 'DATA DOS DOCUMENTOS..: '+
              frmRelBoletosAbertos.qryBoletos.fieldByName('BOL_DTDOCU').AsString;
     //
     With frmRelBoletosAbertos.qryTOTAL do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SUM(BOL_VLDOCU) BOL_TORECE from ACCBOL');
          SQL.Add('Where BOL_NRFATU='+QuotedStr(V_NRFATU));
          SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
          Prepare;
          Open;
     End;
     //
     frmRelBoletosAbertos.QuickRep1.Preview;   // Mostra form em modo exclusivo
     frmRelBoletosAbertos.Free;     // Libera Mem�ria}
end;

end.
