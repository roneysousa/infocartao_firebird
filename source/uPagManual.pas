unit uPagManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Mask, Grids, DBGrids, DB, RXCtrls,
  Buttons, DBTables, DBXpress, FMTBcd, SqlExpr, ToolEdit, CurrEdit;

type
  TfrmPagaManual = class(TForm)
    Panel2: TPanel;
    dbtNMCLIE: TDBText;
    pnlSuprerior: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    edNRCART: TMaskEdit;
    dsBoletos: TDataSource;
    RxLabel1: TRxLabel;
    dsLimpa: TDataSource;
    btPagar: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    dbeDesconto: TDBEdit;
    cmbModalidades: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    brConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    dbeTOTAL: TDBEdit;
    dsTOTAL: TDataSource;
    edtTOPAGA: TEdit;
    qryBoleto: TSQLQuery;
    qryBoletoTOTAL: TFloatField;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    edtVLMODA: TCurrencyEdit;
    GridContas: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edNRCARTKeyPress(Sender: TObject; var Key: Char);
    procedure edNRCARTEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPagarClick(Sender: TObject);
    procedure dsBoletosStateChange(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dbeDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDescontoExit(Sender: TObject);
    procedure cmbModalidadesExit(Sender: TObject);
    procedure brConfirmarClick(Sender: TObject);
    procedure dsBoletosDataChange(Sender: TObject; Field: TField);
    procedure cmbModalidadesKeyPress(Sender: TObject; var Key: Char);
  private
    Procedure Calculos;
    Procedure TOTAL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagaManual: TfrmPagaManual;
  M_NRCART, M_CDCLIE, M_CDMODA,M_HOMOVI,M_CDNATU : String;
  M_PEMULT,M_PEJURO, M_VLDEBI : Double;
  M_FLCONV : String;
  M_REGINI,M_REGATU,M_REG1 : TBookmark;
  M_DTPAGA,M_DTVENC,M_DTDOCU : Tdate;
  M_VLDESC,M_VLPAGO,M_QTDIAS,M_NRSEQU : Double;
  M_NRFATU, M_NRDOCU, M_DTREFE, W_FLSITU ,M_NMDESC: String;
  M_VLDOCU, M_VLJURO, M_VLMULT, M_VLTROC,M_VLMODA : Double;
  M_ANO, M_MES, M_DIA : word;
  M_VLANTE, M_VLATUA : Double;

implementation

uses udmInfoCartao,uFuncoes,uInfoPrincipal;

{$R *.dfm}

procedure TfrmPagaManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmInfoCartao.cdsCartoes.Close;
     dmInfoCartao.cdsBoletos.Close;
     dmInfoCartao.cdsClientes.Close;
     dmInfoCartao.cdsDebito.Close;
     dmInfoCartao.cdsCaixa.Close;
     dmInfoCartao.cdsModalidade.Close;
     dmInfoCartao.cdsMovCaixa.Close;
     dmInfoCartao.cdsCaixa.Close;
     //
     Action := caFree;
end;

procedure TfrmPagaManual.FormActivate(Sender: TObject);
begin
     If (dmInfoCartao.cdsParametros.Active = False) Then
        dmInfoCartao.cdsParametros.Open;
     //
     dmInfoCartao.cdsParametros.Edit;
     If (dmInfoCartao.cdsParametros.FieldByName('PAR_FLCAIX').AsString = 'F') Then
     Begin
          Application.MessageBox('Registro de caixa encontra-se fechado!!!',
          'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          dmInfoCartao.cdsParametros.Close;
          Close;
     End;
     //
     If (dmInfoCartao.cdsClientes.Active = False) Then
         dmInfoCartao.cdsClientes.Open;
     If (dmInfoCartao.cdsCartoes.Active = False) Then
        dmInfoCartao.cdsCartoes.Open;
     If (dmInfoCartao.cdsBoletos.Active = False) Then
        dmInfoCartao.cdsBoletos.Open;
     If (dmInfoCartao.cdsDebito.Active = False) Then
         dmInfoCartao.cdsDebito.Open;
     If (dmInfoCartao.cdsCaixa.Active = False) Then
         dmInfoCartao.cdsCaixa.Open;
     //
     If (dmInfoCartao.cdsModalidade.Active = False) Then
         dmInfoCartao.cdsModalidade.Open;
     dmInfoCartao.cdsModalidade.First;
     While not (dmInfoCartao.cdsModalidade.Eof) do
     begin
         cmbModalidades.Items.Add(dmInfoCartao.cdsModalidadeMOD_CDMODA.Value+' - '+dmInfoCartao.cdsModalidadeMOD_NMMODA.Value);
         dmInfoCartao.cdsModalidade.Next;
     End;
     //
     If (dmInfoCartao.cdsMovCaixa.Active = False) Then
         dmInfoCartao.cdsMovCaixa.Open;
     //
end;

procedure TfrmPagaManual.edNRCARTKeyPress(Sender: TObject; var Key: Char);
Var
   M_TESTE1, M_LOOP : String;
begin
     If (key = #13) Then
     begin
          Key := #0;
          M_NRCART := edNRCART.Text;
          M_FLCONV := 'N';
          //
          If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',M_NRCART,[])) Then
          Begin
               dbtNMCLIE.Visible := True;
               M_CDCLIE := dmInfoCartao.cdsCartoesCAR_CDCLIE.Value;
               //
               If (dmInfoCartao.cdsClientes.Locate('CLI_CDCLIE',M_CDCLIE,[]))
                 And (dmInfoCartao.cdsClientesCLI_FLCONV.AsString = 'S')
                 And (StrtoFloat(dmInfoCartao.cdsClientesCLI_NRCART.Value)<>0) Then
               Begin
                     M_NRCART := dmInfoCartao.cdsClientesCLI_NRCART.Value;
                     M_FLCONV := 'S';
               End;
          End;
          //
          M_TESTE1 := 'M_NRCART=BOL_NRCART .AND. BOL_FLSITU="A"';
          //
          If (dmInfoCartao.cdsBoletos.Locate('BOL_NRCART;BOL_FLSITU',VarArrayOf([M_NRCART,'A']),[])) Then
          begin
               M_REGINI := dmInfoCartao.cdsBoletos.GetBookmark;
               M_LOOP   := 'S';
               //
               {While (M_LOOP = 'S') do
               begin}
                    M_REGATU := dmInfoCartao.cdsBoletos.GetBookmark;
                    M_VLDEBI := 0;
                    //
                    If (dmInfoCartao.cdsBoletos.Locate('BOL_NRCART;BOL_FLSITU',VarArrayOf([M_NRCART,'A']),[])) Then
                    begin
                         dmInfoCartao.cdsBoletos.Filtered := False;
                         dmInfoCartao.cdsBoletos.Filter   := 'BOL_NRCART='+QuotedStr(M_NRCART) +' AND BOL_FLSITU='+QuotedStr('A');
                         dmInfoCartao.cdsBoletos.Filtered := True;
                         //
                         TOTAL;
                         //
                         dmInfoCartao.cdsBoletos.GotoBookmark(M_REGATU);
                         dmInfoCartao.cdsBoletos.FreeBookmark(M_REGATU);
                         //
                         M_REG1 := dmInfoCartao.cdsBoletos.GetBookmark;
                         GridContas.DataSource := dsBoletos;
                         //edtTOPAGA.Text := FormatFloat('#,###,##0.#0',M_VLDEBI);
                         //
                         dmInfoCartao.cdsBoletos.GotoBookmark(M_REG1);
                         dmInfoCartao.cdsBoletos.FreeBookmark(M_REG1);
                         //
                         dmInfoCartao.cdsBoletos.EnableControls;
                    END;
                    //
                    GridContas.SetFocus;
                    If (dmInfoCartao.cdsBoletos.RecordCount = 0) Then
                       btPagar.Enabled := False
                    Else
                       btPagar.Enabled := True;
          End
          Else
          begin
              Application.MessageBox('Não ha registros de débito para este cartão...',
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              btPagar.Enabled := False;
              edNRCART.Clear;
         End;
     End;     // pressionamento <ENTER>
end;

procedure TfrmPagaManual.edNRCARTEnter(Sender: TObject);
begin
      dbtNMCLIE.Visible := False;
      edNRCART.Clear;
      edtTOPAGA.Clear;
      GridContas.DataSource := dsLimpa;
      //
      dmInfoCartao.cdsBoletos.Filtered := False;
      qryBoleto.Close;
end;

procedure TfrmPagaManual.FormCreate(Sender: TObject);
begin
      GridContas.Align := alClient;
end;

procedure TfrmPagaManual.btPagarClick(Sender: TObject);
begin
    GridContas.Visible := False;
    dmInfoCartao.cdsBoletos.Edit;
    dmInfoCartao.cdsBoletosBOL_DTPAGA.Value  := Date();
    //
    M_DTPAGA := DATE();
    M_VLDESC := 0;
    M_CDMODA := ' ';
    M_NRFATU := dmInfoCartao.cdsBoletosBOL_NRFATU.Value;
    M_NRDOCU := dmInfoCartao.cdsBoletosBOL_NRDOCU.Value;
    M_VLPAGO := dmInfoCartao.cdsBoletosBOL_VLDOCU.Value;
    M_CDCLIE := dmInfoCartao.cdsBoletosBOL_CDCLIE.Value;
    M_DTVENC := dmInfoCartao.cdsBoletosBOL_DTVENC.Value;
    //
    DecodeDate (M_DTVENC, M_ANO, M_MES, M_DIA);
    M_DTREFE := uFuncoes.StrZero(InttoStr(M_DIA),2)+'/'+uFuncoes.MesExtenso(Date);
    //
    M_DTDOCU := dmInfoCartao.cdsBoletosBOL_DTDOCU.Value;
    M_QTDIAS := DATE()-M_DTVENC;
    W_FLSITU := dmInfoCartao.cdsBoletosBOL_FLSITU.Value;
    M_NMDESC := 'VENCIMENTO:'+DatetoStr(M_DTVENC);
    M_VLDOCU := dmInfoCartao.cdsBoletosBOL_VLDOCU.Value;
    M_VLJURO := 0;
    M_VLMULT := 0;
    //
    M_VLTROC := 0;
    M_VLMODA := M_VLDOCU;
    //
    edtVLMODA.Text := FormatFloat('#,###,##0.#0',dmInfoCartao.cdsBoletosBOL_VLDOCU.Value);
    //
end;

procedure TfrmPagaManual.dsBoletosStateChange(Sender: TObject);
begin
     pnlSuprerior.Enabled := dsBoletos.State in [dsBrowse];
     btPagar.Enabled      := dsBoletos.State in [dsBrowse];
     GridContas.Visible   := dsBoletos.State in [dsBrowse];
     //
     brConfirmar.Enabled  := dsBoletos.State in [dsEdit];
     btCancelar.Enabled   := dsBoletos.State in [dsEdit];
end;

procedure TfrmPagaManual.btCancelarClick(Sender: TObject);
begin
      dmInfoCartao.cdsBoletos.Cancel;
      GridContas.Visible := True;
      GridContas.SetFocus;
end;

procedure TfrmPagaManual.dbeDescontoKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) Then
    begin
        key := #0;
        Calculos;
    End;
end;

procedure TfrmPagaManual.Calculos;
begin
     M_VLJURO := dmInfoCartao.cdsBoletosBOL_VLJURO.Value;
     M_VLMULT := dmInfoCartao.cdsBoletosBOL_VLMULT.Value;
     M_VLDESC := dmInfoCartao.cdsBoletosBOL_VLDESC.Value;
     //
     M_CDMODA := Copy(cmbModalidades.Text,1,2);
     //Label10.Caption := M_CDMODA;
     M_VLMODA := (M_VLDOCU + M_VLJURO + M_VLMULT) - M_VLDESC;
     edtVLMODA.Text := FormatFloat('#,###,##0.#0',M_VLMODA);
end;

procedure TfrmPagaManual.dbeDescontoExit(Sender: TObject);
begin
        Calculos;
end;

procedure TfrmPagaManual.cmbModalidadesExit(Sender: TObject);
begin
    If not uFuncoes.Empty(cmbModalidades.Text) Then
    begin
         M_CDMODA := Copy(cmbModalidades.Text,1,2);
        // Label10.Caption := M_CDMODA;
    End
    Else
    begin
         ShowMessage('Selecione a modalidade.');
         //cmbModalidades.SetFocus;
    End;
end;

procedure TfrmPagaManual.brConfirmarClick(Sender: TObject);
Var
    W_DTPAGA, W_NRCART : String;
    TD: TTransactionDesc;
begin
      If uFuncoes.Empty(cmbModalidades.Text) Then
      begin
           ShowMessage('Selecione a modalidade!!!');
           cmbModalidades.SetFocus;
           Exit;
      End;
      //
   Try
      //
      TD.TransactionID := 1;
      TD.IsolationLevel := xilREADCOMMITTED;
      // Inicia um transação no BD
      dmInfoCartao.SQLConnection1.StartTransaction(TD);
      //
      If Application.MessageBox('Confirma o recebimento do documento?',
           'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
      begin
           dmInfoCartao.cdsParametros.Edit;
           M_NRSEQU := dmInfoCartao.cdsParametros.FieldByName('PAR_NRSEQU').AsFloat+1;
           M_CDNATU := dmInfoCartao.cdsParametrosPAR_NATVEN.Value;
           dmInfoCartao.cdsParametrosPAR_NRSEQU.AsFloat := M_NRSEQU;
           dmInfoCartao.cdsParametros.Post;
           dmInfoCartao.cdsParametros.ApplyUpdates(0);
           //
           {M_NRSEQU = NETZER(STR(M_NRSEQU,10,0),10)
           M_DTPAGA = NETDAT(M_DTPAGA)}
           //
           dmInfoCartao.cdsBoletosBOL_VLJURO.Value := M_VLJURO;
           dmInfoCartao.cdsBoletosBOL_VLDESC.Value := M_VLDESC;
           dmInfoCartao.cdsBoletosBOL_DTPAGA.Value := M_DTPAGA;
           dmInfoCartao.cdsBoletosBOL_VLMULT.Value := M_VLMULT;
           dmInfoCartao.cdsBoletosBOL_CDUSUA.Value := uInfoPrincipal.M_CDUSUA;
           dmInfoCartao.cdsBoletosBOL_FLSITU.Value := 'P';
           //
           W_NRCART := dmInfoCartao.cdsBoletos.FieldByName('BOL_NRCART').AsString;
           //
           dmInfoCartao.cdsBoletos.post;
           dmInfoCartao.cdsBoletos.ApplyUpdates(0);
           //
            IF (M_FLCONV = 'N') then
            begin
                 //dmInfoCartao.cdsCartoes.IndexFieldNames := 'CAR_NRCART';
                 //If (dmInfoCartao.cdsCartoes.FindKey([])) Then
                 If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',W_NRCART,[])) Then
                 begin
                      dmInfoCartao.cdsCartoes.Edit;
                      W_DTPAGA := uFuncoes.RemoveChar(DatetoStr(Date));
                      W_DTPAGA := Copy(W_DTPAGA,5,4)+Copy(W_DTPAGA,3,2)+Copy(W_DTPAGA,1,2);
                      dmInfoCartao.cdsCartoes.FieldByName('CAR_DTPAGA').AsDateTime := Date();
                      dmInfoCartao.cdsCartoes.FieldByName('CAR_DTPAG1').AsString   := W_DTPAGA;
                      dmInfoCartao.cdsCartoes.FieldByName('CAR_VLUTIL').AsFloat    :=
                              dmInfoCartao.cdsCartoes.FieldByName('CAR_VLUTIL').AsFloat-M_VLDOCU;
                      dmInfoCartao.cdsCartoes.FieldByName('CAR_VLCRED').AsFloat  := M_VLDOCU;
                      //
                      IF (dmInfoCartao.cdsCartoesCAR_VLUTIL.Value  < 0) Then
                           dmInfoCartao.cdsCartoesCAR_VLUTIL.Value := 0;
                      // Grava alterações
                      dmInfoCartao.cdsCartoes.Post;
                      dmInfoCartao.cdsCartoes.ApplyUpdates(0);
                      //
                      //Showmessage('Gravou em cartao');
                 End;

            End
            Else
            begin
                //dmInfoCartao.cdsDebito.IndexFieldNames := 'DEB_NRFATU';
                //If (dmInfoCartao.cdsDebito.FindKey([M_NRFATU])) Then
                If (dmInfoCartao.cdsDebito.Locate('DEB_NRFATU',M_NRFATU,[])) Then
                Begin
                     WHILE (M_NRFATU=dmInfoCartao.cdsDebitoDEB_NRFATU.Value)
                         AND not(dmInfoCartao.cdsDebito.Eof) do
                     begin
                          dmInfoCartao.cdsDebito.Edit;
                          If (M_CDCLIE=dmInfoCartao.cdsDebitoDEB_CDCLIE.Value) Then
                          begin
                               M_NRCART := dmInfoCartao.cdsDebitoDEB_NRCART.Value;
                               M_VLDOCU := dmInfoCartao.cdsDebitoDEB_VLPARC.Value;
                               //
                               //dmInfoCartao.cdsCartoes.IndexFieldNames := 'CAR_NRCART';
                               //If (dmInfoCartao.cdsCartoes.FindKey([M_NRCART])) Then
                               If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',M_NRCART,[])) Then
                               begin
                                    dmInfoCartao.cdsCartoes.Edit;
                                    dmInfoCartao.cdsCartoes.FieldByName('CAR_DTPAGA').AsString := W_DTPAGA;
                                    dmInfoCartao.cdsCartoes.FieldByName('CAR_VLUTIL').AsFloat  :=
                                         dmInfoCartao.cdsCartoesCAR_VLUTIL.Value-M_VLDOCU;
                                    //
                                    If (dmInfoCartao.cdsCartoesCAR_VLUTIL.Value  < 0) Then
                                        dmInfoCartao.cdsCartoesCAR_VLUTIL.Value := 0;
                                    // Grava
                                    dmInfoCartao.cdsCartoes.Post;
                                    dmInfoCartao.cdsCartoes.ApplyUpdates(0);
                                    //Showmessage('Gravou em debito - cartao');
                               End;
                               //
                          End;
                               dmInfoCartao.cdsDebito.Next;
                     End;     // fim-do-enquanto
                End;         //fim-do-se
            End;        //fluxo de convenio
                 //
                 M_DTDOCU := Date();
                 M_HOMOVI := Copy(TimetoStr(TIME()),1,2)+Copy(TimetoStr(TIME()),4,2);
                 //M_DTVENC := M_DTVENC;
                 M_VLANTE := 0;
                 M_VLATUA := M_VLMODA;
                 //
                 If (dmInfoCartao.cdsCaixa.Active = False) Then
                     dmInfoCartao.cdsCaixa.Open;
                 If (dmInfoCartao.cdsCaixa.Locate('CAI_CDMODA',M_CDMODA,[])) then
                 Begin
                      dmInfoCartao.cdsCaixa.Edit;
                      //dmInfoCartao.cdsCaixaCAI_VLMODA.Value := dmInfoCartao.cdsCaixaCAI_VLMODA.Value+M_VLMODA;
                      dmInfoCartao.cdsCaixaCAI_VLMODA.Value := dmInfoCartao.cdsCaixaCAI_VLMODA.Value+M_VLMODA;
                      dmInfoCartao.cdsCaixa.Post;
                      dmInfoCartao.cdsCaixa.ApplyUpdates(0);
                      //Showmessage('Gravou em acccai -1');
                 End
                 Else
                 begin
                      dmInfoCartao.cdsCaixa.APPEND;
                      dmInfoCartao.cdsCaixaCAI_CDMODA.Value := M_CDMODA;
                      dmInfoCartao.cdsCaixaCAI_VLMODA.Value := M_VLMODA;
                      dmInfoCartao.cdsCaixa.Post;
                      dmInfoCartao.cdsCaixa.ApplyUpdates(0);
                      //Showmessage('Gravou em acccai -2');
                 End;
                 //
                 dmInfoCartao.cdsMovCaixa.Append;
                 dmInfoCartao.cdsMovCaixaMCA_NRDOCU.Value := M_NRDOCU;
                 dmInfoCartao.cdsMovCaixaMCA_NRSEQU.Value := uFuncoes.StrZero(FloattoStr(M_NRSEQU),10);
                 dmInfoCartao.cdsMovCaixaMCA_DTMOVI.Value := M_DTDOCU;
                 dmInfoCartao.cdsMovCaixaMCA_HOMOVI.Value := M_HOMOVI;
                 dmInfoCartao.cdsMovCaixaMCA_TPMOVI.Value := 'R';
                 dmInfoCartao.cdsMovCaixaMCA_CDMODA.Value := M_CDMODA;
                 dmInfoCartao.cdsMovCaixaMCA_VLMODA.Value := M_VLMODA;
                 dmInfoCartao.cdsMovCaixaMCA_CDNATU.Value := M_CDNATU;
                 dmInfoCartao.cdsMovCaixaMCA_NMDESC.Value := M_NMDESC;
                 dmInfoCartao.cdsMovCaixaMCA_DTREFE.Value := M_DTREFE;
                 dmInfoCartao.cdsMovCaixaMCA_CDFUNC.Value := uInfoPrincipal.M_CDUSUA;
                 dmInfoCartao.cdsMovCaixa.Post;
                 dmInfoCartao.cdsMovCaixa.ApplyUpdates(0);
                 //Showmessage('Gravou em Movimento do caixa');
            //
            If (dmInfoCartao.cdsBoletos.RecordCount = 0) Then
                 btPagar.Enabled := False
           Else
           begin
                   btPagar.Enabled := True;
                   TOTAL;
           End;
           //
           qryBoleto.Close;
           edNRCART.Clear; 
           //
           dmInfoCartao.SQLConnection1.Commit(TD);
           //
           Application.MessageBox('Recebimento realizado...',
                    'CONCLUÍDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //
           edNRCART.SetFocus;
      End
      Else
      Begin
            dmInfoCartao.cdsBoletos.Cancel;
            dmInfoCartao.SQLConnection1.Rollback(TD);
            GridContas.Visible := True;
            GridContas.SetFocus;
      End;
   Except
         Application.MessageBox('Erro ao tentar realizar o recebimento!',
            'ERRO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          //
         dmInfoCartao.cdsBoletos.Cancel;
         dmInfoCartao.SQLConnection1.Rollback(TD);
         GridContas.Visible := True;
         GridContas.SetFocus;
   End;
end;

procedure TfrmPagaManual.dsBoletosDataChange(Sender: TObject;
  Field: TField);
begin
     frmPrincipal.StatusBar1.Panels[2].Text := ' Registro: ' + IntToStr(dsBoletos.DataSet.RecNo) +
                          ' de ' + IntToStr(dsBoletos.DataSet.RecordCount);
end;

procedure TfrmPagaManual.cmbModalidadesKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     begin
          key := #0;
          dmInfoCartao.cdsBoletos.Cancel;
     End;
end;

procedure TfrmPagaManual.TOTAL;
begin
     With qryBoleto do
     begin
           SQL.Clear;
           Close;
           SQL.Add('Select Sum(BOL_VLDOCU)  TOTAL from ACCBOL');
           SQL.Add(' Where BOL_NRCART='+QuotedStr(edNRCART.Text));
           SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
           Open;
     End;
end;

End.
