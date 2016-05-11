object frmSeleCliente: TfrmSeleCliente
  Left = 212
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione o Cliente'
  ClientHeight = 325
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 284
    Align = alClient
    TabOrder = 0
    object GridCliente: TDBGrid
      Left = 1
      Top = 42
      Width = 581
      Height = 241
      Align = alClient
      DataSource = dsClientes
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GridClienteCellClick
      OnKeyDown = GridClienteKeyDown
      OnKeyPress = GridClienteKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'CLI_CDCLIE'
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NMCLIE'
          Title.Caption = 'NOME'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 341
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_ENCLIE'
          Title.Caption = 'ENDERE'#199'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_BAICLI'
          Title.Caption = 'BAIRRO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 581
      Height = 41
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 15
        Width = 57
        Height = 13
        Caption = 'CLIENTE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNMCLIE: TEdit
        Left = 75
        Top = 11
        Width = 462
        Height = 21
        Hint = 'Digite o c'#243'digo ou nome do cliente.'
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtNMCLIEChange
        OnEnter = edtNMCLIEEnter
        OnKeyDown = edtNMCLIEKeyDown
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 284
    Width = 583
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btFechar: TBitBtn
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = 'Fechar'
      TabOrder = 2
      Kind = bkClose
    end
    object btConfirma: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Visualizar'
      Caption = 'Visualizar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btConfirmaClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
        7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
        E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
        EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
        8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
        926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
    end
    object btImprimir: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Imprimir'
      Caption = 'Imprimir'
      ModalResult = 1
      TabOrder = 1
      OnClick = btImprimirClick
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
  end
  object dsClientes: TDataSource
    DataSet = dmInfoCartao.cdsBuscaCliente
    Left = 416
    Top = 32
  end
  object dsClientes2: TDataSource
    Left = 448
    Top = 48
  end
  object qryClientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select CLI_CDCLIE,CLI_NMCLIE,CLI_NMCART,CLI_NRIDEN,CLI_CPFCGC'
      'from ACCCLI')
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 296
    Top = 292
  end
  object dscBoletos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmInfoCartao.cdsBoletos
    Left = 120
    Top = 192
  end
  object qryCartoes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select CAR_NRCART, CAR_CDCLIE, CAR_NMCLIE, CAR_DTEMIS,'
      'CAR_VLLIMI, CAR_DIAFAT, CAR_FLSITU from ACCCAR')
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 184
    Top = 128
    object qryCartoesCAR_NRCART: TStringField
      FieldName = 'CAR_NRCART'
      Required = True
      Size = 13
    end
    object qryCartoesCAR_CDCLIE: TStringField
      FieldName = 'CAR_CDCLIE'
      Required = True
      Size = 7
    end
    object qryCartoesCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      Required = True
      Size = 45
    end
    object qryCartoesCAR_DTEMIS: TDateField
      FieldName = 'CAR_DTEMIS'
    end
    object qryCartoesCAR_VLLIMI: TFMTBCDField
      FieldName = 'CAR_VLLIMI'
      Precision = 15
      Size = 2
    end
    object qryCartoesCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
    object qryCartoesCAR_FLSITU: TStringField
      FieldName = 'CAR_FLSITU'
      FixedChar = True
      Size = 1
    end
  end
end
