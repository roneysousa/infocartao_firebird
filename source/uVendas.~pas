unit uVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, ExtCtrls, Mask, StdCtrls, DBCtrls, Grids, DBGrids,
  Buttons, DB, ToolEdit, CurrEdit, DBXpress, SqlExpr, ComCtrls;

type
  TfrmVendas = class(TForm)
    Panel1: TPanel;
    pnlDadosPessoais: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    edtNMCART: TEdit;
    edtDTNASC: TEdit;
    edtNRIDEN: TEdit;
    edtOREMIS: TEdit;
    edtUFCLIE: TEdit;
    edtNRCPF: TMaskEdit;
    edtNOMPAI: TEdit;
    edtNMMAE: TEdit;
    pnlCartao: TPanel;
    imgCartao: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    txtNMCLIE: TLabel;
    txtCONVE: TLabel;
    txtVALID: TLabel;
    Label12: TLabel;
    RxLabel1: TRxLabel;
    Image1: TImage;
    Label21: TLabel;
    edNRCART: TMaskEdit;
    edNRCART2: TMaskEdit;
    pnlDadosVenda: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbl_DTVENC: TLabel;
    edDTVENC: TEdit;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    edCDCRED2: TMaskEdit;
    lbl_Valor: TMaskEdit;
    lbl_Parcela: TMaskEdit;
    GridCredeciado: TDBGrid;
    dsCartao: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    edVALOR: TCurrencyEdit;
    edPARC: TCurrencyEdit;
    Panel2: TPanel;
    sbLocCredenciado: TSpeedButton;
    edCDCRED: TEdit;
    lbl_nmcred: TLabel;
    SQLConnection1: TSQLConnection;
    StatusBar1: TStatusBar;
    lbl_NMSITU: TLabel;
    procedure edNRCART2KeyPress(Sender: TObject; var Key: Char);
    procedure edNRCARTKeyPress(Sender: TObject; var Key: Char);
    procedure edNRCARTEnter(Sender: TObject);
    procedure edVALORExit(Sender: TObject);
    procedure edPARCExit(Sender: TObject);
    procedure edPARCKeyPress(Sender: TObject; var Key: Char);
    procedure edCDCREDEnter(Sender: TObject);
    procedure edCDCREDExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edVALORKeyPress(Sender: TObject; var Key: Char);
    procedure edCDCREDKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelarClick(Sender: TObject);
    procedure sbLocCredenciadoClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure edCDCREDChange(Sender: TObject);
    procedure edCDCRED2Enter(Sender: TObject);
    procedure edCDCRED2Exit(Sender: TObject);
    procedure edCDCRED2KeyPress(Sender: TObject; var Key: Char);
    procedure edCDCRED2Change(Sender: TObject);
  private
     Procedure Limpar_Tela;
     Procedure Dados_Cliente;
     procedure DisplayHint(Sender: TObject);
     Procedure NOVA_VENDA;
     Procedure Legendas;
     Procedure Legenda_Invisivel;
     Procedure NOME_SITUACAO(N_NMSITU : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;
  Transacao: TTransactionDesc;
  M_DTVENC : TDate;
  M_CDCLIE, M_CDCRED,M_LETRA : String;
  M_NMCART, M_DTNASC, M_NRIDEN , M_OREMIS , M_UFEMIS : String;
  M_NUMCPF, M_NOMPAI, M_NOMMAE : String;
  M_FLVEND, M_FLESCA : boolean;

implementation

uses udmInfoCartao, uFuncoes, uLocCred, uInfoPrincipal;

{$R *.dfm}

procedure TfrmVendas.edNRCART2KeyPress(Sender: TObject; var Key: Char);
Var
    M_ULVEND : String;
begin
    If (key = #27) Then
    begin
         Key := #0;
         edNRCART2.Clear;
         edNRCART2.SetFocus;
    End;
    //
    If (key = #13) Then
    begin
         Key := #0;
         //
         With dmInfoCartao.qryLocCartao do
         Begin
              SQL.Clear;
              Close;
              SQL.Add('Select * from ACCCAR Where (CAR_NRCART =:pNRCART)');
              ParamByName('pNRCART').AsString := edNRCART2.Text;
              Open;
         End;
         //
         If (dmInfoCartao.qryLocCartao.Locate('CAR_NRCART',edNRCART2.Text,[])) Then
         Begin
               //dbtNMCLIE.Visible := True;
               NOME_SITUACAO(dmInfoCartao.qryLocCartaoCAR_FLSITU.AsString);
               txtNMCLIE.Caption := dmInfoCartao.qryLocCartaoCAR_NMCLIE.AsString;
               txtVALID.Caption  := Copy(dmInfoCartao.qryLocCartaoCAR_DTVALI.Value,1,2)
                               +'/'+Copy(dmInfoCartao.qryLocCartaoCAR_DTVALI.Value,3,4);
               M_CDCLIE := dmInfoCartao.qryLocCartaoCAR_CDCLIE.AsString;
               pnlDadosVenda.Visible := True;
               //
               With dmInfoCartao.qryBuscaCliente do
               begin
                    SQL.Clear;
                    Close;
                    SQL.Add('Select * from ACCCLI Where (CLI_CDCLIE =:pCDCLIE)');
                    ParamByName('pCDCLIE').AsString := M_CDCLIE;
                    Open;
               End;
               //
               If (dmInfoCartao.qryBuscaCliente.Locate('CLI_CDCLIE',M_CDCLIE,[])) Then
               Begin
                    Dados_Cliente;
                    txtCONVE.Caption  := dmInfoCartao.qryBuscaClienteCLI_NMCLIE.Value;
                    pnlDadosPessoais.Visible := True;
                    M_DTVENC := StrtoDate(FloattoStr(dmInfoCartao.qryLocCartaoCAR_DIAFAT.Value)+Copy(DatetoStr(Date),3,8));
                    If (M_DTVENC < Date()) Then
                          edDTVENC.Text := DatetoStr(IncMonth(M_DTVENC,1))
                    Else
                          edDTVENC.Text := DatetoStr(M_DTVENC);
               End
               Else
               Begin
                     ShowMessage('Cliente não encontrado...');
                     Exit;
               End;
               //
               If (dmInfoCartao.qryLocCartao.Locate('CAR_NRCART;CAR_FLSITU',
                      VarArrayOf([edNRCART2.Text,'N']),[])) Then
               begin
               
                    M_FLESCA := False;
                    btConfirmar.Enabled := False;
                    pnlCartao.Enabled := False;
                    edCDCRED.Visible := False;
                    Legendas;
                    Legenda_Invisivel;
                    edCDCRED2.Left   := edCDCRED.Left;
                    edCDCRED2.Visible := True;
                    //
                    edCDCRED2.Clear;
                    edCDCRED2.SetFocus;
               End
               Else
               Begin
                    Application.MessageBox('Situação do cartão irregular!',
                       'ATENÇÃO', MB_OK+MB_ICONSTOP);
                    pnlCartao.Enabled := True;
                    Limpar_Tela;
                    edNRCART2.Clear;
                    edNRCART2.SetFocus;
                    Exit;
               End;
         End
         Else
         begin
              Application.MessageBox('N.º de cartão não encontrado!',
                          'ATENÇÃO', MB_OK+MB_ICONinformation);
              edNRCART2.Clear;
              edNRCART2.SetFocus;
         End;
      // End;       // Fim-do-cancelamento}
    End;
end;

procedure TfrmVendas.edNRCARTKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #27) Then
    begin
         Key := #0;
         pnlCartao.Enabled := True;
         edNRCART.Clear;
         edNRCART.SetFocus;
         Exit;
    End;
    //
    If (key = #13) Then
    begin
         Key := #0;
         // Se for Venda
         With dmInfoCartao.qryLocCartao do
         Begin
              SQL.Clear;
              Close;
              SQL.Add('Select * from ACCCAR Where (CAR_NRCART =:pNRCART)');
              ParamByName('pNRCART').AsString := edNRCART.Text;
              Open;
         End;
         //
         If (dmInfoCartao.qryLocCartao.Locate('CAR_NRCART;CAR_FLSITU',
                      VArArrayOf([edNRCART.Text,'N']),[])) Then
         Begin
               //dbtNMCLIE.Visible := True;
               NOME_SITUACAO(dmInfoCartao.qryLocCartaoCAR_FLSITU.AsString);
               txtNMCLIE.Caption := dmInfoCartao.qryLocCartaoCAR_NMCLIE.AsString;
               txtVALID.Caption  := Copy(dmInfoCartao.qryLocCartaoCAR_DTVALI.Value,1,2)
                               +'/'+Copy(dmInfoCartao.qryLocCartaoCAR_DTVALI.Value,3,4);
               M_CDCLIE := dmInfoCartao.qryLocCartaoCAR_CDCLIE.AsString;
               pnlDadosVenda.Visible := True;
               //
               With dmInfoCartao.qryBuscaCliente do
               begin
                    SQL.Clear;
                    Close;
                    SQL.Add('Select * from ACCCLI Where (CLI_CDCLIE =:pCDCLIE)');
                    ParamByName('pCDCLIE').AsString := M_CDCLIE;
                    Open;
               End;
               //
               If (dmInfoCartao.qryBuscaCliente.Locate('CLI_CDCLIE',M_CDCLIE,[]) ) Then
               Begin
                   txtCONVE.Caption  := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_NMCLIE').AsString;
                   pnlDadosPessoais.Visible := True;
                   //
                   Dados_Cliente;
                   M_DTVENC := StrtoDate(FloattoStr(dmInfoCartao.qryLocCartaoCAR_DIAFAT.Value)+Copy(DatetoStr(Date),3,8));
                   If (M_DTVENC < Date()) Then
                       edDTVENC.Text := DatetoStr(IncMonth(M_DTVENC,1))
                   Else
                       edDTVENC.Text := DatetoStr(M_DTVENC);
                   //
                   If (dmInfoCartao.qryLocCartao.Locate('CAR_NRCART;CAR_FLSITU',
                      VArArrayOf([edNRCART.Text,'N']),[])) Then
                   begin
                       NOVA_VENDA;
                       M_FLESCA := False;
                       btConfirmar.Enabled := False;
                       pnlCartao.Enabled := False;
                       M_FLVEND := True;
                       edVALOR.SetFocus;
                   End
                   Else
                   Begin
                        Application.MessageBox('Situação do cartão irregular!',
                          'ATENÇÃO', MB_OK+MB_ICONSTOP);
                        Limpar_Tela;
                        edNRCART.SetFocus;
                        Exit;
                   End;
                   //
                   {edCDCRED.Visible := False;
                   Legendas;
                   Legenda_Invisivel;
                   edCDCRED2.Left   := edCDCRED.Left;
                   edCDCRED2.Visible := True;
                   //
                   edCDCRED2.Clear;
                   edCDCRED2.SetFocus;}
               End
               Else
               Begin
                    ShowMessage('Cliente não encontrado...');
                    Limpar_Tela;
                    edNRCART.SetFocus;
                    Exit;
               End;
         End
         Else
         begin
             If (dmInfoCartao.qryLocCartao.Locate('CAR_NRCART',edNRCART.Text,[])) Then
             Begin
                 M_CDCLIE := dmInfoCartao.qryLocCartaoCAR_CDCLIE.AsString;
                 //
                 If (dmInfoCartao.qryLocCartao.FieldByName('CAR_FLSITU').AsString <> 'N') Then
                 begin
                      M_CDCLIE := dmInfoCartao.qryLocCartaoCAR_CDCLIE.AsString;
                      //
                      With dmInfoCartao.qryBuscaCliente do
                      begin
                          SQL.Clear;
                          Close;
                          SQL.Add('Select * from ACCCLI Where (CLI_CDCLIE =:pCDCLIE)');
                          ParamByName('pCDCLIE').AsString := M_CDCLIE;
                          Open;
                      End;
                      //
                      pnlDadosPessoais.Visible := True;
                      Dados_Cliente;
                      //
                      Application.MessageBox('Situação do cartão irregular!',
                          'ATENÇÃO', MB_OK+MB_ICONSTOP);
                 End;
              End
              Else
                    Application.MessageBox('N.º de cartão não encontrado!',
                           'ATENÇÃO', MB_OK+MB_ICONinformation);
              //
              Limpar_Tela;
              edNRCART.Clear;
              edNRCART.SetFocus;
         End;
      // End;       // Fim-do-cancelamento}
    End;
end;

procedure TfrmVendas.Limpar_Tela;
begin
      If (edNRCART.Visible = True) Then
          edNRCART.Clear;
      If (edNRCART2.Visible = True) Then
          edNRCART2.Clear;
      txtNMCLIE.Caption := '.';
      txtCONVE.Caption  := '.';
      txtVALID.Caption  := '.';
      //
      pnlDadosVenda.Visible    := False;
      pnlDadosPessoais.Visible := False;
end;

procedure TfrmVendas.edNRCARTEnter(Sender: TObject);
begin
     //
     Limpar_Tela;
     pnlDadosPessoais.Visible := False;
end;

procedure TfrmVendas.Dados_Cliente;
begin
     M_NMCART := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_NMCART').AsString;
     M_DTNASC := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_DTNASC').AsString;
     M_NRIDEN := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_NRIDEN').AsString;
     M_OREMIS := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_ORGEMI').AsString;
     M_UFEMIS := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_UFEMIS').AsString;
     M_NUMCPF := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_CPFCGC').AsString;
     M_NOMPAI := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_NOMPAI').AsString;
     M_NOMMAE := dmInfoCartao.qryBuscaCliente.FieldByName('CLI_NOMMAE').AsString;
     //
     edtNMCART.Text := M_NMCART;
     edtDTNASC.Text := M_DTNASC;
     edtNRIDEN.Text := M_NRIDEN;
     edtOREMIS.Text := M_OREMIS;
     edtUFCLIE.Text := M_UFEMIS;
     edtNRCPF.Text  := M_NUMCPF;
     edtNOMPAI.Text := M_NOMPAI;
     edtNMMAE.Text  := M_NOMMAE;
end;

procedure TfrmVendas.edVALORExit(Sender: TObject);
begin
  If (M_FLVEND = True) Then
  begin
     If uFuncoes.Empty(edVALOR.Text) and (M_FLESCA = False) Then
     begin
          Application.MessageBox(PChar('Digite o valor da Venda?'),
              'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edVALOR.SetFocus;
          Exit;
     End;
     //
     If (edVALOR.Value <= 0) and (M_FLESCA = False) Then
     begin
          Application.MessageBox(PChar('Digite o valor não ser menor ou igual a Zero!!!'),
              'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edVALOR.SetFocus;
          Exit;
     End;
  End;
end;

procedure TfrmVendas.edPARCExit(Sender: TObject);
begin
  If  (M_FLVEND = True) Then
  begin
     If uFuncoes.Empty(edPARC.Text) and (M_FLESCA = False) Then
     Begin
          edPARC.SetFocus;
          Exit;
     End;
     //
     If (edPARC.Value <= 0) and (M_FLESCA = False) Then
     begin
          Application.MessageBox(PChar('Digite o valor não ser menor ou igual a Zero!!!'),
              'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
          edPARC.SetFocus;
          Exit;
     End;
  End;
end;

procedure TfrmVendas.edPARCKeyPress(Sender: TObject; var Key: Char);
begin
     M_FLESCA := True;
     If (key = #27) Then
     Begin
          Limpar_Tela;
          pnlCartao.Enabled := True;
          pnlDadosVenda.Visible := False;
          edNRCART.Clear;
          edNRCART.SetFocus;
          Exit;
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edPARC.Text)
      and (edPARC.Value > 0) then
     begin
         Key := #0;
         edCDCRED.SetFocus;
     End;
end;

procedure TfrmVendas.edCDCREDEnter(Sender: TObject);
begin
     If (edCDCRED.Text = '000000') and (M_FLVEND = True) Then
        edCDCRED.Clear;
end;

procedure TfrmVendas.edCDCREDExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edCDCRED.Text) and (M_FLVEND = True) and (M_FLESCA = False) Then
        edCDCRED.Text := uFuncoes.StrZero(edCDCRED.Text,6);
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
     M_FLVEND := False;
end;

procedure TfrmVendas.edVALORKeyPress(Sender: TObject; var Key: Char);
begin
     M_FLESCA := True;
     If (key = #27) Then
     Begin
          Limpar_Tela;
          pnlCartao.Enabled := True;
          pnlDadosVenda.Visible := False;
          edNRCART.Clear;
          edNRCART.SetFocus;
          Exit;
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edVALOR.Text)
      and (edVALOR.Value > 0) then
     begin
         Key := #0;
         edPARC.SetFocus;
     End;
end;

procedure TfrmVendas.edCDCREDKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13, #27] ) then
         Key := #0;
     //
     If (key = #27) Then
     Begin
          M_FLESCA := True;
          Limpar_Tela;
          pnlCartao.Enabled := True;
          pnlDadosVenda.Visible := False;
          edNRCART.Clear;
          edNRCART.SetFocus;
          Exit;
     End;
     //
     If (Key = #13) and uFuncoes.Empty(edCDCRED.Text) Then
     Begin
         Key := #0;
         sbLocCredenciadoClick(Sender);
         Exit;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edCDCRED.Text) Then
     Begin
          Key := #0;
          //
          With dmInfoCartao.qryCredeciado do
          Begin
              SQL.Clear;
              Close;
              SQL.Add('Select * from ACCCRE Where (CRE_CDCRED =:pCDCRED)');
              //
              ParamByName('pCDCRED').AsString := uFuncoes.StrZero(edCDCRED.Text,6);
              Open;
          End;
          //
          If (dmInfoCartao.qryCredeciado.Locate('CRE_CDCRED',uFuncoes.StrZero(edCDCRED.Text,6),[])) Then
          Begin
               lbl_nmcred.Caption  := dmInfoCartao.qryCredeciado.fieldByName('CRE_NMCRED').AsString;
               btConfirmar.Enabled := True;
               btConfirmar.SetFocus;
               Exit;
          End
          Else
          begin
               btConfirmar.Enabled := False;
               ShowMessage('Credênciado não encontrado!!!');
               edCDCRED.Clear;
               edCDCRED.SetFocus;
               dmInfoCartao.qryCredeciado.Close;
               Exit;
          End;
     End;
end;

procedure TfrmVendas.btCancelarClick(Sender: TObject);
begin
     Limpar_Tela;
     pnlDadosVenda.Visible := False;
     pnlCartao.Enabled := True;
     //
     dmInfoCartao.qryBuscaCliente.Close;
     dmInfoCartao.qryLocCartao.Close;
     //
     edNRCART.Clear;
     edNRCART.SetFocus;
end;

procedure TfrmVendas.NOVA_VENDA;
begin
    edVALOR.Clear;
    edPARC.Clear;
    edCDCRED.Clear;
end;

procedure TfrmVendas.sbLocCredenciadoClick(Sender: TObject);
begin
    Try
       Application.CreateForm(TfrmLocCred, frmLocCred);
       uLocCred.M_NRFORM := 1;
       lbl_nmcred.Caption  := '.';
       frmLocCred.ShowModal;
    Finally
       frmLocCred.Free;
       edCDCRED.SetFocus;
    End;
end;

procedure TfrmVendas.btConfirmarClick(Sender: TObject);
Var
   M_NRVEND, M_NRCART, M_CDCRED, M_DTREFE : String;
   M_VLLIMI, M_VLUTIL, M_VLVEND, M_VLPARC, M_VLDIFE : Double;
   M_QTPARC, W_QTPARC, M_DIAFAT : Integer;
   M_DTFATU, M_ULFATU, M_DTVENC : Tdate;
   M_ANO, M_MES,M_DIA : Word;
begin
   //
   If (edVALOR.Value = 0) or uFuncoes.Empty(edVALOR.Text) Then
   Begin
        Application.MessageBox(PChar('Digite o valor da Venda?'),
              'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
        //ShowMessage('Digite o valor da venda!!!');
        edVALOR.SetFocus;
        Exit;
   End;
   //
   If (edPARC.Value = 0) or uFuncoes.Empty(edPARC.Text) Then
   Begin
        ShowMessage('Digite o número de parcelas.');
        edPARC.SetFocus;
        Exit;
   End;
   //
   If uFuncoes.Empty(edCDCRED.Text) Then
   Begin
        ShowMessage('Digite o codigo do credênciado.');
        edCDCRED.SetFocus;
        Exit;
   End;
   //
   try
      Transacao.TransactionID := 1;
      Transacao.IsolationLevel := xilREPEATABLEREAD;
      dmInfoCartao.SQLConnection1.StartTransaction(Transacao);
      //
      If (dmInfoCartao.cdsParametros.Active = False) Then
         dmInfoCartao.cdsParametros.Open;
      dmInfoCartao.cdsParametros.Edit;
      dmInfoCartao.cdsParametros.FieldByName('PAR_NRVEND').AsFloat :=
         dmInfoCartao.cdsParametros.FieldByName('PAR_NRVEND').AsFloat+1;
      //
      M_NRVEND := uFuncoes.StrZero(FloattoStr(dmInfoCartao.cdsParametros.FieldByName('PAR_NRVEND').AsFloat),7);
      M_ULFATU := dmInfoCartao.cdsParametros.FieldByName('PAR_DTFATU').AsFloat;
      //
      dmInfoCartao.cdsParametros.Post;
      dmInfoCartao.cdsParametros.ApplyUpdates(0);
      //
      M_NRCART := edNRCART.Text;
      M_CDCRED := uFuncoes.StrZero(edCDCRED.Text,6);
      M_VLVEND := edVALOR.Value;
      M_QTPARC := StrtoInt(edPARC.Text);
      //  Atualiza os dados do cliente na tabela cartao
      With dmInfoCartao.qryAtualizaCartao do
      Begin
           SQL.Clear;
           Close;
           SQL.Add('Update ACCCAR Set CAR_VLUTIL = CAR_VLUTIL + :pVLVEND, CAR_DTUTIL = :pDTUTIL, CAR_HOUTIL = :pHOUTIL');
           //
           ParamByName('pVLVEND').AsFloat  := M_VLVEND;
           ParamByName('pDTUTIL').AsDate   := Date();
           ParamByName('pHOUTIL').AsString := TimetoStr(Time);
           //
           ExecSQL;
      End;
      //
      With dmInfoCartao.qryAtualizaCartao do
      Begin
           SQL.Clear;
           Close;
           SQL.Add('Select * from ACCCAR Where (CAR_NRCART = :pNRCART)');
           ParamByName('pNRCART').AsString := M_NRCART;
           Open;
      End;
      //
      M_DIAFAT := dmInfoCartao.qryAtualizaCartao.FieldByName('CAR_DIAFAT').AsInteger;
      M_VLUTIL := dmInfoCartao.qryAtualizaCartao.FieldByName('CAR_VLUTIL').AsFloat;
      M_VLLIMI := dmInfoCartao.qryAtualizaCartao.FieldByName('CAR_VLLIMI').AsFloat;
      // incluir um registro na tabela Movimento
      With dmInfoCartao.qryIncVenda do
      Begin
           SQL.Clear;
           Close;
           SQL.Add('Insert into ACCMOV(MOV_NRVEND, MOV_NRCART, MOV_CDCRED,MOV_DTMOVI,MOV_DTMOV1,MOV_HOMOVI,MOV_VLLIMI,MOV_VLUTIL,MOV_VLVEND,MOV_QTPARC,MOV_FLSITU,MOV_CDOPER) values');
           SQL.Add('(:pNRVEND, :pNRCART, :pCDCRED, :pDTMOVI, :pDTMOV1, :pHOMOVI, :pVLLIMI, :pVLUTIL, :pVLVEND, :pQTPARC, :pFLSITU, :pCDOPER)');
           //
           ParamByName('pNRVEND').AsString := M_NRVEND;
           ParamByName('pNRCART').AsString := M_NRCART;
           ParamByName('pCDCRED').AsString := M_CDCRED;
           ParamByName('pDTMOVI').AsDate   := Date();       //99/99/9999
           ParamByName('pDTMOV1').AsString := Copy(DatetoStr(Date()),7,4)+Copy(DatetoStr(Date()),4,2)+Copy(DatetoStr(Date()),1,2);
           ParamByName('pHOMOVI').AsString := TimetoStr(Time);
           ParamByName('pVLLIMI').AsFloat  := M_VLLIMI;
           ParamByName('pVLUTIL').AsFloat  := M_VLUTIL;
           ParamByName('pVLVEND').AsFloat  := M_VLVEND;
           ParamByName('pQTPARC').AsFloat  := M_QTPARC;
           ParamByName('pFLSITU').AsString := 'N';
           ParamByName('pCDOPER').AsString := uInfoPrincipal.M_CDUSUA;
           //
           ExecSQL;
      End;
      //
      M_DTFATU := Date();
      DecodeDate (M_DTFATU, M_ANO, M_MES, M_DIA);
      M_DTREFE := uFuncoes.StrZero(InttoStr(M_DIA),2)+'/'+uFuncoes.MesExtenso(Date);
      W_QTPARC := 0;
      M_VLPARC := uFuncoes.Arredondar(M_VLVEND/M_QTPARC,2);
      //
          While (M_QTPARC <> W_QTPARC) do
          begin
              // Adiciona um dia a da fatura
              M_DTFATU := uFuncoes.Datafinal(M_DTFATU,1);
              DecodeDate (M_DTFATU, M_ANO, M_MES, M_DIA);
              If (M_DIA = M_DIAFAT) And (M_DTFATU > M_ULFATU) Then
              begin
                W_QTPARC := W_QTPARC+1;
                If (M_QTPARC = W_QTPARC) Then
                begin
                     M_VLDIFE := M_VLVEND -(M_VLPARC*M_QTPARC);
                     M_VLPARC := M_VLPARC + M_VLDIFE;
                End;
                //
                M_DTVENC := M_DTFATU;
                // Inclui um novo debito
                With dmInfoCartao.qryDebito do
                Begin
                     SQL.Clear;
                     Close;
                     SQL.Add('Insert into ACCDEB(DEB_NRVEND, DEB_NRCART, DEB_NRPARC, DEB_CDCLIE, DEB_CDCRED, DEB_DTMOVI, DEB_DTVENC,DEB_QTPARC,DEB_VLPARC,DEB_DTREFE,DEB_FLSITU,DEB_TPMOVI,DEB_DIAFAT) values');
                     SQL.Add('(:pNRVEND, :pNRCART, :pNRPARC, :pCDCLIE, :pCDCRED, :pDTMOVI, :pDTVENC, :pQTPARC, :pVLPARC, :pDTREFE, :pFLSITU, :pTPMOVI, :pDIAFAT )');
                     //
                     ParamByName('pNRVEND').AsString := M_NRVEND;
                     ParamByName('pNRCART').AsString := M_NRCART;
                     ParamByName('pNRPARC').AsInteger:= W_QTPARC;
                     ParamByName('pCDCLIE').AsString := M_CDCLIE;
                     ParamByName('pCDCRED').AsString := M_CDCRED;
                     ParamByName('pDTMOVI').AsDate   := Date();
                     ParamByName('pDTVENC').AsDate   := M_DTVENC;
                     ParamByName('pQTPARC').AsFloat  := M_QTPARC;
                     ParamByName('pVLPARC').AsFloat  := M_VLPARC;
                     ParamByName('pDTREFE').AsString := M_DTREFE;
                     ParamByName('pFLSITU').AsString := 'A';
                     ParamByName('pTPMOVI').AsString := 'D';
                     ParamByName('pDIAFAT').AsString := uFuncoes.StrZero(InttoStr(M_DIAFAT),2);
                     //
                     ExecSQL;
                End;
             End;   //fim-se
          End;   // Fim-do-enquanto
      //
      dmInfoCartao.qryLocCartao.Close;
      pnlDadosVenda.Visible := False;
      //
      dmInfoCartao.SQLConnection1.Commit(Transacao);
      Application.MessageBox(PChar('Registro de venda concluido!'),
           PChar('VENDA:'+M_NRVEND), MB_OK+MB_ICONINFORMATION);
      //
      Limpar_Tela;
      pnlCartao.Enabled := True;
      edNRCART.SetFocus;
   except
      on Exc:Exception do
         begin
            ShowMessage('Ocorreu um erro na tentativa de inclusão do registro: ' + Exc.Message);
            dmInfoCartao.SQLConnection1.Rollback(Transacao);
         end;
   end;

end;

procedure TfrmVendas.edCDCREDChange(Sender: TObject);
begin
     If uFuncoes.Empty(edCDCRED.Text) Then
        lbl_nmcred.Caption := '.';
end;

procedure TfrmVendas.Legenda_Invisivel;
begin
    edVALOR.Visible    := False;
    edPARC.Visible     := False;
    edDTVENC.Visible   := False;
    lbl_DTVENC.Visible := False;
end;

procedure TfrmVendas.Legendas;
begin
    lbl_Valor.Left   := edVALOR.Left;
    lbl_Parcela.Left := edPARC.Left;
    //
    lbl_Valor.Visible := True;
    lbl_Parcela.Visible := True;
    //
    lbl_Valor.Text   := ' ';
    lbl_Parcela.Text := ' ';
end;

procedure TfrmVendas.edCDCRED2Enter(Sender: TObject);
begin
     If not (uFuncoes.Empty(M_CDCRED)) Then
           edCDCRED2.Text := M_CDCRED;
end;

procedure TfrmVendas.edCDCRED2Exit(Sender: TObject);
begin
{          If uFuncoes.Empty(edCDCRED2.Text) Then
              edCDCRED2.SetFocus
          Else
          begin
               edCDCRED2.Text := uFuncoes.StrZero(edCDCRED2.Text,6);
               //
               With dmInfoCartao.qryCredeciado do
               Begin
                  SQL.Clear;
                  Close;
                  SQL.Add('Select * from ACCCRE Where (CRE_CDCRED =:pCDCRED)');
                  //
                  ParamByName('pCDCRED').AsString := edCDCRED2.Text;
                  Open;
               End;
               //
               If dmInfoCartao.qryCredeciado.Locate('CRE_CDCRED',edCDCRED2.Text,[]) Then
               begin
                    lbl_nmcred.Visible := True;
                    lbl_nmcred.Caption := dmInfoCartao.qryCredeciado.fieldByName('CRE_NMCRED').AsString;
               End
               Else
               begin
                     ShowMEssage('Credênciado não encontrado!');
                     lbl_nmcred.Caption := '.';
                     edCDCRED2.Clear;
                     edCDCRED2.SetFocus;
                     Exit;
               End;
          End;}
end;

procedure TfrmVendas.edCDCRED2KeyPress(Sender: TObject; var Key: Char);
Var
    M_NRVEND : String;
    W_NRCART, W_CDCLIE, W_CDCRED, W_NRVEND : String;
    W_VLMOVI : Double;
    TD: TTransactionDesc;
begin
     If not( key in['0'..'9',#8, #13, #27] ) then
         Key := #0;
     // se pressionar ESC
     If (key = #27) Then
     begin
               Key := #0;
               Limpar_Tela;
               pnlCartao.Enabled := True;
               edNRCART2.SetFocus;
               Exit;
     End;
     // se pressionar ENTER
     If (key = #13) And (uFuncoes.Empty(edCDCRED2.Text) ) Then
     begin
          Key := #0;
          //
          Try
             Application.CreateForm(TfrmLocCred, frmLocCred);
             uLocCred.M_NRFORM := 2;
             lbl_nmcred.Caption  := '.';
             frmLocCred.ShowModal;
          Finally
             frmLocCred.Free;
             edCDCRED2.SetFocus;
      End;
     End;
     //
     If (key = #13) And not(uFuncoes.Empty(edCDCRED2.Text)) Then
     begin
          Key := #0;
          W_NRCART := edNRCART2.Text;
          W_CDCRED := uFuncoes.StrZero(edCDCRED2.Text,6);
          //
          With dmInfoCartao.qryLocVenda do
          begin
               SQL.Clear;
               Close;
               SQL.Add('Select * from ACCMOV Where (MOV_NRCART = :pNRCART)');
               SQL.Add('And (MOV_CDCRED = :pCDCRED) And (MOV_FLSITU = :pFLSITU)');
               SQL.Add('And (MOV_DTMOVI = :pDTMOVI)');
               //
               ParamByName('pNRCART').AsString := W_NRCART;
               ParamByName('pFLSITU').AsString := 'N';
               ParamByName('pCDCRED').AsString := W_CDCRED;
               ParamByName('pDTMOVI').AsDate   := Date();
               //
               Open;
          End;
          //
          If (dmInfoCartao.qryLocVenda.Locate('MOV_NRCART;MOV_CDCRED;MOV_DTMOVI,MOV_FLSITU',
                 VarArrayOf([W_NRCART,W_CDCRED,DatetoStr(Date),'N']),[])) Then
          begin
               W_NRVEND := dmInfoCartao.qryLocVenda.FieldByName('MOV_NRVEND').AsString;
               W_VLMOVI := dmInfoCartao.qryLocVenda.FieldByName('MOV_VLVEND').AsFloat;
               //
                With dmInfoCartao.qryCredeciado do
                Begin
                     SQL.Clear;
                     Close;
                     SQL.Add('Select * from ACCCRE Where (CRE_CDCRED =:pCDCRED)');
                     //
                     ParamByName('pCDCRED').AsString := uFuncoes.StrZero(edCDCRED2.Text,6);
                     Open;
                End;
                //
                If (dmInfoCartao.qryCredeciado.Locate('CRE_CDCRED',uFuncoes.StrZero(edCDCRED2.Text,6),[])) Then
                Begin
                     lbl_nmcred.Visible := True;
                     lbl_nmcred.Caption  := dmInfoCartao.qryCredeciado.fieldByName('CRE_NMCRED').AsString;
                End
                Else
                begin
                     ShowMessage('Credênciado não encontrado!!!');
                     edCDCRED2.Clear;
                     edCDCRED2.SetFocus;
                     dmInfoCartao.qryCredeciado.Close;
                     Exit;
                End;
               //
               lbl_Valor.Text   := FormatFloat('###,###,##0.00', dmInfoCartao.qryLocVenda.FieldByName('MOV_VLVEND').AsCurrency);
               lbl_Parcela.Text := dmInfoCartao.qryLocVenda.FieldByName('MOV_QTPARC').AsString;
               //
               If Application.MessageBox(PChar('Confirmar cancelamento de venda? :'+dmInfoCartao.qryLocVenda.FieldByName('MOV_NRVEND').AsString),
                     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
               begin    // se SIM
                 Try
                    TD.TransactionID := 1;
                    TD.IsolationLevel := xilREADCOMMITTED;
                    // Inicia um transação no BD
                    dmInfoCartao.SQLConnection1.StartTransaction(TD);
                    // Tabela de Movimento
                    With dmInfoCartao.qryIncVenda do
                    begin
                         SQL.Clear;
                         Close;
                         SQL.Add('Update ACCMOV Set MOV_FLSITU = :pVLSITU,');
                         SQL.Add('MOV_DTCANC = :pDTCANC, MOV_DTCAN1 = :pDTCAN1, MOV_HOCANC = :pHOCANC, MOV_OPCANC = :pOPCANC');
                         SQL.Add('Where (MOV_NRCART = :pNRCART)');
                         SQL.Add('And (MOV_CDCRED = :pCDCRED) And (MOV_FLSITU = :pFLSITU)');
                         SQL.Add('And (MOV_DTMOVI = :pDTMOVI)');
                         //
                         ParamByName('pNRCART').AsString := W_NRCART;
                         ParamByName('pFLSITU').AsString := 'N';
                         ParamByName('pCDCRED').AsString := W_CDCRED;
                         ParamByName('pDTMOVI').AsDate   := Date();
                         //
                         ParamByName('pVLSITU').AsString := 'C';
                         ParamByName('pDTCANC').AsDate   := Date();
                         ParamByName('pDTCAN1').AsString := Copy(DatetoStr(Date()),7,4)+Copy(DatetoStr(Date()),4,2)+Copy(DatetoStr(Date()),1,2);
                         ParamByName('pHOCANC').AsString := TimetoStr(Time);
                         ParamByName('pOPCANC').AsString := uInfoPrincipal.M_CDUSUA;
                         //
                         ExecSQL;
                    End;
                    // Tabela de Debito
                    With dmInfoCartao.qryDebito do
                    begin
                         SQL.Clear;
                         Close;
                         SQL.Add('Update ACCDEB Set DEB_FLSITU = :pVLSITU');
                         SQL.Add('Where (DEB_NRVEND = :pNRVEND) AND (DEB_FLSITU= :pFLSITU)');
                         //
                         ParamByName('pNRVEND').AsString := W_NRVEND;
                         ParamByName('pVLSITU').AsString := 'C';
                         ParamByName('pFLSITU').AsString := 'A';
                         //
                         ExecSQL;
                    End;
                    // Tabela Cartao
                    With dmInfoCartao.qryAtualizaCartao do
                    begin
                         SQL.Clear;
                         Close;
                         SQL.Add('Update ACCCAR Set CAR_VLUTIL = CAR_VLUTIL - :pVLMOVI');
                         SQL.Add('Where (CAR_NRCART = :pNRCART)');
                         //
                         ParamByName('pNRCART').AsString := W_NRCART;
                         ParamByName('pVLMOVI').AsFloat  := W_VLMOVI;
                         //
                         ExecSQL;
                    End;
                    // Grava e Fechar a transação no BD.
                    dmInfoCartao.SQLConnection1.Commit(TD);
                    //
                    Application.MessageBox('Registro de venda cancelado com sucesso!!!',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                    //
                    Limpar_Tela;
                    pnlCartao.Enabled := True;
                    edNRCART2.Clear;
                    edNRCART2.SetFocus;
                    //
                    Exit;
                 Except
                     // Cancela a transação no DB
                     dmInfoCartao.SQLConnection1.Rollback(TD);
                     Application.MessageBox('Erro no cancelamento de venda!',
                               'ATENÇÃO', MB_OK+MB_ICONSTOP);
                     Limpar_Tela;
                     pnlCartao.Enabled := True;
                     //
                     edNRCART2.SetFocus;
                     Exit;
                 End;
               End
               Else     // se NÃO
               begin
                    txtNMCLIE.Caption := '.';
                    txtCONVE.Caption  := '.';
                    txtVALID.Caption  := '.';
                    pnlCartao.Enabled := True;
                    //
                    pnlDadosVenda.Visible    := False;
                    pnlDadosPessoais.Visible := False;
                    //
                    edNRCART2.SetFocus;
                    edNRCART2.Clear;
                    Exit;
               End;     //fim-se da pergunta
          End
          Else
          begin
               Application.MessageBox('Não ha venda neste cartão'+#13
                                      +'para este credênciado!',
                          'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
               //
               edCDCRED2.SetFocus;
               edCDCRED2.Clear;
               Exit;
          End;
          //
     End;     //fim-pressionar ENTER
end;

procedure TfrmVendas.edCDCRED2Change(Sender: TObject);
begin
      If uFuncoes.Empty(edCDCRED2.Text) Then
         lbl_nmcred.Caption := '.';
end;

procedure TfrmVendas.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := Application.Hint;
end;


procedure TfrmVendas.NOME_SITUACAO(N_NMSITU: String);
begin
     With dmInfoCartao.qrySituacaoCartao do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from ACCSIT Where (SIT_SIGSIT = :pSIGSIT)');
          //
          ParamByName('pSIGSIT').AsString := N_NMSITU;
          Open;
     End;
     //
     lbl_NMSITU.Caption := dmInfoCartao.qrySituacaoCartao.FieldByName('SIT_NMSITU').AsString;
end;

end.
