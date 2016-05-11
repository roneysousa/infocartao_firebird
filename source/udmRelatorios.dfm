object dmRelatorios: TdmRelatorios
  OldCreateOrder = False
  Left = 181
  Top = 158
  Height = 407
  Width = 582
  object dstCartaoRel: TSQLDataSet
    CommandText = 
      'Select C.CAR_NRCART, C.CAR_CDCLIE, CL.CLI_NMCLIE, C.CAR_NMCLIE, ' +
      'C.CAR_DTEMIS, C.CAR_VLLIMI, C.CAR_DIAFAT, C.CAR_FLSITU, S.SIT_NM' +
      'SITU from ACCCAR C, ACCCLI CL, ACCSIT S'#13#10'Where (C.CAR_CDCLIE= CL' +
      '.CLI_CDCLIE)  and (C.CAR_FLSITU=S.SIT_SIGSIT) and (C.CAR_CDCLIE=' +
      ':pCDCLIE)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDCLIE'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 8
    Top = 16
    object dstCartaoRelCAR_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_NRCART'
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      Size = 13
    end
    object dstCartaoRelCAR_CDCLIE: TStringField
      FieldName = 'CAR_CDCLIE'
      Required = True
      Size = 7
    end
    object dstCartaoRelCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object dstCartaoRelCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      Required = True
      Size = 45
    end
    object dstCartaoRelCAR_DTEMIS: TDateField
      FieldName = 'CAR_DTEMIS'
    end
    object dstCartaoRelCAR_VLLIMI: TFMTBCDField
      FieldName = 'CAR_VLLIMI'
      Precision = 15
      Size = 2
    end
    object dstCartaoRelCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
    object dstCartaoRelCAR_FLSITU: TStringField
      FieldName = 'CAR_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstCartaoRelSIT_NMSITU: TStringField
      FieldName = 'SIT_NMSITU'
      Required = True
      Size = 11
    end
  end
  object dstClientesRel: TSQLDataSet
    Active = True
    CommandText = 
      'select CLI_CDCLIE, CLI_NMCLIE, CLI_NMCART, CLI_TPPESS, CLI_NRIDE' +
      'N, CLI_CPFCGC, CLI_ENCLIE, CLI_CEPCLI, CLI_COMCLI, CLI_BAICLI, C' +
      'LI_CIDCLI, CLI_UFCLIE, CLI_FONCLI, CLI_NMEMPR, CLI_ENEMPR, CLI_C' +
      'EPEMP, CLI_BAEMPR, CLI_CIEMPR, CLI_VLSALA, CLI_FONEMP, CLI_RAMEM' +
      'P, CLI_NMCARG, CLI_NOMCJG, CLI_EMPCJG, CLI_FONCJG, CLI_CELCJG, C' +
      'LI_CPFCJG, CLI_FLSITU, CLI_LIMANA, CLI_FLCONV, CLI_NRCART,  C.CA' +
      'R_DIAFAT from ACCCLI,  ACCCAR C Where (CLI_CDCLIE=C.CAR_CDCLIE) ' +
      'And (CLI_CDCLIE=:pCDCLIE) and (CLI_CDCLIE=:pCDFINA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDCLIE'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDFINA'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 16
    Top = 64
    object dstClientesRelCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object dstClientesRelCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object dstClientesRelCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object dstClientesRelCLI_TPPESS: TStringField
      FieldName = 'CLI_TPPESS'
      FixedChar = True
      Size = 1
    end
    object dstClientesRelCLI_NRIDEN: TStringField
      FieldName = 'CLI_NRIDEN'
      Size = 14
    end
    object dstClientesRelCLI_CPFCGC: TStringField
      FieldName = 'CLI_CPFCGC'
      Size = 11
    end
    object dstClientesRelCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object dstClientesRelCLI_CEPCLI: TStringField
      FieldName = 'CLI_CEPCLI'
      Size = 8
    end
    object dstClientesRelCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      Size = 30
    end
    object dstClientesRelCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
    object dstClientesRelCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      Size = 25
    end
    object dstClientesRelCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      FixedChar = True
      Size = 2
    end
    object dstClientesRelCLI_FONCLI: TStringField
      FieldName = 'CLI_FONCLI'
      Size = 10
    end
    object dstClientesRelCLI_NMEMPR: TStringField
      FieldName = 'CLI_NMEMPR'
      Size = 45
    end
    object dstClientesRelCLI_ENEMPR: TStringField
      FieldName = 'CLI_ENEMPR'
      Size = 45
    end
    object dstClientesRelCLI_CEPEMP: TStringField
      FieldName = 'CLI_CEPEMP'
      Size = 8
    end
    object dstClientesRelCLI_BAEMPR: TStringField
      FieldName = 'CLI_BAEMPR'
      Size = 25
    end
    object dstClientesRelCLI_CIEMPR: TStringField
      FieldName = 'CLI_CIEMPR'
      Size = 23
    end
    object dstClientesRelCLI_VLSALA: TFloatField
      FieldName = 'CLI_VLSALA'
      currency = True
    end
    object dstClientesRelCLI_FONEMP: TStringField
      FieldName = 'CLI_FONEMP'
      Size = 10
    end
    object dstClientesRelCLI_RAMEMP: TStringField
      FieldName = 'CLI_RAMEMP'
      Size = 4
    end
    object dstClientesRelCLI_NMCARG: TStringField
      FieldName = 'CLI_NMCARG'
      Size = 23
    end
    object dstClientesRelCLI_NOMCJG: TStringField
      FieldName = 'CLI_NOMCJG'
      Size = 45
    end
    object dstClientesRelCLI_EMPCJG: TStringField
      FieldName = 'CLI_EMPCJG'
      Size = 25
    end
    object dstClientesRelCLI_FONCJG: TStringField
      FieldName = 'CLI_FONCJG'
      Size = 10
    end
    object dstClientesRelCLI_CELCJG: TStringField
      FieldName = 'CLI_CELCJG'
      Size = 10
    end
    object dstClientesRelCLI_CPFCJG: TStringField
      FieldName = 'CLI_CPFCJG'
      Size = 11
    end
    object dstClientesRelCLI_FLSITU: TStringField
      FieldName = 'CLI_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstClientesRelCLI_LIMANA: TFloatField
      FieldName = 'CLI_LIMANA'
      currency = True
    end
    object dstClientesRelCLI_FLCONV: TStringField
      FieldName = 'CLI_FLCONV'
      FixedChar = True
      Size = 1
    end
    object dstClientesRelCLI_NRCART: TStringField
      FieldName = 'CLI_NRCART'
      Size = 13
    end
    object dstClientesRelCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
  end
  object dstBoletosRel: TSQLDataSet
    CommandText = 
      'Select BOL_NRDOCU, BOL_NRFATU, BOL_NRCART, BOL_LOCPAG, BOL_DTVEN' +
      'C, BOL_NMCEDE, BOL_DTDOCU, BOL_VLDOCU, BOL_NMSACA, BOL_ENDERE, B' +
      'OL_COMPLE, BOL_CEPSAC, BOL_BAIRRO, BOL_CIDADE, BOL_UFSACA, BOL_C' +
      'PFCGC, BOL_TPPESS, BOL_FLSITU, BOL_DTPAGA, BOL_CDCLIE from ACCBO' +
      'L'#13#10'Where BOL_CDCLIE>:pCDCLIE and BOL_FLSITU=:pFLSITU'#13#10'order by B' +
      'OL_NMSACA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDCLIE'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 8
    Top = 120
    object dstBoletosRelBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstBoletosRelBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstBoletosRelBOL_NRCART: TStringField
      FieldName = 'BOL_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstBoletosRelBOL_LOCPAG: TStringField
      FieldName = 'BOL_LOCPAG'
      Required = True
      Size = 50
    end
    object dstBoletosRelBOL_DTVENC: TDateField
      FieldName = 'BOL_DTVENC'
      Required = True
    end
    object dstBoletosRelBOL_NMCEDE: TStringField
      FieldName = 'BOL_NMCEDE'
      Required = True
      Size = 50
    end
    object dstBoletosRelBOL_DTDOCU: TDateField
      FieldName = 'BOL_DTDOCU'
      Required = True
    end
    object dstBoletosRelBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
    end
    object dstBoletosRelBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object dstBoletosRelBOL_ENDERE: TStringField
      FieldName = 'BOL_ENDERE'
      Size = 50
    end
    object dstBoletosRelBOL_COMPLE: TStringField
      FieldName = 'BOL_COMPLE'
      Size = 45
    end
    object dstBoletosRelBOL_CEPSAC: TStringField
      FieldName = 'BOL_CEPSAC'
      FixedChar = True
      Size = 8
    end
    object dstBoletosRelBOL_BAIRRO: TStringField
      FieldName = 'BOL_BAIRRO'
    end
    object dstBoletosRelBOL_CIDADE: TStringField
      FieldName = 'BOL_CIDADE'
    end
    object dstBoletosRelBOL_UFSACA: TStringField
      FieldName = 'BOL_UFSACA'
      FixedChar = True
      Size = 2
    end
    object dstBoletosRelBOL_CPFCGC: TStringField
      FieldName = 'BOL_CPFCGC'
      FixedChar = True
      Size = 18
    end
    object dstBoletosRelBOL_TPPESS: TStringField
      FieldName = 'BOL_TPPESS'
      FixedChar = True
      Size = 1
    end
    object dstBoletosRelBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstBoletosRelBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object dstBoletosRelBOL_CDCLIE: TStringField
      FieldName = 'BOL_CDCLIE'
      FixedChar = True
      Size = 7
    end
  end
  object dspCartaoRel: TDataSetProvider
    DataSet = dstCartaoRel
    Left = 88
    Top = 16
  end
  object cdsCartaoRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCartaoRel'
    Left = 168
    Top = 16
    object cdsCartaoRelCAR_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_NRCART'
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      Size = 13
    end
    object cdsCartaoRelCAR_CDCLIE: TStringField
      FieldName = 'CAR_CDCLIE'
      Required = True
      Size = 7
    end
    object cdsCartaoRelCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsCartaoRelCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsCartaoRelCAR_DTEMIS: TDateField
      FieldName = 'CAR_DTEMIS'
    end
    object cdsCartaoRelCAR_VLLIMI: TFMTBCDField
      FieldName = 'CAR_VLLIMI'
      Precision = 15
      Size = 2
    end
    object cdsCartaoRelCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
    object cdsCartaoRelCAR_FLSITU: TStringField
      FieldName = 'CAR_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsCartaoRelSIT_NMSITU: TStringField
      FieldName = 'SIT_NMSITU'
      Required = True
      Size = 11
    end
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Visualizar Impress'#227'o'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 232
    Top = 16
  end
  object rvpClientesporCartao: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\INFOG2\Cartao\Rave\prvClientesCartao.rav'
    Left = 304
    Top = 8
  end
  object dscCartoes: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsCartaoRel
    Left = 400
    Top = 8
  end
  object dspClientesRel: TDataSetProvider
    DataSet = dstClientesRel
    Left = 88
    Top = 64
  end
  object cdsClientesRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientesRel'
    Left = 168
    Top = 64
    object cdsClientesRelCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object cdsClientesRelCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsClientesRelCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object cdsClientesRelCLI_TPPESS: TStringField
      FieldName = 'CLI_TPPESS'
      FixedChar = True
      Size = 1
    end
    object cdsClientesRelCLI_NRIDEN: TStringField
      FieldName = 'CLI_NRIDEN'
      Size = 14
    end
    object cdsClientesRelCLI_CPFCGC: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CPFCGC'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsClientesRelCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object cdsClientesRelCLI_CEPCLI: TStringField
      FieldName = 'CLI_CEPCLI'
      Size = 8
    end
    object cdsClientesRelCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      Size = 30
    end
    object cdsClientesRelCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
    object cdsClientesRelCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      Size = 25
    end
    object cdsClientesRelCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      FixedChar = True
      Size = 2
    end
    object cdsClientesRelCLI_FONCLI: TStringField
      FieldName = 'CLI_FONCLI'
      Size = 10
    end
    object cdsClientesRelCLI_NMEMPR: TStringField
      FieldName = 'CLI_NMEMPR'
      Size = 45
    end
    object cdsClientesRelCLI_ENEMPR: TStringField
      FieldName = 'CLI_ENEMPR'
      Size = 45
    end
    object cdsClientesRelCLI_CEPEMP: TStringField
      FieldName = 'CLI_CEPEMP'
      Size = 8
    end
    object cdsClientesRelCLI_BAEMPR: TStringField
      FieldName = 'CLI_BAEMPR'
      Size = 25
    end
    object cdsClientesRelCLI_CIEMPR: TStringField
      FieldName = 'CLI_CIEMPR'
      Size = 23
    end
    object cdsClientesRelCLI_VLSALA: TFloatField
      FieldName = 'CLI_VLSALA'
      currency = True
    end
    object cdsClientesRelCLI_FONEMP: TStringField
      FieldName = 'CLI_FONEMP'
      Size = 10
    end
    object cdsClientesRelCLI_RAMEMP: TStringField
      FieldName = 'CLI_RAMEMP'
      Size = 4
    end
    object cdsClientesRelCLI_NMCARG: TStringField
      FieldName = 'CLI_NMCARG'
      Size = 23
    end
    object cdsClientesRelCLI_NOMCJG: TStringField
      FieldName = 'CLI_NOMCJG'
      Size = 45
    end
    object cdsClientesRelCLI_EMPCJG: TStringField
      FieldName = 'CLI_EMPCJG'
      Size = 25
    end
    object cdsClientesRelCLI_FONCJG: TStringField
      FieldName = 'CLI_FONCJG'
      Size = 10
    end
    object cdsClientesRelCLI_CELCJG: TStringField
      FieldName = 'CLI_CELCJG'
      Size = 10
    end
    object cdsClientesRelCLI_CPFCJG: TStringField
      FieldName = 'CLI_CPFCJG'
      Size = 11
    end
    object cdsClientesRelCLI_FLSITU: TStringField
      FieldName = 'CLI_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsClientesRelCLI_LIMANA: TFloatField
      FieldName = 'CLI_LIMANA'
      currency = True
    end
    object cdsClientesRelCLI_FLCONV: TStringField
      FieldName = 'CLI_FLCONV'
      FixedChar = True
      Size = 1
    end
    object cdsClientesRelCLI_NRCART: TStringField
      FieldName = 'CLI_NRCART'
      Size = 13
    end
    object cdsClientesRelCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
  end
  object rvpClientes: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\INFOG2\Cartao\Rave\prvClientes.rav'
    Left = 304
    Top = 56
  end
  object dscClientes: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dstClientesRel
    Left = 400
    Top = 56
  end
  object dspBoletosRel: TDataSetProvider
    DataSet = dstBoletosRel
    Left = 88
    Top = 120
  end
  object cdsBoletosRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoletosRel'
    Left = 168
    Top = 120
    object cdsBoletosRelBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsBoletosRelBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsBoletosRelBOL_NRCART: TStringField
      FieldName = 'BOL_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsBoletosRelBOL_LOCPAG: TStringField
      FieldName = 'BOL_LOCPAG'
      Required = True
      Size = 50
    end
    object cdsBoletosRelBOL_DTVENC: TDateField
      FieldName = 'BOL_DTVENC'
      Required = True
    end
    object cdsBoletosRelBOL_NMCEDE: TStringField
      FieldName = 'BOL_NMCEDE'
      Required = True
      Size = 50
    end
    object cdsBoletosRelBOL_DTDOCU: TDateField
      FieldName = 'BOL_DTDOCU'
      Required = True
    end
    object cdsBoletosRelBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
    end
    object cdsBoletosRelBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object cdsBoletosRelBOL_ENDERE: TStringField
      FieldName = 'BOL_ENDERE'
      Size = 50
    end
    object cdsBoletosRelBOL_COMPLE: TStringField
      FieldName = 'BOL_COMPLE'
      Size = 45
    end
    object cdsBoletosRelBOL_CEPSAC: TStringField
      FieldName = 'BOL_CEPSAC'
      FixedChar = True
      Size = 8
    end
    object cdsBoletosRelBOL_BAIRRO: TStringField
      FieldName = 'BOL_BAIRRO'
    end
    object cdsBoletosRelBOL_CIDADE: TStringField
      FieldName = 'BOL_CIDADE'
    end
    object cdsBoletosRelBOL_UFSACA: TStringField
      FieldName = 'BOL_UFSACA'
      FixedChar = True
      Size = 2
    end
    object cdsBoletosRelBOL_CPFCGC: TStringField
      FieldName = 'BOL_CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsBoletosRelBOL_TPPESS: TStringField
      FieldName = 'BOL_TPPESS'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosRelBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosRelBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object cdsBoletosRelBOL_CDCLIE: TStringField
      FieldName = 'BOL_CDCLIE'
      FixedChar = True
      Size = 7
    end
  end
  object rvpAvisoSPC: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\INFOG2\Cartao\Rave\prvAvisoSPC.rav'
    Left = 304
    Top = 104
  end
  object dscAviso: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsClientesRel
    Left = 400
    Top = 104
  end
  object rvpRecibo: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\INFOG2\Cartao\Rave\prvRecibo.rav'
    Left = 304
    Top = 152
  end
  object dscRecibo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsClientesRel
    Left = 400
    Top = 152
  end
  object rvpReciboEntrega: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\INFOG2\Cartao\Rave\prvReciboEntrega.rav'
    Left = 304
    Top = 200
  end
  object dscEntrega: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsClientesRel
    Left = 400
    Top = 200
  end
  object dstEnvelopesClientes: TSQLDataSet
    CommandText = 
      'select CLI_CDCLIE, CLI_NMCLIE, CLI_NMCART, CLI_ENCLIE, CLI_CEPCL' +
      'I, CLI_COMCLI, CLI_BAICLI, CLI_CIDCLI, CLI_UFCLIE from ACCCLI Wh' +
      'ere CLI_CDCLIE>:pCDCLIE and CLI_CDCLIE<:pCDFINA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDCLIE'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDFINA'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 32
    Top = 192
    object dstEnvelopesClientesCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object dstEnvelopesClientesCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object dstEnvelopesClientesCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object dstEnvelopesClientesCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object dstEnvelopesClientesCLI_CEPCLI: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CEPCLI'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object dstEnvelopesClientesCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      Size = 30
    end
    object dstEnvelopesClientesCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
    object dstEnvelopesClientesCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      Size = 25
    end
    object dstEnvelopesClientesCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      FixedChar = True
      Size = 2
    end
  end
  object dspEnvelClientes: TDataSetProvider
    DataSet = dstEnvelopesClientes
    Left = 96
    Top = 176
  end
  object cdsEnvelClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEnvelClientes'
    Left = 160
    Top = 192
    object cdsEnvelClientesCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object cdsEnvelClientesCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsEnvelClientesCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object cdsEnvelClientesCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object cdsEnvelClientesCLI_CEPCLI: TStringField
      FieldName = 'CLI_CEPCLI'
      Size = 8
    end
    object cdsEnvelClientesCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      Size = 30
    end
    object cdsEnvelClientesCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
    object cdsEnvelClientesCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      Size = 25
    end
    object cdsEnvelClientesCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      FixedChar = True
      Size = 2
    end
  end
  object dstMovimentosRel: TSQLDataSet
    Active = True
    CommandText = 
      'select MOV_NRVEND, MOV_NRCART, MOV_CDCRED, MOV_DTMOVI, MOV_HOMOV' +
      'I, MOV_VLVEND, MOV_QTPARC, MOV_FLSITU, C.CRE_NMEXTR from ACCMOV,' +
      ' ACCCRE C Where (MOV_CDCRED=:pCDCRED) and (MOV_CDCRED=C.CRE_CDCR' +
      'ED)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDCRED'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmInfoCartao.SQLConnection1
    Left = 32
    Top = 248
    object dstMovimentosRelMOV_NRVEND: TStringField
      FieldName = 'MOV_NRVEND'
      Required = True
      FixedChar = True
      Size = 7
    end
    object dstMovimentosRelMOV_NRCART: TStringField
      FieldName = 'MOV_NRCART'
      Required = True
      Size = 13
    end
    object dstMovimentosRelMOV_CDCRED: TStringField
      FieldName = 'MOV_CDCRED'
      Required = True
      FixedChar = True
      Size = 6
    end
    object dstMovimentosRelMOV_DTMOVI: TDateField
      FieldName = 'MOV_DTMOVI'
    end
    object dstMovimentosRelMOV_HOMOVI: TStringField
      FieldName = 'MOV_HOMOVI'
      FixedChar = True
      Size = 8
    end
    object dstMovimentosRelMOV_VLVEND: TFloatField
      FieldName = 'MOV_VLVEND'
    end
    object dstMovimentosRelMOV_QTPARC: TIntegerField
      FieldName = 'MOV_QTPARC'
    end
    object dstMovimentosRelMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstMovimentosRelCRE_NMEXTR: TStringField
      FieldName = 'CRE_NMEXTR'
    end
  end
  object dspMovimentoRel: TDataSetProvider
    DataSet = dstMovimentosRel
    Left = 112
    Top = 248
  end
  object cdsMovimentoRel: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentoRel'
    Left = 192
    Top = 248
    object cdsMovimentoRelMOV_NRVEND: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_NRVEND'
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsMovimentoRelMOV_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_NRCART'
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      Size = 13
    end
    object cdsMovimentoRelMOV_CDCRED: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_CDCRED'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsMovimentoRelMOV_DTMOVI: TDateField
      Alignment = taRightJustify
      FieldName = 'MOV_DTMOVI'
    end
    object cdsMovimentoRelMOV_HOMOVI: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_HOMOVI'
      FixedChar = True
      Size = 8
    end
    object cdsMovimentoRelMOV_VLVEND: TFloatField
      FieldName = 'MOV_VLVEND'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###.##0.#0'
    end
    object cdsMovimentoRelMOV_QTPARC: TIntegerField
      FieldName = 'MOV_QTPARC'
    end
    object cdsMovimentoRelMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoRelCRE_NMEXTR: TStringField
      FieldName = 'CRE_NMEXTR'
    end
  end
  object rvpMovCredenciado: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\INFOG2\Cartao\Rave\prvMovCredenciado.rav'
    Left = 304
    Top = 256
  end
  object dscMovCredenciado: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsMovimentoRel
    Left = 408
    Top = 256
  end
end
