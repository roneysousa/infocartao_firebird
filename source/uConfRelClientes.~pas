unit uConfRelClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RpCon, RpConDS, RpConBDE, RpBase, RpSystem, RpDefine,
  RpRave, Buttons;

type
  TfrmConfRelClientes = class(TForm)
    rvpCadClientes: TRvProject;
    RvSystem1: TRvSystem;
    Panel1: TPanel;
    Panel2: TPanel;
    dscClientes: TRvDataSetConnection;
    sbReceber: TSpeedButton;
    spFechar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spFecharClick(Sender: TObject);
    procedure sbReceberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfRelClientes: TfrmConfRelClientes;

implementation

Uses udmInfoCartao;

{$R *.dfm}

procedure TfrmConfRelClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmConfRelClientes.spFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmConfRelClientes.sbReceberClick(Sender: TObject);
begin
     rvpCadClientes.Execute;
     //dmEmp.rvprjEmp.ExecuteReport('rptEmpGeral');
end;

end.
