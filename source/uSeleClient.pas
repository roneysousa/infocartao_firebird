unit uSeleClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, DBTables,uInfoPrincipal,
  FMTBcd, SqlExpr, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TfrmSeleCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GridCliente: TDBGrid;
    btFechar: TBitBtn;
    dsClientes: TDataSource;
    btConfirma: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    edtNMCLIE: TEdit;
    dsClientes2: TDataSource;
    btImprimir: TBitBtn;
    qryClientes: TSQLQuery;
    dscBoletos: TRvDataSetConnection;
    qryCartoes: TSQLQuery;
    qryCartoesCAR_NRCART: TStringField;
    qryCartoesCAR_CDCLIE: TStringField;
    qryCartoesCAR_NMCLIE: TStringField;
    qryCartoesCAR_DTEMIS: TDateField;
    qryCartoesCAR_VLLIMI: TFMTBCDField;
    qryCartoesCAR_DIAFAT: TIntegerField;
    qryCartoesCAR_FLSITU: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridClienteKeyPress(Sender: TObject; var Key: Char);
    procedure GridClienteCellClick(Column: TColumn);
    procedure btConfirmaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNMCLIEChange(Sender: TObject);
    procedure edtNMCLIEEnter(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtNMCLIEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rvpClientesporCartaoDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure Relatorio_CartoesCliente;
  public
    { Public declarations }
  end;

var
  frmSeleCliente: TfrmSeleCliente;
  M_LETRAS, W_CDCLIE : String;

implementation

Uses udmInfoCartao, uFuncoes, udmRelatorios;

{Uses uCadCartoes,udmInfoCartao, uRelCartoesCliente, uRelRecibo,uFuncoes,
  uRelAviso, uRelReciboMod2, uRelReciboMod3, uRelApresCartao,
  uRelFichaCliente;}

{$R *.dfm}

procedure TfrmSeleCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     If (frmSeleCliente.Caption = 'CARTA DE AVISO PARA CLIENTE') or
         (frmSeleCliente.Caption = 'RECIBO DE CLIENTE') Then
         dmInfoCartao.cdsClientes.Close;
     //
     //uFuncoes.Limpar_Status; 
     Action := caFree;
end;

procedure TfrmSeleCliente.GridClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     //Impedir que apagar o registro atual.
     If (Shift = [ssCtrl]) and (Key = 46) Then
         KEY := 0;
     IF (KEY=38) or (key=40) then // avalio se � seta para cima ou para baixo;
     begin
          M_LETRAS := ' ';
          edtNMCLIE.Text := M_LETRAS;
     End;     
end;

procedure TfrmSeleCliente.GridClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    { M_letras := M_letras+uppercase(key); // acumula as letras digitadas
     dmInfoCartao.cdsBuscaCliente.LOCATE('CLI_NMCLIE',M_LETRAS,[loPartialKey]); // Efetua a procura
     edtNMCLIE.Text := M_LETRAS;}
end;

procedure TfrmSeleCliente.GridClienteCellClick(Column: TColumn);
begin
     M_LETRAS := ' ';
     edtNMCLIE.Text := M_LETRAS;
end;

procedure TfrmSeleCliente.btConfirmaClick(Sender: TObject);
Var
   M_CDCLIE, M_NMCLIE : String;
   M_NRFONE, M_FONEMP : String;
   M_FONER1, M_FONER2, M_DTNASC : String;
   M_CONSQL : String;
begin
{      If (frmSeleCliente.Caption = 'Selecione o cliente') Then
      begin
           dmInfoCartao.cdsCartoesCAR_CDCLIE.Value := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').AsString;
           dmInfoCartao.cdsCartoesCAR_NMCLIE.Value := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_NMCLIE').AsString;
           //
           Close;
      End;       }
      //
      If (frmSeleCliente.Caption = 'RELA��ES DE CART�ES POR CLIENTE') Then
      begin
           Relatorio_CartoesCliente;
      End;
      //
      If (frmSeleCliente.Caption = 'APRESENTA��O DO CART�O') Then
      begin
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').AsString;
           //
           With dmRelatorios.dstClientesRel do
           begin
                DisableControls;
                Close;
                ParamByName('pCDCLIE').AsString := M_CDCLIE;
                Open;
                EnableControls;
           End;
           //
           With dmRelatorios.cdsClientesRel do
           begin
                Active      := False;
                Active      := True;
           End;
          //
          With dmRelatorios do
          begin
               rvpClientes.Execute;
               rvpClientes.Close;
          End;
      End;
      //
      If (frmSeleCliente.Caption = 'CARTA DE AVISO PARA CLIENTE') Then
      begin
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').Value;
           //
           //Application.CreateForm(TfrmRelAviso, frmRelAviso);   //Carrega form na mem�ria
           //
           With dmRelatorios.dstClientesRel do
           begin
                DisableControls;
                Active      := False;
                //(CLI_CDCLIE=C.CAR_CDCLIE) And (CLI_CDCLIE=:pCDCLIE)
                Params.ParamByName('pCDCLIE').AsString := M_CDCLIE;
                //CommandText := 'Select CLI_CDCLIE,CLI_NMCLIE,CLI_NMCART,CLI_NRIDEN,CLI_CPFCGC from ACCCLI Where CLI_CDCLIE='+QuotedStr(M_CDCLIE);
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.cdsClientesRel do
           begin
                DisableControls;
                Active      := False;
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.dstBoletosRel do
           begin
                DisableControls;
                Active      := False;
                Params.ParamByName('pCDCLIE').AsString := M_CDCLIE;
                Params.ParamByName('pFLSITU').AsString := 'A';
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.cdsBoletosRel do
           begin
                DisableControls;
                Active      := False;
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.rvpAvisoSPC  do
           begin
                Execute;
                Close;
           End;
           //
      End;
      //
      If (frmSeleCliente.Caption = 'RECIBO DE CLIENTE') Then
      begin
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').Value;
           //
           With dmRelatorios.dstClientesRel do
           begin
                DisableControls;
                Active      := False;
                Params.ParamByName('pCDCLIE').AsString := M_CDCLIE;
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.cdsClientesRel do
           begin
                DisableControls;
                Active      := False;
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.rvpRecibo do
           begin
                Execute;
                Close;
           End;
           //
      End;
      //
      If (frmSeleCliente.Caption = 'RECEBIMENTO DE CLIENTE') Then
      begin
           //dmInfoCartao.cdsBuscaCliente.Edit;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').Value;
           //
           With dmRelatorios.dstClientesRel do
           begin
                DisableControls;
                Active      := False;
                Params.ParamByName('pCDCLIE').AsString := M_CDCLIE;
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.cdsClientesRel do
           begin
                DisableControls;
                Active      := False;
                Active      := True;
                EnableControls;
           End;
           //
           With dmRelatorios.rvpReciboEntrega do
           begin
                Execute;
                Close;
           End;
           //
      End;
      // Ficha de clientes
      {If (frmSeleCliente.Caption = 'Ficha de cliente') Then
      begin
           M_NMCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_NMCLIE').Value;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').AsString;
           //
           If (dmInfoCartao.tbParam.Active = False) Then
               dmInfoCartao.tbParam.Open;
           //
           Application.CreateForm(TfrmRelClientes, frmRelClientes);   // Carrega form na mem�ria
           With frmRelClientes do
           begin
                txtEmpresa.Caption   := dmInfoCartao.tbParam.fieldByName('PAR_NMEMPR').AsString;
                txtSistema.Caption   := 'INFOG2 SISTEMAS - NETCART�O';
                txtRelatorio.Caption := 'RELAT�RIO.: FICHA DE CLIENTE';
                txtUsuario.Caption   := 'USU�RIO...: '+uPrincipal.M_NMUSUA;
           End;
           //
           With frmRelClientes.qryFicha do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from ACCCLI');
                SQL.Add('Where CLI_CDCLIE='+QuotedStr(M_CDCLIE));
                Prepare;
                Open;
           End;
           //
           With frmRelClientes.qryBoletos do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from ACCBOL');
                SQL.Add('Where BOL_CDCLIE='+QuotedStr(M_CDCLIE));
                SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
                Prepare;
                Open;
           End;
           //
           With frmRelClientes do
           begin
                M_NRFONE := frmRelClientes.qryFicha.FieldByName('CLI_FONCLI').AsString;
                M_FONEMP := frmRelClientes.qryFicha.FieldByName('CLI_FONEMP').AsString;
                M_FONER1 := frmRelClientes.qryFicha.FieldByName('CLI_FOREF1').AsString;
                M_FONER2 := frmRelClientes.qryFicha.FieldByName('CLI_FOREF2').AsString;
                M_DTNASC := frmRelClientes.qryFicha.FieldByName('CLI_DTNASC').AsString;
                //
                If Length(M_NRFONE)= 10 Then
                    txtNRFONE.Caption := '('+Copy(M_NRFONE,1,2)+')'+Copy(M_NRFONE,3,4)+'-'+Copy(M_NRFONE,7,4)
                Else
                    txtNRFONE.Caption := '('+Copy(M_NRFONE,1,2)+')'+Copy(M_NRFONE,3,3)+'-'+Copy(M_NRFONE,6,4);
                //
                If Length(M_FONEMP)= 10 Then
                    txtFONEMP.Caption := '('+Copy(M_FONEMP,1,2)+')'+Copy(M_FONEMP,3,4)+'-'+Copy(M_FONEMP,7,4)
                Else
                    txtFONEMP.Caption := '('+Copy(M_FONEMP,1,2)+')'+Copy(M_FONEMP,3,3)+'-'+Copy(M_FONEMP,6,4);
                //
                If Length(M_FONER1)= 10 Then
                    txtNRFONE1.Caption := '('+Copy(M_FONER1,1,2)+')'+Copy(M_FONER1,3,4)+'-'+Copy(M_FONER1,7,4)
                Else
                    txtNRFONE1.Caption := '('+Copy(M_FONER1,1,2)+')'+Copy(M_FONER1,3,3)+'-'+Copy(M_FONER1,6,4);
                //
                If Length(M_FONER2)= 10 Then
                    txtNRFONE2.Caption := '('+Copy(M_FONER2,1,2)+')'+Copy(M_FONER2,3,4)+'-'+Copy(M_FONER2,7,4)
                Else
                    txtNRFONE2.Caption := '('+Copy(M_FONER2,1,2)+')'+Copy(M_FONER2,3,3)+'-'+Copy(M_FONER2,6,4);
                //
                txtDTNASC.Caption  := Copy(M_DTNASC,7,2)+'/'+Copy(M_DTNASC,5,2)+'/'+Copy(M_DTNASC,1,4);
           End;
           //
           frmRelClientes.qrFichaClientes.Preview;
           frmRelClientes.Close;
      End;}
