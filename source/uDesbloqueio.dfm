object frmDesbloqueio: TfrmDesbloqueio
  Left = 198
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Desbloqueio de cart'#227'o'
  ClientHeight = 463
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 650
    Top = 0
    Width = 29
    Height = 463
    Align = alRight
    ButtonHeight = 25
    Caption = 'ToolBar1'
    Flat = True
    Images = frmPrincipal.ImageList1
    TabOrder = 0
    Visible = False
    object btPrimeiro: TToolButton
      Left = 0
      Top = 0
      Hint = 'Primeiro registro'
      Caption = 'btPrimeiro'
      ImageIndex = 4
      Wrap = True
      OnClick = btPrimeiroClick
    end
    object btAnterior: TToolButton
      Left = 0
      Top = 25
      Hint = 'Registro anterior'
      Caption = 'btAnterior'
      ImageIndex = 5
      Wrap = True
      OnClick = btAnteriorClick
    end
    object btProximo: TToolButton
      Left = 0
      Top = 50
      Hint = 'Pr'#243'ximo registro'
      Caption = 'btProximo'
      ImageIndex = 6
      Wrap = True
      OnClick = btProximoClick
    end
    object btUltimo: TToolButton
      Left = 0
      Top = 75
      Hint = #218'ltimo registro'
      Caption = 'btUltimo'
      ImageIndex = 7
      Wrap = True
      OnClick = btUltimoClick
    end
    object btGrid: TToolButton
      Left = 0
      Top = 100
      Hint = 'Visualizar'
      Caption = 'btGrid'
      ImageIndex = 12
      Wrap = True
    end
    object btFechar: TToolButton
      Left = 0
      Top = 125
      Hint = 'Fechar janela atual'
      Caption = 'btFechar'
      ImageIndex = 0
      OnClick = btFecharClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 463
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 648
      Height = 32
      Align = alTop
      Color = clBlue
      TabOrder = 1
      object Label13: TLabel
        Left = -3
        Top = 4
        Width = 229
        Height = 24
        Caption = 'Desbloqueio de cart'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
      end
      object dbtNMCLIE: TDBText
        Left = 234
        Top = 4
        Width = 279
        Height = 24
        AutoSize = True
        DataField = 'CLI_NMCART'
        DataSource = dsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 421
      Width = 648
      Height = 41
      Align = alBottom
      TabOrder = 2
      object btConfirmar: TBitBtn
        Left = 605
        Top = 10
        Width = 75
        Height = 25
        Caption = 'OK'
        Enabled = False
        ModalResult = 1
        TabOrder = 0
        OnClick = btConfirmarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object btCancelar: TBitBtn
        Left = 690
        Top = 9
        Width = 75
        Height = 25
        TabOrder = 1
        OnClick = btCancelarClick
        Kind = bkCancel
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 33
      Width = 648
      Height = 44
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 1
        Width = 34
        Height = 13
        Caption = 'Cart'#227'o:'
      end
      object lbl_Vali: TLabel
        Left = 460
        Top = 2
        Width = 44
        Height = 13
        Caption = 'Validade:'
        FocusControl = dbeVALI
      end
      object btLocalizar: TBitBtn
        Left = 150
        Top = 13
        Width = 75
        Height = 25
        Caption = 'Localizar'
        Default = True
        TabOrder = 1
        OnClick = btLocalizarClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
          0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000084000000840000008400000084000000FF00FF008400000000FF
          FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
          FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000000FFFF00840000008400000084000000FF00FF00840000008400
          00008400000084000000840000008400000084000000FF00FF00840000008400
          00008400000084000000840000008400000084000000FF00FF00840000008400
          000000FFFF0084000000840000008400000084000000840000008400000000FF
          FF008400000084000000840000008400000084000000FF00FF00840000008400
          000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
          FF008400000084000000840000008400000084000000FF00FF00840000008400
          000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
          FF008400000084000000840000008400000084000000FF00FF00FF00FF008400
          0000840000008400000084000000840000008400000084000000840000008400
          000084000000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
          FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
          FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000084000000840000008400000084000000FF00FF00840000008400
          0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
          00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008400000000FFFF0084000000FF00FF00FF00FF00FF00FF008400
          000000FFFF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
          00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object edtNRCART: TMaskEdit
        Left = 20
        Top = 16
        Width = 115
        Height = 21
        EditMask = '9999 9999 99 999;0;_'
        MaxLength = 16
        TabOrder = 0
        OnKeyPress = edtNRCARTKeyPress
      end
      object dbeVALI: TDBEdit
        Left = 460
        Top = 16
        Width = 93
        Height = 21
        DataField = 'CAR_DTVALI'
        DataSource = dsCartao
        MaxLength = 7
        TabOrder = 2
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 77
      Width = 648
      Height = 344
      Align = alClient
      TabOrder = 3
      object Label2: TLabel
        Left = 16
        Top = 10
        Width = 80
        Height = 13
        Caption = 'Nome do Cart'#227'o:'
        FocusControl = DBEdit1
      end
      object Label4: TLabel
        Left = 16
        Top = 51
        Width = 53
        Height = 13
        Caption = 'Identidade:'
        FocusControl = DBEdit3
      end
      object Label8: TLabel
        Left = 16
        Top = 91
        Width = 64
        Height = 13
        Caption = 'Nome do Pai:'
        FocusControl = DBEdit7
      end
      object Label9: TLabel
        Left = 16
        Top = 131
        Width = 70
        Height = 13
        Caption = 'Nome do M'#227'e:'
        FocusControl = DBEdit8
      end
      object Label10: TLabel
        Left = 16
        Top = 179
        Width = 30
        Height = 13
        Caption = 'Limite:'
        FocusControl = DBEdit9
      end
      object Label11: TLabel
        Left = 16
        Top = 219
        Width = 43
        Height = 13
        Caption = 'Utilizado:'
        FocusControl = DBEdit10
      end
      object Label12: TLabel
        Left = 16
        Top = 259
        Width = 30
        Height = 13
        Caption = 'Saldo:'
        FocusControl = DBEdit11
      end
      object Label14: TLabel
        Left = 16
        Top = 299
        Width = 45
        Height = 13
        Caption = 'Situa'#231#227'o:'
      end
      object Label7: TLabel
        Left = 406
        Top = 50
        Width = 23
        Height = 13
        Caption = 'CPF:'
        FocusControl = DBEdit6
      end
      object Label3: TLabel
        Left = 416
        Top = 10
        Width = 59
        Height = 13
        Caption = 'Nascimento:'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 26
        Width = 394
        Height = 21
        DataField = 'CLI_NMCART'
        DataSource = dsCliente
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 67
        Width = 186
        Height = 21
        DataField = 'CLI_NRIDEN'
        DataSource = dsCliente
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 16
        Top = 107
        Width = 537
        Height = 21
        DataField = 'CLI_NOMPAI'
        DataSource = dsCliente
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 16
        Top = 147
        Width = 537
        Height = 21
        DataField = 'CLI_NOMMAE'
        DataSource = dsCliente
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 16
        Top = 195
        Width = 134
        Height = 21
        DataField = 'CAR_VLLIMI'
        DataSource = dsCartao
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 16
        Top = 235
        Width = 134
        Height = 21
        DataField = 'CAR_VLUTIL'
        DataSource = dsCartao
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 16
        Top = 275
        Width = 134
        Height = 21
        DataField = 'CAR_VLANTE'
        DataSource = dsCartao
        TabOrder = 10
      end
      object DBEdit4: TDBEdit
        Left = 208
        Top = 67
        Width = 69
        Height = 21
        DataField = 'CLI_ORGEMI'
        DataSource = dsCliente
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 282
        Top = 67
        Width = 37
        Height = 21
        DataField = 'CLI_UFEMIS'
        DataSource = dsCliente
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 406
        Top = 66
        Width = 148
        Height = 21
        DataField = 'CLI_CPFCGC'
        DataSource = dsCliente
        MaxLength = 15
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 416
        Top = 26
        Width = 137
        Height = 21
        DataField = 'CLI_DTNASC'
        DataSource = dsCliente
        MaxLength = 10
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 208
        Top = 200
        Width = 320
        Height = 120
        DataSource = dsCliente
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 312
        Width = 134
        Height = 21
        DataField = 'CAR_NMSITU'
        DataSource = dsCartao
        TabOrder = 11
      end
    end
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = dmInfoCartao.cdsClientes
    Left = 432
    Top = 264
  end
  object dsCartao: TDataSource
    AutoEdit = False
    DataSet = dmInfoCartao.cdsCartoes
    Left = 496
    Top = 264
  end
end
