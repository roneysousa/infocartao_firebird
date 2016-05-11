unit uLocCartaoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB, Mask;

type
  TfrmLocCartao = class(TForm)
    rdCODIGO: TRadioButton;
    rbNOME: TRadioButton;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    GridDados: TDBGrid;
    dsCartao: TDataSource;
    Edit1: TMaskEdit;
    Label1: TLabel;
    edtNome: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdCODIGOClick(Sender: TObject);
    procedure rbNOMEClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeChange(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure GridDadosDblClick(Sender: TObject);
    procedure GridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCartao: TfrmLocCartao;

implementation

Uses udmInfoCartao, uFuncoes, udmConsultas;

{$R *.dfm}

procedure TfrmLocCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmLocCartao.rdCODIGOClick(Sender: TObject);
begin
     edtNome.Visible := False;
     Edit1.Visible := True;
     //
     Edit1.SetFocus;
end;

procedure TfrmLocCartao.rbNOMEClick(Sender: TObject);
begin
     Edit1.Visible := False;
     //
     edtNome.Left := Edit1.Left;
     edtNome.Top  := Edit1.Top;
     //
     edtNome.Visible := True;
     edtNome.SetFocus;
end;

procedure TfrmLocCartao.FormShow(Sender: TObject);
begin
     dmConsultas.cdsLocCartao.Close;
     //
     //Edit1.SetFocus;
     Edit1.Visible := False;
     //
     edtNome.Left := Edit1.Left;
     edtNome.Top  := Edit1.Top;
     //
     edtNome.Visible := True;
     edtNome.SetFocus;
end;

procedure TfrmLocCartao.BtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLocCartao.Edit1Change(Sender: TObject);
Var
    W_NRCART : String;
begin
     If not uFuncoes.Empty(Edit1.Text) Then
     begin
           If (rdCODIGO.Checked = True) Then
           begin
                // Procura pelo codigo
                W_NRCART := Edit1.Text;
                //dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',W_NRCART,[loPartialKey]);
                //
                dmConsultas.cdsLocCartao.Close;
                With dmConsultas.dstLocCartao  do
                begin
                     DisableControls;
                     Active      := False;
                     CommandText := 'Select * from ACCCAR Where UPPER(CAR_NRCART) like ' + QuotedStr(AnsiUpperCase(W_NRCART) + '%');
                     CommandText := CommandText+' order by CAR_NMCLIE';
                     Active      := True;
                     EnableControls;
                End;
                //
                dmConsultas.cdsLocCartao.open;
            End;
    End
    Else
        dmConsultas.cdsLocCartao.Close;
end;

procedure TfrmLocCartao.BtnConfirmarClick(Sender: TObject);
Var
    M_NRCART : String;
begin
     M_NRCART := dmConsultas.cdsLocCartao.FieldByName('CAR_NRCART').AsString;
     //
     dmInfoCartao.cdsCartoes.Close;
     With dmInfoCartao.dstCartoes do
     Begin
         Active := False;
         CommandText := 'Select * from ACCCAR Where (CAR_NRCART = :pNRCART)';
         Params.ParamByName('pNRCART').AsString := M_NRCART;
         Active := True;
     End;
     dmInfoCartao.cdsCartoes.Open;
     // Fechar janela de localizar
     close;
end;

procedure TfrmLocCartao.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#13,#8] ) then
       key:=#0;
    //
    if key = #13 then btnconfirmar.Click;
    if key = #13 then btncancelar.Click;
end;

procedure TfrmLocCartao.edtNomeChange(Sender: TObject);
Var
    W_NMCLIE : String;
begin
     If not uFuncoes.Empty(edtNome.Text) Then
     begin
          If (rbNOME.Checked = True) Then
          begin
               // Procura pelo nome
               W_NMCLIE := edtNome.Text;
               //dmInfoCartao.cdsCartoes.Locate('CAR_NMCLIE',W_NMCLIE,[loPartialKey]);
               dmConsultas.cdsLocCartao.DisableControls;
               dmConsultas.cdsLocCartao.Close;
               With dmConsultas.dstLocCartao  do
               begin
                     Active      := False;
                     CommandText := 'Select CAR_NRCART, CAR_NMCLIE from ACCCAR Where UPPER(CAR_NMCLIE) like ' + QuotedStr(AnsiUpperCase(W_NMCLIE) + '%');
                     CommandText := CommandText+' order by CAR_NMCLIE';
                     Active      := True;
                     EnableControls;
               End;
                //
               dmConsultas.cdsLocCartao.open;
               dmConsultas.cdsLocCartao.EnableControls;
          End;
     End
     Else
         dmConsultas.cdsLocCartao.Close; 
end;

procedure TfrmLocCartao.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then btnconfirmar.Click;
    if key = #13 then btncancelar.Click;
end;

procedure TfrmLocCartao.GridDadosDblClick(Sender: TObject);
begin
    BtnConfirmarClick(Sender);
end;

procedure TfrmLocCartao.GridDadosKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) Then
     Begin
         Key := #0;
         BtnConfirmarClick(Sender);
     End;
end;

procedure TfrmLocCartao.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocCartao.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocCartao.Next;
end;

procedure TfrmLocCartao.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocCartao.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocCartao.Next;
end;

end.
