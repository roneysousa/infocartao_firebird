unit uCadCredenciado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, Mask, Buttons, DBClientActns,
  DBActns, ActnList, DBXpress;

type
  TfrmCadCredenciados = class(TForm)
    Panel2: TPanel;
    DBText1: TDBText;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    dsCredenciado: TDataSource;
    Label2: TLabel;
    dbeNMCRED: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    cmbUFEMISS: TDBComboBox;
    DBText2: TDBText;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure dsCredenciadoDataChange(Sender: TObject; Field: TField);
    procedure dsCredenciadoStateChange(Sender: TObject);
    procedure dbeNMCREDExit(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Procedure NOVO_CDCREDENCIADO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCredenciados: TfrmCadCredenciados;
  Transacao: TTransactionDesc;  

implementation

uses udmInfoCartao, uLocCred, uInfoPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadCredenciados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dmInfoCartao.cdsCredenciados.Close;
     //
     uFuncoes.Limpar_Status;
     //
     Action := caFree;
end;

procedure TfrmCadCredenciados.NOVO_CDCREDENCIADO;
begin
     If (dmInfoCartao.cdsParametros.Active = False) Then
         dmInfoCartao.cdsParametros.Open;
     //
     dmInfoCartao.cdsParametros.Edit;
     dmInfoCartao.cdsParametros.FieldByName('PAR_CDCRED').AsFloat :=
       dmInfoCartao.cdsParametros.FieldByName('PAR_CDCRED').AsFloat+1;
     dmInfoCartao.cdsParametros.Post;
     //
     dmInfoCartao.cdsParametros.ApplyUpdates(0);
     //
     dmInfoCartao.cdsCredenciados.FieldByName('CRE_CDCRED').AsString :=
         uFuncoes.StrZero(dmInfoCartao.cdsParametros.FieldByName('PAR_CDCRED').AsString,6);
     dmInfoCartao.cdsCredenciados.FieldByName('CRE_CDUSUA').AsString := uInfoPrincipal.M_CDUSUA;
end;

procedure TfrmCadCredenciados.btAdicionarClick(Sender: TObject);
begin
    Try
           dmInfoCartao.cdsCredenciados.Append;             // Cria um novo regitro.
           dbeNMCRED.SetFocus;
    Except
          Application.MessageBox('Este registro n�o pode incluir agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadCredenciados.btEditarClick(Sender: TObject);
begin
    Try
           dmInfoCartao.cdsCredenciados.Edit;             // Cria um novo regitro.
           //
           dbeNMCRED.SetFocus;
    Except
          Application.MessageBox('Este registro n�o pode ser editar agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadCredenciados.btExcluirClick(Sender: TObject);
begin
    Try
        If Application.MessageBox('Deseja eliminar este registro?', 'Exclus�o de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
           dmInfoCartao.cdsCredenciados.Delete;             // Apagar o regitro atual.
    Except
          Application.MessageBox('Este registro n�o pode ser excluido agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadCredenciados.btGravarClick(Sender: TObject);
begin
   //
      If (dsCredenciado.State in [dsInsert, dsEdit]) Then
      begin
           If uFuncoes.Empty(dbeNMCRED.Text) Then
           begin
                Application.MessageBox('Digite o nome do cred�nciado.','ATEN��O',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dbeNMCRED.SetFocus;
                Exit;
           End;
      End;
      //
   Try

      Transacao.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
      Transacao.IsolationLevel := xilREPEATABLEREAD;
      dmInfoCartao.SQLConnection1.StartTransaction(Transacao);
       //
      If (dsCredenciado.State = dsInsert) Then
      begin
           NOVO_CDCREDENCIADO;
      End;
      //  Grava as altera��es
      dmInfoCartao.cdsCredenciados.Post;
      dmInfoCartao.cdsCredenciados.ApplyUpdates(0);
      //
      dmInfoCartao.SQLConnection1.Commit(Transacao);
   Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmInfoCartao.cdsCredenciados.Cancel;
           dmInfoCartao.SQLConnection1.Rollback(Transacao);
        End;
   End;
end;

procedure TfrmCadCredenciados.dsCredenciadoDataChange(Sender: TObject;
  Field: TField);
begin
     frmPrincipal.StatusBar1.Panels[2].Text := ' Registro: ' + IntToStr(dsCredenciado.DataSet.RecNo) +
                          ' de ' + IntToStr(dsCredenciado.DataSet.RecordCount);
end;

procedure TfrmCadCredenciados.dsCredenciadoStateChange(Sender: TObject);
begin
    btAdicionar.Enabled  := dsCredenciado.State in [dsBrowse];
    btEditar   .Enabled  := (dsCredenciado.State in [dsBrowse])
                           And (dmInfoCartao.cdsCredenciados.RecordCount>0);
    btExcluir  .Enabled  := (dsCredenciado.State in [dsBrowse])
                           And (dmInfoCartao.cdsCredenciados.RecordCount>0);
    btLocalizar.Enabled  := (dsCredenciado.State in [dsBrowse])
                           And (dmInfoCartao.cdsCredenciados.RecordCount>0);
    //
    btGravar   .Enabled  := dsCredenciado.State in [dsInsert,dsEdit];
    btCancelar .Enabled  := dsCredenciado.State in [dsInsert,dsEdit];
    {btAplicar  .Enabled  := (dsCredenciado.State in [dsBrowse])
                           And (dmInfoCartao.cdsCredenciados.RecordCount>0);}
end;

procedure TfrmCadCredenciados.dbeNMCREDExit(Sender: TObject);
begin
     If (dsCredenciado.State in [dsInsert]) Then
     begin
          // Se nome do cliente estiver vazio
          If not uFuncoes.Empty(dbeNMCRED.Text) Then
          begin
               If (dmInfoCartao.ValidaNomeCred('CRE_NMCRED',dbeNMCRED.Text)) Then
               begin
                   Application.MessageBox('Cred�nciado j� cadastrado!',
                               'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeNMCRED.SetFocus;
                   dbeNMCRED.Clear;
                   Exit;
               End;
          End;
          //
     End;
end;

procedure TfrmCadCredenciados.btLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocCred, frmLocCred);
      frmLocCred.Caption := 'Localizar Cred�nciado';
      frmLocCred.ShowModal;
  Finally
      frmLocCred.Free;
  End;
end;

procedure TfrmCadCredenciados.FormCreate(Sender: TObject);
begin
    dmInfoCartao.cdsCredenciados.Close;
    With dmInfoCartao.dstCredenciados do
    Begin
         Active := False;
         CommandText := 'Select * from ACCCRE Where (CRE_CDCRED = :pCDCRED)';
         Params.ParamByName('pCDCRED').AsString := dmInfoCartao.mscodigo('CRE_CDCRED','ACCCRE');
         Active := True;
    End;
    dmInfoCartao.cdsCredenciados.Open;
end;

end.
