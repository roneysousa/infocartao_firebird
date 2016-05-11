unit uEnvelope;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ComCtrls, Buttons,
  RpCon, RpConDS, RpConBDE, RpDefine, RpRave, DBTables, RpBase, RpSystem,
  DBCtrls, FMTBcd, SqlExpr;

type
  TfrmEnvelope = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    dsCliente: TDataSource;
    dsBoletos: TDataSource;
    btVisualizar: TBitBtn;
    btImprimir: TBitBtn;
    ravEnvelope: TRvProject;
    RvSystem1: TRvSystem;
    DBText1: TDBText;
    btTodos: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    GridBoleto: TDBGrid;
    Label3: TLabel;
    Label2: TLabel;
    edtCDINIC: TEdit;
    edtCDFINA: TEdit;
    edtNMCLIE: TEdit;
    btLocalizar: TBitBtn;
    dscClientesEnvelope: TRvDataSetConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFaturaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure GridClienteKeyPress(Sender: TObject; var Key: Char);
    procedure GridClienteCellClick(Column: TColumn);
    procedure GridClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure GridBoletoKeyPress(Sender: TObject; var Key: Char);
    procedure GridBoletoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridBoletoCellClick(Column: TColumn);
    procedure GridBoletoDblClick(Sender: TObject);
    procedure edtNMCLIEChange(Sender: TObject);
    procedure edtNMCLIEEnter(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtNMCLIEExit(Sender: TObject);
    procedure edtCDINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDINICExit(Sender: TObject);
    procedure edtCDFINAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDINICEnter(Sender: TObject);
    procedure edtCDFINAEnter(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvelope: TfrmEnvelope;
  M_LETRAS, M_FLREGI : String;

implementation

Uses udmInfoCartao, udmRelatorios, uFuncoes;

{$R *.dfm}

procedure TfrmEnvelope.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmInfoCartao.cdsBoletos.Close;
     dmInfoCartao.cdsClientes.Close;
     //
     dmRelatorios.cdsEnvelClientes.Close;
     // 
     Action := caFree;
end;

procedure TfrmEnvelope.edtFaturaKeyPress(Sender: TObject; var Key: Char);
begin
{     If (Key = #13) and (not uFuncoes.Empty(edtFatura.Text)) Then
     begin
          Key := #0;
          edtFatura.Text := uFuncoes.StrZero(edtFatura.Text,10);
          If (dmCartao.tbBoleto.Locate('BOL_NRFATU',edtFatura.Text,[loPartialKey])) Then
          Begin
               dmCartao.tbBoleto.Filtered := False;
               dmCartao.tbBoleto.Filter   := 'BOL_NRFATU='+QuotedStr(edtFatura.Text)
                           +' and BOL_FLSITU='+QuotedStr('A');
               dmCartao.tbBoleto.Filtered := True;
               GridBoleto.Visible := True;
               GridBoleto.SetFocus;
          End
          Else
          begin
               Application.MessageBox('Fatura não existe!!!',
                            'ATENÇÃO', MB_OK+MB_ICONSTOP);
               GridBoleto.Visible := False;
               edtFatura.Clear;
               edtFatura.SetFocus;
          End;
     End;}
end;

procedure TfrmEnvelope.edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
begin
     {If (Key = #13) and (not uFuncoes.Empty(edtNMCLIE.Text)) Then
     begin
          Key := #0;
          If (dmCartao.tbBoleto.Locate('BOL_NMSACA',edtNMCLIE.Text,[loPartialKey])) Then
          Begin
               dmCartao.tbBoleto.Filtered := False;
               dmCartao.tbBoleto.Filter   := 'BOL_NMSACA='+QuotedStr(edtNMCLIE.Text)
                                           +' and BOL_FLSITU='+QuotedStr('A');
               dmCartao.tbBoleto.Filtered := True;
               GridBoleto.Visible := True;
               GridBoleto.SetFocus;
          End
          Else
          begin
               Application.MessageBox('Cliente não existe!!!',
                            'ATENÇÃO', MB_OK+MB_ICONSTOP);
               GridBoleto.Visible := False;
               edtNMCLIE.Clear;
               edtNMCLIE.SetFocus;
          End;
     End;}
end;

procedure TfrmEnvelope.GridClienteKeyPress(Sender: TObject; var Key: Char);
begin
     M_LETRAS := M_letraS+uppercase(key); // acumula as letras digitadas;
     edtNMCLIE.Text := M_LETRAS;
     dmInfoCartao.cdsClientes.Locate('CAR_NMCLIE',M_LETRAS,[loPartialKey])
end;

procedure TfrmEnvelope.GridClienteCellClick(Column: TColumn);
begin
     M_LETRAS := ' ';
     edtNMCLIE.Text := M_LETRAS;
end;

procedure TfrmEnvelope.GridClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     //Impedir que apagar o registro atual.
     If (Shift = [ssCtrl]) and (Key = 46) Then
         KEY := 0;
     //
     IF (KEY=38) or (key=40) then // avalio se é seta para cima ou para baixo;
         M_letras := '';
end;

procedure TfrmEnvelope.FormActivate(Sender: TObject);
begin
     If (dmInfoCartao.cdsBoletos.Active = False ) Then
         dmInfoCartao.cdsBoletos.Open;
     If (dmInfoCartao.cdsClientes.Active = False ) Then
         dmInfoCartao.cdsClientes.Open;
     //
     With dmRelatorios.dstEnvelopesClientes do
     begin
         Active := False;
         ParamByName('pCDCLIE').AsString := '0000001';
         ParamByName('pCDFINA').AsString := '9999999';
         Active := True;
    End;
    //
    dmRelatorios.cdsEnvelClientes.Open;  
     {If (tsCliente.TabVisible = True) Then
        edtNMCLIE.SetFocus
     Else
        edtFatura.SetFocus;}
     //GridBoleto.SetFocus;
     edtCDINIC.SetFocus;
end;

procedure TfrmEnvelope.btVisualizarClick(Sender: TObject);
Var
    M_CDCLIE, M_CDINIC, M_CDFINA : String;
begin
     If (M_FLREGI = 'S') Then
     begin
             With dmRelatorios.dstEnvelopesClientes do
             begin
                  M_CDINIC := uFuncoes.StrZero(edtCDINIC.Text,7);
                  M_CDFINA := uFuncoes.StrZero(edtCDFINA.Text,7);
                  //
                  Active := False;
                  ParamByName('pCDCLIE').AsString := M_CDINIC;
                  ParamByName('pCDFINA').AsString := M_CDFINA;
                  Active := True;
             End;
             //
             {With dmRelatorios.cdsEnvelClientes do
             begin
                  Active := False;
                  Active := True;
             End;}
             //
             With ravEnvelope do
             begin
                   Execute;
                   Close;
             End;
     //
     End
     Else
     begin
          M_CDCLIE := dmInfoCartao.cdsClientes.FieldByName('CLI_CDCLIE').Value;
          //
          With dmRelatorios.dstEnvelopesClientes do
          begin
               Active := False;
               ParamByName('pCDCLIE').AsString := M_CDCLIE;
               ParamByName('pCDFINA').AsString := M_CDCLIE;
               Active := True;
          End;
          //
          With dmRelatorios.cdsEnvelClientes do
          begin
               {Active := False;
               Active := True;}
          End;
         //
          With ravEnvelope do
          begin
               Execute;
               Close;
          End;
     //
     End;
end;

procedure TfrmEnvelope.btLocalizarClick(Sender: TObject);
begin
    { Application.CreateForm(TfrmLocSacado, frmLocSacado);//Carrega form na memória
     Try
         frmLocSacado.ShowModal;
     Finally
         frmLocSacado.Free;
     End;}
end;

procedure TfrmEnvelope.GridBoletoKeyPress(Sender: TObject; var Key: Char);
begin
     M_letras := M_letras+uppercase(key); // acumula as letras digitadas
     edtNMCLIE.Text := M_letras;
     dmInfoCartao.cdsBoletos.LOCATE('BOL_NMSACA',M_letras,[loPartialKey]); // Efetua a procura
end;

procedure TfrmEnvelope.GridBoletoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     //Impedir que apagar o registro atual.
     If (Shift = [ssCtrl]) and (Key = 46) Then
         KEY := 0;
     //
     IF (KEY=38) or (key=40) then // avalio se é seta para cima ou para baixo;
     begin
          M_letras := '';
          edtNMCLIE.Text := M_letras;
     End;
end;

procedure TfrmEnvelope.GridBoletoCellClick(Column: TColumn);
begin
      M_LETRAS := '';
      edtNMCLIE.Text := M_letras;
end;

procedure TfrmEnvelope.GridBoletoDblClick(Sender: TObject);
begin
  {   If (tsCliente.TabVisible = True) Then}
end;

procedure TfrmEnvelope.edtNMCLIEChange(Sender: TObject);
begin
     dmInfoCartao.cdsClientes.LOCATE('CLI_NMCLIE',edtNMCLIE.Text,[loPartialKey]); // Efetua a procura
end;

procedure TfrmEnvelope.edtNMCLIEEnter(Sender: TObject);
begin
{     With dmInfoCartao.qryCliente do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from ACCCLI');
          SQL.Add('order by CLI_NMCLIE');
          Prepare;
          Open;
      End;}
      //
      M_FLREGI := 'N';
      edtCDINIC.Clear;
      edtCDFINA.Clear;
      edtNMCLIE.Clear;
end;

procedure TfrmEnvelope.btImprimirClick(Sender: TObject);
Var
    M_NMCLIE : String;
begin
{     If (M_FLREGI = 'S') Then
     begin
         Application.CreateForm(TfrmRelEnvelope, frmRelEnvelope); //Carrega form na memória
         Try
             With frmRelEnvelope.qyrFaturas do
             begin
                 SQL.Clear;
                 CLose;
                 SQL.Add('Select * from ACCCLI');
                 SQL.Add('Where CLI_CDCLIE>='+QuotedStr(edtCDINIC.Text));
                 SQL.Add('And CLI_CDCLIE<='+QuotedStr(uFuncoes.StrZero(edtCDFINA.Text,7)));
                 Prepare;
                 Open;
             End;
             //
           frmRelEnvelope.qrEtiquetas.Print;
         finally
           frmRelEnvelope.Free;
         End;
     //
     End
     Else
     begin
     //
     Application.CreateForm(TfrmRelEnvelope, frmRelEnvelope);  // Carrega form na memória
     Try
         With frmRelEnvelope.qyrFaturas do
         begin
             If (tsCliente.TabVisible = True) Then
             begin
                //dmInfoCartao.tbCliente2.Edit;
                M_NMCLIE := dmInfoCartao.qryCliente.FieldByName('CLI_NMCLIE').Value;
                //dmInfoCartao.tbCliente2.Cancel;
                //
                If uFuncoes.Empty(edtNMCLIE.Text) Then
                    edtNMCLIE.Text := M_NMCLIE
                Else
                    edtNMCLIE.Text := M_NMCLIE;
                //
                SQL.Clear;
                Close;
                SQL.Add('Select * from ACCCLI');
                SQL.Add('Where CLI_NMCLIE='+QuotedStr(M_NMCLIE));
                //SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
                Prepare;
                Open;
             End;
             //
             If (tsFatura.TabVisible = True) Then
             begin
                If not uFuncoes.Empty(edtFatura.Text) Then
                begin
                     SQL.Clear;
                     Close;
                     SQL.Add('Select * from ACCBOL');
                     SQL.Add('Where BOL_NRFATU='+QuotedStr(edtFatura.Text));
                     SQL.Add('And BOL_FLSITU='+QuotedStr('A'));
                     Prepare;
                     Open;
                End
                Else
                begin
                     ShowMessage('Digite o número da fatura!');
                     edtFatura.SetFocus;
                     Exit;
                End;
             End;
         End;
         frmRelEnvelope.qrEtiquetas.Print;
     finally
         frmRelEnvelope.Free;
     End;
     //
     End;}
end;

procedure TfrmEnvelope.edtNMCLIEExit(Sender: TObject);
begin
     btVisualizar.SetFocus;
end;

procedure TfrmEnvelope.edtCDINICKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
end;

procedure TfrmEnvelope.edtCDINICExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDINIC.Text) Then
       edtCDINIC.Text := uFuncoes.StrZero(edtCDINIC.Text,7);
end;

procedure TfrmEnvelope.edtCDFINAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (Key = #13) Then
    begin
         Key := #0;
         If StrtoFloat(edtCDFINA.Text)<StrtoFloat(edtCDINIC.Text) Then
         begin
              ShowMessage('Registro final menor que o inicial!!!');
              edtCDFINA.Clear;
              edtCDFINA.SetFocus;
              Exit;
         End;
         //
         If not uFuncoes.Empty(edtCDINIC.Text)
           and not uFuncoes.Empty(edtCDFINA.Text) Then
         begin
           With dmInfoCartao.cdsClientes do
           begin

           End;
           //
           edtCDFINA.Text := uFuncoes.StrZero(edtCDFINA.Text,7);
           M_FLREGI := 'S';
           //
         End;
    End;
end;

procedure TfrmEnvelope.edtCDINICEnter(Sender: TObject);
begin
     edtNMCLIE.Clear;
end;

procedure TfrmEnvelope.edtCDFINAEnter(Sender: TObject);
begin
      edtNMCLIE.Clear;
end;

procedure TfrmEnvelope.btTodosClick(Sender: TObject);
begin
{     Application.CreateForm(TfrmRelEnvelope, frmRelEnvelope); //Carrega form na memória
     Try
        With frmRelEnvelope.qyrFaturas do
        begin
             SQL.Clear;
             CLose;
             SQL.Add('Select * from ACCCLI');
             SQL.Add('order by CLI_NMCLIE');
             Prepare;
             Open;
        End;
        //
        frmRelEnvelope.qrEtiquetas.Preview;
     finally
          frmRelEnvelope.Free;
     End;}
end;

end.
