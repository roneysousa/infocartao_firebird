unit uCadVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, Buttons, DB,
  RXCtrls, ActnList, DBClientActns, DBActns, DBXpress, SqlExpr;

type
  TfrmCadVenda = class(TForm)
    Panel2: TPanel;
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
    dsMovimento: TDataSource;
    dsCartao: TDataSource;
    Panel3: TPanel;
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
    dbtNMCLIE: TDBText;
    ActionList1: TActionList;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    ClientDataSetApply1: TClientDataSetApply;
    pnlDadosVenda: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbl_DTVENC: TLabel;
    dbtNMCRED: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    edDTVENC: TEdit;
    edVALOR: TDBEdit;
    edPARC: TDBEdit;
    edCDCRED: TDBEdit;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    edCDCRED2: TMaskEdit;
    lbl_Valor: TMaskEdit;
    lbl_Parcela: TMaskEdit;
    GridCredeciado: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNRCARTKeyPress(Sender: TObject; var Key: Char);
    procedure edNRCARTEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dsMovimentoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure edCDCREDExit(Sender: TObject);
    procedure edPARCExit(Sender: TObject);
    procedure edVALORExit(Sender: TObject);
    procedure edNRCART2KeyPress(Sender: TObject; var Key: Char);
    procedure edNRCART2Enter(Sender: TObject);
    procedure edCDCRED2Enter(Sender: TObject);
    procedure edCDCRED2Exit(Sender: TObject);
    procedure edCDCRED2KeyPress(Sender: TObject; var Key: Char);
    procedure edCDCREDKeyPress(Sender: TObject; var Key: Char);
    procedure edPARCKeyPress(Sender: TObject; var Key: Char);
    procedure edCDCREDEnter(Sender: TObject);
  private
     Procedure Limpar_Tela;
     Procedure Dados_Cliente;
     Procedure Validar_Entrada;
     Procedure Legendas;
     Procedure Legenda_Invisivel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVenda: TfrmCadVenda;
  M_DTVENC: TDate;
  M_CDCRED,M_LETRA : String;
  M_NMCART, M_DTNASC, M_NRIDEN , M_OREMIS , M_UFEMIS : String;
  M_NUMCPF, M_NOMPAI, M_NOMMAE : String;

implementation

uses udmInfoCartao, uInfoPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmInfoCartao.cdsMovimento.Close;
     dmInfoCartao.cdsCartoes.Close;
     dmInfoCartao.cdsClientes.Close;
     //
     Action := caFree; 
end;

procedure TfrmCadVenda.Limpar_Tela;
begin
      If (edNRCART.Visible = True) Then
          edNRCART.Clear;
      If (edNRCART2.Visible = True) Then
          edNRCART2.Clear;
      txtNMCLIE.Caption := '.';
      txtCONVE.Caption  := '.';
      txtVALID.Caption  := '.';
      dbtNMCRED.Visible := False;
      //
      pnlDadosVenda.Visible    := False;
      pnlDadosPessoais.Visible := False;
      dbtNMCLIE.Visible        := False;
end;