end;

procedure TfrmSeleCliente.FormActivate(Sender: TObject);
begin
     If (dmInfoCartao.cdsBuscaCliente.Active = False) then
         dmInfoCartao.cdsBuscaCliente.Open;
     //
     With dmInfoCartao.dstBuscaCliente do
     begin
          DisableControls;
          Active      := False;
          CommandText := 'Select * from ACCCLI order by CLI_NMCLIE';
          Active      := True;
          EnableControls;
     End;
     //
     With dmInfoCartao.cdsBuscaCliente do
     begin
          DisableControls;
          Active      := False;
          Active      := True;
          EnableControls;
     End;
     //
     edtNMCLIE.Clear;
     M_LETRAS := ' ';
     edtNMCLIE.SetFocus;
end;

procedure TfrmSeleCliente.Relatorio_CartoesCliente;
Var
    M_QTBLOQ,M_QTROUB,M_QTPERD : Double;
    M_QTNORM,M_QTSUSP,M_QTCANC : Double;
    W_CDCLIE : String;
begin
         M_QTBLOQ := 0;
         M_QTROUB := 0;
         M_QTPERD := 0;
         M_QTNORM := 0;
         M_QTSUSP := 0;
         M_QTCANC := 0;
         //
         W_CDCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').AsString;
         //
         With dmRelatorios.dstCartaoRel do
         begin
              DisableControls;
              Close;
              //CommandText := 'Select C.CAR_NRCART, C.CAR_CDCLIE, CL.CLI_NMCLIE, C.CAR_NMCLIE, C.CAR_DTEMIS, C.CAR_VLLIMI, C.CAR_DIAFAT, C.CAR_FLSITU, S.SIT_NMSITU from ACCCAR C, ACCCLI CL, ACCSIT S Where (C.CAR_CDCLIE= CL.CLI_CDCLIE) and (C.CAR_FLSITU=S.SIT_SIGSIT) and (C.CAR_CDCLIE=:pCDCLIE)';
              ParamByName('pCDCLIE').AsString := W_CDCLIE;
              Open;
              EnableControls;
         End;
         //
         With dmRelatorios.cdsCartaoRel do
         begin
              Active      := False;
              Active      := True;
         End;
         //
         dmRelatorios.rvpClientesporCartao.Execute;
         dmRelatorios.rvpClientesporCartao.Close;
         //
         {Application.CreateForm(TfrmRelCartoesCliente, frmRelCartoesCliente);   //Carrega form na mem�ria
         //
         frmRelCartoesCliente.txtEmpresa.Caption := uPrincipal.M_NMEMPR;
         frmRelCartoesCliente.txtSistema.Caption := 'NETCART�O - ADMINISTRA��O DE CART�O DE CR�DITO';
         frmRelCartoesCliente.txtRelatorio.Caption := 'RELA��O DE CART�ES POR CLIENTE';
         frmRelCartoesCliente.txtUsuario.Caption := uPrincipal.M_NMUSUA;
         //frmRelCartoesCliente.qrlNMCLIE.Caption  := dmInfoCartao.cdsBuscaClienteCLI_NMCLIE.Value;
         frmRelCartoesCliente.qrlCDCLIE.Caption  := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').Value;
         frmRelCartoesCliente.qrlNMCLIE.Caption  := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_NMCLIE').Value;
         //
         With frmRelCartoesCliente.qryCartao do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select CAR_NRCART, CAR_CDCLIE,CAR_NMCLIE, CAR_DTEMIS,');
              SQL.Add('CAR_VLLIMI, CAR_DIAFAT, CAR_FLSITU from ACCCAR ');
              SQL.Add('Where CAR_CDCLIE='+QuotedStr(dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').Value));
              Prepare;
              Open;
              //
              First;
              While not Eof do
              begin
                   If (frmRelCartoesCliente.qryCartaoCAR_FLSITU.Value = 'B') Then
                       M_QTBLOQ := M_QTBLOQ+1;
                   If (frmRelCartoesCliente.qryCartaoCAR_FLSITU.Value = 'R') Then
                       M_QTROUB := M_QTROUB+1;
                   If (frmRelCartoesCliente.qryCartaoCAR_FLSITU.Value = 'P') Then
                       M_QTPERD := M_QTPERD+1;
                   If (frmRelCartoesCliente.qryCartaoCAR_FLSITU.Value = 'N') Then
                       M_QTNORM := M_QTNORM+1;
                   If (frmRelCartoesCliente.qryCartaoCAR_FLSITU.Value = 'S') Then
                       M_QTSUSP := M_QTSUSP+1;
                   If (frmRelCartoesCliente.qryCartaoCAR_FLSITU.Value = 'C') Then
                       M_QTCANC := M_QTCANC+1;
                   //
                   Next;
              End;
              //
              frmRelCartoesCliente.txtBloq.Caption := frmRelCartoesCliente.txtBloq.Caption+' '+FloattoStr(M_QTBLOQ);
              frmRelCartoesCliente.txtRoub.Caption := frmRelCartoesCliente.txtRoub.Caption+' '+FloattoStr(M_QTROUB);
              frmRelCartoesCliente.txtPerd.Caption := frmRelCartoesCliente.txtPerd.Caption+' '+FloattoStr(M_QTPERD);
              frmRelCartoesCliente.txtNormal.Caption := frmRelCartoesCliente.txtNormal.Caption+' '+FloattoStr(M_QTNORM);
              frmRelCartoesCliente.txtSusp.Caption := frmRelCartoesCliente.txtSusp.Caption+' '+FloattoStr(M_QTSUSP);
              frmRelCartoesCliente.txtCanc.Caption := frmRelCartoesCliente.txtCanc.Caption+' '+FloattoStr(M_QTCANC);
              //
         End;
         frmRelCartoesCliente.qrCartoes.Preview;}
end;

procedure TfrmSeleCliente.edtNMCLIEChange(Sender: TObject);
Var
   M_NMMESA : String;
begin
     M_LETRAS := edtNMCLIE.Text;
     //
     If not uFuncoes.Empty(edtNMCLIE.Text) Then
     begin
          If (uFuncoes.StrIsInteger(M_LETRAS)) Then
          begin
               W_CDCLIE := uFuncoes.StrZero(edtNMCLIE.Text,7);
               // Procura pelo codigo
               dmInfoCartao.cdsBuscaCliente.LOCATE('CLI_CDCLIE',W_CDCLIE,[loPartialKey]); // Efetua a procura
               M_NMMESA := 'Codigo';
          End
          Else
          Begin
             M_LETRAS := edtNMCLIE.Text;
             // Procura pelo nome
             dmInfoCartao.cdsBuscaCliente.LOCATE('CLI_NMCLIE',M_LETRAS,[loPartialKey]); // Efetua a procura
             M_NMMESA := 'Nome';
          End;
     End;
     //
     frmPrincipal.StatusBar1.Panels[2].Text := M_NMMESA;
end;

procedure TfrmSeleCliente.edtNMCLIEEnter(Sender: TObject);
begin
      frmPrincipal.StatusBar1.Panels[1].Text := 'Digite o c�digo ou nome do cliente.';
end;

procedure TfrmSeleCliente.btImprimirClick(Sender: TObject);
Var
   M_CDCLIE, M_NMCLIE : String;
   M_NRFONE, M_FONEMP : String;
   M_FONER1, M_FONER2, M_DTNASC : String;
begin
{      If (frmSeleCliente.Caption = 'Selecione o cliente') Then
      begin
           //dmInfoCartao.cdsBuscaCliente2.Edit;
           dmInfoCartao.cdsCartoesCAR_CDCLIE.Value := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').AsString;
           dmInfoCartao.cdsCartoesCAR_NMCLIE.Value := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_NMCLIE').AsString;
           //dmInfoCartao.cdsBuscaCliente2.Cancel;
           //
           Close;
      End;
      //
      If (frmSeleCliente.Caption = 'RELA��ES DE CART�ES POR CLIENTE') Then
      begin
           Relatorio_CartoesCliente;
      End;
      //
      If (frmSeleCliente.Caption = 'RECIBO DE CLIENTE') Then
      begin
           //dmInfoCartao.cdsBuscaCliente.Edit;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').Value;
           //dmInfoCartao.cdsBuscaCliente.Cancel;
           //
           Application.CreateForm(TfrmRelRecibo, frmRelRecibo);    //Carrega form na mem�ria

           With frmRelRecibo.cdsBuscaCliente do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select CLI_CDCLIE,CLI_NMCLIE,CLI_NMCART,CLI_NRIDEN,CLI_CPFCGC from ACCCLI');
                SQL.Add('Where CLI_CDCLIE='+QuotedStr(M_CDCLIE));
                Prepare;
                Open;
           End;
           //
           frmRelRecibo.memRecibo.Lines.Add('       Recebi   da '+frmRelRecibo.tbParamPAR_NMEMPR.Value
                     +', uma   Carta    Cobran�a do  Cart�o  de  Cr�dito '
                     +' R�dio  T�xi,  conforme  modelo  do  C.D.L..');
           frmRelRecibo.txtMes.Caption := uFuncoes.DataExtenso(Date()) ;

           //
           frmRelRecibo.QuickRep1.Print; // Mostra form em modo exclusivo
           frmRelRecibo.Free;            // Libera Mem�ria
      End;
      //
      If (frmSeleCliente.Caption = 'CARTA DE AVISO PARA CLIENTE') Then
      begin
           //dmInfoCartao.cdsBuscaCliente.Edit;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').Value;
           //dmInfoCartao.cdsBuscaCliente.Cancel;
           //
           Application.CreateForm(TfrmRelAviso, frmRelAviso);     // Carrega form na mem�ria
           //
           With frmRelAviso.cdsBuscaCliente do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select CLI_CDCLIE,CLI_NMCLIE,CLI_NMCART,CLI_NRIDEN,CLI_CPFCGC from ACCCLI');
                SQL.Add('Where CLI_CDCLIE='+QuotedStr(M_CDCLIE));
                Prepare;
                Open;
           End;
           //
           With frmRelAviso.qryBoleto do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from ACCBOL');
                //SQL.Add('Select  BOL_CDCLIE, BOL_VLDOCU,BOL_DTVENC, BOL_FLSITU  from ACCBOL');
                SQL.Add('Where BOL_CDCLIE='+QuotedStr(M_CDCLIE));
                SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
                Prepare;
                Open;
           End;
           //
           With frmRelAviso do
           begin
              memAviso.Lines.Add('       N�o registramos o pagamento de sua fatura, do '
                                         +' valor de R$ '+FormatFloat('###,##0.#0',qryBoleto.FieldByName('BOL_VLDOCU').AsFloat)+ ' '
                                         + '('+uFuncoes.Maiuscula(uFuncoes.extenso(qryBoleto.FieldByName('BOL_VLDOCU').AsFloat))+'),'
                                         +' vencida em '+qryBoleto.FieldByName('BOL_DTVENC').AsString +'.'+#13
                                     +#13+'       Por esse motivo, cumprindo acordo firmado com'
                                         +' C�mara dos Diretores Lojista - CDL, em 15(quinze) dias, a'
                                         +' contar recebimento desta, estaremos encaminhado seu nome'
                                         +' para o cadastro do SPC - Servi�o de Prote��o ao Cr�dito.'+#13
                                     +#13+'       Caso j� tenha pago, fineza descosiderar este aviso.');
              txtMes.Caption := uFuncoes.DataExtenso(Date()) ;
              //
              qrAviso.Print;    //Mostra form em modo exclusivo
           End;
      End;
      //
      If (frmSeleCliente.Caption = 'RECEBIMENTO DE CLIENTE') Then
      begin
           //dmInfoCartao.cdsBuscaCliente.Edit;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.FieldByName('CLI_CDCLIE').Value;
           //dmInfoCartao.cdsBuscaCliente.Cancel;
           //
           Application.CreateForm(TfrmRelReciboMod3, frmRelReciboMod3);  // Carrega form na mem�ria
           //
           With frmRelReciboMod3.cdsBuscaCliente do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select CLI_CDCLIE,CLI_NMCLIE,CLI_NMCART,CLI_NRIDEN,CLI_CPFCGC,CLI_NRCART from ACCCLI');
                SQL.Add('Where CLI_CDCLIE='+QuotedStr(M_CDCLIE));
                Prepare;
                Open;
           End;
           //
           If (dmInfoCartao.cdsCartoes.Active = False) Then
               dmInfoCartao.cdsCartoes.Open;
           //
           dmInfoCartao.cdsCartoes.Locate('CAR_CDCLIE',M_CDCLIE,[]);
           frmRelReciboMod3.txtNRCART.Caption := dmInfoCartao.cdsCartoes.FieldByName('CAR_NRCART').AsString;
           //
           dmInfoCartao.cdsCartoes.Close;
           //
           With frmRelReciboMod3 do
           begin
                memRecibo.Lines.Add('       Eu, '+frmRelReciboMod3.cdsBuscaClienteCLI_NMCLIE.Value+', recebi da R�dio'
                                   +'T�xi Transporte e Comunicac�es Ltda., um Cart�o de'
                                   +'Cr�dito, personalizado com meus dados, e uma c�pia'
                                   +'do Contrato de Utiliza��o do Cart�o R�dio T�xi    '
                                   +'222-2222.');
                txtMes.Caption := uFuncoes.DataExtenso(Date()) ;
                //
                qrReciboMod3.Print;    //Mostra form em modo exclusivo
           End;
      End;
      //
      If (frmSeleCliente.Caption = 'APRESENTA��O DO CART�O') Then
      begin
           //dmInfoCartao.cdsBuscaCliente.Edit;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').Value;
           //dmInfoCartao.cdsBuscaCliente.Cancel;
           //
           Application.CreateForm(TfrmRelApresCartao, frmRelApresCartao);   // Carrega form na mem�ria
           With frmRelApresCartao.cdsBuscaCliente do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select CLI_CDCLIE,CLI_NMCLIE,CLI_NMCART,CLI_NRIDEN,CLI_CPFCGC, CLI_LIMANA from ACCCLI');
                SQL.Add('Where CLI_CDCLIE='+QuotedStr(M_CDCLIE));
                Prepare;
                Open;
           End;
           //
           frmRelApresCartao.txtMes.Caption := uFuncoes.DataExtenso(Date()) ;
           //
           //If (dmInfoCartao.cdsCartoes.Locate('CAR_CDCLIE',M_CDCLIE,[])) Then
           //     frmRelApresCartao.txtVENCIMENTO.Caption := 'VENCIMENTO:     '
           //          +dmInfoCartao.cdsCartoes.fieldByName('CAR_DIAFAT').AsString;
           //
           If (dmInfoCartao.qryCartao2.Locate('CAR_CDCLIE',M_CDCLIE,[])) Then
                frmRelApresCartao.txtVENCIMENTO.Caption := 'VENCIMENTO:     '
                     +dmInfoCartao.qryCartao2.fieldByName('CAR_DIAFAT').AsString;
           //
           frmRelApresCartao.qrApresent.Print;
      End;
      // Ficha de clientes
      If (frmSeleCliente.Caption = 'Ficha de cliente') Then
      begin
           M_NMCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_NMCLIE').Value;
           M_CDCLIE := dmInfoCartao.cdsBuscaCliente.fieldByName('CLI_CDCLIE').AsString;
           //
           If (dmInfoCartao.tbParam.Active = False) Then
               dmInfoCartao.tbParam.Open;
           //
           Application.CreateForm(TfrmRelClientes, frmRelClientes);   // Carrega form na mem�ria
           With frmRelClientes do
           begin
                txtEmpresa.Caption   := dmInfoCartao.tbParam.fieldByName('PAR_NMEMPR').AsString;
                txtSistema.Caption   := 'INFOG2 SISTEMAS - NETCART�O';
                txtRelatorio.Caption := 'RELAT�RIO.: FICHA DE CLIENTE';
                txtUsuario.Caption   := 'USU�RIO...: '+uPrincipal.M_NMUSUA;
           End;
           //
           With frmRelClientes.qryFicha do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from ACCCLI');
                SQL.Add('Where CLI_CDCLIE='+QuotedStr(M_CDCLIE));
                Prepare;
                Open;
           End;
           //
           With frmRelClientes.qryBoletos do
           begin
                SQL.Clear;
                Close;
                SQL.Add('Select * from ACCBOL');
                SQL.Add('Where BOL_CDCLIE='+QuotedStr(M_CDCLIE));
                SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
                Prepare;
                Open;
           End;
           //
           With frmRelClientes do
           begin
                M_NRFONE := frmRelClientes.qryFicha.FieldByName('CLI_FONCLI').AsString;
                M_FONEMP := frmRelClientes.qryFicha.FieldByName('CLI_FONEMP').AsString;
                M_FONER1 := frmRelClientes.qryFicha.FieldByName('CLI_FOREF1').AsString;
                M_FONER2 := frmRelClientes.qryFicha.FieldByName('CLI_FOREF2').AsString;
                M_DTNASC := frmRelClientes.qryFicha.FieldByName('CLI_DTNASC').AsString;
                //
                If Length(M_NRFONE)= 10 Then
                    txtNRFONE.Caption := '('+Copy(M_NRFONE,1,2)+')'+Copy(M_NRFONE,3,4)+'-'+Copy(M_NRFONE,7,4)
                Else
                    txtNRFONE.Caption := '('+Copy(M_NRFONE,1,2)+')'+Copy(M_NRFONE,3,3)+'-'+Copy(M_NRFONE,6,4);
                //
                If Length(M_FONEMP)= 10 Then
                    txtFONEMP.Caption := '('+Copy(M_FONEMP,1,2)+')'+Copy(M_FONEMP,3,4)+'-'+Copy(M_FONEMP,7,4)
                Else
                    txtFONEMP.Caption := '('+Copy(M_FONEMP,1,2)+')'+Copy(M_FONEMP,3,3)+'-'+Copy(M_FONEMP,6,4);
                //
                If Length(M_FONER1)= 10 Then
                    txtNRFONE1.Caption := '('+Copy(M_FONER1,1,2)+')'+Copy(M_FONER1,3,4)+'-'+Copy(M_FONER1,7,4)
                Else
                    txtNRFONE1.Caption := '('+Copy(M_FONER1,1,2)+')'+Copy(M_FONER1,3,3)+'-'+Copy(M_FONER1,6,4);
                //
                If Length(M_FONER2)= 10 Then
                    txtNRFONE2.Caption := '('+Copy(M_FONER2,1,2)+')'+Copy(M_FONER2,3,4)+'-'+Copy(M_FONER2,7,4)
                Else
                    txtNRFONE2.Caption := '('+Copy(M_FONER2,1,2)+')'+Copy(M_FONER2,3,3)+'-'+Copy(M_FONER2,6,4);
                //
                txtDTNASC.Caption  := Copy(M_DTNASC,7,2)+'/'+Copy(M_DTNASC,5,2)+'/'+Copy(M_DTNASC,1,4);
           End;
           // Imprimi direto para impressora
           frmRelClientes.qrFichaClientes.Print;
           frmRelClientes.Close;
      End;                      }
end;

procedure TfrmSeleCliente.edtNMCLIEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmInfoCartao.cdsBuscaCliente.Prior;
     If (Key = VK_DOWN) Then
        dmInfoCartao.cdsBuscaCliente.Next;
end;

procedure TfrmSeleCliente.rvpClientesporCartaoDestroy(Sender: TObject);
begin
   qryCartoes.Close;
end;

end.
