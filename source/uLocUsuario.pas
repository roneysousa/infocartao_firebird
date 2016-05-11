unit uLocUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, Buttons, StdCtrls, Mask;

type
  TfrmLocUsuarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    rdCODIGO: TRadioButton;
    rbNOME: TRadioButton;
    Label1: TLabel;
    Edit1: TMaskEdit;
    edtNome: TEdit;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    Label2: TLabel;
    sbConfirma: TSpeedButton;
    sbCancelar: TSpeedButton;
    GridDados: TDBGrid;
    dsUsuarios: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbConfirmaClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdCODIGOClick(Sender: TObject);
    procedure rbNOMEClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure GridDadosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure GridDadosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocUsuarios: TfrmLocUsuarios;

implementation

Uses uFuncoes, udmConsultas, udmInfoCartao;

{$R *.dfm}

procedure TfrmLocUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmConsultas.cdsLocUsuario.Close;
     // 
     Action := caFree;
end;

procedure TfrmLocUsuarios.sbConfirmaClick(Sender: TObject);
Var
    M_CDUSUA : String;
begin
     M_CDUSUA := dmConsultas.cdsLocUsuario.FieldByName('SEN_CDUSUA').AsString;
     //
     dmInfoCartao.cdsUsuarios.Locate('SEN_CDUSUA',M_CDUSUA,[]);
     // Fechar janela de localizar
     close;
end;

procedure TfrmLocUsuarios.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocUsuario.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocUsuario.Next;
end;

procedure TfrmLocUsuarios.rdCODIGOClick(Sender: TObject);
begin
     edtNome.Visible := False;
     Edit1.Visible := True;
     //
     Edit1.SetFocus;
end;

procedure TfrmLocUsuarios.rbNOMEClick(Sender: TObject);
begin
     Edit1.Visible := False;
     //
     edtNome.Left := Edit1.Left;
     edtNome.Top  := Edit1.Top;
     //
     edtNome.Visible := True;
     edtNome.SetFocus;
end;

procedure TfrmLocUsuarios.sbCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLocUsuarios.GridDadosDblClick(Sender: TObject);
begin
      sbConfirmaClick(Sender);
end;

procedure TfrmLocUsuarios.FormShow(Sender: TObject);
begin
     With dmConsultas.dstLocUsuario  do
     begin
          DisableControls;
          Active      := False;
          CommandText := 'Select SEN_CDUSUA, SEN_NMUSUA from ACCSEN order by SEN_NMUSUA';
          Active      := True;
          EnableControls;
     End;
     //
     dmConsultas.cdsLocUsuario.Open;  
     //
   Edit1.SetFocus;
end;

procedure TfrmLocUsuarios.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8] ) then
        key:=#0;
end;

procedure TfrmLocUsuarios.edtNomeChange(Sender: TObject);
Var
    W_NMUSUA : String;
begin
     If not uFuncoes.Empty(edtNome.Text) Then
     begin
           If (rbNOME.Checked = True) Then
           begin
                // Procura pelo NOME
                W_NMUSUA := edtNome.Text;
                dmConsultas.cdsLocUsuario.Locate('SEN_NMUSUA',W_NMUSUA,[loPartialKey]);
            End;
    End
    Else
    begin
         dmConsultas.cdsLocUsuario.DisableConstraints;
         dmConsultas.cdsLocUsuario.Close;
         With dmConsultas.dstLocUsuario do
         begin
              DisableControls;
              Active      := False;
              CommandText := 'Select SEN_CDUSUA, SEN_NMUSUA from ACCSEN order by SEN_NMUSUA';
              Active      := True;
              EnableControls;
          End;
          //
          dmConsultas.cdsLocUsuario.Open;
          dmConsultas.cdsLocUsuario.EnableControls;
    End;
end;

procedure TfrmLocUsuarios.Edit1Change(Sender: TObject);
Var
    W_CDUSUA : String;
begin
     If not uFuncoes.Empty(Edit1.Text) Then
     begin
           If (rdCODIGO.Checked = True) Then
           begin
                // Procura pelo codigo
                W_CDUSUA := uFuncoes.StrZero(Edit1.Text,3);
                dmConsultas.cdsLocUsuario.Locate('SEN_CDUSUA',W_CDUSUA,[loPartialKey]);
            End;
    End
    Else
    begin
         dmConsultas.cdsLocUsuario.DisableConstraints;
         dmConsultas.cdsLocUsuario.Close;
         With dmConsultas.dstLocUsuario do
         begin
              DisableControls;
              Active      := False;
              CommandText := 'Select SEN_CDUSUA, SEN_NMUSUA from ACCSEN order by SEN_NMUSUA';
              Active      := True;
              EnableControls;
          End;
          //
          dmConsultas.cdsLocUsuario.Open;
          dmConsultas.cdsLocUsuario.EnableControls;
    End;
end;

procedure TfrmLocUsuarios.GridDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) Then
     Begin
         Key := #0;
         sbConfirmaClick(Sender);
     End;
end;

end.