procedure TfrmCadVenda.edNRCARTKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #27) Then
    begin
         Key := #0;
         edNRCART.Clear;
         edNRCART.SetFocus;
    End;
    //
    If (key = #13) Then
    begin
       Key := #0;
       // Se for Venda
       If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',edNRCART.Text,[])) Then
       Begin
               // Dados do cartão
               dbtNMCLIE.Visible := True;
               txtNMCLIE.Caption := dmInfoCartao.cdsCartoes.FieldByName('CAR_NMCLIE').AsString;
               txtVALID.Caption  := Copy(dmInfoCartao.cdsCartoes.FieldByName('CAR_DTVALI').AsString,1,2)
                            +'/'+Copy(dmInfoCartao.cdsCartoes.FieldByName('CAR_DTVALI').AsString,3,4);
               pnlDadosVenda.Visible := True;
               // Procura cliente
               If (dmInfoCartao.cdsClientes.Locate('CLI_CDCLIE',
                   dmInfoCartao.cdsCartoes.FieldByName('CAR_CDCLIE').AsString,[])) Then
               Begin
                    txtCONVE.Caption  := dmInfoCartao.cdsClientes.FieldByName('CLI_NMCLIE').AsString;
                    pnlDadosPessoais.Visible := True;
                    //
                    Dados_Cliente;
                    //
                    M_DTVENC := StrtoDate(FloattoStr(dmInfoCartao.cdsCartoes.FieldByName('CAR_DIAFAT').AsInteger)
                       +Copy(DatetoStr(Date),3,8));
                    //
                    If (M_DTVENC < Date()) Then
                          edDTVENC.Text := DatetoStr(IncMonth(M_DTVENC,1))
                    Else
                          edDTVENC.Text := DatetoStr(M_DTVENC);
               End
               Else
                     ShowMessage('Não encontrado...');
               //
               If (dmInfoCartao.cdsCartoes.FieldByName('CAR_FLSITU').AsString <> 'N') Then
               begin
                    Application.MessageBox('Situação do cartão irregular!',
                          'ATENÇÃO', MB_OK+MB_ICONSTOP);
                    Limpar_Tela;
                    edNRCART.SetFocus;
                    Exit;
               End;
               // Incluir novo movimento
               If (dmInfoCartao.cdsMovimento.Active = False) then
                     dmInfoCartao.cdsMovimento.Open;
               //
               dmInfoCartao.cdsMovimento.Append;
               edVALOR.SetFocus;
         End
         Else
         begin
              Application.MessageBox('N.º de cartão não encontrado!',
                          'ATENÇÃO', MB_OK+MB_ICONinformation);
              edNRCART.Clear;
              edNRCART.SetFocus;
         End;
    End;          // fim-pressionamento do ENTER
end;

procedure TfrmCadVenda.edNRCARTEnter(Sender: TObject);
begin
     If (dsMovimento.State in [dsInsert]) Then
       dmInfoCartao.cdsMovimento.Cancel;
     //
     Limpar_Tela;
end;

procedure TfrmCadVenda.FormActivate(Sender: TObject);
begin
     dmInfoCartao.cdsMovimento.Open;
     //
     dmInfoCartao.cdsCartoes.Open;
     dmInfoCartao.cdsClientes.Open;
end;

procedure TfrmCadVenda.dsMovimentoStateChange(Sender: TObject);
begin
    btConfirmar.Enabled := dsMovimento.State in [dsInsert, dsEdit];
    btCancelar .Enabled := dsMovimento.State in [dsInsert, dsEdit];
end;

procedure TfrmCadVenda.FormCreate(Sender: TObject);
begin
     Limpar_Tela;
     M_CDCRED := '';
end;

procedure TfrmCadVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (dsMovimento.State in [dsInsert]) Then
     Begin
          If (key = #27) Then
          begin
               Key := #0;
               dmInfoCartao.cdsMovimento.Cancel;
               Limpar_Tela;
               If (edNRCART.Visible = True) Then
               begin
                    edNRCART.Clear;
                    edNRCART.SetFocus;
               End;
               If (edNRCART2.Visible = True) Then
               begin
                    edNRCART2.Clear;
                    edNRCART2.SetFocus;
               End;
         End;
     End;
end;

procedure TfrmCadVenda.Dados_Cliente;
begin
     M_NMCART := dmInfoCartao.cdsClientes.FieldByName('CLI_NMCART').AsString;
     M_DTNASC := dmInfoCartao.cdsClientes.FieldByName('CLI_DTNASC').AsString;
     M_NRIDEN := dmInfoCartao.cdsClientes.FieldByName('CLI_NRIDEN').AsString;
     M_OREMIS := dmInfoCartao.cdsClientes.FieldByName('CLI_ORGEMI').AsString;
     M_UFEMIS := dmInfoCartao.cdsClientes.FieldByName('CLI_UFEMIS').AsString;
     M_NUMCPF := dmInfoCartao.cdsClientes.FieldByName('CLI_CPFCGC').AsString;
     M_NOMPAI := dmInfoCartao.cdsClientes.FieldByName('CLI_NOMPAI').AsString;
     M_NOMMAE := dmInfoCartao.cdsClientes.FieldByName('CLI_NOMMAE').AsString;
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

procedure TfrmCadVenda.btCancelarClick(Sender: TObject);
begin
     dmInfoCartao.cdsMovimento.Cancel;
     Limpar_Tela;
end;

procedure TfrmCadVenda.btConfirmarClick(Sender: TObject);
Var
    M_NRVEND, M_DTREFE : String;
    M_QTPARC,W_QTPARC, M_DIAFAT : Integer;
    M_VLPARC, M_VLDIFE,M_VLVEND : Double;
    M_DTFATU,M_ULFATU, M_DTVENC : Tdate;
    M_ANO, M_MES,M_DIA : Word;
    TD: TTransactionDesc;
begin
  if not (dmInfoCartao.SQLConnection1.InTransaction) then
  begin
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    // Inicia um transação no BD
    dmInfoCartao.SQLConnection1.StartTransaction(TD);
    //
    Try
     //
     Validar_Entrada;
     //
     If (dsMovimento.State in [dsInsert]) Then
     Begin
          M_QTPARC := 0;
          // Tabela da parametros
          If (dmInfoCartao.cdsParametros.Active = False) Then
             dmInfoCartao.cdsParametros.Open;
          //
          dmInfoCartao.cdsParametros.Edit;
          dmInfoCartao.cdsParametros.FieldByName('PAR_NRVEND').AsFloat :=
                dmInfoCartao.cdsParametros.FieldByName('PAR_NRVEND').AsFloat+1;
          M_NRVEND := uFuncoes.StrZero(dmInfoCartao.cdsParametros.FieldByName('PAR_NRVEND').AsString,7);
          M_ULFATU := dmInfoCartao.cdsParametros.FieldByName('PAR_DTFATU').AsFloat;
          // 
          dmInfoCartao.cdsParametros.Post;
          dmInfoCartao.cdsParametros.ApplyUpdates(0);
          // Tabela de cartao
          dmInfoCartao.cdsCartoes.Edit;
          dmInfoCartao.cdsCartoes.FieldByName('CAR_VLUTIL').AsCurrency :=
             dmInfoCartao.cdsCartoes.FieldByName('CAR_VLUTIL').AsCurrency
             +dmInfoCartao.cdsMovimento.FieldByName('MOV_VLVEND').AsCurrency;
          dmInfoCartao.cdsCartoes.FieldByName('CAR_DTUTIL').AsDateTime := Date();
          dmInfoCartao.cdsCartoes.FieldByName('CAR_HOUTIL').AsString := TimetoStr(Time);
          // Grava alterações
          dmInfoCartao.cdsCartoes.Post;
          dmInfoCartao.cdsCartoes.ApplyUpdates(0);
          //
          M_DIAFAT := dmInfoCartao.cdsCartoes.FieldByName('CAR_DIAFAT').AsInteger;
          // Tabela de Movimento
          dmInfoCartao.cdsMovimento.FieldByName('MOV_NRVEND').AsString := M_NRVEND;
          dmInfoCartao.cdsMovimento.FieldByName('MOV_NRCART').AsString := edNRCART.Text;
          dmInfoCartao.cdsMovimento.FieldByName('MOV_DTMOVI').AsDateTime := Date();
          dmInfoCartao.cdsMovimento.FieldByName('MOV_HOMOVI').AsString := TimetoStr(Time);
          dmInfoCartao.cdsMovimento.FieldByName('MOV_VLLIMI').AsFloat  :=
                                   dmInfoCartao.cdsCartoes.FieldByName('CAR_VLLIMI').AsFloat;
          dmInfoCartao.cdsMovimento.FieldByName('MOV_VLUTIL').AsFloat  :=
                                   dmInfoCartao.cdsCartoes.FieldByName('CAR_VLUTIL').AsFloat;
          dmInfoCartao.cdsMovimento.FieldByName('MOV_FLSITU').AsString :=
                                   dmInfoCartao.cdsCartoes.FieldByName('CAR_FLSITU').AsString;
          dmInfoCartao.cdsMovimento.FieldByName('MOV_CDOPER').AsString := uInfoPrincipal.M_CDUSUA;
          // 
          M_QTPARC := dmInfoCartao.cdsMovimento.FieldByName('MOV_QTPARC').AsInteger;
          M_VLVEND := dmInfoCartao.cdsMovimento.FieldByName('MOV_VLVEND').AsCurrency;
          dmInfoCartao.cdsMovimento.FieldByName('MOV_CDCRED').AsString :=
                  uFuncoes.StrZero(dmInfoCartao.cdsMovimento.FieldByName('MOV_CDCRED').AsString,6);
          // Grava as alterações
          dmInfoCartao.cdsMovimento.Post;
          dmInfoCartao.cdsMovimento.ApplyUpdates(0);
          // Tabela de debito
          If (dmInfoCartao.cdsDebito.Active = False) Then
              dmInfoCartao.cdsDebito.Open;
          //
          M_DTFATU := Date();
          DecodeDate (M_DTFATU, M_ANO, M_MES, M_DIA);
          M_DTREFE := uFuncoes.StrZero(InttoStr(M_DIA),2)+'/'+uFuncoes.MesExtenso(Date);
          W_QTPARC := 0;
          M_VLPARC :=
             uFuncoes.Arredondar(dmInfoCartao.cdsMovimento.FieldByName('MOV_VLVEND').Value/M_QTPARC,2);
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
                // Incluit um novo
                dmInfoCartao.cdsDebito.Append;
                dmInfoCartao.cdsDebito.FieldByName('DEB_NRVEND').AsString  := M_NRVEND;
                dmInfoCartao.cdsDebito.FieldByName('DEB_NRPARC').AsInteger := W_QTPARC;
                dmInfoCartao.cdsDebito.FieldByName('DEB_NRCART').AsString  := edNRCART.Text;
                dmInfoCartao.cdsDebito.FieldByName('DEB_CDCLIE').AsString  :=
                               dmInfoCartao.cdsCartoes.FieldByName('CAR_CDCLIE').AsString;
                dmInfoCartao.cdsDebito.FieldByName('DEB_CDCRED').AsString  :=
                               dmInfoCartao.cdsMovimento.FieldByName('MOV_CDCRED').AsString;
                dmInfoCartao.cdsDebito.FieldByName('DEB_DTVENC').AsDateTime := M_DTVENC;
                dmInfoCartao.cdsDebito.FieldByName('DEB_QTPARC').AsInteger := M_QTPARC;
                dmInfoCartao.cdsDebito.FieldByName('DEB_VLPARC').AsCurrency := M_VLPARC;
                dmInfoCartao.cdsDebito.FieldByName('DEB_DTREFE').AsString  := M_DTREFE;
                dmInfoCartao.cdsDebito.FieldByName('DEB_FLSITU').AsString  := 'A';
                dmInfoCartao.cdsDebito.FieldByName('DEB_DTMOVI').AsDateTime := Date();
                dmInfoCartao.cdsDebito.FieldByName('DEB_TPMOVI').AsString  := 'D';
                dmInfoCartao.cdsDebito.FieldByName('DEB_DIAFAT').AsString  := uFuncoes.StrZero(InttoStr(M_DIAFAT),2);
                // Grava as alterações
                dmInfoCartao.cdsDebito.Post;
                dmInfoCartao.cdsDebito.ApplyUpdates(0);
                //
              End;
          End;   // Fim-do-enquanto
          //
          dmInfoCartao.SQLConnection1.Commit(TD); {on success, commit the changes};
          //
          Application.MessageBox(PChar('Registro de venda concluido!'),
              PChar('VENDA:'+M_NRVEND), MB_OK+MB_ICONINFORMATION);
          //
          dmInfoCartao.cdsMovimento.Cancel;
          Limpar_Tela;
          edNRCART.SetFocus;
     End;
   Except
         dmInfoCartao.SQLConnection1.Rollback(TD);  {on failure, undo the changes}
         Application.MessageBox('Error ao tentar gravar venda!',
             'ATENÇÃO', MB_OK+MB_ICONERROR);
          Limpar_Tela;
          edNRCART.SetFocus;
   End;
  //
  End;
end;

procedure TfrmCadVenda.Validar_Entrada;
begin
     If uFuncoes.Empty (edVALOR.Text) Then
     begin
           ShowMessage('Digite o valor da venda?');
           edVALOR.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty (edPARC.Text) Then
     begin
           ShowMessage('Digite a quantidade de parcelas?');
           edPARC.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty (edCDCRED.Text) Then
     begin
           ShowMessage('Digite o código do credênciado?');
           edCDCRED.SetFocus;
           Exit;
     End;
end;

procedure TfrmCadVenda.edCDCREDExit(Sender: TObject);
begin
     If (dsMovimento.State = dsInsert) Then
        dmInfoCartao.cdsMovimento.FieldByName('MOV_CDCRED').AsString :=
          uFuncoes.StrZero(dmInfoCartao.cdsMovimento.FieldByName('MOV_CDCRED').AsString,6);
end;

procedure TfrmCadVenda.edPARCExit(Sender: TObject);
begin
     If (dsMovimento.State in [dsInsert,dsEdit]) Then
     Begin
          If uFuncoes.Empty(edPARC.Text) Then
              edPARC.SetFocus;
     End;
end;

procedure TfrmCadVenda.edVALORExit(Sender: TObject);
begin
     If (dsMovimento.State in [dsInsert,dsEdit]) Then
     Begin
          If uFuncoes.Empty(edVALOR.Text) Then
          begin
               If Application.MessageBox(PChar('Confirmar cancelamento de venda? '),
                     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                    edVALOR.SetFocus
               Else
                    btCancelarClick(Sender);
          End;
     End;
end;

procedure TfrmCadVenda.edNRCART2KeyPress(Sender: TObject; var Key: Char);
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
         If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',edNRCART2.Text,[])) Then
         Begin
               //
               dbtNMCLIE.Visible := True;
               txtNMCLIE.Caption := dmInfoCartao.cdsCartoesCAR_NMCLIE.Value;
               txtVALID.Caption  := Copy(dmInfoCartao.cdsCartoesCAR_DTVALI.Value,1,2)
                               +'/'+Copy(dmInfoCartao.cdsCartoesCAR_DTVALI.Value,3,4);
               pnlDadosVenda.Visible := True;
               //
               If (dmInfoCartao.cdsClientes.Locate('CLI_CDCLIE',dmInfoCartao.cdsCartoesCAR_CDCLIE.Value,[])) Then
               Begin
                    txtCONVE.Caption  := dmInfoCartao.cdsClientesCLI_NMCLIE.Value;
                    pnlDadosPessoais.Visible := True;
                    M_DTVENC := StrtoDate(FloattoStr(dmInfoCartao.cdsCartoesCAR_DIAFAT.Value)+Copy(DatetoStr(Date),3,8));
                    If (M_DTVENC < Date()) Then
                          edDTVENC.Text := DatetoStr(IncMonth(M_DTVENC,1))
                    Else
                          edDTVENC.Text := DatetoStr(M_DTVENC);
               End
               Else
                     ShowMessage('Não encontrado...');
               //
               If (dmInfoCartao.cdsCartoesCAR_FLSITU.Value <> 'N') Then
               begin
                    Application.MessageBox('Situação do cartão irregular!',
                          'ATENÇÃO', MB_OK+MB_ICONSTOP);
                    Limpar_Tela;
                    edNRCART2.SetFocus;
                    Exit;
               End;
               // Incluir novo movimento
               If (dmInfoCartao.cdsMovimento.Active = False) then
                     dmInfoCartao.cdsMovimento.Open;
               //
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
         begin
              Application.MessageBox('N.º de cartão não encontrado!',
                          'ATENÇÃO', MB_OK+MB_ICONinformation);
              edNRCART2.Clear;
              edNRCART2.SetFocus;
         End;
      // End;       // Fim-do-cancelamento}
    End;
end;

procedure TfrmCadVenda.edNRCART2Enter(Sender: TObject);
begin
     //
     Limpar_Tela;
end;

procedure TfrmCadVenda.Legendas;
begin
    //
    lbl_Valor.Left   := edVALOR.Left;
    lbl_Parcela.Left := edPARC.Left;
    //
    lbl_Valor.Visible := True;
    lbl_Parcela.Visible := True;
    //
    lbl_Valor.Text   := ' ';
    lbl_Parcela.Text := ' ';
end;

procedure TfrmCadVenda.Legenda_Invisivel;
begin
    //
    edVALOR.Visible    := False;
    edPARC.Visible     := False;
    edDTVENC.Visible   := False;
    lbl_DTVENC.Visible := False;
end;

procedure TfrmCadVenda.edCDCRED2Enter(Sender: TObject);
begin
     If not (uFuncoes.Empty(M_CDCRED)) Then
           edCDCRED2.Text := M_CDCRED;
end;

procedure TfrmCadVenda.edCDCRED2Exit(Sender: TObject);
begin
     If (dsMovimento.State in [dsInsert,dsEdit]) Then
     Begin
          If uFuncoes.Empty(edCDCRED.Text) Then
              edCDCRED.SetFocus
          Else
          begin
               edCDCRED2.Text := uFuncoes.StrZero(edCDCRED2.Text,6);
               If dmInfoCartao.cdsCredenciados.Locate('CRE_CDCRED',edCDCRED2.Text,[]) Then
                    dbtNMCRED.Visible := True
               Else
               begin
                     ShowMEssage('Credênciado não encontrado!');
                     dbtNMCRED.Visible := False;
                     edCDCRED2.SetFocus;
                     Exit;
               End;
          End;
     End;
end;

procedure TfrmCadVenda.edCDCRED2KeyPress(Sender: TObject; var Key: Char);
Var
    M_NRVEND : String;
    TD: TTransactionDesc;
begin
     If not( key in['0'..'9',#8, #13, #27] ) then
         Key := #0;
     // se pressionar ESC
     If (key = #27) Then
     begin
               Key := #0;
               dmInfoCartao.cdsMovimento.Cancel;
               Limpar_Tela;
               edNRCART2.SetFocus;
     End;
     // se pressionar ENTER
     If (key = #13) And (uFuncoes.Empty(edCDCRED2.Text) ) Then
     begin
          Key := #0;
          GridCredeciado.Left    := 247;
          GridCredeciado.Top     := 53;
          GridCredeciado.Visible := True;
          GridCredeciado.SetFocus;
     End;
     //
     If (key = #13) And not(uFuncoes.Empty(edCDCRED2.Text)) Then
     begin
          Key := #0;
          //
          If (dmInfoCartao.cdsMovimento.Locate('MOV_CDCRED;MOV_NRCART',
                 VarArrayOf([uFuncoes.StrZero(edCDCRED2.Text,6),edNRCART2.Text]),[]))
            and (dmInfoCartao.cdsMovimentoMOV_FLSITU.Value = 'N')
            And (dmInfoCartao.cdsMovimento.FieldByName('MOV_DTMOVI').AsDateTime = Date()) Then
          begin
               dbtNMCRED.Visible := True;
               lbl_Valor.Text   := FormatFloat('###,###,##0.00', dmInfoCartao.cdsMovimentoMOV_VLVEND.Value);
               lbl_Parcela.Text := dmInfoCartao.cdsMovimentoMOV_QTPARC.AsString;
               //
               If Application.MessageBox(PChar('Confirmar cancelamento de venda? :'+dmInfoCartao.cdsMovimentoMOV_NRVEND.Value),
                     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
               begin    // se SIM
                 Try
                    TD.TransactionID := 1;
                    TD.IsolationLevel := xilREADCOMMITTED;
                    // Inicia um transação no BD
                    dmInfoCartao.SQLConnection1.StartTransaction(TD);
                    // Tabela de Movimento
                    dmInfoCartao.cdsMovimento.Edit;
                    dmInfoCartao.cdsMovimentoMOV_FLSITU.Value := 'C';
                    dmInfoCartao.cdsMovimentoMOV_DTCANC.Value := Date();
                    dmInfoCartao.cdsMovimentoMOV_HOCANC.Value := TimetoStr(Time());
                    dmInfoCartao.cdsMovimentoMOV_OPCANC.Value := uInfoPrincipal.M_CDUSUA;
                    M_NRVEND := dmInfoCartao.cdsMovimentoMOV_NRVEND.Value;
                    // Grava as alterações
                    dmInfoCartao.cdsMovimento.Post;
                    dmInfoCartao.cdsMovimento.ApplyUpdates(0); 
                    // Tabela de Debito
                    If (dmInfoCartao.cdsDebito.Active =  False) Then
                        dmInfoCartao.cdsDebito.Open;
                    //
                    With dmInfoCartao.dstDebito do
                    begin
                         DisableControls;
                         Active      := False;
                         CommandText := 'Select * from ACCDEB Where DEB_NRVEND='+QuotedStr(M_NRVEND);
                         Active      := True;
                         EnableControls;
                    End;
                    //
                    With dmInfoCartao.cdsDebito do
                    begin
                         DisableControls;
                         Active      := False;
                         Active      := True;
                         EnableControls;
                    End;
                    //
                    dmInfoCartao.cdsDebito.First;
                    While not (dmInfoCartao.cdsDebito.Eof) do
                    begin
                         dmInfoCartao.cdsDebito.Edit;
                         If (dmInfoCartao.cdsDebitoDEB_FLSITU.Value = 'A') Then
                             dmInfoCartao.cdsDebitoDEB_FLSITU.Value := 'C';
                         //
                         dmInfoCartao.cdsDebito.Next;
                    End;
                    //
                    dmInfoCartao.cdsDebito.ApplyUpdates(0);
                    //
                    dmInfoCartao.cdsCartoes.Edit;
                    dmInfoCartao.cdsCartoesCAR_VLUTIL.Value :=
                    dmInfoCartao.cdsCartoesCAR_VLUTIL.Value - dmInfoCartao.cdsMovimentoMOV_VLVEND.Value;
                    //
                    If (dmInfoCartao.cdsCartoesCAR_VLUTIL.Value < 0) Then
                        dmInfoCartao.cdsCartoesCAR_VLUTIL.Value := 0;
                    // Grava as alterações
                    dmInfoCartao.cdsCartoes.Post;
                    dmInfoCartao.cdsCartoes.ApplyUpdates(0);
                    //
                    dmInfoCartao.cdsDebito.Close;
                    // Grava e Fechar a transação no BD.
                    dmInfoCartao.SQLConnection1.Commit(TD);
                    //
                    Application.MessageBox('Registro de venda cancelado!',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                    //
                    Limpar_Tela;
                    edNRCART2.Clear;
                    edNRCART2.SetFocus;
                 Except
                     // Cancela a transação no DB
                     dmInfoCartao.SQLConnection1.Rollback(TD);
                     Application.MessageBox('Erro no cancelamento de venda!',
                               'ATENÇÃO', MB_OK+MB_ICONSTOP);
                     Limpar_Tela;
                 End;
               End
               Else     // se NÃO
               begin
                    Limpar_Tela;
                    edNRCART2.Clear;
                    edNRCART2.SetFocus;
               End;
          End
          Else
          begin
               Application.MessageBox('Não ha venda neste cartão'+#13
                                      +'para este credênciado!',
                          'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
               Limpar_Tela;
               dbtNMCRED.Visible := False;
               edNRCART2.Clear;
               edNRCART2.SetFocus;
          End;
          //
     End;     //fim-pressionar ENTER
end;

procedure TfrmCadVenda.edCDCREDKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8] ) then
         Key := #0;
end;

procedure TfrmCadVenda.edPARCKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8] ) then
         Key := #0;
end;

procedure TfrmCadVenda.edCDCREDEnter(Sender: TObject);
begin
     If (edCDCRED.Text = '000000') Then
        edCDCRED.Clear; 
end;

End.
