object frmLocalizarDados: TfrmLocalizarDados
  Left = 189
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 261
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 65
    Align = alTop
    TabOrder = 0
    object lblConsultar: TLabel
      Left = 139
      Top = 5
      Width = 84
      Height = 13
      Caption = 'Nome/Descri'#231#227'o:'
    end
    object rgConsultar: TRadioGroup
      Left = 4
      Top = 2
      Width = 127
      Height = 55
      Caption = 'Consultar por:'
      ItemIndex = 1
      Items.Strings = (
        '&C'#243'digo'
        '&Nome/Descri'#231#227'o')
      TabOrder = 0
      OnClick = rgConsultarClick
    end
    object edtConsultar: TEdit
      Left = 138
      Top = 21
      Width = 346
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object btnAlterar: TBitBtn
      Left = 489
      Top = 17
      Width = 75
      Height = 25
      Hint = 'Ir para registro'
      Caption = '&Ir'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF005441B100614EBE00C0C0C000FCD7DA00ECC8CA00F0CCCE00EFCBCD00EECA
        CC00FDD9DB00FBD7D900EAC5C700EEC9CB00F9D4D600FAD5D700E1BABB00ECC4
        C500EDC6C700E6C0C100E4BEBF00E3BDBE00E9C3C400E7C2C300F4CECF00F8D3
        D400F6D1D200FFCFCF00D6AEAE00D9B2B200D8B1B100E7BFBF00E8C1C100EAC3
        C300F6D0D000CAA09F00CCA2A100D4AAA900E0B6B500DEB5B400DCB3B200D7B0
        AF00E1B9B800C3999700CDA4A200D3AAA80046C6C50053D3D2004D8DB900ADAF
        D900BABCE600F2F2F200C3C3C300B6B6B6008F8F8F008B8B8B00282828001B1B
        1B000D0D0D000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        0404040404040404040404040404040439010404040404040404040401330133
        38390133013304040404043A003A003A392F3936330104040404040001070B16
        382E0339013304040404043A330F07050C382E03390104040404040001170E08
        0A392F02383304040404043A33121319090A392F0238330404040400011D1114
        1A0D382E033901040404043A332A1E21152206382E03390104040400012C2629
        201018392F3938330404043A332524271C1F003A3930023833040400012B2D23
        28001B00383132390104043A330133013301000135383138330404003A003A00
        3A003A3534393837010404040404040404040404040404040404}
    end
  end
  object Panel3: TPanel
    Left = 538
    Top = 65
    Width = 34
    Height = 196
    Align = alRight
    TabOrder = 1
    object sbProximo: TSpeedButton
      Left = 5
      Top = 83
      Width = 25
      Height = 35
      Hint = 'Pr'#243'ximo registro'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FFFFFF00FFE6
        E600FEE5E500FCE3E300FBE1E100F9DFE000F7DDDE00F7DDDD00F5DBDB00F4DB
        DB00F2D9D900E6D9D900F0D6D700EED4D400EBD2D200E9D0D000E9CFD000E7CD
        CD00E5CBCB00E3C9C900E0C7C700DEC4C400DCC2C200CCC0C000D9C0BF00D7BE
        BD00D4BBBB00D3B9B900D0B7B700CFB5B500CEB4B400CCB3B300C9B0B000C7AE
        AE00C5ACAC00C3AAAA00C1A8A800C1A7A700BFA5A500BDA3A300BCA3A300BAA0
        A100BAA1A000B89E9E00B59C9C00B39A9A00AF969600AD949400A88F8F00A68D
        8D00A18888009F8686009B8382009A818100998080006633330000000000C0C0
        C000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000393939393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939393939003939
        3939393939393939393939393939393939393939000037393939393939393939
        39393939393939393939390000370D3839393939393939393939393939393939
        39390000370D260D383939393939393939393939393939393900003706260D2E
        1138393939393939393939393939393900003706260D2C112E15383939393939
        3939393939393900003705210D2B112E15311938393939393939393939390000
        3706210D261038143019331D383939393939393939000037012106260D383938
        18331D331D38393939393939000037012106260D3839393938193321331D3839
        393939393937011D05250C3839393939393821331D170B383939393939393801
        25063839393939393939381D170B383939393939393939380638393939393939
        393939380B383939393939393939393938393939393939393939393938393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbProximoClick
    end
    object sbUltimo: TSpeedButton
      Left = 5
      Top = 122
      Width = 25
      Height = 35
      Hint = #218'ltimo registro'
      Enabled = False
      Flat = True
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000FFFFFF006130
        30006E3D3D00916161009E6E6E00C2919100CF9E9E00C0C0C000000000000000
        0000000000000000000000000000000000000000000000000000777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777077777777777777777777770027777777
        7777777777777002327777777777777777770023432777777777777777700234
        3432777777777777770023434343277777777777700234343434327777777777
        0025656565656547777777700256565656565654777777772121212121212121
        2777777777777777777777777777777000000000000000007777777034343434
        3434343617777770456565656565656527777770365656565656565617777770
        4565656565656565277777771212121212121212177777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbUltimoClick
    end
    object sbAnterior: TSpeedButton
      Left = 5
      Top = 44
      Width = 25
      Height = 35
      Hint = 'Registro anterior'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FFFFFF00FEE5
        E400FDE3E300FBE1E100F9DFE000F7DEDD00F4DBDB00F2D9D900E6D9D900F0D7
        D700EED4D400EBD2D200E9CFCF00E7CECD00E5CBCB00E3C9C900E0C6C700DEC4
        C500DBC2C200D9C0C000CDC0C000CCC0C000D7BDBD00D5BBBB00D3B9B900D1B7
        B700CFB6B500CFB5B500CDB4B400CCB3B300C7AEAE00C6ACAC00C1A8A800BFA6
        A600BAA0A100B89E9E00B39A9A00B1989800AD949400AA919100A68D8D00A38A
        8A009F8686009D8484009C8283009A818100998080006633330000000000C0C0
        C000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000313131313131
        3131313131313131313131313131313131313131313131313131313131313131
        3131313131313131313131313131313131313131313131313131313131313131
        3131313131313131313131313131313131313131313131313131313131313131
        3131313131313131313131313131313131313131313131003131313131313131
        313131003131313131313131313100002F31313131313131313100002F313131
        313131313100002F01303131313131313100002F1A3031313131313100002F01
        1E0530313131313100002F1A2A1A303131313131312F011E05210A3031313100
        002F1E2A1A1408303131313131313004210A230D303100002F1E2A1A14083031
        313131313131313005210D241130002F1A2A1A16083031313131313131313131
        300A240D26162F1A2A1A140830313131313131313131313131300D2611281A2A
        1A1408303131313131313131313131313131301128162A1A1408303131313131
        313131313131313131313130162A1A1408303131313131313131313131313131
        3131313130191408303131313131313131313131313131313131313131300830
        3131313131313131313131313131313131313131313130313131313131313131
        3131313131313131313131313131313131313131313131313131313131313131
        3131313131313131313131313131313131313131313131313131313131313131
        3131313131313131313131313131313131313131313131313131313131313131
        3131313131313131313131313131313131313131313131313131}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAnteriorClick
    end
    object sbPrimeiro: TSpeedButton
      Left = 5
      Top = 6
      Width = 25
      Height = 35
      Hint = 'Primeiro registro'
      Enabled = False
      Flat = True
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000FFFFFF006130
        30006E3D3D00916161009E6E6E00C2919100CF9E9E00C0C0C000000000000000
        0000000000000000000000000000000000000000000000000000777777777777
        7777777777777777777777777777777777777777777777777777777777777770
        0000000000000000777777703434343434343436177777704565656565656565
        2777777036565656565656561777777045656565656565652777777712121212
        1212121217777777777777777777777777777777777777777777777777777770
        0000000000000000777777771212121212121212177777777143434343434341
        7777777777143434343656177777777777714343436561777777777777771434
        3656177777777777777771436561777777777777777777165617777777777777
        7777777161777777777777777777777717777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbPrimeiroClick
    end
  end
  object grdConsultar: TDBGrid
    Left = 0
    Top = 65
    Width = 538
    Height = 196
    Align = alClient
    Ctl3D = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    OnStateChange = dsConsultarStateChange
    OnDataChange = dsConsultarDataChange
    Left = 164
    Top = 178
  end
  object datasetConsultar: TSQLDataSet
    Params = <>
    Left = 244
    Top = 178
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 324
    Top = 178
  end
  object cdsConsultar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultar'
    Left = 396
    Top = 178
  end
end
