object frmConsContasReceber: TfrmConsContasReceber
  Left = 195
  Top = 116
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consultas '
  ClientHeight = 358
  ClientWidth = 637
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 32
    Align = alTop
    Color = clBlue
    TabOrder = 0
    object lbl_Titulo: TLabel
      Left = 2
      Top = 4
      Width = 18
      Height = 24
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 637
    Height = 326
    Align = alClient
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 36
      Width = 635
      Height = 35
      Align = alTop
      TabOrder = 1
      object lbl_e: TLabel
        Left = 457
        Top = 11
        Width = 6
        Height = 13
        Caption = 'e'
        Enabled = False
        Transparent = True
      end
      object ckb_Datas: TCheckBox
        Left = 8
        Top = 8
        Width = 241
        Height = 17
        Caption = 'Mostrar contas com data de vencimento entre:'
        TabOrder = 0
        OnClick = ckb_DatasClick
      end
      object edt_DTINIC: TDateEdit
        Left = 322
        Top = 7
        Width = 121
        Height = 21
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
      end
      object edt_DTFINA: TDateEdit
        Left = 482
        Top = 6
        Width = 121
        Height = 21
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 635
      Height = 35
      Align = alTop
      TabOrder = 0
      object lbl_mens1: TLabel
        Left = 195
        Top = 8
        Width = 121
        Height = 13
        Caption = 'Apenas contas do Cliente'
      end
      object ckb_Todas: TCheckBox
        Left = 8
        Top = 8
        Width = 137
        Height = 17
        Caption = 'Contas de todos clientes'
        TabOrder = 0
        OnClick = ckb_TodasClick
      end
      object cmbCliente: TRxDBLookupCombo
        Left = 322
        Top = 5
        Width = 301
        Height = 21
        DropDownCount = 8
        DataField = 'BOL_CDCLIE'
        DataSource = dsBoletos
        LookupField = 'CLI_CDCLIE'
        LookupDisplay = 'CLI_NMCLIE'
        LookupSource = dsCliente
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 71
      Width = 635
      Height = 213
      Align = alClient
      TabOrder = 2
      object GridContas: TDBGrid
        Left = 1
        Top = 36
        Width = 633
        Height = 176
        Align = alClient
        DataSource = dsBoletos
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridContasCellClick
        OnKeyDown = GridContasKeyDown
        OnKeyPress = GridContasKeyPress
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'BOL_NRDOCU'
            Title.Caption = 'DOCUMENTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOL_NMSACA'
            Title.Caption = 'CLIENTE'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOL_DTDOCU'
            Title.Caption = 'DT.DOCUMENTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOL_DTVENC'
            Title.Caption = 'VENCIMENTO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'BOL_DTPAGA'
            Title.Caption = 'DT.PAGAMEN.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'BOL_DIASAT2'
            Title.Caption = 'ATRASO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOL_VLJURO'
            Title.Caption = 'JUROS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOL_VLDOCU'
            Title.Caption = 'VALOR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 633
        Height = 35
        Align = alTop
        TabOrder = 1
        object rgbOpcao: TRadioGroup
          Left = 1
          Top = 1
          Width = 631
          Height = 33
          Align = alClient
          Caption = '[ Op'#231#245'es ]'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'A vencer'
            'Vencidas'
            'Recebidas')
          TabOrder = 0
          OnClick = rgbOpcaoClick
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 284
      Width = 635
      Height = 41
      Align = alBottom
      TabOrder = 3
      object btFechar: TBitBtn
        Left = 717
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Fechar'
        TabOrder = 1
        Kind = bkClose
      end
      object btExecutar: TBitBtn
        Left = 624
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Executar'
        Default = True
        TabOrder = 0
        OnClick = btExecutarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E000000010000000100004A7BB500296B
          C600527BC600186BD600528CD6003194D600397BE7005284E700107BEF00317B
          EF001084EF0029ADEF0039ADEF0010B5EF0008BDEF000073F7001873F7002973
          F7000884F7000894F70018A5F70000CEF70018DEF70063DEF700FF00FF000073
          FF00007BFF000084FF00008CFF000094FF00009CFF0000A5FF0010A5FF0039A5
          FF0052A5FF005AA5FF0000ADFF0029ADFF0031ADFF0000B5FF006BB5FF0084B5
          FF0000BDFF0008BDFF0010BDFF0000C6FF0008C6FF006BC6FF0000CEFF0018CE
          FF0000D6FF0008D6FF0010D6FF0021D6FF0031D6FF0000DEFF0018DEFF0029DE
          FF0042DEFF0000E7FF0010E7FF0018E7FF0039E7FF0000EFFF0018EFFF0039EF
          FF004AEFFF0000F7FF0008F7FF0029F7FF0031F7FF0042F7FF004AF7FF005AF7
          FF0000FFFF0008FFFF0018FFFF0021FFFF0031FFFF0039FFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
          1818181818181818181818181802181818181818181818181818181818090201
          18181818181818181818181818061A0F02181818181818181818181818181E1C
          1C0218181818181818181818181818271C1D0202181818181818181818181818
          272E1E1E02181818181818181818181818272B241E0218181818181818180202
          022D4B462C240202181818181818252D3F43434A42311F02181818181818212D
          3F433F374A4A412E021818181818182E3E42474C4A4A4B4D0218181818181818
          1836444A43322702181818181818181818181836433F241F0218181818181818
          1818181818363A34230218181818181818181818181818362202}
      end
    end
  end
  object dsCliente: TDataSource
    DataSet = dmInfoCartao.cdsClientes
    Left = 249
    Top = 81
  end
  object dsBoletos: TDataSource
    DataSet = cdsConsulta
    Left = 321
    Top = 68
  end
  object dstConsultaBoletos: TSQLDataSet
    CommandText = 'Select * from ACCBOL Where BOL_FLSITU='#39'A'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 41
    Top = 324
    object dstConsultaBoletosBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstConsultaBoletosBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstConsultaBoletosBOL_NRCART: TStringField
      FieldName = 'BOL_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstConsultaBoletosBOL_DTVENC: TDateField
      FieldName = 'BOL_DTVENC'
      Required = True
    end
    object dstConsultaBoletosBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
    end
    object dstConsultaBoletosBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object dstConsultaBoletosBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstConsultaBoletosBOL_VLJURO: TFloatField
      FieldName = 'BOL_VLJURO'
    end
    object dstConsultaBoletosBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object dstConsultaBoletosBOL_CDCLIE: TStringField
      FieldName = 'BOL_CDCLIE'
      FixedChar = True
      Size = 7
    end
    object dstConsultaBoletosBOL_DIASAT2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'BOL_DIASAT2'
      Calculated = True
    end
    object dstConsultaBoletosBOL_DTDOCU: TDateField
      FieldName = 'BOL_DTDOCU'
      Required = True
    end
  end
  object qryBoletos: TSQLQuery
    OnCalcFields = qryBoletosCalcFields
    DataSource = dsBoletos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pInicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFinal'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDtatual'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'Select BOL_NRDOCU, BOL_NRFATU, BOL_NRCART, BOL_DTVENC,'
      '    BOL_DTDOCU, BOL_VLDOCU, BOL_NMSACA, BOL_FLSITU, BOL_VLJURO,'
      '    BOL_DTPAGA from ACCBOL ')
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 185
    Top = 324
    object qryBoletosBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryBoletosBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryBoletosBOL_NRCART: TStringField
      FieldName = 'BOL_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object qryBoletosBOL_DTVENC: TDateField
      FieldName = 'BOL_DTVENC'
      Required = True
    end
    object qryBoletosBOL_DTDOCU: TDateField
      FieldName = 'BOL_DTDOCU'
      Required = True
    end
    object qryBoletosBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
      currency = True
    end
    object qryBoletosBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object qryBoletosBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object qryBoletosBOL_VLJURO: TFloatField
      FieldName = 'BOL_VLJURO'
    end
    object qryBoletosBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object qryBoletosBOL_DIASAT2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'BOL_DIASAT2'
      Calculated = True
    end
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsultaBoletos
    Left = 81
    Top = 324
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 121
    Top = 324
    object cdsConsultaBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsConsultaBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsConsultaBOL_NRCART: TStringField
      FieldName = 'BOL_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsConsultaBOL_DTVENC: TDateField
      FieldName = 'BOL_DTVENC'
      Required = True
    end
    object cdsConsultaBOL_DTDOCU: TDateField
      FieldName = 'BOL_DTDOCU'
      Required = True
    end
    object cdsConsultaBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
      currency = True
    end
    object cdsConsultaBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object cdsConsultaBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaBOL_VLJURO: TFloatField
      FieldName = 'BOL_VLJURO'
    end
    object cdsConsultaBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object cdsConsultaBOL_CDCLIE: TStringField
      FieldName = 'BOL_CDCLIE'
      FixedChar = True
      Size = 7
    end
    object cdsConsultaBOL_DIASAT2: TIntegerField
      FieldName = 'BOL_DIASAT2'
      ReadOnly = True
    end
  end
  object dsqryBoletos: TDataSource
    DataSet = qryBoletos
    Left = 370
    Top = 104
  end
end
