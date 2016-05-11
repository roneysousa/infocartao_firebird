unit uPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave;

type
  TfrmPeriodo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label13: TLabel;
    btOk: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edt_DTINIC: TDateEdit;
    edt_DTFINA: TDateEdit;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    procedure Button2Click(Sender: TObject);
    procedure edt_DTINICExit(Sender: TObject);
    procedure edt_DTFINAExit(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPeriodo: TfrmPeriodo;
  M_VLINIC,M_VLFINA, M_VLMODA : Double;
  M_TORECE,M_TODESP, M_VLSALD : Double;

implementation

uses udmRelatorios, uInfoPrincipal, uFuncoes, udmInfoCartao;

// uRelMovCaixa, , uRelTotGeralNatu

{$R *.dfm}

procedure TfrmPeriodo.Button2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmPeriodo.edt_DTINICExit(Sender: TObject);
begin
    Try
        StrToDate(edt_DTINIC.Text);
    Except
        on EConvertError do
        begin
             Application.MessageBox('Data Inv�lida!',
                    'ATEN��O', MB_OK+MB_ICONINFORMATION);
             edt_DTINIC.Clear;
             edt_DTINIC.SetFocus;
        End;
    End;
end;

procedure TfrmPeriodo.edt_DTFINAExit(Sender: TObject);
begin
    Try
        StrToDate(edt_DTFINA.Text);
    Except
        on EConvertError do
        begin
             Application.MessageBox('Data Inv�lida!',
                    'ATEN��O', MB_OK+MB_ICONINFORMATION);
             edt_DTFINA.Clear;
             edt_DTFINA.SetFocus;
        End;
    End;
end;

procedure TfrmPeriodo.btOkClick(Sender: TObject);
begin
   If (frmPeriodo.Caption ='Relat�rio') Then
   begin
     Try
         M_VLINIC := 0;
         M_VLFINA := 0;
         //
         //Application.CreateForm(TfrmRelMovCaixa,frmRelMovCaixa);
         //
         If (dmInfoCartao.cdsParametros.Active = False) Then
             dmInfoCartao.cdsParametros.Open;
         {With frmRelMovCaixa do
         begin
           txtEmpresa.Caption   := dmInfoCartao.cdsParametrosPAR_NMEMPR.Value;
           txtSistema.Caption   := 'INFOCART�O';
           txtRelatorio.Caption := 'MOVIMENTO DO CAIXA';
           txtUsuario.Caption   := uInfoPrincipal.M_CDUSUA+' - '+ uInfoPrincipal.M_NMUSUA;
           txtPeriodo.Caption   := edt_DTINIC.Text+' a '+edt_DTFINA.Text;
         End;}
         //
         dmInfoCartao.cdsParametros.Close;
         //
         {With frmRelMovCaixa.qryCaixa do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select Sum(CXA_VLINIC),Sum(CXA_VLFINA) from ACCCXA');
              SQL.Add('WHERE CXA_DTCAIX >=:pInicial');
              ParamByName('pInicial').AsDateTime := StrToDate(edt_DTINIC.Text);
              Prepare;
              Open;
         End;
         //
         M_VLINIC := frmRelMovCaixa.qryCaixaSUMOFCXA_VLINIC.Value;
         M_VLFINA := frmRelMovCaixa.qryCaixaSUMOFCXA_VLFINA.Value;
         //
         frmRelMovCaixa.txtVLNIC.Caption := FormatFLoat('#,###,##0.#0',M_VLINIC);
         // Total de receita
         With frmRelMovCaixa.qryMovCaixa2 do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select  Sum(MCA_VLMODA) MCA_TOTAL from ACCMCA');
              SQL.Add('WHERE MCA_DTMOVI<=:pFinal And MCA_TPMOVI="R"');
              ParamByName('pFinal').AsDateTime   := StrToDate(edt_DTFINA.Text);
              Prepare;
              Open;
         End;
         //
         M_TORECE := frmRelMovCaixa.qryMovCaixa2MCA_TOTAL.Value;
         frmRelMovCaixa.txtTORECE.Caption := FormatFLoat('#,###,##0.#0',M_TORECE);
         //
         // Total de Despesa
         With frmRelMovCaixa.qryMovCaixa2 do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select  Sum(MCA_VLMODA) MCA_TOTAL from ACCMCA');
              SQL.Add('WHERE MCA_DTMOVI<=:pFinal And MCA_TPMOVI="D"');
              ParamByName('pFinal').AsDateTime   := StrToDate(edt_DTFINA.Text);
              Prepare;
              Open;
         End;
         //
         M_TODESP := frmRelMovCaixa.qryMovCaixa2MCA_TOTAL.Value;
         frmRelMovCaixa.txtTODESP.Caption := FormatFLoat('#,###,##0.#0',M_TODESP);
         //
         With frmRelMovCaixa.qyrMovCaixa do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select * from ACCMCA');
              SQL.Add('WHERE MCA_DTMOVI >=:pInicial and MCA_DTMOVI<=:pFinal');
              ParamByName('pInicial').AsDateTime := StrToDate(edt_DTINIC.Text);
              ParamByName('pFinal').AsDateTime   := StrToDate(edt_DTFINA.Text);
              Prepare;
              Open;
         End;
         //
         M_VLSALD := 0;
         With frmRelMovCaixa.qryCaixa2 do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select  Sum(CXA_VLFINA) CXA_VLSALD from ACCCXA');
              SQL.Add('WHERE CXA_DTCAIX =:pFinal');
              ParamByName('pFinal').AsDateTime   := StrToDate(edt_DTFINA.Text);
              Prepare;
              Open;
         End;
         //
         M_VLSALD := frmRelMovCaixa.qryCaixa2CXA_VLSALD.Value;
         frmRelMovCaixa.txtSaldo.Caption := FormatFLoat('#,###,##0.#0',M_VLSALD);
         //
         frmRelMovCaixa.qrMovCaixa.Preview;
     Finally
         frmRelMovCaixa.Free;
     End;
  End;
  //
  If (frmPeriodo.Caption = 'Total Geral das Naturezas') then
  Begin
       try
           Application.CreateForm(TfrmRelTotGerNatu,frmRelTotGerNatu);
           With frmRelTotGerNatu do
           begin
                If (dmInfoCartao.cdsParametros.Active = False) Then
                    dmInfoCartao.cdsParametros.Open;
                //
                txtEmpresa.Caption   := dmInfoCartao.cdsParametrosPAR_NMEMPR.Value;
                txtSistema.Caption   := 'INFOCART�O';
                txtRelatorio.Caption := 'TOTAL GERAL DAS NATUREZAS';
                txtUsuario.Caption   := uInfoPrincipal.M_CDUSUA+' - '+ uInfoPrincipal.M_NMUSUA;
                txtPeriodo.Caption   := edt_DTINIC.Text+' a '+edt_DTFINA.Text;
                //
                dmInfoCartao.cdsParametros.Close;
           End;
           frmRelTotGerNatu.qrNatureza.Preview;}
       finally
           //frmRelTotGerNatu.Free;
       End;
  End;
End;

procedure TfrmPeriodo.FormActivate(Sender: TObject);
begin
    edt_DTINIC.Text := DatetoStr(Date);
    edt_DTFINA.Text := DatetoStr(Date);
end;

end.
