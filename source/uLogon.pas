unit uLogon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uFuncoes, jpeg;

type
  TfrmLogon = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TEdit;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtUsuarioExit(Sender: TObject);
  private
    function Localizar(W_CDUSUA : String) : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogon: TfrmLogon;

implementation

uses udmConsultas;

{$R *.dfm}

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree; 
end;

procedure TfrmLogon.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and not uFuncoes.Empty(edtUsuario.Text) Then
    Begin
         key:=#0;
         edtSenha.SetFocus;
    End;
end;

procedure TfrmLogon.edtUsuarioExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtUsuario.Text) Then
     Begin
        edtUsuario.Text := uFuncoes.StrZero(edtUsuario.Text,3);
        //
        If Localizar(edtUsuario.Text) = False Then
        Begin
             Application.MessageBox('Usuário não cadastro.',
                   'ATENÇÃO', MB_OK+MB_ICONSTOP);
             edtUsuario.Clear;
             edtUsuario.SetFocus;
             Exit;
        End;
     End;
end;

function TfrmLogon.Localizar(W_CDUSUA: String): boolean;
begin
     //
     With dmConsultas.dstLocUsuario  do
     begin
          DisableControls;
          Active      := False;
          CommandText := 'Select SEN_CDUSUA, SEN_NMUSUA from ACCSEN Where (SEN_CDUSUA=:pCDUSUA) order by SEN_NMUSUA';
          Params.ParamByName('pCDUSUA').AsString := edtUsuario.Text;
          Active      := True;
          EnableControls;
     End;
     //
     dmConsultas.cdsLocUsuario.Open;
     //
     If (dmConsultas.cdsLocUsuario.Locate('SEN_CDUSUA', edtUsuario.Text,[])) Then
         result := True
     Else
         result := False;
end;

end.
