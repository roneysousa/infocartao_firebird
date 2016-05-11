unit uDesbloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Mask, DB, Buttons, ComCtrls,
  ToolWin, Grids, DBGrids;

type
  TfrmDesbloqueio = class(TForm)
    dsCliente: TDataSource;
    dsCartao: TDataSource;
    ToolBar1: TToolBar;
    btPrimeiro: TToolButton;
    btAnterior: TToolButton;
    btProximo: TToolButton;
    btUltimo: TToolButton;
    btGrid: TToolButton;
    btFechar: TToolButton;
    Panel1: TPanel;
    Panel3: TPanel;
    Label13: TLabel;
    dbtNMCLIE: TDBText;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    pnlDados: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    btLocalizar: TBitBtn;
    edtNRCART: TMaskEdit;
    lbl_Vali: TLabel;
    dbeVALI: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btPrimeiroClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btUltimoClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btLocalizarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure edtNRCARTKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesbloqueio: TfrmDesbloqueio;

implementation

uses udmInfoCartao, uFuncoes;

{$R *.dfm}

procedure TfrmDesbloqueio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //
     dmInfoCartao.cdsClientes.Close;
     dmInfoCartao.cdsCartoes.Close;
     //
     uFuncoes.Limpar_Status;
     //
     Action := caFree;
end;

procedure TfrmDesbloqueio.FormActivate(Sender: TObject);
begin
      If (dmInfoCartao.cdsClientes.Active = False) Then
          dmInfoCartao.cdsClientes.open;
      If (dmInfoCartao.cdsCartoes.Active = False) Then
          dmInfoCartao.cdsCartoes.open;
      //
      pnlDados.Visible := False;
      lbl_Vali.Visible := False;
      dbeVALI.Visible  := False;
      dbtNMCLIE.Visible := False;
end;

procedure TfrmDesbloqueio.btPrimeiroClick(Sender: TObject);
begin
     If not (dmInfoCartao.cdsClientes.Bof) Then
         dmInfoCartao.cdsClientes.First;
end;

procedure TfrmDesbloqueio.btAnteriorClick(Sender: TObject);
begin
     If not (dmInfoCartao.cdsClientes.Bof) Then
         dmInfoCartao.cdsClientes.Prior;
end;

procedure TfrmDesbloqueio.btProximoClick(Sender: TObject);
begin
     If not (dmInfoCartao.cdsClientes.Eof) Then
         dmInfoCartao.cdsClientes.Next;
end;

procedure TfrmDesbloqueio.btUltimoClick(Sender: TObject);
begin
     If not (dmInfoCartao.cdsClientes.Eof) Then
         dmInfoCartao.cdsClientes.Last;
end;

procedure TfrmDesbloqueio.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDesbloqueio.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    //
    if (Key = #13) then
    begin
        Key := #0;
        ShowMessage('Ok');
        pnlDados.Visible := False;
    end;

end;

procedure TfrmDesbloqueio.btLocalizarClick(Sender: TObject);
Var
    M_CDCLIE: String;
begin
     //
     If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',uFuncoes.Alltrim(edtNRCART.Text),[])) Then
     begin
          //
          M_CDCLIE := dmInfoCartao.cdsCartoesCAR_CDCLIE.Value;
          //
          If (dmInfoCartao.cdsCartoesCAR_FLSITU.Value <> 'B') then
          begin
             Application.MessageBox('Registro de cart�o n�o se encontra-se bloqueado!',
                         'ATEN��O', MB_OK+MB_ICONINFORMATION);
             edtNRCART.Clear;
             edtNRCART.SetFocus;
             pnlDados.Visible := False;
             lbl_Vali.Visible := False;
             dbeVALI.Visible  := False;
             dbtNMCLIE.Visible := False;
             Exit;
             //
          End;
          //
          pnlDados.Visible := True;
          lbl_Vali.Visible := True;
          dbeVALI.Visible  := True;
          dbtNMCLIE.Visible:= True;
          btConfirmar.Enabled :=  True;
          //
          btCancelar.SetFocus;
          //
          dmInfoCartao.cdsCartoes.Cancel;
          //
     End
     Else
     begin
          Application.MessageBox('Registro de cart�o ou validade inv�lido!',
                    'ATEN��O', MB_OK+MB_ICONSTOP);
          edtNRCART.Clear;
          edtNRCART.SetFocus;
     End;
end;

procedure TfrmDesbloqueio.btCancelarClick(Sender: TObject);
begin
     edtNRCART.Clear;
     edtNRCART.SetFocus;
     pnlDados.Visible := False;
     lbl_Vali.Visible := False;
     dbeVALI.Visible  := False;
     dbtNMCLIE.Visible := False;
     //
     Close;
     //btConfirmar.Enabled :=  False;
end;

procedure TfrmDesbloqueio.btConfirmarClick(Sender: TObject);
begin
     If (dmInfoCartao.cdsCartoes.FieldByName('CAR_FLSITU').AsString = 'B') Then
     begin
          If Application.MessageBox('Confirma desbloqueio de cart�o?',
               'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          begin
               dmInfoCartao.cdsCartoes.Edit;
               dmInfoCartao.cdsCartoes.FieldByName('CAR_FLSITU').AsString := 'N';
               dmInfoCartao.cdsCartoes.Post;
               dmInfoCartao.cdsCartoes.ApplyUpdates(0);
               //
               ShowMessage('Registro de cart�o desbloqueado!');
               pnlDados.Visible := False;
               //
               lbl_Vali.Visible := False;
               dbeVALI.Visible := False;
               btConfirmar.Enabled :=  False;

          End;
     End;
end;

procedure TfrmDesbloqueio.edtNRCARTKeyPress(Sender: TObject;
  var Key: Char);
begin
    //
  If (Key = #13) Then
  begin
       Key := #0;
       btLocalizar.SetFocus;
  End;
end;          //Fim-da-Procedure

end.
