unit uPeriodoMovCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Grids, DBGrids, Buttons, DB, ToolEdit;

type
  TfrmPeriodoMovCred = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label13: TLabel;
    Panel2: TPanel;
    btOk: TButton;
    Button2: TButton;
    Label3: TLabel;
    edt_CDCRED: TEdit;
    sbLocalizar: TSpeedButton;
    dbGridCred: TDBGrid;
    dsCred: TDataSource;
    edt_DTINIC: TDateEdit;
    edt_DTFINA: TDateEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbLocalizarClick(Sender: TObject);
    procedure edt_CDCREDKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dbGridCredDblClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edt_CDCREDExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPeriodoMovCred: TfrmPeriodoMovCred;

implementation

uses udmInfoCartao, udmRelatorios,uFuncoes, uInfoPrincipal;

{$R *.dfm}

procedure TfrmPeriodoMovCred.Button2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmPeriodoMovCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //dmCartao.tbCredenciado.Close;
     //
     Action := caFree;
end;

procedure TfrmPeriodoMovCred.sbLocalizarClick(Sender: TObject);
begin
     dbGridCred.Visible := True;
end;

procedure TfrmPeriodoMovCred.edt_CDCREDKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8] ) then
        key:=#0;
end;

procedure TfrmPeriodoMovCred.FormActivate(Sender: TObject);
begin
    { If (dmInfoCartao.tbCredenciado.Active = False) Then
         dmInfoCartao .tbCredenciado.Open;}
    edt_DTINIC.Date := Date();
    edt_DTFINA.Date := Date();
end;

procedure TfrmPeriodoMovCred.dbGridCredDblClick(Sender: TObject);
begin
{     dmInfoCartao .tbCredenciado.Edit;
     edt_CDCRED.Text := dmInfoCartao .tbCredenciadoCRE_CDCRED.Value;
     dmInfoCartao .tbCredenciado.Cancel;
     //
     dbGridCred.Visible := False;}
end;

procedure TfrmPeriodoMovCred.btOkClick(Sender: TObject);
begin
      If (dmInfoCartao.cdsParametros.Active = False) Then
          dmInfoCartao.cdsParametros.Open;
     //
     If (dbGridCred.Visible = True) Then
          dbGridCred.Visible := False;
     //
     //txtPeriodo.Caption   := edt_DTINIC.Text+' a '+edt_DTFINA.Text;
     //
     If not (uFuncoes.Empty(edt_CDCRED.Text)) Then
     begin
          With dmRelatorios.dstMovimentosRel do
          begin
               Active := False;
               CommandText := 'Select MOV_NRVEND, MOV_NRCART, MOV_CDCRED, MOV_DTMOVI, MOV_HOMOVI, MOV_VLVEND, MOV_QTPARC, MOV_FLSITU, C.CRE_NMEXTR from ACCMOV, ACCCRE C Where (MOV_CDCRED=:pCDCRED) and (MOV_CDCRED=C.CRE_CDCRED)'+
                              'And (MOV_DTMOVI>=:pIncial) and (MOV_DTMOVI<=:pFinal)';
               Params.ParamByName('pCDCRED').AsString := uFuncoes.StrZero(edt_CDCRED.Text,6);
               Params.ParamByName('pIncial').AsDate   := StrtoDate(edt_DTINIC.Text);
               Params.ParamByName('pFinal').AsDate    := StrtoDate(edt_DTFINA.Text);
               //
               Active := True;
          End;
          //
          With dmRelatorios.cdsMovimentoRel do
          begin
               Active := False;
               Active := True;
          End;
          //
          With dmRelatorios.rvpMovCredenciado do
          begin
               Execute;
               Close;
          End;
          //
     End
     Else
     begin
          With dmRelatorios.dstMovimentosRel do
          begin
               Active := False;
               CommandText := 'Select MOV_NRVEND, MOV_NRCART, MOV_CDCRED, MOV_DTMOVI, MOV_HOMOVI, MOV_VLVEND, MOV_QTPARC, MOV_FLSITU, C.CRE_NMEXTR from ACCMOV, ACCCRE C Where (MOV_CDCRED>=:pCDCRED) and (MOV_CDCRED=C.CRE_CDCRED)'+
                              'And (MOV_DTMOVI>=:pIncial) and (MOV_DTMOVI<=:pFinal)';
               Params.ParamByName('pCDCRED').AsString := '000001';               
               Params.ParamByName('pIncial').AsDate   := StrtoDate(edt_DTINIC.Text);
               Params.ParamByName('pFinal').AsDate    := StrtoDate(edt_DTFINA.Text);
               //
               Active := True;
          End;
          //
          With dmRelatorios.cdsMovimentoRel do
          begin
               Active := False;
               Active := True;
          End;
          //
          With dmRelatorios.rvpMovCredenciado do
          begin
               Execute;
               Close;
          End;
          //
     End;
     //
end;

procedure TfrmPeriodoMovCred.edt_CDCREDExit(Sender: TObject);
begin
     edt_CDCRED.Text := uFuncoes.StrZero(edt_CDCRED.Text,6); 
end;

end.

