object dmConsultas: TdmConsultas
  OldCreateOrder = False
  Left = 215
  Top = 195
  Height = 249
  Width = 337
  object dstLocUsuario: TSQLDataSet
    CommandText = 'select SEN_CDUSUA, SEN_NMUSUA from ACCSEN'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 24
    Top = 16
    object dstLocUsuarioSEN_CDUSUA: TStringField
      FieldName = 'SEN_CDUSUA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstLocUsuarioSEN_NMUSUA: TStringField
      FieldName = 'SEN_NMUSUA'
      Required = True
      Size = 40
    end
  end
  object dspLocUsuario: TDataSetProvider
    DataSet = dstLocUsuario
    Left = 104
    Top = 16
  end
  object cdsLocUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocUsuario'
    Left = 184
    Top = 16
    object cdsLocUsuarioSEN_CDUSUA: TStringField
      FieldName = 'SEN_CDUSUA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsLocUsuarioSEN_NMUSUA: TStringField
      FieldName = 'SEN_NMUSUA'
      Required = True
      Size = 40
    end
  end
  object dstLocCliente: TSQLDataSet
    CommandText = 'select CLI_CDCLIE, CLI_NMCLIE from ACCCLI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 24
    Top = 64
    object dstLocClienteCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object dstLocClienteCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
  end
  object dspLocCliente: TDataSetProvider
    DataSet = dstLocCliente
    Left = 104
    Top = 64
  end
  object cdsLocCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocCliente'
    Left = 176
    Top = 64
    object cdsLocClienteCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object cdsLocClienteCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
  end
  object dstLocCred: TSQLDataSet
    CommandText = 'select CRE_CDCRED, CRE_NMCRED from ACCCRE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 24
    Top = 112
    object dstLocCredCRE_CDCRED: TStringField
      FieldName = 'CRE_CDCRED'
      Required = True
      Size = 6
    end
    object dstLocCredCRE_NMCRED: TStringField
      FieldName = 'CRE_NMCRED'
      Required = True
      Size = 40
    end
  end
  object dspLocCred: TDataSetProvider
    DataSet = dstLocCred
    Left = 104
    Top = 112
  end
  object cdsLocCred: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocCred'
    Left = 176
    Top = 112
    object cdsLocCredCRE_CDCRED: TStringField
      FieldName = 'CRE_CDCRED'
      Required = True
      Size = 6
    end
    object cdsLocCredCRE_NMCRED: TStringField
      FieldName = 'CRE_NMCRED'
      Required = True
      Size = 40
    end
  end
  object dstLocCartao: TSQLDataSet
    CommandText = 'select  CAR_NRCART, CAR_NMCLIE from ACCCAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 24
    Top = 160
  end
  object dspLocCartao: TDataSetProvider
    DataSet = dstLocCartao
    Options = [poAllowCommandText]
    Left = 104
    Top = 160
  end
  object cdsLocCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocCartao'
    Left = 176
    Top = 160
    object cdsLocCartaoCAR_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_NRCART'
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      Size = 13
    end
    object cdsLocCartaoCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      Required = True
      Size = 45
    end
  end
end
