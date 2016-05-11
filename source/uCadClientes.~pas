unit uCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask, ComCtrls,
  ExtCtrls, DB, ActnList, DBClientActns, DBActns, ToolEdit, RXDBCtrl,SqlExpr, DBXpress;

type
  TfrmCadClientes = class(TForm)
    Panel2: TPanel;
    DBText1: TDBText;
    pnlDadosComp: TPanel;
    PageControl1: TPageControl;
    tbsBasico: TTabSheet;
    Label53: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    tbsResid: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    tbsTrabalho: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    tbsConjuge: TTabSheet;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    tbsCompl: TTabSheet;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label37: TLabel;
    Label48: TLabel;
    Label66: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    lbl_porcentagem: TLabel;
    DBEdit45: TDBEdit;
    tbsAnalise: TTabSheet;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    ckbReg: TDBCheckBox;
    pnlComandos: TPanel;
    btAdicionar: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btLocalizar: TBitBtn;
    GridClientes: TDBGrid;
    dsClientes: TDataSource;
    dbeNMCLIE: TDBEdit;
    dbeNMCART: TDBEdit;
    dbeNRIDEN: TDBEdit;
    DBEdit7: TDBEdit;
    cmbUFEMISS: TDBComboBox;
    dbeCPFCGC: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit28: TDBEdit;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    ClientDataSetApply1: TClientDataSetApply;
    btAplicar: TBitBtn;
    dbeDTNASC: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit15: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    edtTPEMPR: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit39: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit20: TDBEdit;
    dbcSituacao: TDBLookupComboBox;
    dbeVLDESC: TDBEdit;
    edtData: TDBEdit;
    edtHora: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit48: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    cmbTPPESSO: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBLookupComboBox10: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBText2: TDBText;
    Label13: TLabel;
    Label72: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsClientesStateChange(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dsClientesDataChange(Sender: TObject; Field: TField);
    procedure btGravarClick(Sender: TObject);
    procedure dbeNMCARTEnter(Sender: TObject);
    procedure dbeNRIDENExit(Sender: TObject);
    procedure dbeDTNASCExit(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure edtTPEMPRKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit26KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit20KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure dbeCPFCGCExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Procedure NOVO_CLIENTE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;
  Transacao: TTransactionDesc;
  M_FLANAL : String;

implementation

uses udmInfoCartao, uInfoPrincipal, uFuncoes, uLocClientes;

{$R *.dfm}

procedure TfrmCadClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmInfoCartao.cdsClientes.Close;
     // 
     uFuncoes.Limpar_Status;
     // 
     Action := caFree;
end;

procedure TfrmCadClientes.dsClientesStateChange(Sender: TObject);
begin
    //GridClientes.Visible := dsClientes.State in [dsBrowse];
    //
    btAdicionar.Enabled  := dsClientes.State in [dsBrowse];
    btEditar   .Enabled  := (dsClientes.State in [dsBrowse])
                           And (dmInfoCartao.cdsClientes.RecordCount>0);
    btExcluir  .Enabled  := (dsClientes.State in [dsBrowse])
                           And (dmInfoCartao.cdsClientes.RecordCount>0);
    btLocalizar.Enabled  := (dsClientes.State in [dsBrowse])
                           And (dmInfoCartao.cdsClientes.RecordCount>0);
    //
    btGravar   .Enabled  := dsClientes.State in [dsInsert,dsEdit];
    btCancelar .Enabled  := dsClientes.State in [dsInsert,dsEdit];
    btAplicar  .Enabled  := (dsClientes.State in [dsBrowse])
                           And (dmInfoCartao.cdsClientes.RecordCount>0);
    //
end;

procedure TfrmCadClientes.btExcluirClick(Sender: TObject);
begin
    Try
        If Application.MessageBox('Deseja eliminar este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
           dmInfoCartao.cdsClientes.Delete;             // Apagar o regitro atual.
    Except
          Application.MessageBox('Este registro não pode ser excluido agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadClientes.dsClientesDataChange(Sender: TObject;
  Field: TField);
begin
     frmPrincipal.StatusBar1.Panels[2].Text := ' Registro: ' + IntToStr(dsClientes.DataSet.RecNo) +
                          ' de ' + IntToStr(dsClientes.DataSet.RecordCount);
end;

procedure TfrmCadClientes.btGravarClick(Sender: TObject);
begin
      If (dsClientes.State in [dsInsert, dsEdit]) Then
      begin
           If uFuncoes.Empty(dbeNMCLIE.Text) Then
           begin
                Application.MessageBox('Digite o nome do cliente!!!','ATENÇÃO',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dbeNMCLIE.SetFocus;
                Exit;
           End;
      End;
      //
      If (dsClientes.State = dsInsert) Then
      begin
          // NOVO_CLIENTE;
      End;
      //
   Try
      Transacao.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
      Transacao.IsolationLevel := xilREPEATABLEREAD;
      dmInfoCartao.SQLConnection1.StartTransaction(Transacao);
      //
      dmInfoCartao.cdsClientes.Post;
      dmInfoCartao.cdsClientes.ApplyUpdates(0);
      //
      dmInfoCartao.SQLConnection1.Commit(Transacao);
   Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmInfoCartao.cdsClientes.Cancel;
           dmInfoCartao.SQLConnection1.Rollback(Transacao);
        End;
   End;
end;

procedure TfrmCadClientes.NOVO_CLIENTE;
begin
     If (dmInfoCartao.cdsParametros.Active = False) Then
         dmInfoCartao.cdsParametros.Open;
     //
     dmInfoCartao.cdsParametros.Edit;
     dmInfoCartao.cdsParametros.FieldByName('PAR_CDCLIE').AsFloat :=
         dmInfoCartao.cdsParametros.FieldByName('PAR_CDCLIE').AsFloat+1;
     dmInfoCartao.cdsParametros.Post;
     //
     dmInfoCartao.cdsParametros.ApplyUpdates(0);
     //
     dmInfoCartao.cdsClientes.FieldByName('CLI_CDCLIE').AsString :=
         uFuncoes.StrZero(dmInfoCartao.cdsParametros.FieldByName('PAR_CDCLIE').AsString,7);
end;

procedure TfrmCadClientes.dbeNMCARTEnter(Sender: TObject);
begin
     If (dsClientes.State = dsInsert) Then
        dmInfoCartao.cdsClientes.FieldByName('CLI_NMCART').AsString :=
           dmInfoCartao.cdsClientes.FieldByName('CLI_NMCLIE').AsString;
end;

procedure TfrmCadClientes.dbeNRIDENExit(Sender: TObject);
begin
     If (dsClientes.State in [dsInsert,dsEdit])
        and not (uFuncoes.Empty(dbeNRIDEN.Text)) Then
            dmInfoCartao.cdsClientes.FieldByName('CLI_NRIDEN').AsString :=
          uFuncoes.StrZero(dmInfoCartao.cdsClientes.FieldByName('CLI_NRIDEN').AsString,14);
     //
     If (dsClientes.State in [dsInsert]) Then
     begin
          // Se nome do cliente estiver vazio
          If not uFuncoes.Empty(dbeNRIDEN.Text) Then
          begin
               If (dmInfoCartao.ValidaCampo2('CLI_NRIDEN',uFuncoes.StrZero(dbeNRIDEN.Text,14))) Then
               begin
                   Application.MessageBox('Identidade já cadastrada!',
                               'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeNRIDEN.SetFocus;
                   dbeNRIDEN.Clear;
                   Exit;
               End;
               dbeNRIDEN.Text := uFuncoes.StrZero(dbeNRIDEN.Text,14);
          End;
          //
     End;
end;

procedure TfrmCadClientes.dbeDTNASCExit(Sender: TObject);
begin
   If (dsClientes.State in [dsInsert,dsEdit])
       and (dbeDTNASC.text <> '  /  /    ') Then
   begin
        try
            StrToDate(dbeDTNASC.Text);
        except
            on EConvertError do
            begin
                 ShowMessage ('Data Inválida!');
                 dbeDTNASC.Clear;
                 dbeDTNASC.SetFocus;  
            End;
        end;
   End;
end;

procedure TfrmCadClientes.btAdicionarClick(Sender: TObject);
begin
    Try
           dmInfoCartao.cdsClientes.Append;             // Cria um novo regitro.
           NOVO_CLIENTE;
           dmInfoCartao.cdsClientes.FieldByName('CLI_CDUSUA').AsString := uInfoPrincipal.M_CDUSUA;
           cmbTPPESSO.SetFocus;
    Except
          Application.MessageBox('Este registro não pode incluir agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadClientes.btEditarClick(Sender: TObject);
begin
    Try
           dmInfoCartao.cdsClientes.Edit;             // Edita registro.
           If (M_FLANAL = 'S') Then
           begin
                dmInfoCartao.cdsClientes.FieldByName('CLI_DATANA').AsDateTime := Date();
                dmInfoCartao.cdsClientes.FieldByName('CLI_HORANA').AsString   :=
                                  TimetoStr(Time());
           end;
           //
           dbeNMCLIE.SetFocus;
    Except
          Application.MessageBox('Este registro não pode ser editar agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadClientes.btLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocClientes, frmLocClientes);
      frmLocClientes.Caption := 'Localizar Cliente';
      uLocClientes.frmLocClientes.M_NMFORM := 1;
      frmLocClientes.ShowModal;
  Finally
      frmLocClientes.Free;
      PageControl1.ActivePageIndex := 0;
  End;
end;

procedure TfrmCadClientes.edtTPEMPRKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['P','V','p','v',#8] ) then
          key:=#0;
end;

procedure TfrmCadClientes.DBEdit9KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['S','N','s','n',#8] ) then
          key:=#0;
end;

procedure TfrmCadClientes.DBEdit12KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['S','N','s','n',#8] ) then
          key:=#0;
end;

procedure TfrmCadClientes.DBEdit26KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8] ) then
        key:=#0;
end;

procedure TfrmCadClientes.DBEdit20KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['S','N','s','n',#8] ) then
          key:=#0;
end;

procedure TfrmCadClientes.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['S','N','s','n',#8] ) then
          key:=#0;
end;

procedure TfrmCadClientes.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['S','N','s','n',#8] ) then
          key:=#0;
end;

procedure TfrmCadClientes.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
     Key:= Upcase(Key);
end;

procedure TfrmCadClientes.PageControl1Change(Sender: TObject);
begin
     If (PageControl1.ActivePage = tbsAnalise) Then
     begin
         //
         edtData.Text := DatetoStr(Date);
         edtHora.Text := TimetoStr(Time);
     End;
end;

procedure TfrmCadClientes.dbeCPFCGCExit(Sender: TObject);
begin
      If (dsClientes.State in [dsInsert,dsEdit]) Then
      begin
           If not uFuncoes.Empty (dbeCPFCGC.Text) Then
               If uFuncoes.CPF(RemoveChar(dbeCPFCGC.Text))= False Then
               begin
                    ShowMessage('CPF inválido!!!!');
                    dbeCPFCGC.SetFocus;
                    dbeCPFCGC.Clear;
                    Exit;
               End;
      End;
      //
     If (dsClientes.State in [dsInsert]) Then
     begin
          // Se nome do cliente estiver vazio
          If not uFuncoes.Empty(dbeCPFCGC.Text) Then
          begin
               If (dmInfoCartao.ValidaCampo2('CLI_CPFCGC',dbeCPFCGC.Text)) Then
               begin
                   Application.MessageBox('CPF já cadastrada!',
                               'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeCPFCGC.SetFocus;
                   dbeCPFCGC.Clear;
                   Exit;
               End;
          End;
          //
     End;
end;

procedure TfrmCadClientes.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 0;
end;

end.
