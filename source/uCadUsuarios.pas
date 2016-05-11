unit uCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, Mask, Buttons;

type
  TfrmCadUsuarios = class(TForm)
    Panel2: TPanel;
    DBText1: TDBText;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsUsuario: TDataSource;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtCargo: TDBEdit;
    Label4: TLabel;
    edtSenha: TDBEdit;
    btAdicionar: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btLocalizar: TBitBtn;
    btCancelar: TBitBtn;
    btGravar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dsUsuarioDataChange(Sender: TObject; Field: TField);
    procedure dsUsuarioStateChange(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses udmInfoCartao, uInfoPrincipal, uFuncoes, uLocUsuario;

{$R *.dfm}

procedure TfrmCadUsuarios.FormActivate(Sender: TObject);
begin
     dmInfoCartao.cdsUsuarios.Open;
end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmInfoCartao.cdsUsuarios.Close;
     //
     Action := caFree;
end;

procedure TfrmCadUsuarios.btCancelarClick(Sender: TObject);
begin
     dmInfoCartao.cdsUsuarios.Cancel; 
end;

procedure TfrmCadUsuarios.btGravarClick(Sender: TObject);
Var
   M_CDUSUA : String;
begin
     If uFuncoes.Empty(edtNome.Text) Then
     Begin
          Application.MessageBox('Digite o nome do usuário.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtNome.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtSenha.Text) Then
     Begin
          Application.MessageBox('Digite a senha do usuário.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtSenha.SetFocus;
          Exit;
     End;
     //
     If (dsUsuario.State = dsInsert) Then
     Begin
          //dmInfoCartao.cdsParametros.Close;
          If (dmInfoCartao.cdsParametros.Active = False) Then
               dmInfoCartao.cdsParametros.Open;
          dmInfoCartao.cdsParametros.Edit;
          //
          dmInfoCartao.cdsParametrosPAR_CDUSUA.AsFloat :=
            dmInfoCartao.cdsParametrosPAR_CDUSUA.AsFloat+1;
          M_CDUSUA := uFuncoes.StrZero(dmInfoCartao.cdsParametrosPAR_CDUSUA.AsString,3);
          //
          dmInfoCartao.cdsParametros.Post;
          dmInfoCartao.cdsParametros.ApplyUpdates(0);
          //
          dmInfoCartao.cdsUsuarios.FieldByName('SEN_CDUSUA').AsString := M_CDUSUA;
     End;
     //
     dmInfoCartao.cdsUsuarios.Post;
     dmInfoCartao.cdsUsuarios.ApplyUpdates(0); 
end;

procedure TfrmCadUsuarios.btAdicionarClick(Sender: TObject);
begin
      Try
           dmInfoCartao.cdsUsuarios.Append;
           edtNome.SetFocus;
      Except
           Application.MessageBox('Error ao tentar incluir registro', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
           dmInfoCartao.cdsUsuarios.Cancel;
      End;
end;

procedure TfrmCadUsuarios.btEditarClick(Sender: TObject);
begin
      Try
           dmInfoCartao.cdsUsuarios.Edit;
           //
           edtNome.SetFocus;
      Except
           Application.MessageBox('Error ao tentar editar registro.', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
           dmInfoCartao.cdsUsuarios.Cancel;
      End;
end;

procedure TfrmCadUsuarios.btExcluirClick(Sender: TObject);
begin
    Try
        If Application.MessageBox('Deseja eliminar este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
        Begin
           dmInfoCartao.cdsUsuarios.Delete;             // Apagar o regitro atual.
           dmInfoCartao.cdsUsuarios.ApplyUpdates(0);
        End;
    Except
          Application.MessageBox('Este registro não pode ser excluido agora?', 'Erro',
                    MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadUsuarios.dsUsuarioDataChange(Sender: TObject;
  Field: TField);
begin
     frmPrincipal.StatusBar1.Panels[2].Text := ' Registro: ' + IntToStr(dsUsuario.DataSet.RecNo) +
                          ' de ' + IntToStr(dsUsuario.DataSet.RecordCount);
end;

procedure TfrmCadUsuarios.dsUsuarioStateChange(Sender: TObject);
begin
    btAdicionar.Enabled  := dsUsuario.State in [dsBrowse];
    btEditar   .Enabled  := (dsUsuario.State in [dsBrowse])
                           And (dmInfoCartao.cdsUsuarios.RecordCount>0);
    btExcluir  .Enabled  := (dsUsuario.State in [dsBrowse])
                           And (dmInfoCartao.cdsUsuarios.RecordCount>0);
    btLocalizar.Enabled  := (dsUsuario.State in [dsBrowse])
                           And (dmInfoCartao.cdsUsuarios.RecordCount>0);
    //
    btGravar   .Enabled  := dsUsuario.State in [dsInsert,dsEdit];
    btCancelar .Enabled  := dsUsuario.State in [dsInsert,dsEdit];
end;

procedure TfrmCadUsuarios.btLocalizarClick(Sender: TObject);
begin
     Application.CreateForm(TfrmLocUsuarios, frmLocUsuarios);  //  Carrega form na memória
     Try
        frmLocUsuarios.ShowModal;    // Mostra form em modo exclusivo
     Finally
        frmLocUsuarios.Free;         // Libera Memória
     End;
end;

end.
