unit uConsultaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, Grids, DBGrids, Buttons;

type
  TfrmConsultaVendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label13: TLabel;
    GridVendas: TDBGrid;
    dsMovimento: TDataSource;
    btCartao: TBitBtn;
    btData: TBitBtn;
    btFechar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCartaoClick(Sender: TObject);
    procedure btDataClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    Procedure TODOS; 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

Uses udmInfoCartao,uFuncoes;

{$R *.dfm}

procedure TfrmConsultaVendas.FormActivate(Sender: TObject);
begin
     {With dmInfoCartao.dstMovimento do
     begin
          DisableControls;
          Active      := False;
          CommandText := 'Select * from ACCMOV Where (MOV_DTMOVI = ) order by MOV_DTMOVI';
          Active      := True;
          EnableControls;
     End;
     //
     With dmInfoCartao.cdsMovimento do
     begin
          DisableControls;
          Active      := False;
          Active      := True;
          EnableControls;
     End;}
     //
     With dmInfoCartao.qryLocVenda do
     begin
          DisableControls;
          SQL.Clear;
          Close;
          SQL.Add('Select * from ACCMOV Where (MOV_DTMOVI = :pDTATUA) order by MOV_DTMOVI');
          ParamByName('pDTATUA').AsDate := Date();
          Open;
          EnableControls;
     End;
     //
     dmInfoCartao.cdsMovimento.DisableControls;
     dmInfoCartao.cdsMovimento.Close;
     With dmInfoCartao.dstMovimento do
     begin

          Active      := False;
          CommandText := 'Select * from ACCMOV Where (MOV_DTMOVI = :pDTATUA) order by MOV_DTMOVI';
          ParamByName('pDTATUA').AsDate := Date();
          Active      := True;
     End;
     dmInfoCartao.cdsMovimento.Open;
     dmInfoCartao.cdsMovimento.EnableControls;
end;

procedure TfrmConsultaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dmInfoCartao.cdsMovimento.Close;
      uFuncoes.Limpar_Status;
      //
      Action := caFree;
end;

procedure TfrmConsultaVendas.btCartaoClick(Sender: TObject);
Var
    M_NRCART:String;
begin
    //TODOS;
    //
    M_NRCART := InputBox('Localizar','Digite o número do cartão?','');
    If Not uFuncoes.Empty(M_NRCART) Then
    begin
         If not (dmInfoCartao.qryLocVenda.Locate('MOV_NRCART',M_NRCART,[])) Then
         begin
              Application.MessageBox('Número de cartão não encontado.',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
              Exit;
         End
         Else
         begin
              With dmInfoCartao.dstMovimento do
              begin
                   DisableControls;
                   Active      := False;
                   CommandText := 'Select * from ACCMOV Where MOV_NRCART='+QuotedStr(M_NRCART)+' order by MOV_DTMOVI';
                   Active      := True;
                   EnableControls;
              End;
              //
              With dmInfoCartao.cdsMovimento do
              begin
                   DisableControls;
                   Active      := False;
                   //CommandText := 'Select * from ACCMOV Where MOV_NRCART='+QuotedStr(M_NRCART)+' order by MOV_NRCART';
                   Active      := True;
                   EnableControls;
              End;
         End;
    End;
    //
    GridVendas.SetFocus;
end;

procedure TfrmConsultaVendas.btDataClick(Sender: TObject);
Var
    M_DTMOVI:String;
begin
    //TODOS;
    //
    M_DTMOVI := InputBox('Localizar','Digite a data da venda?',DatetoStr(Date));
    Try
        StrToDate(M_DTMOVI);
        If Not uFuncoes.Empty(M_DTMOVI) Then
        begin
           //If not (dmInfoCartao.cdsMovimento.Locate('MOV_DTMOVI',M_DTMOVI,[])) Then
           {If not (dmInfoCartao.qryLocVenda.Locate('MOV_DTMOVI',M_DTMOVI,[])) Then
           begin
                Application.MessageBox('Data não encontada.',
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                Exit;
           End
           Else
           begin}
              With dmInfoCartao.dstMovimento do
              begin
                   DisableControls;
                   Active      := False;
                   CommandText := 'Select * from ACCMOV Where (MOV_DTMOVI=:pDTMOVI) order by MOV_DTMOVI';
                   Params.ParamByName('pDTMOVI').AsDate := StrToDate(M_DTMOVI);
                   Active      := True;
                   EnableControls;
              End;
              //
              With dmInfoCartao.cdsMovimento do
              begin
                   DisableControls;
                   Active      := False;
                   Active      := True;
                   EnableControls;
              End;
              //
             If (dmInfoCartao.cdsMovimento.RecordCount = 0) Then
             begin
                  Application.MessageBox('Data não encontada.',
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                 Exit;
             End;
                 {With dmInfoCartao.qryLocVenda do
                 begin
                      DisableControls;
                      SQL.Clear;
                      Close;
                      SQL.Add('Select * from ACCMOV Where (MOV_DTMOVI = :pDTATUA) order by MOV_DTMOVI');
                      ParamByName('pDTATUA').AsDate := M_DTMOVI;
                      Open;
                      EnableControls;
                 End;}
               {
                With dmInfoCartao.dstMovimento do
                begin
                     DisableControls;
                     Active      := False;
                     CommandText := 'Select * from ACCMOV order by MOV_DTMOVI';
                     Active      := True;
                     EnableControls;
                End;}
           //End;
        End;
    Except
    on EConvertError do
          Application.MessageBox('Data Inválida!.',
                    'ERROR', MB_OK+MB_ICONERROR);
    End;
    //
    GridVendas.SetFocus;
end;

procedure TfrmConsultaVendas.TODOS;
begin
     dmInfoCartao.cdsMovimento.Close;
     With dmInfoCartao.dstMovimento do
     begin
          DisableControls;
          Active      := False;
          CommandText := 'Select * from ACCMOV order by MOV_DTMOVI';
          Active      := True;
          EnableControls;
     End;
     dmInfoCartao.cdsMovimento.Open;
end;

procedure TfrmConsultaVendas.btFecharClick(Sender: TObject);
begin
      dmInfoCartao.cdsMovimento.Close; 
      Close;
end;

end.
