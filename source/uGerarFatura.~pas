unit uGerarFatura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, DB, DBTables,SqlExpr,
  DBXpress, Grids, DBGrids;

type
  TfrmGerarFatura = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_NRFATU: TStaticText;
    edDIAFAT: TEdit;
    edDTFATU: TMaskEdit;
    edDTVENC: TMaskEdit;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    dsBoletos: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edDIAFATKeyPress(Sender: TObject; var Key: Char);
    procedure edDIAFATExit(Sender: TObject);
    procedure edDTVENCExit(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    Procedure Validar_Dia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarFatura: TfrmGerarFatura;
  M_DIAFAT : Integer;
  M_LOCPAG, M_NRBOLE, M_NMCEDE : String;
  M_PEMULT,M_PEJURO, M_NRFATU : Double;
  M_DTVENC,M_DTLIMI : Tdate;
  M_ANO, M_MES, M_DIA : Word;

implementation

Uses udmInfoCartao, uFuncoes;

{$R *.dfm}

procedure TfrmGerarFatura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmInfoCartao.cdsDebito.Close;
     dmInfoCartao.cdsCredenciados.Close;
     dmInfoCartao.cdsClientes.Close;
     dmInfoCartao.cdsCartoes.Close;
     dmInfoCartao.cdsBoletos.Close;
     dmInfoCartao.cdsMovBoletos.Close;
     dmInfoCartao.cdsFeriados.Close;
     //
     Action := caFree;
end;

procedure TfrmGerarFatura.FormActivate(Sender: TObject);
begin
     dmInfoCartao.cdsParametros.Open;
     dmInfoCartao.cdsParametros.Edit;
     M_DIAFAT := 0;
     M_NMCEDE := dmInfoCartao.cdsParametros.FieldByName('PAR_NMCEDE').AsString;
     M_LOCPAG := dmInfoCartao.cdsParametros.FieldByName('PAR_LOCPAGA').AsString;
     M_PEMULT := dmInfoCartao.cdsParametros.FieldByName('PAR_PEMULT').AsFloat;
     M_PEJURO := dmInfoCartao.cdsParametros.FieldByName('PAR_PEJURO').AsFloat;
     M_NRFATU := dmInfoCartao.cdsParametros.FieldByName('PAR_NRFATU').AsFloat+1;
     lbl_NRFATU.Caption := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
     //
     dmInfoCartao.cdsParametros.Cancel;
     //dmInfoCartao.cdsParametros.ApplyUpdates(0);
     // Abri outras tabelas
     If (dmInfoCartao.cdsDebito.Active = False) Then
         dmInfoCartao.cdsDebito.Open;
     If (dmInfoCartao.cdsCredenciados.Active = False) Then
         dmInfoCartao.cdsCredenciados.Open;
     If (dmInfoCartao.cdsClientes.Active = False) Then
         dmInfoCartao.cdsClientes.open;
     If (dmInfoCartao.cdsCartoes.Active = False) Then
        dmInfoCartao.cdsCartoes.Open;
     If (dmInfoCartao.cdsBoletos.Active = False) Then
        dmInfoCartao.cdsBoletos.Open;
     If (dmInfoCartao.cdsMovBoletos.Active = False) Then
        dmInfoCartao.cdsMovBoletos.Open;
     If (dmInfoCartao.cdsFeriados.Active = False) Then
        dmInfoCartao.cdsFeriados.Open;
     //
     edDTVENC.Text := DatetoStr(Date);
end;

procedure TfrmGerarFatura.edDIAFATKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8,#13] ) then
         key:=#0;
end;

procedure TfrmGerarFatura.edDIAFATExit(Sender: TObject);
Var
   M_DTAUXI : String;
begin
   If not uFuncoes.Empty(edDIAFAT.Text) Then
   begin
       If not (dmInfoCartao.cdsDiaFatura.Locate('FAT_DIAFATU',edDIAFAT.Text,[])) Then
       begin
            Application.MessageBox('Dia para Fatura invalido!',
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
             edDIAFAT.SetFocus;
             edDIAFAT.Clear;
             Exit;
       End
       Else
       begin
           M_DIAFAT := StrtoInt(edDIAFAT.Text);
           DecodeDate (Date(), M_ANO, M_MES, M_DIA);
           M_DTAUXI := uFuncoes.StrZero(edDIAFAT.Text,2)+'/'+InttoStr(M_MES)+'/'+InttoStr(M_ANO);
           M_DTVENC := StrtoDate(M_DTAUXI);
           M_DTLIMI := uFuncoes.Datafinal(Date(),-1);
           //
           edDIAFAT.Text := uFuncoes.StrZero(edDIAFAT.Text,2);
           edDTFATU.Text := DatetoStr(M_DTLIMI);
           edDTVENC.Text := DatetoStr(M_DTVENC);
       End;
   End;
end;

procedure TfrmGerarFatura.edDTVENCExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edDTVENC.Text) Then
     begin
          If (StrtoDate(edDTVENC.Text)-Date() > 30) Then
          begin
               Application.MessageBox('Vencimento informado superior a 30 dias!',
                  'ATENÇÃO', MB_OK+MB_ICONSTOP);
               btCancelar.SetFocus;
          End
          Else
              btConfirmar.SetFocus;

     End;
end;

procedure TfrmGerarFatura.btConfirmarClick(Sender: TObject);
Var
    M_NRCART, M_NRDOCU, M_NRPARC,M_QTPARC : String;
    M_CDCRED,M_DTREFE, M_CDCLIE,M_TPMOVI  : String;
    M_NMCRED,M_NMPLAN,M_FLPRIM, M_DIAFAT  : String;
    M_NMSACA,M_ENDERE, M_CEPSAC,M_BAIRRO  : String;
    M_CIDADE,M_UFSACA,M_CPFCGC, M_TPPESS  : String;
    DIA_RUIM : Boolean;
    M_FLCONV, M_COMPLE : String;
    M_VLPARC,M_PEDESC,M_VLDESC,M_VLANTE: Double;
    M_VLDOCU,M_VLCRED : Double;
    M_DTPAGA : TDate;
    M_REGANT : TBookmark;
    M_VLMULT, M_VLJURO,M_QTDIAS :Double;
    M_NMMULT,M_NMJURO : String;
    TD: TTransactionDesc;
begin
 //         dmInfoCartao.dbCartao.StartTransaction;
     If uFuncoes.Empty (edDIAFAT.Text) Then
     begin
           Application.MessageBox('Digite o dia da Fatura?',
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
           edDIAFAT.SetFocus;
           edDIAFAT.Clear;
           Exit;
     End;
     //
     If not (dmInfoCartao.cdsDiaFatura.Locate('FAT_DIAFATU',edDIAFAT.Text,[])) Then
     begin
            Application.MessageBox('Dia para Fatura invalido!',
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
             edDIAFAT.SetFocus;
             edDIAFAT.Clear;
             Exit;
     End;
   //
   If Application.MessageBox(PChar('Confirmar geração de fatura: '+lbl_NRFATU.Caption),
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
   begin
     TD.TransactionID := 1;
     TD.IsolationLevel := xilREADCOMMITTED;
     // Inicia um transação no BD
     dmInfoCartao.SQLConnection1.StartTransaction(TD);
     //
     Try
          //
          dmInfoCartao.cdsParametros.Open;
          dmInfoCartao.cdsParametros.Edit;
          dmInfoCartao.cdsParametros.FieldByName('PAR_NRFATU').AsFloat
             := dmInfoCartao.cdsParametros.FieldByName('PAR_NRFATU').AsFloat+1;
          M_DIAFAT := uFuncoes.StrZero(edDIAFAT.Text,2);
          M_NRFATU := dmInfoCartao.cdsParametros.FieldByName('PAR_NRFATU').AsFloat;
          // Grava as Alterações
          dmInfoCartao.cdsParametros.Post;
          dmInfoCartao.cdsParametros.ApplyUpdates(0);
          //
          M_NRBOLE := '';
          //
          With dmInfoCartao.dstDebito do
          begin
               DisableControls;
               Active      := False;
               CommandText := 'Select * from ACCDEB Where DEB_DIAFAT='
                  +QuotedStr(M_DIAFAT)+'And DEB_FLSITU='+QuotedStr('A');
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
             If (dmInfoCartao.cdsDebito.FieldByName('DEB_DTMOVI').AsDateTime <= M_DTLIMI) Then
                {(dmInfoCartao.cdsDebito.FieldByName('DEB_DIAFAT').AsString = M_DIAFAT) And
                (dmInfoCartao.cdsDebitoDEB_FLSITU.Value ='A') Then}
             Begin
               M_NRCART := dmInfoCartao.cdsDebito.FieldByName('DEB_NRCART').AsString;
               M_NRDOCU := dmInfoCartao.cdsDebito.FieldByName('DEB_NRVEND').AsString
                    +uFuncoes.StrZero(dmInfoCartao.cdsDebito.FieldByName('DEB_NRPARC').AsString,3);
               M_NRPARC := uFuncoes.StrZero(dmInfoCartao.cdsDebito.FieldByName('DEB_NRPARC').AsString,3);
               M_QTPARC := uFuncoes.StrZero(dmInfoCartao.cdsDebito.FieldByName('DEB_QTPARC').AsString,3);
               M_CDCRED := dmInfoCartao.cdsDebito.FieldByName('DEB_CDCRED').AsString;
               M_DTREFE := dmInfoCartao.cdsDebito.FieldByName('DEB_DTREFE').AsString;
               M_VLPARC := dmInfoCartao.cdsDebito.FieldByName('DEB_VLPARC').AsCurrency;
               M_CDCLIE := dmInfoCartao.cdsDebito.FieldByName('DEB_CDCLIE').AsString;
               M_TPMOVI := dmInfoCartao.cdsDebito.FieldByName('DEB_TPMOVI').AsString;
               M_NMPLAN := M_NRPARC+'/'+M_QTPARC;
               //
               dmInfoCartao.cdsDebito.FieldByName('DEB_DTFATU').AsDateTime := Date();
               dmInfoCartao.cdsDebito.FieldByName('DEB_FLSITU').AsString  := 'F';
               dmInfoCartao.cdsDebito.FieldByName('DEB_NRFATU').AsString  :=
                          uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
               //
               dmInfoCartao.cdsCredenciados.Open;
               If (dmInfoCartao.cdsCredenciados.Locate('CRE_CDCRED',M_CDCRED,[])) Then
                    M_NMCRED := dmInfoCartao.cdsCredenciados.FieldByName('CRE_NMEXTR').AsString
               Else
                    M_NMCRED := M_CDCRED+' - NÃO ENCONTRADO';
               //
               M_NMSACA := '';
               M_ENDERE := '';
               M_CEPSAC := '';
               M_BAIRRO := '';
               M_CIDADE := '';
               M_UFSACA := '';
               M_CPFCGC := '';
               M_TPPESS := '';
               M_FLCONV := 'N';
               M_PEDESC := 0;
               //
               dmInfoCartao.cdsClientes.Open;
               //
               If (dmInfoCartao.cdsClientes.Locate('CLI_CDCLIE',M_CDCLIE,[])) Then
               Begin
                  M_FLCONV := dmInfoCartao.cdsClientesCLI_FLCONV.Value;
                  M_NMSACA := dmInfoCartao.cdsClientesCLI_NMCLIE.Value;
                  M_ENDERE := dmInfoCartao.cdsClientesCLI_ENCLIE.Value;
                  M_COMPLE := dmInfoCartao.cdsClientesCLI_COMCLI.Value;
                  M_CEPSAC := dmInfoCartao.cdsClientesCLI_CEPCLI.Value;
                  M_BAIRRO := dmInfoCartao.cdsClientesCLI_BAICLI.Value;
                  M_CIDADE := dmInfoCartao.cdsClientesCLI_CIDCLI.Value;
                  M_UFSACA := dmInfoCartao.cdsClientesCLI_UFCLIE.Value;
                  M_CPFCGC := dmInfoCartao.cdsClientesCLI_CPFCGC.Value;
                  M_TPPESS := dmInfoCartao.cdsClientesCLI_TPPESS.Value;
                  M_PEDESC := dmInfoCartao.cdsClientesCLI_PEDESC.AsFloat;
                  //
                  If (M_TPPESS = 'J') Then
                     If not uFuncoes.Empty(dmInfoCartao.cdsClientesCLI_NRCART.Value) Then
                     begin
                        M_NRCART := dmInfoCartao.cdsClientesCLI_NRCART.Value;
                        M_NMSACA := dmInfoCartao.cdsClientesCLI_NMEMPR.Value;
                        M_ENDERE := dmInfoCartao.cdsClientesCLI_ENEMPR.Value;
                        M_CEPSAC := dmInfoCartao.cdsClientesCLI_CEPEMP.Value;
                        M_BAIRRO := dmInfoCartao.cdsClientesCLI_BAEMPR.Value;
                        M_CIDADE := dmInfoCartao.cdsClientesCLI_CIEMPR.Value;
                        M_UFSACA := dmInfoCartao.cdsClientesCLI_UFCLIE.Value;
                        dmInfoCartao.cdsClientesCLI_CGCEMP.EditMask := '99.999.999/9999-99';
                        M_CPFCGC := dmInfoCartao.cdsClientesCLI_CGCEMP.Value;
                     End
                     Else
                     begin
                        dmInfoCartao.cdsClientesCLI_CPFCGC.EditMask := '999.999.999-99';
                        M_CPFCGC := dmInfoCartao.cdsClientesCLI_CPFCGC.Value;
                     End;
                  End;
               End;
               //
               M_VLDESC := (M_VLPARC * M_PEDESC)/100;
               M_VLPARC := M_VLPARC - M_VLDESC;
               //
               dmInfoCartao.cdsDebito.FieldByName('DEB_VLDESC').AsFloat := M_VLDESC;
               // Grava
               dmInfoCartao.cdsDebito.Post;
               dmInfoCartao.cdsDebito.ApplyUpdates(0);
               //
               M_VLANTE := 0;
               M_VLCRED := 0;
               //M_DTPAGA := StrtoDate('  /  /    ');
               //
               If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',M_NRCART,[])) Then
               Begin
                  M_VLANTE := dmInfoCartao.cdsCartoes.FieldByName('CAR_VLANTE').AsCurrency;
                  M_VLCRED := dmInfoCartao.cdsCartoes.FieldByName('CAR_VLCRED').AsCurrency;
                  M_DTPAGA := dmInfoCartao.cdsCartoes.FieldByName('CAR_DTPAGA').AsDateTime;
               End;
               //
               M_FLPRIM := 'N';
               //
               If not (dmInfoCartao.cdsBoletos.Locate('BOL_NRFATU;BOL_NRCART',
                   VarArrayOf([dmInfoCartao.cdsDebito.FieldByName('DEB_NRFATU').AsString,M_NRCART]),[])) Then
               begin
                  M_FLPRIM := 'S';
                  dmInfoCartao.cdsParametros.Edit;
                  dmInfoCartao.cdsParametros.FieldByName('PAR_NRBOLE').AsFloat :=
                        dmInfoCartao.cdsParametros.FieldByName('PAR_NRBOLE').AsFloat+1;
                  M_NRBOLE := dmInfoCartao.cdsParametros.FieldByName('PAR_NRBOLE').AsString;
                  // Grava
                  dmInfoCartao.cdsParametros.Post;
                  dmInfoCartao.cdsParametros.ApplyUpdates(0);
                  //
                  M_NRBOLE := uFuncoes.StrZero(M_NRBOLE,10);
                  dmInfoCartao.cdsBoletos.Append;
               End
               Else
               begin
                   dmInfoCartao.cdsBoletos.Edit;
                   M_NRBOLE := dmInfoCartao.cdsBoletos.FieldByName('BOL_NRDOCU').AsString;
               End;
               //
               dmInfoCartao.cdsBoletosBOL_NRDOCU.Value := M_NRBOLE;
               dmInfoCartao.cdsBoletosBOL_CDCLIE.Value := M_CDCLIE;
               dmInfoCartao.cdsBoletosBOL_DTDOCU.Value := DATE();
               dmInfoCartao.cdsBoletosBOL_FLSITU.Value := 'A';
               dmInfoCartao.cdsBoletosBOL_DTVENC.Value := M_DTVENC;
               dmInfoCartao.cdsBoletosBOL_NMCEDE.Value := M_NMCEDE;
               dmInfoCartao.cdsBoletosBOL_NRFATU.Value := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
               dmInfoCartao.cdsBoletosBOL_VLDOCU.Value :=
                uFuncoes.Arredondar(dmInfoCartao.cdsBoletos.FieldByName('BOL_VLDOCU').AsCurrency+M_VLPARC,2);
               dmInfoCartao.cdsBoletosBOL_NMSACA.Value := M_NMSACA;
               dmInfoCartao.cdsBoletosBOL_ENDERE.Value := M_ENDERE;
               dmInfoCartao.cdsBoletosBOL_COMPLE.AsString := M_COMPLE;
               dmInfoCartao.cdsBoletosBOL_CEPSAC.Value := M_CEPSAC;
               dmInfoCartao.cdsBoletosBOL_BAIRRO.Value := M_BAIRRO;
               dmInfoCartao.cdsBoletosBOL_CIDADE.Value := M_CIDADE;
               dmInfoCartao.cdsBoletosBOL_UFSACA.Value := M_UFSACA;
               dmInfoCartao.cdsBoletosBOL_CPFCGC.Value := M_CPFCGC;
               dmInfoCartao.cdsBoletosBOL_TPPESS.Value := M_TPPESS;
               dmInfoCartao.cdsBoletosBOL_LOCPAG.Value := M_LOCPAG;
               dmInfoCartao.cdsBoletosBOL_NRCART.Value := M_NRCART;
               dmInfoCartao.cdsBoletosBOL_VLANTE.Value := M_VLANTE;
               dmInfoCartao.cdsBoletosBOL_VLCRED.Value := M_VLCRED;
               dmInfoCartao.cdsBoletosBOL_VLREST.Value := M_VLANTE-M_VLCRED;
               dmInfoCartao.cdsBoletosBOL_VLFATU.Value := dmInfoCartao.cdsBoletosBOL_VLFATU.Value+M_VLPARC;
               //
               If (M_FLPRIM = 'S') Then
               begin
                 { *** CASO QUEIRA COLOCAR O VALOR DO BOLETO ANTERIO
                  *** NAO PAGO, JUNTO COM O ATUAL
                  ***
                  *REPL BOL_VLDOCU WITH BOL_VLDOCU+(M_VLANTE-M_VLCRED)
                  ***
                  ***}
                End;
               // Grava as alterações
               dmInfoCartao.cdsBoletos.Post;
               dmInfoCartao.cdsBoletos.ApplyUpdates(0);
               //dmInfoCartao.cdsBoletos.Cancel;
               //
               If (M_FLCONV <> 'S') Then
               begin
                  If (dmInfoCartao.cdsMovBoletos.Active = False) Then
                      dmInfoCartao.cdsMovBoletos.Open;
                  //
                  dmInfoCartao.cdsMovBoletos.Append;
                  dmInfoCartao.cdsMovBoletosBOM_NRFATU.Value := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
                  dmInfoCartao.cdsMovBoletosBOM_NRCART.Value := M_NRCART;
                  dmInfoCartao.cdsMovBoletos.FieldByName('BOM_CDCLIE').AsString := M_CDCLIE;
                  dmInfoCartao.cdsMovBoletosBOM_DTREFE.Value := M_DTREFE;
                  dmInfoCartao.cdsMovBoletosBOM_NMCRED.Value := M_NMCRED;
                  dmInfoCartao.cdsMovBoletosBOM_NMPLAN.Value := M_NMPLAN;
                  dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value := M_VLPARC;
                  dmInfoCartao.cdsMovBoletosBOM_TPMOVI.Value := M_TPMOVI;
                  // Grava
                  dmInfoCartao.cdsMovBoletos.Post;
                  dmInfoCartao.cdsMovBoletos.ApplyUpdates(0);
                  //
                  If (M_FLPRIM = 'S') AND (M_VLCRED > 0) Then
                  begin
                     DecodeDate (M_DTPAGA, M_ANO, M_MES, M_DIA);
                     M_DTREFE := uFuncoes.StrZero(InttoStr(M_DIA),2)+'/'+uFuncoes.MesExtenso(Date);
                     //
                     dmInfoCartao.cdsMovBoletos.Append;
                     //
                     dmInfoCartao.cdsMovBoletosBOM_NRFATU.Value := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
                     dmInfoCartao.cdsMovBoletosBOM_NRCART.Value := M_NRCART;
                     dmInfoCartao.cdsMovBoletos.FieldByName('BOM_CDCLIE').AsString := M_CDCLIE;
                     dmInfoCartao.cdsMovBoletosBOM_DTREFE.Value := M_DTREFE;
                     dmInfoCartao.cdsMovBoletosBOM_NMCRED.Value := 'PAGAMENTO';
                     dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value := M_VLCRED;
                     dmInfoCartao.cdsMovBoletosBOM_TPMOVI.Value := 'C';
                     //  Gravar
                     dmInfoCartao.cdsMovBoletos.Post;
                     dmInfoCartao.cdsMovBoletos.ApplyUpdates(0);
                     //
                  End;
               End
               Else
               begin
                  //
                  If not (dmInfoCartao.cdsMovBoletos.Locate('BOM_NRFATU;BOM_NRCART;BOM_TPMOVI',
                          VarArrayOf([M_NRFATU,M_NRCART,M_TPMOVI]),[])) Then
                      dmInfoCartao.cdsMovBoletos.Append
                  Else
                      dmInfoCartao.cdsMovBoletos.Edit;
                  //
                  dmInfoCartao.cdsMovBoletosBOM_NRFATU.Value := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
                  dmInfoCartao.cdsMovBoletosBOM_NRCART.Value := M_NRCART;
                  dmInfoCartao.cdsMovBoletos.FieldByName('BOM_CDCLIE').AsString := M_CDCLIE;
                  dmInfoCartao.cdsMovBoletosBOM_NMCRED.Value := 'FATURA';
                  dmInfoCartao.cdsMovBoletosBOM_DTREFE.Value := M_DTREFE;
                  dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value := dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value+(M_VLPARC+M_VLDESC);
                  dmInfoCartao.cdsMovBoletosBOM_TPMOVI.Value := M_TPMOVI;
                  // Grava
                  dmInfoCartao.cdsMovBoletos.Post;
                  dmInfoCartao.cdsMovBoletos.ApplyUpdates(0);
                  //
                  If not (dmInfoCartao.cdsMovBoletos.Locate('BOM_NRFATU;BOM_NRCART;BOM_TPMOVI',
                        VarArrayOf([M_NRFATU,M_NRCART,'C']),[])) Then
                      dmInfoCartao.cdsMovBoletos.Append
                  Else
                      dmInfoCartao.cdsMovBoletos.Edit;
                  //
                  dmInfoCartao.cdsMovBoletosBOM_NRFATU.Value := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
                  dmInfoCartao.cdsMovBoletosBOM_NRCART.Value := M_NRCART;
                  dmInfoCartao.cdsMovBoletos.FieldByName('BOM_CDCLIE').AsString := M_CDCLIE;
                  dmInfoCartao.cdsMovBoletosBOM_DTREFE.Value := M_DTREFE;
                  dmInfoCartao.cdsMovBoletosBOM_NMCRED.Value := 'DESCONTO';
                  dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value := dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value+M_VLDESC;
                  dmInfoCartao.cdsMovBoletosBOM_TPMOVI.Value := 'C';
                  // Grava
                  dmInfoCartao.cdsMovBoletos.Post;
                  dmInfoCartao.cdsMovBoletos.ApplyUpdates(0);
                  //
               End;
               // Próximo registro
               dmInfoCartao.cdsDebito.Next;
          End;
          //
          With dmInfoCartao.dstBoletos do
          begin
               DisableControls;
               Active      := False;
               CommandText := 'Select * from ACCBOL Where BOL_NRFATU='
                  +QuotedStr(uFuncoes.StrZero(FloattoStr(M_NRFATU),10));
               Active      := True;
               EnableControls;
          End;
          //
          With dmInfoCartao.cdsBoletos do
          begin
               DisableControls;
               Active      := False;
               Active      := True;
               EnableControls;
          End;
          //
          dmInfoCartao.cdsBoletos.First;
          While not (dmInfoCartao.cdsBoletos.EOF) do
          begin
            dmInfoCartao.cdsBoletos.Edit;
            M_NRCART := dmInfoCartao.cdsBoletosBOL_NRCART.Value;
            M_VLDOCU := dmInfoCartao.cdsBoletosBOL_VLDOCU.Value;
            //
            If (dmInfoCartao.cdsCartoes.Locate('CAR_NRCART',M_NRCART,[])) Then
            begin
               dmInfoCartao.cdsCartoes.Edit;
               dmInfoCartao.cdsCartoes.FieldByName('CAR_VLANTE').AsCurrency := M_VLDOCU;
               dmInfoCartao.cdsCartoes.FieldByName('CAR_VLCRED').AsFloat    := 0;
               // Grava
               dmInfoCartao.cdsCartoes.Post;
               dmInfoCartao.cdsCartoes.ApplyUpdates(0);
            End;
            // Próximo registro
            dmInfoCartao.cdsBoletos.next;
          End;    //fim-do-enquanto
          //
          // GERANDO JUROS PARA PROXIMA FATURA
          //dmInfoCartao.cdsBoletos.Locate('BOL_NRFATU',M_NRFATU,[]);
          //
          dmInfoCartao.cdsBoletos.First;
          While not (dmInfoCartao.cdsBoletos.EOF) do
          begin
           If (uFuncoes.StrZero(FloattoStr(M_NRFATU),10)=dmInfoCartao.cdsBoletosBOL_NRFATU.AsString) Then
           begin
                M_NRCART := dmInfoCartao.cdsBoletosBOL_NRCART.Value;
                M_REGANT := dmInfoCartao.cdsBoletos.GetBookmark;
                M_VLMULT := 0;
                M_VLJURO := 0;
                M_NMMULT := 'MULTA';
                M_NMJURO := 'JUROS';
                //
                If (dmInfoCartao.cdsBoletos.Locate('BOL_NRFATU;BOL_NRCART',
                    VarArrayOf([M_NRFATU,M_NRCART]),[])) Then
                begin
                     // Retorna um registro
                     dmInfoCartao.cdsBoletos.Prior;
                     //
                     If (M_NRCART = dmInfoCartao.cdsBoletosBOL_NRCART.Value) Then   // FATURA ANTERIOR
                     begin
                          M_NMMULT := M_NMMULT+' VENC:'+(dmInfoCartao.cdsBoletosBOL_DTVENC.AsString)+'.';
                          M_NMJURO := M_NMJURO+' VENC:'+(dmInfoCartao.cdsBoletosBOL_DTVENC.AsString)+'.';
                          //
                          If not uFuncoes.Empty(dmInfoCartao.cdsBoletosBOL_DTPAGA.AsString) Then
                          begin
                               M_DTVENC := dmInfoCartao.cdsBoletosBOL_DTVENC.Value;
                               DIA_RUIM := True;
                               //
                               While (DIA_RUIM) do
                               begin
                                   If (DayOfWeek(M_DTVENC) = 1) Then // se domingo
                                      M_DTVENC := M_DTVENC + 1;
                                   If (DayOfWeek(M_DTVENC) = 7) Then // se sabado
                                      M_DTVENC := M_DTVENC + 2;
                                   If (DayOfWeek(M_DTVENC) in [2,3,4,5,6]) Then
                                   begin
                                      If (dmInfoCartao.cdsFeriados.Locate('FER_DTFERI',M_DTVENC,[])) Then
                                         M_DTVENC := M_DTVENC + 1
                                      Else
                                         DIA_RUIM := False;
                                   End;
                               End;     // fim-do-enquanto
                              //
                               M_QTDIAS :=
                               dmInfoCartao.cdsBoletos.FieldByName('BOL_DTPAGA').AsDateTime-M_DTVENC;
                          End
                          Else
                             M_QTDIAS := DATE()-dmInfoCartao.cdsBoletos.FieldByName('BOL_DTVENC').AsDateTime;
                  //
                  If (M_QTDIAS > 0) Then
                  begin
                     M_VLMULT := (dmInfoCartao.cdsBoletos.FieldByName('BOL_VLDOCU').AsFloat * M_PEMULT)/100;
                     M_VLJURO := (((dmInfoCartao.cdsBoletos.FieldByName('BOL_VLDOCU').AsFloat * M_PEJURO)/100)/30) * M_QTDIAS;
                  End;
               End;
            End;
            //
            dmInfoCartao.cdsBoletos.GotoBookmark(M_REGANT);
            dmInfoCartao.cdsBoletos.FreeBookmark(M_REGANT);
            //
            dmInfoCartao.cdsBoletos.Edit;
            dmInfoCartao.cdsBoletos.FieldByName('BOL_VLDOCU').AsCurrency :=
                dmInfoCartao.cdsBoletos.FieldByName('BOL_VLDOCU').AsCurrency+M_VLJURO+M_VLMULT;
            // Grava
            dmInfoCartao.cdsBoletos.Post;
            dmInfoCartao.cdsBoletos.ApplyUpdates(0);
            //
            {If not (dmInfoCartao.cdsMovBoletos.Active = False) Then
                   dmInfoCartao.cdsMovBoletos.Open;}
            //
            If (M_VLMULT > 0) Then
            begin
               //
               If not (dmInfoCartao.cdsMovBoletos.Locate('BOM_NRFATU;BOM_NRCART;BOM_TPMOVI',
                       VarArrayOf([M_NRFATU,M_NRCART,'M']),[])) Then
                  dmInfoCartao.cdsMovBoletos.APPEND
               Else
                  dmInfoCartao.cdsMovBoletos.edit;
               //
               dmInfoCartao.cdsMovBoletosBOM_NRFATU.Value := uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
               dmInfoCartao.cdsMovBoletosBOM_NRCART.Value := M_NRCART;
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_CDCLIE').AsString := M_CDCLIE;
               dmInfoCartao.cdsMovBoletosBOM_NMCRED.Value := M_NMMULT;
               dmInfoCartao.cdsMovBoletosBOM_DTREFE.Value := M_DTREFE;
               dmInfoCartao.cdsMovBoletosBOM_VLPARC.Value := M_VLMULT;
               dmInfoCartao.cdsMovBoletosBOM_TPMOVI.Value := 'M';
               // Grava
               dmInfoCartao.cdsMovBoletos.Post;
               dmInfoCartao.cdsMovBoletos.ApplyUpdates(0);
            End;
            //
            IF (M_VLJURO > 0) Then
            begin
               //se não encontra
               If not (dmInfoCartao.cdsMovBoletos.Locate('BOM_NRFATU;BOM_NRCART;BOM_TPMOVI',
                         VarArrayOf([M_NRFATU,M_NRCART,'J']),[])) then
                  dmInfoCartao.cdsMovBoletos.Append
               Else
                  dmInfoCartao.cdsMovBoletos.Edit;
               //
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_NRFATU').AsString :=
                  uFuncoes.StrZero(FloattoStr(M_NRFATU),10);
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_NRCART').AsString := M_NRCART;
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_CDCLIE').AsString := M_CDCLIE;
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_DTREFE').AsString := M_DTREFE;
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_NMCRED').AsString := M_NMJURO;
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_VLPARC').AsCurrency := M_VLJURO;
               dmInfoCartao.cdsMovBoletos.FieldByName('BOM_TPMOVI').AsString := 'J';
               // Grava
               dmInfoCartao.cdsMovBoletos.Post;
               dmInfoCartao.cdsMovBoletos.ApplyUpdates(0);
            End;
           End;    //Fim-do-se
            // Proximo registro
            dmInfoCartao.cdsBoletos.Next;
          End;    //fim-do-enquanto
          //
         // Grava e Fechar a transação no BD
         dmInfoCartao.SQLConnection1.Commit(TD);
         //
         Application.MessageBox('Registro de faturamento gerado!',
              'CONCLUÍDO', MB_OK+MB_ICONINFORMATION);
         btConfirmar.Enabled := False;
         //
         Close;
         //
     Except
         // Cancela e Fechar a transação no BD
         dmInfoCartao.SQLConnection1.Rollback(TD);
         //
         Application.MessageBox('Error ao tentar gerar faturamento!',
               'ERROR', MB_OK+MB_ICONERROR);
     End;
   //
   End   // Fim-do-se
   Else
       Close;
end;

procedure TfrmGerarFatura.btCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGerarFatura.FormKeyPress(Sender: TObject; var Key: Char);
begin
      If (Key = #27) Then
      begin
           Key := #0;
           Close;
      End;
end;

procedure TfrmGerarFatura.Validar_Dia;
begin
end;

end.
