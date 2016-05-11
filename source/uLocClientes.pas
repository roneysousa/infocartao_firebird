unit uLocClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB;

type
  TfrmLocClientes = class(TForm)
    edtPROCURA: TLabeledEdit;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    GridDados: TDBGrid;
    dsClientes: TDataSource;
    rdCODIGO: TRadioButton;
    rbNOME: TRadioButton;
    edtNome: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPROCURAKeyPress(Sender: TObject; var Key: Char);
    procedure edtPROCURAChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure rbNOMEClick(Sender: TObject);
    procedure rdCODIGOClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeChange(Sender: TObject);
    procedure edtPROCURAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    M_NMFORM, M_IMCARN : Integer;
    { Public declarations }
  end;

var
  frmLocClientes: TfrmLocClientes;

implementation

Uses udmInfoCartao,uFuncoes,uCadClientes, udmConsultas, uCadCartoes;

{$R *.dfm}

procedure TfrmLocClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmConsultas.cdsLocCliente.Close;
     //
     Action := caFree;
end;

procedure TfrmLocClientes.edtPROCURAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#13,#8] ) then
       key:=#0;
     //
     if key = #13 then btnconfirmar.Click;
     if key = #13 then btncancelar.Click;
end;

procedure TfrmLocClientes.edtPROCURAChange(Sender: TObject);
Var
    W_CDCLIE : String;
begin
     If not uFuncoes.Empty(edtPROCURA.Text) Then
     begin
           If (rdCODIGO.Checked = True) Then
           begin
                // Procura pelo codigo
                dmConsultas.cdsLocCliente.Close;
                W_CDCLIE := uFuncoes.StrZero(edtPROCURA.Text,7);
                //dmInfoCartao.cdsClientes.Locate('CLI_CDCLIE',W_CDCLIE,[]);
                With dmConsultas.dstLocCliente do
                Begin
                     Active := False;
                     CommandText := 'Select * from ACCCLI Where (CLI_CDCLIE = :pCDCLIE)';
                     Params.ParamByName('pCDCLIE').AsString := W_CDCLIE;
                     Active := True;
                End;
                dmConsultas.cdsLocCliente.Open;
            End;
    End
    Else
        dmConsultas.cdsLocCliente.Close;
end;

procedure TfrmLocClientes.FormShow(Sender: TObject);
begin
     dmConsultas.cdsLocCliente.Close; 
end;

procedure TfrmLocClientes.BtnConfirmarClick(Sender: TObject);
Var
    M_CDCLIE : String;
begin
    M_CDCLIE := dmConsultas.cdsLocCliente.fieldByName('CLI_CDCLIE').AsString;
    //
    dmInfoCartao.cdsClientes.Close;
    With dmInfoCartao.dstClientes do
    Begin
         Active := False;
         CommandText := 'Select * from ACCCLI Where (CLI_CDCLIE = :pCDCLIE)';
         Params.ParamByName('pCDCLIE').AsString := M_CDCLIE;
         Active := True;
    End;
    dmInfoCartao.cdsClientes.Open;
    //
    If (M_NMFORM = 1) Then
    begin

    End;
    //
    If (M_NMFORM = 2) Then
    begin
    End;
    //
    If (M_NMFORM = 3) Then
    begin
         dmInfoCartao.cdsCartoes.fieldByName('CAR_CDCLIE').AsString := M_CDCLIE;
    End;
    // Fechar janela de localizar
    close;
end;

procedure TfrmLocClientes.rbNOMEClick(Sender: TObject);
begin
     edtPROCURA.Visible := False;
     //
     edtNome.Left := edtPROCURA.Left;
     edtNome.Top  := edtPROCURA.Top;
     //
     edtNome.Visible := True;
     edtNome.SetFocus;
end;

procedure TfrmLocClientes.rdCODIGOClick(Sender: TObject);
begin
     edtNome.Visible := False;
     edtPROCURA.Visible := True;
     //
     edtPROCURA.SetFocus;
end;

procedure TfrmLocClientes.BtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLocClientes.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then btnconfirmar.Click;
    if key = #13 then btncancelar.Click;
end;

procedure TfrmLocClientes.edtNomeChange(Sender: TObject);
Var
    W_NMCLIE : String;
begin
     If not uFuncoes.Empty(edtNome.Text) Then
     begin
          If (rbNOME.Checked = True) Then
          begin
                // Procura pelo nome
                W_NMCLIE := edtNome.Text;
                dmConsultas.cdsLocCliente.Close;
                With dmConsultas.dstLocCliente do
                Begin
                     Active := False;
                     CommandText := 'Select * from ACCCLI where UPPER(CLI_NMCLIE) like ' + QuotedStr(AnsiUpperCase(W_NMCLIE) + '%');
                     Active := True;
                End;
                dmConsultas.cdsLocCliente.Open;
          End;
           //dmInfoCartao.cdsClientes.Locate('CLI_NMCLIE',W_NMCLIE,[loPartialKey]);
     End
     Else
         dmConsultas.cdsLocCliente.Close;
end;

procedure TfrmLocClientes.edtPROCURAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocCliente.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocCliente.Next;
end;

procedure TfrmLocClientes.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocCliente.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocCliente.Next;
end;

end.
