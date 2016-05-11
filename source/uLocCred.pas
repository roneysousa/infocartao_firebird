unit uLocCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB;

type
  TfrmLocCred = class(TForm)
    edtPROCURA: TLabeledEdit;
    BtnConfirmar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    GridDados: TDBGrid;
    dsCredenciados: TDataSource;
    rdCODIGO: TRadioButton;
    rbNOME: TRadioButton;
    edtNome: TLabeledEdit;
    procedure edtPROCURAChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure edtPROCURAKeyPress(Sender: TObject; var Key: Char);
    procedure rdCODIGOClick(Sender: TObject);
    procedure rbNOMEClick(Sender: TObject);
    procedure GridDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeChange(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure GridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure edtPROCURAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCred: TfrmLocCred;
  M_NRFORM : Integer;

implementation

uses udmInfoCartao,uFuncoes, uVendas, udmConsultas;

{$R *.dfm}

procedure TfrmLocCred.edtPROCURAChange(Sender: TObject);
Var
    W_CDCRED : String;
begin
     If not uFuncoes.Empty(edtPROCURA.Text) Then
     begin
           If (rdCODIGO.Checked = True) Then
           begin
                // Procura pelo codigo
                W_CDCRED := uFuncoes.StrZero(edtPROCURA.Text,6);
                //
                dmConsultas.cdsLocCred.Close;
                With dmConsultas.dstLocCred do
                begin
                     Active      := False;
                     CommandText := 'Select * from ACCCRE Where UPPER(CRE_CDCRED) like ' + QuotedStr(AnsiUpperCase(W_CDCRED) + '%');
                     //CommandText := 'Select * from ACCCRE Where (CRE_CDCRED = :pCDCRED)';
                     //Params.ParamByName('pCDCRED').AsString := M_CDCRED;
                     Active      := True;
                End;
                dmConsultas.cdsLocCred.Open;
            End;
    End
    Else
         dmConsultas.cdsLocCred.Close;
end;

procedure TfrmLocCred.FormShow(Sender: TObject);
begin
      dmConsultas.cdsLocCred.Close;
end;

procedure TfrmLocCred.BtnConfirmarClick(Sender: TObject);
Var
    M_CDCRED : String;
begin
    M_CDCRED := dmConsultas.cdsLocCred.fieldByName('CRE_CDCRED').AsString;
    //
    dmInfoCartao.cdsCredenciados.Close;
    With dmInfoCartao.dstCredenciados do
    begin
         Active      := False;
         CommandText := 'Select * from ACCCRE Where (CRE_CDCRED = :pCDCRED)';
         Params.ParamByName('pCDCRED').AsString := M_CDCRED;
         Active      := True;
    End;
    dmInfoCartao.cdsCredenciados.Open;
    //
    If (M_NRFORM = 1) Then
    Begin
         frmVendas.edCDCRED.Text := M_CDCRED;
         frmVendas.lbl_nmcred.Caption  := dmConsultas.cdsLocCred.fieldByName('CRE_NMCRED').AsString;
         //cdsCredenciados.fieldByName('CRE_NMCRED').AsString;
         Close;
    End;
    //
    If (M_NRFORM = 2) Then
    Begin
         frmVendas.edCDCRED2.Text := M_CDCRED;
         frmVendas.lbl_nmcred.Caption  := dmConsultas.cdsLocCred.fieldByName('CRE_NMCRED').AsString;
         //dmInfoCartao.cdsCredenciados.fieldByName('CRE_NMCRED').AsString;
         Close;
    End;
    //
    //dmInfoCartao.cdsCredenciados.Locate('CRE_CDCRED',M_CDCRED,[]);
    // Fechar janela de localizar
    close;
end;

procedure TfrmLocCred.BtnCancelarClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmLocCred.edtPROCURAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#13,#8] ) then
       key:=#0;
    //
    if key = #13 then btnconfirmar.Click;
    if key = #13 then btncancelar.Click;
end;

procedure TfrmLocCred.rdCODIGOClick(Sender: TObject);
begin
     edtNome.Visible := False;
     edtPROCURA.Visible := True;
     //
     edtPROCURA.SetFocus;
end;

procedure TfrmLocCred.rbNOMEClick(Sender: TObject);
begin
     edtPROCURA.Visible := False;
     //
     edtNome.Left := edtPROCURA.Left;
     edtNome.Top  := edtPROCURA.Top;
     //
     edtNome.Visible := True;
     edtNome.SetFocus;
end;

procedure TfrmLocCred.GridDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
end;

procedure TfrmLocCred.edtNomeChange(Sender: TObject);
Var
    W_NMCRED : String;
begin
     If not uFuncoes.Empty(edtNome.Text) Then
     begin
          If (rbNOME.Checked = True) Then
          begin
               // Procura pelo nome
               W_NMCRED := edtNome.Text;
               dmConsultas.cdsLocCred.Close;
               With dmConsultas.dstLocCred do
               begin
                     Active      := False;
                     CommandText := 'Select * from ACCCRE Where UPPER(CRE_NMCRED) like ' + QuotedStr(AnsiUpperCase(W_NMCRED) + '%');
                     Active      := True;
               End;
               dmConsultas.cdsLocCred.Open;
          End;
     End
     Else
        dmConsultas.cdsLocCred.Close;
end;

procedure TfrmLocCred.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then btnconfirmar.Click;
    if key = #13 then btncancelar.Click;
end;

procedure TfrmLocCred.FormActivate(Sender: TObject);
begin
  With dmInfoCartao.dstCredenciados do
   begin
          DisableControls;
          Active      := False;
          CommandText := 'Select * from ACCCRE order by CRE_NMCRED';
          Active      := True;
          EnableControls;
   End;
end;

procedure TfrmLocCred.GridDadosKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) Then
     begin
          Key := #0;
          BtnConfirmarClick(Sender);
     End;
end;

procedure TfrmLocCred.edtPROCURAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocCred.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocCred.Next;
end;

procedure TfrmLocCred.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_UP) Then
        dmConsultas.cdsLocCred.Prior;
     If (Key = VK_DOWN) Then
        dmConsultas.cdsLocCred.Next;
end;

end.
