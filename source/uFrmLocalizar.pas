unit uFrmLocalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, Buttons, ExtCtrls, DBClient, Provider, DB,
  SqlExpr, Grids, DBGrids;

type
  TfrmLocalizarDados = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    grdConsultar: TDBGrid;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    lblConsultar: TLabel;
    btnAlterar: TBitBtn;
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizarDados: TfrmLocalizarDados;

implementation

{$R *.dfm}

procedure TfrmLocalizarDados.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmLocalizarDados.dsConsultarStateChange(Sender: TObject);
begin
     btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmLocalizarDados.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.First;
end;

procedure TfrmLocalizarDados.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.Prior;
end;

procedure TfrmLocalizarDados.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.Next;
end;

procedure TfrmLocalizarDados.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.Last;
end;

procedure TfrmLocalizarDados.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

end.
