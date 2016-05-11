unit uCadCartoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, Mask, RxLookup, Buttons,
  DBClientActns, DBActns, ActnList, ToolEdit, RXDBCtrl, DBXpress, FMTBcd,
  SqlExpr;

type
  TfrmCadCartoes = class(TForm)
    Panel2: TPanel;
    DBText1: TDBText;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCartoes: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    dbeNMCLIE: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    dbeDTFATU: TDBLookupComboBox;
    Label10: TLabel;
    btAdicionar: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btLocalizar: TBitBtn;
    btCancelar: TBitBtn;
    btGravar: TBitBtn;
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
    dbeDTEMISS: TDBDateEdit;
    dbeCDCLIE: TDBEdit;
    spLocalizar: TSpeedButton;
    lbl_NMCLIE: TLabel;
    qryLocCliente: TSQLQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure dsCartoesStateChange(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure dsCartoesDataChange(Sender: TObject; Field: TField);
    procedure cmbCLIENTEExit(Sender: TObject);
    procedure dbeDTEMISSExit(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocalizarClick(Sender: TObject);
    procedure dbeCDCLIEExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    procedure LOCALIZA_CLIENTE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCartoes: TfrmCadCartoes;
  Transacao: TTransactionDesc;
  M_NRCART,W_NRCART, M_CDCLIE: String;
  M_VALCAR, M_DTVALI : Double;

implementation

Uses udmInfoCartao, uFuncoes, uInfoPrincipal, uLocCartaoCliente,
  uLocClientes;

{$R *.dfm}

procedure TfrmCadCartoes.FormActivate(Sender: TObject);
begin
{     If (dmInfoCartao.cdsCartoes.Active = False) Then
         dmInfoCartao.cdsCartoes.Open;}
      LOCALIZA_CLIENTE;   
end;

procedure TfrmCadCartoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmInfoCartao.cdsCartoes.Close;
     //
     uFuncoes.Limpar_Status;
     //
     Action := caFree;
end;

procedure TfrmCadCartoes.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['S','N','s','n',#8] ) then
          key:=#0;
end;

procedure TfrmCadCartoes.btAdicionarClick(Sender: TObject);
begin
      Try
           //pnlComandos.Visible :=  True;
           dmInfoCartao.cdsCartoes.Append;
           //
           If (dmInfoCartao.cdsParametros.Active = False) Then
               dmInfoCartao.cdsParametros.Open;
           //     
           dmInfoCartao.cdsParametros.Edit;
           M_VALCAR := dmInfoCartao.cdsParametros.FieldByName('PAR_VALCAR').AsFloat;
           dmInfoCartao.cdsParametros.Cancel;
           //
           M_DTVALI := Date()+M_VALCAR;
           dmInfoCartao.cdsCartoes.FieldByName('CAR_DTVALI').AsString :=
               Copy(DatetoStr(M_DTVALI),4,2)+Copy(DatetoStr(M_DTVALI),7,4);
           dmInfoCartao.cdsCartoes.FieldByName('CAR_CDUSUA').AsString :=
               uInfoPrincipal.M_CDUSUA;      
           //cmbCLIENTE.SetFocus;
           lbl_NMCLIE.Caption := '';
           dbeCDCLIE.SetFocus;
      Except
           Application.MessageBox('Error ao tentar incluir registro', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
           dmInfoCartao.cdsCartoes.Cancel;          
      End;
end;

procedure TfrmCadCartoes.btEditarClick(Sender: TObject);
begin
      Try
           //pnlComandos.Visible :=  True;
           dmInfoCartao.cdsCartoes.Edit;
           //
           dbeNMCLIE.SetFocus;
      Except
           Application.MessageBox('Error ao tentar editar registro.', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
           dmInfoCartao.cdsCartoes.Cancel;
      End;
end;

procedure TfrmCadCartoes.dsCartoesStateChange(Sender: TObject);
begin
    dbeCDCLIE.Enabled := dsCartoes.State in [dsInsert];
    spLocalizar.Enabled := dsCartoes.State in [dsInsert];
    //
    btAdicionar.Enabled  := dsCartoes.State in [dsBrowse];
    btEditar   .Enabled  := (dsCartoes.State in [dsBrowse])
                           And (dmInfoCartao.cdsCartoes.RecordCount>0);
    btExcluir  .Enabled  := (dsCartoes.State in [dsBrowse])
                           And (dmInfoCartao.cdsCartoes.RecordCount>0);
    btLocalizar.Enabled  := (dsCartoes.State in [dsBrowse])
                           And (dmInfoCartao.cdsCartoes.RecordCount>0);
    //
    btGravar   .Enabled  := dsCartoes.State in [dsInsert,dsEdit];
    btCancelar .Enabled  := dsCartoes.State in [dsInsert,dsEdit];
    {btAplicar  .Enabled  := (dsCartoes.State in [dsBrowse])
                           And (dmInfoCartao.cdsCartoes.RecordCount>0);}
end;

procedure TfrmCadCartoes.btExcluirClick(Sender: TObject);
begin
    Try
        If Application.MessageBox('Deseja eliminar este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
        Begin
           dmInfoCartao.cdsCartoes.Delete;             // Apagar o regitro atual.
           dmInfoCartao.cdsCartoes.ApplyUpdates(0);
        End;
    Except
          Application.MessageBox('Este registro não pode ser excluido agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadCartoes.btGravarClick(Sender: TObject);
Var
    N_NRCART:String;
    W_NRCART:Real;
begin
      If uFuncoes.Empty(dbeCDCLIE.Text) then
      begin
          Application.MessageBox('Seleciona o cliente.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCDCLIE.SetFocus;
          Exit;
      End;
      //
      If uFuncoes.Empty(dbeNMCLIE.Text) then
      begin
          Application.MessageBox('Digite o nome do cliente.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeNMCLIE.SetFocus;
          Exit;
      End;
      //
      If uFuncoes.Empty(dbeDTFATU.Text) then
      begin
          Application.MessageBox('Selecione o dia fatura.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeDTFATU.SetFocus;
          Exit;
      End;
      //
   Try
      Transacao.TransactionID := StrtoInt(uInfoPrincipal.M_CDUSUA);
      Transacao.IsolationLevel := xilREPEATABLEREAD;
      dmInfoCartao.SQLConnection1.StartTransaction(Transacao);
      //
      If (dsCartoes.State in [dsInsert]) Then
      begin
           dmInfoCartao.cdsParametros.Edit;
           dmInfoCartao.cdsParametros.FieldByName('PAR_NRCART').AsFloat :=
              dmInfoCartao.cdsParametros.FieldByName('PAR_NRCART').AsFloat+1;
           dmInfoCartao.cdsParametros.Post;
           //
           dmInfoCartao.cdsParametros.ApplyUpdates(0);
           //
           M_CDCLIE := dmInfoCartao.cdsCartoes.FieldByName('CAR_CDCLIE').AsString;
           W_NRCART := StrtoFloat(M_CDCLIE)+dmInfoCartao.cdsParametros.FieldByName('PAR_NRCART').AsFloat;
           W_NRCART := W_NRCART / 0.1616;
           M_NRCART := Format('%15.3f',[W_NRCART]);
           M_NRCART := Ufuncoes.Removechar(M_NRCART);
           M_NRCART := Copy(M_CDCLIE,4,4)+FloattoSTr(dmInfoCartao.cdsParametros.FieldByName('PAR_NRCART').AsFloat)+StrZero(M_NRCART,5);
           M_NRCART := Copy(M_NRCART,1,13);
           //
           dmInfoCartao.cdsCartoes.FieldByName('CAR_NRCART').AsString := M_NRCART;
           dmInfoCartao.cdsCartoes.FieldByName('CAR_FLSITU').AsString := 'N';
      End;
      // Grava as alterações
      dmInfoCartao.cdsCartoes.Post;
      dmInfoCartao.cdsCartoes.ApplyUpdates(0); 
      LOCALIZA_CLIENTE;
      //
      dmInfoCartao.SQLConnection1.Commit(Transacao);
   Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmInfoCartao.cdsCartoes.Cancel;
           dmInfoCartao.SQLConnection1.Rollback(Transacao);
        End;
   End;
end;

procedure TfrmCadCartoes.dsCartoesDataChange(Sender: TObject;
  Field: TField);
begin
     frmPrincipal.StatusBar1.Panels[2].Text := ' Registro: ' + IntToStr(dsCartoes.DataSet.RecNo) +
                          ' de ' + IntToStr(dsCartoes.DataSet.RecordCount);
end;

procedure TfrmCadCartoes.cmbCLIENTEExit(Sender: TObject);
begin
     If (dsCartoes.State in [dsInsert]) Then
        dmInfoCartao.cdsCartoes.FieldByName('CAR_NMCLIE').AsString :=
            dmInfoCartao.cdsCartoes.FieldByName('CAR_NMTITU').AsString;
end;

procedure TfrmCadCartoes.dbeDTEMISSExit(Sender: TObject);
begin
   //
   If (dsCartoes.State in [dsInsert,dsEdit])
       and (dbeDTEMISS.text <> '  /  /    ') Then
   begin
        try
            StrToDate(dbeDTEMISS.Text);
        except
            on EConvertError do
            begin
                 ShowMessage ('Data Inválida!');
                 dbeDTEMISS.Clear;
                 dbeDTEMISS.SetFocus;
            End;
        end;
   End;

end;

procedure TfrmCadCartoes.btLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocCartao, frmLocCartao);
      frmLocCartao.ShowModal;
  Finally
      frmLocCartao.Free;
      LOCALIZA_CLIENTE;
  End;

end;

procedure TfrmCadCartoes.dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadCartoes.spLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocClientes, frmLocClientes);
      frmLocClientes.Caption := 'Localizar Cliente';
      uLocClientes.frmLocClientes.M_NMFORM := 3;
      frmLocClientes.ShowModal;
  Finally
      frmLocClientes.Free;
      dbeCDCLIE.SetFocus;
  End;
end;

procedure TfrmCadCartoes.LOCALIZA_CLIENTE;
begin
     With qryLocCliente do
     begin
          Close;
          Params.ParamByName('pCDCLIE').AsString := uFuncoes.StrZero(dbeCDCLIE.Text,7);
          Open;
     End;
     //
     If (qryLocCliente.IsEmpty) Then
     Begin
          Application.MessageBox('Código não cadastrado!!!','ATENÇÃO',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCDCLIE.SetFocus;
          lbl_NMCLIE.Caption := '';
          Exit;
     End
     Else
         lbl_NMCLIE.Caption := qryLocCliente.FieldByName('CLI_NMCLIE').AsString;
end;

procedure TfrmCadCartoes.dbeCDCLIEExit(Sender: TObject);
begin
     If (dmInfoCartao.cdsCartoes.State in [dsInsert])
       and not uFuncoes.Empty(dbeCDCLIE.Text) Then
         LOCALIZA_CLIENTE;
end;

procedure TfrmCadCartoes.btCancelarClick(Sender: TObject);
begin
     dmInfoCartao.cdsCartoes.Cancel;
     If not uFuncoes.Empty(dbeCDCLIE.Text) Then
         LOCALIZA_CLIENTE;
end;

end.
