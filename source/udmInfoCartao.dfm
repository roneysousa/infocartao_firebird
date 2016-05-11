object dmInfoCartao: TdmInfoCartao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 196
  Top = 120
  Height = 542
  Width = 800
  object SQLConnection1: TSQLConnection
    ConnectionName = 'CARTAO'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=D:\Sistemas\InfoCartao\Dados\INFOCARTAO.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'C:\windows\system32\fbclient.dll'
    Left = 32
  end
  object dstClientes: TSQLDataSet
    CommandText = 'select * from ACCCLI order by CLI_NMCLIE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 96
    object dstClientesCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object dstClientesCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 45
    end
    object dstClientesCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_TPPESS: TStringField
      FieldName = 'CLI_TPPESS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_DTNASC: TDateField
      FieldName = 'CLI_DTNASC'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_DTNAS1: TStringField
      FieldName = 'CLI_DTNAS1'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_SXCLIE: TStringField
      FieldName = 'CLI_SXCLIE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_ESTCIV: TStringField
      FieldName = 'CLI_ESTCIV'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_NRIDEN: TStringField
      FieldName = 'CLI_NRIDEN'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstClientesCLI_ORGEMI: TStringField
      FieldName = 'CLI_ORGEMI'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstClientesCLI_UFEMIS: TStringField
      FieldName = 'CLI_UFEMIS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstClientesCLI_CPFCGC: TStringField
      FieldName = 'CLI_CPFCGC'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_NOMPAI: TStringField
      FieldName = 'CLI_NOMPAI'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_NOMMAE: TStringField
      FieldName = 'CLI_NOMMAE'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_CDBANC: TStringField
      FieldName = 'CLI_CDBANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstClientesCLI_FLESPE: TStringField
      FieldName = 'CLI_FLESPE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_CEPCLI: TStringField
      FieldName = 'CLI_CEPCLI'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstClientesCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object dstClientesCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object dstClientesCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstClientesCLI_FONCLI: TStringField
      FieldName = 'CLI_FONCLI'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_TIPFON: TStringField
      FieldName = 'CLI_TIPFON'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_CELCLI: TStringField
      FieldName = 'CLI_CELCLI'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_TPRESI: TStringField
      FieldName = 'CLI_TPRESI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_TMRESI: TStringField
      FieldName = 'CLI_TMRESI'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dstClientesCLI_VLRESI: TFloatField
      FieldName = 'CLI_VLRESI'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_NMEMPR: TStringField
      FieldName = 'CLI_NMEMPR'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_ENEMPR: TStringField
      FieldName = 'CLI_ENEMPR'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_CEPEMP: TStringField
      FieldName = 'CLI_CEPEMP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_BAEMPR: TStringField
      FieldName = 'CLI_BAEMPR'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object dstClientesCLI_CIEMPR: TStringField
      FieldName = 'CLI_CIEMPR'
      ProviderFlags = [pfInUpdate]
      Size = 23
    end
    object dstClientesCLI_VINEMP: TStringField
      FieldName = 'CLI_VINEMP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_TIPEMP: TStringField
      FieldName = 'CLI_TIPEMP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_TMSERV: TStringField
      FieldName = 'CLI_TMSERV'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dstClientesCLI_VLSALA: TFloatField
      FieldName = 'CLI_VLSALA'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_VLOUTR: TFloatField
      FieldName = 'CLI_VLOUTR'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_FONEMP: TStringField
      FieldName = 'CLI_FONEMP'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_RAMEMP: TStringField
      FieldName = 'CLI_RAMEMP'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dstClientesCLI_FLPROP: TStringField
      FieldName = 'CLI_FLPROP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_NMCARG: TStringField
      FieldName = 'CLI_NMCARG'
      ProviderFlags = [pfInUpdate]
      Size = 23
    end
    object dstClientesCLI_CGCEMP: TStringField
      FieldName = 'CLI_CGCEMP'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstClientesCLI_NOMCJG: TStringField
      FieldName = 'CLI_NOMCJG'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object dstClientesCLI_EMPCJG: TStringField
      FieldName = 'CLI_EMPCJG'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object dstClientesCLI_FONCJG: TStringField
      FieldName = 'CLI_FONCJG'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_CELCJG: TStringField
      FieldName = 'CLI_CELCJG'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_CPFCJG: TStringField
      FieldName = 'CLI_CPFCJG'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstClientesCLI_ENCORR: TStringField
      FieldName = 'CLI_ENCORR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object dstClientesCLI_NMBENS: TStringField
      FieldName = 'CLI_NMBENS'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstClientesCLI_VLBENS: TFloatField
      FieldName = 'CLI_VLBENS'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_OUTCAR: TStringField
      FieldName = 'CLI_OUTCAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_NMREF1: TStringField
      FieldName = 'CLI_NMREF1'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstClientesCLI_FOREF1: TStringField
      FieldName = 'CLI_FOREF1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_NMREF2: TStringField
      FieldName = 'CLI_NMREF2'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstClientesCLI_FOREF2: TStringField
      FieldName = 'CLI_FOREF2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClientesCLI_DTCADA: TDateField
      FieldName = 'CLI_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_DTCAD1: TStringField
      FieldName = 'CLI_DTCAD1'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_HOCADA: TStringField
      FieldName = 'CLI_HOCADA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_FLSITU: TStringField
      FieldName = 'CLI_FLSITU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_CDREPR: TStringField
      FieldName = 'CLI_CDREPR'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstClientesCLI_DATANA: TDateField
      FieldName = 'CLI_DATANA'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_DATAN1: TStringField
      FieldName = 'CLI_DATAN1'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_HORANA: TStringField
      FieldName = 'CLI_HORANA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_USUANA: TStringField
      FieldName = 'CLI_USUANA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstClientesCLI_SPCANA: TStringField
      FieldName = 'CLI_SPCANA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_LOCANA: TStringField
      FieldName = 'CLI_LOCANA'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstClientesCLI_OBSANA: TBlobField
      FieldName = 'CLI_OBSANA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object dstClientesCLI_LIMANA: TFloatField
      FieldName = 'CLI_LIMANA'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_FLCONV: TStringField
      FieldName = 'CLI_FLCONV'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_NRCART: TStringField
      FieldName = 'CLI_NRCART'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object dstClientesCLI_PEDESC: TFMTBCDField
      FieldName = 'CLI_PEDESC'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstClientesCLI_CDUSUA: TStringField
      FieldName = 'CLI_CDUSUA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = dstClientes
    Left = 112
    Top = 96
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 200
    Top = 96
    object cdsClientesCLI_CDCLIE: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CDCLIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object cdsClientesCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsClientesCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object cdsClientesCLI_TPPESS: TStringField
      FieldName = 'CLI_TPPESS'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_DTNASC: TDateField
      Alignment = taRightJustify
      FieldName = 'CLI_DTNASC'
      EditMask = '99/99/9999;1;_'
    end
    object cdsClientesCLI_DTNAS1: TStringField
      FieldName = 'CLI_DTNAS1'
      Size = 8
    end
    object cdsClientesCLI_SXCLIE: TStringField
      FieldName = 'CLI_SXCLIE'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_ESTCIV: TStringField
      FieldName = 'CLI_ESTCIV'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_NRIDEN: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_NRIDEN'
      Size = 14
    end
    object cdsClientesCLI_ORGEMI: TStringField
      FieldName = 'CLI_ORGEMI'
      Size = 5
    end
    object cdsClientesCLI_UFEMIS: TStringField
      FieldName = 'CLI_UFEMIS'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLI_CPFCGC: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CPFCGC'
      EditMask = ' 999.999.999-99;0;_'
      Size = 11
    end
    object cdsClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 45
    end
    object cdsClientesCLI_NOMPAI: TStringField
      FieldName = 'CLI_NOMPAI'
      Size = 45
    end
    object cdsClientesCLI_NOMMAE: TStringField
      FieldName = 'CLI_NOMMAE'
      Size = 45
    end
    object cdsClientesCLI_CDBANC: TStringField
      FieldName = 'CLI_CDBANC'
      FixedChar = True
      Size = 3
    end
    object cdsClientesCLI_FLESPE: TStringField
      FieldName = 'CLI_FLESPE'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object cdsClientesCLI_CEPCLI: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CEPCLI'
      EditMask = '99999-999;1;_'
      Size = 8
    end
    object cdsClientesCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      Size = 30
    end
    object cdsClientesCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
    object cdsClientesCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      Size = 25
    end
    object cdsClientesCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLI_FONCLI: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONCLI'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_TIPFON: TStringField
      FieldName = 'CLI_TIPFON'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_CELCLI: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CELCLI'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_TPRESI: TStringField
      FieldName = 'CLI_TPRESI'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_TMRESI: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_TMRESI'
      EditMask = '99-99;0;_'
      Size = 4
    end
    object cdsClientesCLI_NMEMPR: TStringField
      FieldName = 'CLI_NMEMPR'
      Size = 45
    end
    object cdsClientesCLI_ENEMPR: TStringField
      FieldName = 'CLI_ENEMPR'
      Size = 45
    end
    object cdsClientesCLI_CEPEMP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CEPEMP'
      EditMask = '99999-999;1;_'
      Size = 8
    end
    object cdsClientesCLI_BAEMPR: TStringField
      FieldName = 'CLI_BAEMPR'
      Size = 25
    end
    object cdsClientesCLI_CIEMPR: TStringField
      FieldName = 'CLI_CIEMPR'
      Size = 23
    end
    object cdsClientesCLI_VINEMP: TStringField
      FieldName = 'CLI_VINEMP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_TIPEMP: TStringField
      FieldName = 'CLI_TIPEMP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_TMSERV: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_TMSERV'
      EditMask = '99-99;0;_'
      Size = 4
    end
    object cdsClientesCLI_VLSALA: TFloatField
      FieldName = 'CLI_VLSALA'
      currency = True
    end
    object cdsClientesCLI_FONEMP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONEMP'
      EditMask = '(99)9999-9999;1;_'
      Size = 10
    end
    object cdsClientesCLI_RAMEMP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_RAMEMP'
      EditMask = '9999;1;_'
      Size = 4
    end
    object cdsClientesCLI_FLPROP: TStringField
      FieldName = 'CLI_FLPROP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_NMCARG: TStringField
      FieldName = 'CLI_NMCARG'
      Size = 23
    end
    object cdsClientesCLI_CGCEMP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CGCEMP'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsClientesCLI_NOMCJG: TStringField
      FieldName = 'CLI_NOMCJG'
      Size = 45
    end
    object cdsClientesCLI_EMPCJG: TStringField
      FieldName = 'CLI_EMPCJG'
      Size = 25
    end
    object cdsClientesCLI_FONCJG: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONCJG'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_CELCJG: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CELCJG'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_CPFCJG: TStringField
      FieldName = 'CLI_CPFCJG'
      EditMask = ' 999.999.999-99;0;_'
      Size = 11
    end
    object cdsClientesCLI_ENCORR: TStringField
      FieldName = 'CLI_ENCORR'
      Size = 1
    end
    object cdsClientesCLI_NMBENS: TStringField
      FieldName = 'CLI_NMBENS'
      Size = 30
    end
    object cdsClientesCLI_OUTCAR: TStringField
      FieldName = 'CLI_OUTCAR'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_NMREF1: TStringField
      FieldName = 'CLI_NMREF1'
      Size = 30
    end
    object cdsClientesCLI_FOREF1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FOREF1'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_NMREF2: TStringField
      FieldName = 'CLI_NMREF2'
      Size = 30
    end
    object cdsClientesCLI_FOREF2: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FOREF2'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_DTCADA: TDateField
      Alignment = taRightJustify
      FieldName = 'CLI_DTCADA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsClientesCLI_DTCAD1: TStringField
      FieldName = 'CLI_DTCAD1'
      Size = 8
    end
    object cdsClientesCLI_HOCADA: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_HOCADA'
      EditMask = '99:99:99;1;_'
      Size = 8
    end
    object cdsClientesCLI_FLSITU: TStringField
      FieldName = 'CLI_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_CDREPR: TStringField
      FieldName = 'CLI_CDREPR'
      Size = 6
    end
    object cdsClientesCLI_DATANA: TDateField
      Alignment = taRightJustify
      FieldName = 'CLI_DATANA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsClientesCLI_DATAN1: TStringField
      FieldName = 'CLI_DATAN1'
      Size = 8
    end
    object cdsClientesCLI_HORANA: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_HORANA'
      EditMask = '99:99:99;1;_'
      Size = 8
    end
    object cdsClientesCLI_USUANA: TStringField
      FieldName = 'CLI_USUANA'
      FixedChar = True
      Size = 3
    end
    object cdsClientesCLI_SPCANA: TStringField
      FieldName = 'CLI_SPCANA'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_LOCANA: TStringField
      FieldName = 'CLI_LOCANA'
      Size = 60
    end
    object cdsClientesCLI_OBSANA: TBlobField
      FieldName = 'CLI_OBSANA'
      Size = 1
    end
    object cdsClientesCLI_FLCONV: TStringField
      FieldName = 'CLI_FLCONV'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_NRCART'
      EditMask = '9999 9999 99 999;0;_'
      Size = 13
    end
    object cdsClientesCLI_PEDESC: TFMTBCDField
      FieldName = 'CLI_PEDESC'
      Precision = 15
      Size = 2
    end
    object cdsClientesCLI_TPFONE: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_TPFONE'
      LookupDataSet = cdsTipoFone
      LookupKeyFields = 'TPF_CDTPFO'
      LookupResultField = 'TPF_NMDESC'
      KeyFields = 'CLI_TIPFON'
      Size = 10
      Lookup = True
    end
    object cdsClientesCLI_TPRES2: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_TPRES2'
      LookupDataSet = cdsTipoResidencia
      LookupKeyFields = 'TPR_CDRESI'
      LookupResultField = 'TPR_NMDESC'
      KeyFields = 'CLI_TPRESI'
      Size = 18
      Lookup = True
    end
    object cdsClientesCLI_VIEMPR: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_VIEMPR'
      LookupDataSet = cdsVinculo
      LookupKeyFields = 'VIN_CDVINC'
      LookupResultField = 'VIN_NMDESC'
      KeyFields = 'CLI_VINEMP'
      Size = 15
      Lookup = True
    end
    object cdsClientesCLI_ENCOR2: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_ENCOR2'
      LookupDataSet = cdsCorresp
      LookupKeyFields = 'RES_CDTPRE'
      LookupResultField = 'RES_NMDESC'
      KeyFields = 'CLI_ENCORR'
      Size = 11
      Lookup = True
    end
    object cdsClientesCLI_NMBANC: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMBANC'
      LookupDataSet = cdsBancos
      LookupKeyFields = 'BAN_CDBANC'
      LookupResultField = 'BAN_NMBANC'
      KeyFields = 'CLI_CDBANC'
      Size = 30
      Lookup = True
    end
    object cdsClientesCLI_NMSITU: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMSITU'
      LookupDataSet = cdsSituacao
      LookupKeyFields = 'SIT_CDSITU'
      LookupResultField = 'SIT_NMDESC'
      KeyFields = 'CLI_FLSITU'
      Lookup = True
    end
    object cdsClientesCLI_TPDESC: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_TPDESC'
      LookupDataSet = cdsTPPessoa
      LookupKeyFields = 'PES_TPPESS'
      LookupResultField = 'PES_NMDESC'
      KeyFields = 'CLI_TPPESS'
      Size = 10
      Lookup = True
    end
    object cdsClientesCLI_SXDESC: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_SXDESC'
      LookupDataSet = cdsSexo
      LookupKeyFields = 'SEX_CDSEXO'
      LookupResultField = 'SEX_NMDESC'
      KeyFields = 'CLI_SXCLIE'
      Size = 10
      Lookup = True
    end
    object cdsClientesCLI_ECDESC: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_ECDESC'
      LookupDataSet = cdsEstCivil
      LookupKeyFields = 'EST_CDESCI'
      LookupResultField = 'EST_NMDESC'
      KeyFields = 'CLI_ESTCIV'
      Size = 12
      Lookup = True
    end
    object cdsClientesCLI_VLRESI: TFloatField
      FieldName = 'CLI_VLRESI'
      currency = True
    end
    object cdsClientesCLI_VLOUTR: TFloatField
      FieldName = 'CLI_VLOUTR'
      currency = True
    end
    object cdsClientesCLI_VLBENS: TFloatField
      FieldName = 'CLI_VLBENS'
      currency = True
    end
    object cdsClientesCLI_LIMANA: TFloatField
      FieldName = 'CLI_LIMANA'
      currency = True
    end
    object cdsClientesCLI_CDUSUA: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CDUSUA'
      FixedChar = True
      Size = 3
    end
  end
  object dstParametros: TSQLDataSet
    CommandText = 'select * from ACCPAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 48
    object dstParametrosPAR_NMEMPR: TStringField
      FieldName = 'PAR_NMEMPR'
      Required = True
      Size = 50
    end
    object dstParametrosPAR_ENEMPR: TStringField
      FieldName = 'PAR_ENEMPR'
      Required = True
      Size = 40
    end
    object dstParametrosPAR_BAIRRO: TStringField
      FieldName = 'PAR_BAIRRO'
    end
    object dstParametrosPAR_CIDADE: TStringField
      FieldName = 'PAR_CIDADE'
      Size = 10
    end
    object dstParametrosPAR_CEPEMP: TStringField
      FieldName = 'PAR_CEPEMP'
      Size = 8
    end
    object dstParametrosPAR_UFEMPR: TStringField
      FieldName = 'PAR_UFEMPR'
      FixedChar = True
      Size = 2
    end
    object dstParametrosPAR_CGCEMP: TStringField
      FieldName = 'PAR_CGCEMP'
      Size = 14
    end
    object dstParametrosPAR_INSEST: TStringField
      FieldName = 'PAR_INSEST'
      Size = 14
    end
    object dstParametrosPAR_NRFONE: TStringField
      FieldName = 'PAR_NRFONE'
      Size = 10
    end
    object dstParametrosPAR_NUMFAX: TStringField
      FieldName = 'PAR_NUMFAX'
      Size = 10
    end
    object dstParametrosPAR_DTATUA: TDateField
      FieldName = 'PAR_DTATUA'
    end
    object dstParametrosPAR_LTTEMP: TStringField
      FieldName = 'PAR_LTTEMP'
      FixedChar = True
      Size = 1
    end
    object dstParametrosPAR_NRTEMP: TFMTBCDField
      FieldName = 'PAR_NRTEMP'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_GRUSUA: TFMTBCDField
      FieldName = 'PAR_GRUSUA'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_CDUSUA: TFMTBCDField
      FieldName = 'PAR_CDUSUA'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_CDCLIE: TFMTBCDField
      FieldName = 'PAR_CDCLIE'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_CDCRED: TFMTBCDField
      FieldName = 'PAR_CDCRED'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_VALCAR: TFMTBCDField
      FieldName = 'PAR_VALCAR'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_NRCART: TFMTBCDField
      FieldName = 'PAR_NRCART'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_NRVEND: TFMTBCDField
      FieldName = 'PAR_NRVEND'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_LIPARC: TFMTBCDField
      FieldName = 'PAR_LIPARC'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_NRSEQU: TFMTBCDField
      FieldName = 'PAR_NRSEQU'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_FLCAIX: TStringField
      FieldName = 'PAR_FLCAIX'
      FixedChar = True
      Size = 1
    end
    object dstParametrosPAR_RGINIC: TStringField
      FieldName = 'PAR_RGINIC'
      Size = 10
    end
    object dstParametrosPAR_CDNATU: TFMTBCDField
      FieldName = 'PAR_CDNATU'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_NRFATU: TFMTBCDField
      FieldName = 'PAR_NRFATU'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_NMCEDE: TStringField
      FieldName = 'PAR_NMCEDE'
      Size = 50
    end
    object dstParametrosPAR_LOCPAGA: TStringField
      FieldName = 'PAR_LOCPAGA'
      Size = 50
    end
    object dstParametrosPAR_NRBOLE: TFMTBCDField
      FieldName = 'PAR_NRBOLE'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_PEJURO: TFMTBCDField
      FieldName = 'PAR_PEJURO'
      Precision = 15
      Size = 2
    end
    object dstParametrosPAR_NATVEN: TStringField
      FieldName = 'PAR_NATVEN'
      FixedChar = True
      Size = 3
    end
    object dstParametrosPAR_DTFATU: TDateField
      FieldName = 'PAR_DTFATU'
    end
    object dstParametrosPAR_QTATRA: TFMTBCDField
      FieldName = 'PAR_QTATRA'
      Precision = 15
      Size = 0
    end
    object dstParametrosPAR_NMPAST: TStringField
      FieldName = 'PAR_NMPAST'
      Size = 50
    end
    object dstParametrosPAR_CDCEDE: TStringField
      FieldName = 'PAR_CDCEDE'
      Size = 14
    end
    object dstParametrosPAR_DIGCED: TStringField
      FieldName = 'PAR_DIGCED'
      FixedChar = True
      Size = 1
    end
    object dstParametrosPAR_CDBANC: TStringField
      FieldName = 'PAR_CDBANC'
      FixedChar = True
      Size = 3
    end
    object dstParametrosPAR_CDAGEN: TStringField
      FieldName = 'PAR_CDAGEN'
      Size = 5
    end
    object dstParametrosPAR_DIGAGE: TStringField
      FieldName = 'PAR_DIGAGE'
      FixedChar = True
      Size = 1
    end
    object dstParametrosPAR_NRCONT: TStringField
      FieldName = 'PAR_NRCONT'
      Size = 11
    end
    object dstParametrosPAR_INSTR1: TMemoField
      FieldName = 'PAR_INSTR1'
      BlobType = ftMemo
      Size = 1
    end
    object dstParametrosPAR_INSTR2: TMemoField
      FieldName = 'PAR_INSTR2'
      BlobType = ftMemo
      Size = 1
    end
    object dstParametrosPAR_IMLOGO: TBlobField
      FieldName = 'PAR_IMLOGO'
      Size = 1
    end
    object dstParametrosPAR_PEMULT: TFMTBCDField
      FieldName = 'PAR_PEMULT'
      Precision = 15
      Size = 2
    end
  end
  object dspParametros: TDataSetProvider
    DataSet = dstParametros
    Left = 112
    Top = 48
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametros'
    Left = 200
    Top = 48
    object cdsParametrosPAR_NMEMPR: TStringField
      FieldName = 'PAR_NMEMPR'
      Required = True
      Size = 50
    end
    object cdsParametrosPAR_ENEMPR: TStringField
      FieldName = 'PAR_ENEMPR'
      Required = True
      Size = 40
    end
    object cdsParametrosPAR_BAIRRO: TStringField
      FieldName = 'PAR_BAIRRO'
    end
    object cdsParametrosPAR_CIDADE: TStringField
      FieldName = 'PAR_CIDADE'
      Size = 10
    end
    object cdsParametrosPAR_CEPEMP: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CEPEMP'
      EditMask = '99999-999;1;_'
      Size = 8
    end
    object cdsParametrosPAR_UFEMPR: TStringField
      FieldName = 'PAR_UFEMPR'
      FixedChar = True
      Size = 2
    end
    object cdsParametrosPAR_CGCEMP: TStringField
      FieldName = 'PAR_CGCEMP'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsParametrosPAR_INSEST: TStringField
      FieldName = 'PAR_INSEST'
      Size = 14
    end
    object cdsParametrosPAR_NRFONE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_NRFONE'
      EditMask = '(99)9999-9999;1;_'
      Size = 10
    end
    object cdsParametrosPAR_NUMFAX: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_NUMFAX'
      EditMask = '(99)9999-9999;1;_'
      Size = 10
    end
    object cdsParametrosPAR_DTATUA: TDateField
      Alignment = taRightJustify
      FieldName = 'PAR_DTATUA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParametrosPAR_LTTEMP: TStringField
      FieldName = 'PAR_LTTEMP'
      FixedChar = True
      Size = 1
    end
    object cdsParametrosPAR_NRTEMP: TFMTBCDField
      FieldName = 'PAR_NRTEMP'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_GRUSUA: TFMTBCDField
      FieldName = 'PAR_GRUSUA'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_CDUSUA: TFMTBCDField
      FieldName = 'PAR_CDUSUA'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_CDCLIE: TFMTBCDField
      FieldName = 'PAR_CDCLIE'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_CDCRED: TFMTBCDField
      FieldName = 'PAR_CDCRED'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_VALCAR: TFMTBCDField
      FieldName = 'PAR_VALCAR'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_NRCART: TFMTBCDField
      FieldName = 'PAR_NRCART'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_NRVEND: TFMTBCDField
      FieldName = 'PAR_NRVEND'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_LIPARC: TFMTBCDField
      FieldName = 'PAR_LIPARC'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_NRSEQU: TFMTBCDField
      FieldName = 'PAR_NRSEQU'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_FLCAIX: TStringField
      FieldName = 'PAR_FLCAIX'
      FixedChar = True
      Size = 1
    end
    object cdsParametrosPAR_RGINIC: TStringField
      FieldName = 'PAR_RGINIC'
      Size = 10
    end
    object cdsParametrosPAR_CDNATU: TFMTBCDField
      FieldName = 'PAR_CDNATU'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_NRFATU: TFMTBCDField
      FieldName = 'PAR_NRFATU'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_NMCEDE: TStringField
      FieldName = 'PAR_NMCEDE'
      Size = 50
    end
    object cdsParametrosPAR_LOCPAGA: TStringField
      FieldName = 'PAR_LOCPAGA'
      Size = 50
    end
    object cdsParametrosPAR_NRBOLE: TFMTBCDField
      FieldName = 'PAR_NRBOLE'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_PEJURO: TFMTBCDField
      FieldName = 'PAR_PEJURO'
      Precision = 15
      Size = 2
    end
    object cdsParametrosPAR_NATVEN: TStringField
      FieldName = 'PAR_NATVEN'
      FixedChar = True
      Size = 3
    end
    object cdsParametrosPAR_DTFATU: TDateField
      FieldName = 'PAR_DTFATU'
    end
    object cdsParametrosPAR_QTATRA: TFMTBCDField
      FieldName = 'PAR_QTATRA'
      Precision = 15
      Size = 0
    end
    object cdsParametrosPAR_NMPAST: TStringField
      FieldName = 'PAR_NMPAST'
      Size = 50
    end
    object cdsParametrosPAR_CDCEDE: TStringField
      FieldName = 'PAR_CDCEDE'
      Size = 14
    end
    object cdsParametrosPAR_DIGCED: TStringField
      FieldName = 'PAR_DIGCED'
      FixedChar = True
      Size = 1
    end
    object cdsParametrosPAR_CDBANC: TStringField
      FieldName = 'PAR_CDBANC'
      FixedChar = True
      Size = 3
    end
    object cdsParametrosPAR_CDAGEN: TStringField
      FieldName = 'PAR_CDAGEN'
      Size = 5
    end
    object cdsParametrosPAR_DIGAGE: TStringField
      FieldName = 'PAR_DIGAGE'
      FixedChar = True
      Size = 1
    end
    object cdsParametrosPAR_NRCONT: TStringField
      FieldName = 'PAR_NRCONT'
      Size = 11
    end
    object cdsParametrosPAR_INSTR1: TMemoField
      FieldName = 'PAR_INSTR1'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParametrosPAR_INSTR2: TMemoField
      FieldName = 'PAR_INSTR2'
      BlobType = ftMemo
      Size = 1
    end
    object cdsParametrosPAR_IMLOGO: TBlobField
      FieldName = 'PAR_IMLOGO'
      Size = 1
    end
    object cdsParametrosPAR_PEMULT: TFMTBCDField
      FieldName = 'PAR_PEMULT'
      Precision = 15
      Size = 2
    end
  end
  object dstTipoFone: TSQLDataSet
    CommandText = 'select * from ACCTPF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 8
  end
  object dspTipoFone: TDataSetProvider
    DataSet = dstTipoFone
    Left = 376
    Top = 8
  end
  object cdsTipoFone: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoFone'
    Left = 464
    Top = 8
  end
  object dstTipoResiden: TSQLDataSet
    CommandText = 'select TPR_CDRESI, TPR_NMDESC from ACCRES order by TPR_NMDESC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 64
  end
  object dspTipoResiden: TDataSetProvider
    DataSet = dstTipoResiden
    Left = 376
    Top = 64
  end
  object cdsTipoResidencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoResiden'
    Left = 464
    Top = 64
  end
  object dstVinculo: TSQLDataSet
    CommandText = 'select * from ACCVIN'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 112
  end
  object dspVinculo: TDataSetProvider
    DataSet = dstVinculo
    Left = 376
    Top = 112
  end
  object cdsVinculo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVinculo'
    Left = 464
    Top = 112
  end
  object dstCorrespon: TSQLDataSet
    CommandText = 'select * from ACCTRE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 168
  end
  object dspCorresp: TDataSetProvider
    DataSet = dstCorrespon
    Left = 376
    Top = 168
  end
  object cdsCorresp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCorresp'
    Left = 464
    Top = 168
  end
  object dstBancos: TSQLDataSet
    CommandText = 'select * from ACCBAN'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 216
  end
  object dspBancos: TDataSetProvider
    DataSet = dstBancos
    Left = 376
    Top = 216
  end
  object cdsBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    Left = 464
    Top = 216
  end
  object dstSituacao: TSQLDataSet
    CommandText = 'select * from ACCSTC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 264
  end
  object dspSituacao: TDataSetProvider
    DataSet = dstSituacao
    Left = 376
    Top = 264
  end
  object cdsSituacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSituacao'
    Left = 464
    Top = 264
  end
  object dstPessoa: TSQLDataSet
    CommandText = 'select * from ACCPES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 312
  end
  object dspPessoa: TDataSetProvider
    DataSet = dstPessoa
    Left = 376
    Top = 312
  end
  object cdsTPPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 464
    Top = 262
    object cdsTPPessoaPES_TPPESS: TStringField
      FieldName = 'PES_TPPESS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTPPessoaPES_NMDESC: TStringField
      FieldName = 'PES_NMDESC'
      Required = True
      Size = 10
    end
  end
  object dstSexo: TSQLDataSet
    CommandText = 'select * from ACCSEX'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 360
  end
  object dspSexo: TDataSetProvider
    DataSet = dstSexo
    Left = 376
    Top = 360
  end
  object cdsSexo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSexo'
    Left = 464
    Top = 310
  end
  object dstEstCivil: TSQLDataSet
    CommandText = 'select * from ACCEST'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 359
  end
  object dspEstCivil: TDataSetProvider
    DataSet = dstEstCivil
    Left = 376
    Top = 360
  end
  object cdsEstCivil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstCivil'
    Left = 464
    Top = 359
  end
  object dstCredenciados: TSQLDataSet
    CommandText = 'select * from ACCCRE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 200
    object dstCredenciadosCRE_CDCRED: TStringField
      FieldName = 'CRE_CDCRED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object dstCredenciadosCRE_NMCRED: TStringField
      FieldName = 'CRE_NMCRED'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object dstCredenciadosCRE_NMEXTR: TStringField
      FieldName = 'CRE_NMEXTR'
      ProviderFlags = [pfInUpdate]
    end
    object dstCredenciadosCRE_ENDCRE: TStringField
      FieldName = 'CRE_ENDCRE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstCredenciadosCRE_BACRED: TStringField
      FieldName = 'CRE_BACRED'
      ProviderFlags = [pfInUpdate]
    end
    object dstCredenciadosCRE_CICRED: TStringField
      FieldName = 'CRE_CICRED'
      ProviderFlags = [pfInUpdate]
    end
    object dstCredenciadosCRE_UFCRED: TStringField
      FieldName = 'CRE_UFCRED'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstCredenciadosCRE_CEPCRE: TStringField
      FieldName = 'CRE_CEPCRE'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstCredenciadosCRE_NRFONE: TStringField
      FieldName = 'CRE_NRFONE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstCredenciadosCRE_CDUSUA: TStringField
      FieldName = 'CRE_CDUSUA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
  end
  object dspCredeciados: TDataSetProvider
    DataSet = dstCredenciados
    Left = 112
    Top = 200
  end
  object cdsCredenciados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCredeciados'
    Left = 200
    Top = 200
    object cdsCredenciadosCRE_CDCRED: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_CDCRED'
      Required = True
      Size = 6
    end
    object cdsCredenciadosCRE_NMCRED: TStringField
      FieldName = 'CRE_NMCRED'
      Required = True
      Size = 40
    end
    object cdsCredenciadosCRE_NMEXTR: TStringField
      FieldName = 'CRE_NMEXTR'
    end
    object cdsCredenciadosCRE_ENDCRE: TStringField
      FieldName = 'CRE_ENDCRE'
      Size = 40
    end
    object cdsCredenciadosCRE_BACRED: TStringField
      FieldName = 'CRE_BACRED'
    end
    object cdsCredenciadosCRE_CICRED: TStringField
      FieldName = 'CRE_CICRED'
    end
    object cdsCredenciadosCRE_UFCRED: TStringField
      FieldName = 'CRE_UFCRED'
      FixedChar = True
      Size = 2
    end
    object cdsCredenciadosCRE_CEPCRE: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_CEPCRE'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsCredenciadosCRE_NRFONE: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_NRFONE'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsCredenciadosCRE_CDUSUA: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_CDUSUA'
      FixedChar = True
      Size = 3
    end
  end
  object dstBuscaCliente: TSQLDataSet
    CommandText = 'select * from ACCCLI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 152
    object dstBuscaClienteCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object dstBuscaClienteCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object dstBuscaClienteCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object dstBuscaClienteCLI_TPPESS: TStringField
      FieldName = 'CLI_TPPESS'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_DTNASC: TDateField
      FieldName = 'CLI_DTNASC'
    end
    object dstBuscaClienteCLI_DTNAS1: TStringField
      FieldName = 'CLI_DTNAS1'
      Size = 8
    end
    object dstBuscaClienteCLI_SXCLIE: TStringField
      FieldName = 'CLI_SXCLIE'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_ESTCIV: TStringField
      FieldName = 'CLI_ESTCIV'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_NRIDEN: TStringField
      FieldName = 'CLI_NRIDEN'
      Size = 14
    end
    object dstBuscaClienteCLI_ORGEMI: TStringField
      FieldName = 'CLI_ORGEMI'
      Size = 5
    end
    object dstBuscaClienteCLI_UFEMIS: TStringField
      FieldName = 'CLI_UFEMIS'
      FixedChar = True
      Size = 2
    end
    object dstBuscaClienteCLI_CPFCGC: TStringField
      FieldName = 'CLI_CPFCGC'
      Size = 11
    end
    object dstBuscaClienteCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 45
    end
    object dstBuscaClienteCLI_NOMPAI: TStringField
      FieldName = 'CLI_NOMPAI'
      Size = 45
    end
    object dstBuscaClienteCLI_NOMMAE: TStringField
      FieldName = 'CLI_NOMMAE'
      Size = 45
    end
    object dstBuscaClienteCLI_CDBANC: TStringField
      FieldName = 'CLI_CDBANC'
      FixedChar = True
      Size = 3
    end
    object dstBuscaClienteCLI_FLESPE: TStringField
      FieldName = 'CLI_FLESPE'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object dstBuscaClienteCLI_CEPCLI: TStringField
      FieldName = 'CLI_CEPCLI'
      Size = 8
    end
    object dstBuscaClienteCLI_COMCLI: TStringField
      FieldName = 'CLI_COMCLI'
      Size = 30
    end
    object dstBuscaClienteCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
    object dstBuscaClienteCLI_CIDCLI: TStringField
      FieldName = 'CLI_CIDCLI'
      Size = 25
    end
    object dstBuscaClienteCLI_UFCLIE: TStringField
      FieldName = 'CLI_UFCLIE'
      FixedChar = True
      Size = 2
    end
    object dstBuscaClienteCLI_FONCLI: TStringField
      FieldName = 'CLI_FONCLI'
      Size = 10
    end
    object dstBuscaClienteCLI_TIPFON: TStringField
      FieldName = 'CLI_TIPFON'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_CELCLI: TStringField
      FieldName = 'CLI_CELCLI'
      Size = 10
    end
    object dstBuscaClienteCLI_TPRESI: TStringField
      FieldName = 'CLI_TPRESI'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_TMRESI: TStringField
      FieldName = 'CLI_TMRESI'
      Size = 4
    end
    object dstBuscaClienteCLI_VLRESI: TFloatField
      FieldName = 'CLI_VLRESI'
    end
    object dstBuscaClienteCLI_NMEMPR: TStringField
      FieldName = 'CLI_NMEMPR'
      Size = 45
    end
    object dstBuscaClienteCLI_ENEMPR: TStringField
      FieldName = 'CLI_ENEMPR'
      Size = 45
    end
    object dstBuscaClienteCLI_CEPEMP: TStringField
      FieldName = 'CLI_CEPEMP'
      Size = 8
    end
    object dstBuscaClienteCLI_BAEMPR: TStringField
      FieldName = 'CLI_BAEMPR'
      Size = 25
    end
    object dstBuscaClienteCLI_CIEMPR: TStringField
      FieldName = 'CLI_CIEMPR'
      Size = 23
    end
    object dstBuscaClienteCLI_VINEMP: TStringField
      FieldName = 'CLI_VINEMP'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_TIPEMP: TStringField
      FieldName = 'CLI_TIPEMP'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_TMSERV: TStringField
      FieldName = 'CLI_TMSERV'
      Size = 4
    end
    object dstBuscaClienteCLI_VLSALA: TFloatField
      FieldName = 'CLI_VLSALA'
    end
    object dstBuscaClienteCLI_VLOUTR: TFloatField
      FieldName = 'CLI_VLOUTR'
    end
    object dstBuscaClienteCLI_FONEMP: TStringField
      FieldName = 'CLI_FONEMP'
      Size = 10
    end
    object dstBuscaClienteCLI_RAMEMP: TStringField
      FieldName = 'CLI_RAMEMP'
      Size = 4
    end
    object dstBuscaClienteCLI_FLPROP: TStringField
      FieldName = 'CLI_FLPROP'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_NMCARG: TStringField
      FieldName = 'CLI_NMCARG'
      Size = 23
    end
    object dstBuscaClienteCLI_CGCEMP: TStringField
      FieldName = 'CLI_CGCEMP'
      Size = 14
    end
    object dstBuscaClienteCLI_NOMCJG: TStringField
      FieldName = 'CLI_NOMCJG'
      Size = 45
    end
    object dstBuscaClienteCLI_EMPCJG: TStringField
      FieldName = 'CLI_EMPCJG'
      Size = 25
    end
    object dstBuscaClienteCLI_FONCJG: TStringField
      FieldName = 'CLI_FONCJG'
      Size = 10
    end
    object dstBuscaClienteCLI_CELCJG: TStringField
      FieldName = 'CLI_CELCJG'
      Size = 10
    end
    object dstBuscaClienteCLI_CPFCJG: TStringField
      FieldName = 'CLI_CPFCJG'
      Size = 11
    end
    object dstBuscaClienteCLI_ENCORR: TStringField
      FieldName = 'CLI_ENCORR'
      Size = 1
    end
    object dstBuscaClienteCLI_NMBENS: TStringField
      FieldName = 'CLI_NMBENS'
      Size = 30
    end
    object dstBuscaClienteCLI_VLBENS: TFloatField
      FieldName = 'CLI_VLBENS'
    end
    object dstBuscaClienteCLI_OUTCAR: TStringField
      FieldName = 'CLI_OUTCAR'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_NMREF1: TStringField
      FieldName = 'CLI_NMREF1'
      Size = 30
    end
    object dstBuscaClienteCLI_FOREF1: TStringField
      FieldName = 'CLI_FOREF1'
      Size = 10
    end
    object dstBuscaClienteCLI_NMREF2: TStringField
      FieldName = 'CLI_NMREF2'
      Size = 30
    end
    object dstBuscaClienteCLI_FOREF2: TStringField
      FieldName = 'CLI_FOREF2'
      Size = 10
    end
    object dstBuscaClienteCLI_DTCADA: TDateField
      FieldName = 'CLI_DTCADA'
    end
    object dstBuscaClienteCLI_DTCAD1: TStringField
      FieldName = 'CLI_DTCAD1'
      Size = 8
    end
    object dstBuscaClienteCLI_HOCADA: TStringField
      FieldName = 'CLI_HOCADA'
      Size = 8
    end
    object dstBuscaClienteCLI_FLSITU: TStringField
      FieldName = 'CLI_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_CDREPR: TStringField
      FieldName = 'CLI_CDREPR'
      Size = 6
    end
    object dstBuscaClienteCLI_DATANA: TDateField
      FieldName = 'CLI_DATANA'
    end
    object dstBuscaClienteCLI_DATAN1: TStringField
      FieldName = 'CLI_DATAN1'
      Size = 8
    end
    object dstBuscaClienteCLI_HORANA: TStringField
      FieldName = 'CLI_HORANA'
      Size = 8
    end
    object dstBuscaClienteCLI_USUANA: TStringField
      FieldName = 'CLI_USUANA'
      FixedChar = True
      Size = 3
    end
    object dstBuscaClienteCLI_SPCANA: TStringField
      FieldName = 'CLI_SPCANA'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_LOCANA: TStringField
      FieldName = 'CLI_LOCANA'
      Size = 60
    end
    object dstBuscaClienteCLI_OBSANA: TBlobField
      FieldName = 'CLI_OBSANA'
      Size = 1
    end
    object dstBuscaClienteCLI_LIMANA: TFloatField
      FieldName = 'CLI_LIMANA'
    end
    object dstBuscaClienteCLI_FLCONV: TStringField
      FieldName = 'CLI_FLCONV'
      FixedChar = True
      Size = 1
    end
    object dstBuscaClienteCLI_NRCART: TStringField
      FieldName = 'CLI_NRCART'
      Size = 13
    end
    object dstBuscaClienteCLI_PEDESC: TFMTBCDField
      FieldName = 'CLI_PEDESC'
      Precision = 15
      Size = 2
    end
    object dstBuscaClienteCLI_CDUSUA: TStringField
      FieldName = 'CLI_CDUSUA'
      FixedChar = True
      Size = 3
    end
  end
  object dspBuscaCliente: TDataSetProvider
    DataSet = dstBuscaCliente
    Left = 120
    Top = 152
  end
  object cdsBuscaCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaCliente'
    Left = 208
    Top = 152
    object cdsBuscaClienteCLI_CDCLIE: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CDCLIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object cdsBuscaClienteCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsBuscaClienteCLI_NMCART: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object cdsBuscaClienteCLI_NRIDEN: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_NRIDEN'
      Size = 14
    end
    object cdsBuscaClienteCLI_CPFCGC: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CPFCGC'
      Size = 11
    end
    object cdsBuscaClienteCLI_ENCLIE: TStringField
      FieldName = 'CLI_ENCLIE'
      Size = 45
    end
    object cdsBuscaClienteCLI_BAICLI: TStringField
      FieldName = 'CLI_BAICLI'
      Size = 25
    end
  end
  object dstBuscaCred: TSQLDataSet
    CommandText = 'select * from ACCCRE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 248
    object dstBuscaCredCRE_CDCRED: TStringField
      FieldName = 'CRE_CDCRED'
      Required = True
      Size = 6
    end
    object dstBuscaCredCRE_NMCRED: TStringField
      FieldName = 'CRE_NMCRED'
      Required = True
      Size = 40
    end
    object dstBuscaCredCRE_NMEXTR: TStringField
      FieldName = 'CRE_NMEXTR'
    end
    object dstBuscaCredCRE_ENDCRE: TStringField
      FieldName = 'CRE_ENDCRE'
      Size = 40
    end
    object dstBuscaCredCRE_BACRED: TStringField
      FieldName = 'CRE_BACRED'
    end
    object dstBuscaCredCRE_CICRED: TStringField
      FieldName = 'CRE_CICRED'
    end
    object dstBuscaCredCRE_UFCRED: TStringField
      FieldName = 'CRE_UFCRED'
      FixedChar = True
      Size = 2
    end
    object dstBuscaCredCRE_CEPCRE: TStringField
      FieldName = 'CRE_CEPCRE'
      Size = 8
    end
    object dstBuscaCredCRE_NRFONE: TStringField
      FieldName = 'CRE_NRFONE'
      Size = 10
    end
    object dstBuscaCredCRE_CDUSUA: TStringField
      FieldName = 'CRE_CDUSUA'
      FixedChar = True
      Size = 3
    end
  end
  object dspBuscaCred: TDataSetProvider
    DataSet = dstBuscaCred
    Left = 112
    Top = 248
  end
  object cdsBuscaCred: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaCred'
    Left = 200
    Top = 248
    object StringField1: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_CDCRED'
      Required = True
      Size = 6
    end
    object StringField2: TStringField
      FieldName = 'CRE_NMCRED'
      Required = True
      Size = 40
    end
    object StringField3: TStringField
      FieldName = 'CRE_NMEXTR'
    end
    object StringField4: TStringField
      FieldName = 'CRE_ENDCRE'
      Size = 40
    end
    object StringField5: TStringField
      FieldName = 'CRE_BACRED'
    end
    object StringField6: TStringField
      FieldName = 'CRE_CICRED'
    end
    object StringField7: TStringField
      FieldName = 'CRE_UFCRED'
      FixedChar = True
      Size = 2
    end
    object StringField8: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_CEPCRE'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object StringField9: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_NRFONE'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object StringField10: TStringField
      Alignment = taRightJustify
      FieldName = 'CRE_CDUSUA'
      FixedChar = True
      Size = 3
    end
  end
  object dstCartoes: TSQLDataSet
    CommandText = 'select * from ACCCAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 304
    object dstCartoesCAR_NRCART: TStringField
      FieldName = 'CAR_NRCART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object dstCartoesCAR_CDCLIE: TStringField
      FieldName = 'CAR_CDCLIE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 7
    end
    object dstCartoesCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 45
    end
    object dstCartoesCAR_DTEMIS: TDateField
      FieldName = 'CAR_DTEMIS'
      ProviderFlags = [pfInUpdate]
    end
    object dstCartoesCAR_DTEMI1: TStringField
      FieldName = 'CAR_DTEMI1'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstCartoesCAR_DTVALI: TStringField
      FieldName = 'CAR_DTVALI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object dstCartoesCAR_VLLIMI: TFMTBCDField
      FieldName = 'CAR_VLLIMI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstCartoesCAR_VLUTIL: TFloatField
      FieldName = 'CAR_VLUTIL'
      ProviderFlags = [pfInUpdate]
    end
    object dstCartoesCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
      ProviderFlags = [pfInUpdate]
    end
    object dstCartoesCAR_FLDEPE: TStringField
      FieldName = 'CAR_FLDEPE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCartoesCAR_FLSITU: TStringField
      FieldName = 'CAR_FLSITU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCartoesCAR_DTUTIL: TDateField
      FieldName = 'CAR_DTUTIL'
      ProviderFlags = [pfInUpdate]
    end
    object dstCartoesCAR_DTUTI1: TStringField
      FieldName = 'CAR_DTUTI1'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstCartoesCAR_HOUTIL: TStringField
      FieldName = 'CAR_HOUTIL'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstCartoesCAR_VLANTE: TFMTBCDField
      FieldName = 'CAR_VLANTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstCartoesCAR_VLCRED: TFMTBCDField
      FieldName = 'CAR_VLCRED'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstCartoesCAR_DTPAGA: TDateField
      FieldName = 'CAR_DTPAGA'
      ProviderFlags = [pfInUpdate]
    end
    object dstCartoesCAR_DTPAG1: TStringField
      FieldName = 'CAR_DTPAG1'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstCartoesCAR_CDUSUA: TStringField
      FieldName = 'CAR_CDUSUA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
  end
  object cdsCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCartoes'
    Left = 200
    Top = 304
    object cdsCartoesCAR_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_NRCART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      Size = 13
    end
    object cdsCartoesCAR_NMTITU: TStringField
      FieldKind = fkLookup
      FieldName = 'CAR_NMTITU'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLI_CDCLIE'
      LookupResultField = 'CLI_NMCLIE'
      KeyFields = 'CAR_CDCLIE'
      Size = 45
      Lookup = True
    end
    object cdsCartoesCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      Required = True
      Size = 45
    end
    object cdsCartoesCAR_CDCLIE: TStringField
      FieldName = 'CAR_CDCLIE'
      Required = True
      Size = 7
    end
    object cdsCartoesCAR_DTEMIS: TDateField
      Alignment = taRightJustify
      FieldName = 'CAR_DTEMIS'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCartoesCAR_DTEMI1: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_DTEMI1'
      Size = 8
    end
    object cdsCartoesCAR_DTVALI: TStringField
      FieldName = 'CAR_DTVALI'
      EditMask = '99/9999;0;_'
      FixedChar = True
      Size = 6
    end
    object cdsCartoesCAR_VLLIMI: TFMTBCDField
      FieldName = 'CAR_VLLIMI'
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsCartoesCAR_VLUTIL: TFloatField
      FieldName = 'CAR_VLUTIL'
      currency = True
    end
    object cdsCartoesCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
    object cdsCartoesCAR_FLDEPE: TStringField
      FieldName = 'CAR_FLDEPE'
      FixedChar = True
      Size = 1
    end
    object cdsCartoesCAR_FLSITU: TStringField
      FieldName = 'CAR_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsCartoesCAR_VLANTE: TFMTBCDField
      FieldName = 'CAR_VLANTE'
      LookupCache = True
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsCartoesCAR_VLCRED: TFMTBCDField
      FieldName = 'CAR_VLCRED'
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsCartoesCAR_DTPAG1: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_DTPAG1'
      Size = 8
    end
    object cdsCartoesCAR_DTPAGA: TDateField
      Alignment = taRightJustify
      FieldName = 'CAR_DTPAGA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCartoesCAR_HOUTIL: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_HOUTIL'
      Size = 8
    end
    object cdsCartoesCAR_DTUTI1: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_DTUTI1'
      Size = 8
    end
    object cdsCartoesCAR_DTUTIL: TDateField
      Alignment = taRightJustify
      FieldName = 'CAR_DTUTIL'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCartoesCAR_CDUSUA: TStringField
      Alignment = taRightJustify
      FieldName = 'CAR_CDUSUA'
      FixedChar = True
      Size = 3
    end
    object cdsCartoesCAR_NMSITU: TStringField
      FieldKind = fkLookup
      FieldName = 'CAR_NMSITU'
      LookupDataSet = cdsSitCartao
      LookupKeyFields = 'SIT_SIGSIT'
      LookupResultField = 'SIT_NMSITU'
      KeyFields = 'CAR_FLSITU'
      Size = 11
      Lookup = True
    end
    object cdsCartoesCAR_FATDIA: TStringField
      FieldKind = fkLookup
      FieldName = 'CAR_FATDIA'
      LookupDataSet = cdsDiaFatura
      LookupKeyFields = 'FAT_DIAFATU'
      LookupResultField = 'FAT_NMDESC'
      KeyFields = 'CAR_DIAFAT'
      Size = 25
      Lookup = True
    end
  end
  object dspCartoes: TDataSetProvider
    DataSet = dstCartoes
    Left = 112
    Top = 304
  end
  object dstSitCartao: TSQLDataSet
    CommandText = 'select * from ACCSIT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 544
    Top = 184
  end
  object dspSitCartao: TDataSetProvider
    DataSet = dstSitCartao
    Left = 544
    Top = 232
  end
  object cdsSitCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSitCartao'
    Left = 552
    Top = 288
    object cdsSitCartaoSIT_SIGSIT: TStringField
      FieldName = 'SIT_SIGSIT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSitCartaoSIT_NMSITU: TStringField
      FieldName = 'SIT_NMSITU'
      Required = True
      Size = 11
    end
  end
  object dstDiaFatura: TSQLDataSet
    CommandText = 'select * from ACCDFA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 536
    Top = 16
    object dstDiaFaturaFAT_DIAFATU: TIntegerField
      FieldName = 'FAT_DIAFATU'
      Required = True
    end
    object dstDiaFaturaFAT_NMDESC: TStringField
      FieldName = 'FAT_NMDESC'
      Required = True
      Size = 25
    end
  end
  object dspDiaFatura: TDataSetProvider
    DataSet = dstDiaFatura
    Left = 544
    Top = 72
  end
  object cdsDiaFatura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiaFatura'
    Left = 544
    Top = 128
  end
  object dstMovimento: TSQLDataSet
    CommandText = 
      'select MOV_NRVEND, MOV_NRCART, MOV_CDCRED, MOV_DTMOVI, MOV_HOMOV' +
      'I, MOV_VLLIMI, MOV_VLUTIL, MOV_VLVEND, MOV_QTPARC, MOV_FLSITU, M' +
      'OV_CDOPER, MOV_DTCANC, MOV_HOCANC, MOV_OPCANC from ACCMOV'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 352
    object dstMovimentoMOV_NRVEND: TStringField
      FieldName = 'MOV_NRVEND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 7
    end
    object dstMovimentoMOV_NRCART: TStringField
      FieldName = 'MOV_NRCART'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 13
    end
    object dstMovimentoMOV_CDCRED: TStringField
      FieldName = 'MOV_CDCRED'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object dstMovimentoMOV_DTMOVI: TDateField
      FieldName = 'MOV_DTMOVI'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_HOMOVI: TStringField
      FieldName = 'MOV_HOMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstMovimentoMOV_VLLIMI: TFloatField
      FieldName = 'MOV_VLLIMI'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_VLUTIL: TFloatField
      FieldName = 'MOV_VLUTIL'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_VLVEND: TFloatField
      FieldName = 'MOV_VLVEND'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_QTPARC: TIntegerField
      FieldName = 'MOV_QTPARC'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoMOV_CDOPER: TStringField
      FieldName = 'MOV_CDOPER'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstMovimentoMOV_DTCANC: TDateField
      FieldName = 'MOV_DTCANC'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_HOCANC: TStringField
      FieldName = 'MOV_HOCANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstMovimentoMOV_OPCANC: TStringField
      FieldName = 'MOV_OPCANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
  end
  object dspMovimento: TDataSetProvider
    DataSet = dstMovimento
    Left = 112
    Top = 352
  end
  object cdsMovimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimento'
    Left = 200
    Top = 352
    object cdsMovimentoMOV_NRVEND: TStringField
      FieldName = 'MOV_NRVEND'
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsMovimentoMOV_NRCART: TStringField
      FieldName = 'MOV_NRCART'
      Required = True
      Size = 13
    end
    object cdsMovimentoMOV_CDCRED: TStringField
      FieldName = 'MOV_CDCRED'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsMovimentoMOV_DTMOVI: TDateField
      FieldName = 'MOV_DTMOVI'
    end
    object cdsMovimentoMOV_HOMOVI: TStringField
      FieldName = 'MOV_HOMOVI'
      FixedChar = True
      Size = 8
    end
    object cdsMovimentoMOV_VLLIMI: TFloatField
      FieldName = 'MOV_VLLIMI'
      DisplayFormat = '###,###,##0.#0'
    end
    object cdsMovimentoMOV_VLUTIL: TFloatField
      FieldName = 'MOV_VLUTIL'
      DisplayFormat = '###,###,##0.#0'
    end
    object cdsMovimentoMOV_VLVEND: TFloatField
      FieldName = 'MOV_VLVEND'
      DisplayFormat = '###,###,##0.#0'
    end
    object cdsMovimentoMOV_QTPARC: TIntegerField
      FieldName = 'MOV_QTPARC'
    end
    object cdsMovimentoMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoMOV_CDOPER: TStringField
      FieldName = 'MOV_CDOPER'
      FixedChar = True
      Size = 3
    end
    object cdsMovimentoMOV_DTCANC: TDateField
      FieldName = 'MOV_DTCANC'
    end
    object cdsMovimentoMOV_HOCANC: TStringField
      FieldName = 'MOV_HOCANC'
      FixedChar = True
      Size = 8
    end
    object cdsMovimentoMOV_OPCANC: TStringField
      FieldName = 'MOV_OPCANC'
      FixedChar = True
      Size = 3
    end
  end
  object dstDebito: TSQLDataSet
    CommandText = 'select * from ACCDEB'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 400
    object dstDebitoDEB_NRVEND: TStringField
      FieldName = 'DEB_NRVEND'
      Required = True
      FixedChar = True
      Size = 7
    end
    object dstDebitoDEB_NRCART: TStringField
      FieldName = 'DEB_NRCART'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 13
    end
    object dstDebitoDEB_CDCLIE: TStringField
      FieldName = 'DEB_CDCLIE'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 7
    end
    object dstDebitoDEB_CDCRED: TStringField
      FieldName = 'DEB_CDCRED'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object dstDebitoDEB_DTREFE: TStringField
      FieldName = 'DEB_DTREFE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object dstDebitoDEB_QTPARC: TIntegerField
      FieldName = 'DEB_QTPARC'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_NRPARC: TIntegerField
      FieldName = 'DEB_NRPARC'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_VLPARC: TFloatField
      FieldName = 'DEB_VLPARC'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTVENC: TDateField
      FieldName = 'DEB_DTVENC'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTVEN1: TStringField
      FieldName = 'DEB_DTVEN1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstDebitoDEB_DTFATU: TDateField
      FieldName = 'DEB_DTFATU'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTFAT1: TStringField
      FieldName = 'DEB_DTFAT1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstDebitoDEB_TPMOVI: TStringField
      FieldName = 'DEB_TPMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstDebitoDEB_FLSITU: TStringField
      FieldName = 'DEB_FLSITU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstDebitoDEB_NRFATU: TStringField
      FieldName = 'DEB_NRFATU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstDebitoDEB_VLDESC: TFloatField
      FieldName = 'DEB_VLDESC'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTMOVI: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTMOVI'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object dstDebitoDEB_DTMOV1: TStringField
      FieldName = 'DEB_DTMOV1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstDebitoDEB_DIAFAT: TStringField
      FieldName = 'DEB_DIAFAT'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dspDebito: TDataSetProvider
    DataSet = dstDebito
    Left = 112
    Top = 400
  end
  object cdsDebito: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDebito'
    Left = 200
    Top = 400
    object cdsDebitoDEB_NRVEND: TStringField
      Alignment = taRightJustify
      FieldName = 'DEB_NRVEND'
      Required = True
      EditMask = '99/99/9999;1;_'
      FixedChar = True
      Size = 7
    end
    object cdsDebitoDEB_NRCART: TStringField
      FieldName = 'DEB_NRCART'
      Required = True
      Size = 13
    end
    object cdsDebitoDEB_CDCLIE: TStringField
      FieldName = 'DEB_CDCLIE'
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsDebitoDEB_CDCRED: TStringField
      FieldName = 'DEB_CDCRED'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDebitoDEB_DTREFE: TStringField
      FieldName = 'DEB_DTREFE'
      FixedChar = True
      Size = 6
    end
    object cdsDebitoDEB_QTPARC: TIntegerField
      FieldName = 'DEB_QTPARC'
    end
    object cdsDebitoDEB_NRPARC: TIntegerField
      FieldName = 'DEB_NRPARC'
    end
    object cdsDebitoDEB_VLPARC: TFloatField
      FieldName = 'DEB_VLPARC'
      currency = True
    end
    object cdsDebitoDEB_DTVENC: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTVENC'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_DTVEN1: TStringField
      FieldName = 'DEB_DTVEN1'
      FixedChar = True
      Size = 8
    end
    object cdsDebitoDEB_DTFATU: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTFATU'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_DTFAT1: TStringField
      FieldName = 'DEB_DTFAT1'
      FixedChar = True
      Size = 8
    end
    object cdsDebitoDEB_TPMOVI: TStringField
      FieldName = 'DEB_TPMOVI'
      FixedChar = True
      Size = 1
    end
    object cdsDebitoDEB_FLSITU: TStringField
      FieldName = 'DEB_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsDebitoDEB_NRFATU: TStringField
      FieldName = 'DEB_NRFATU'
      FixedChar = True
      Size = 10
    end
    object cdsDebitoDEB_VLDESC: TFloatField
      FieldName = 'DEB_VLDESC'
    end
    object cdsDebitoDEB_DTMOVI: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTMOVI'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_DTMOV1: TStringField
      Alignment = taRightJustify
      FieldName = 'DEB_DTMOV1'
      FixedChar = True
      Size = 8
    end
    object cdsDebitoDEB_DIAFAT: TStringField
      FieldName = 'DEB_DIAFAT'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dstBoletos: TSQLDataSet
    CommandText = 'select * from ACCBOL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 408
    object dstBoletosBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstBoletosBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstBoletosBOL_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'BOL_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstBoletosBOL_LOCPAG: TStringField
      FieldName = 'BOL_LOCPAG'
      Required = True
      Size = 50
    end
    object dstBoletosBOL_DTVENC: TDateField
      FieldName = 'BOL_DTVENC'
      Required = True
    end
    object dstBoletosBOL_NMCEDE: TStringField
      FieldName = 'BOL_NMCEDE'
      Required = True
      Size = 50
    end
    object dstBoletosBOL_DTDOCU: TDateField
      FieldName = 'BOL_DTDOCU'
      Required = True
    end
    object dstBoletosBOL_ACEITE: TStringField
      FieldName = 'BOL_ACEITE'
      FixedChar = True
      Size = 1
    end
    object dstBoletosBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
    end
    object dstBoletosBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object dstBoletosBOL_ENDERE: TStringField
      FieldName = 'BOL_ENDERE'
      Size = 50
    end
    object dstBoletosBOL_COMPLE: TStringField
      FieldName = 'BOL_COMPLE'
      Size = 45
    end
    object dstBoletosBOL_CEPSAC: TStringField
      FieldName = 'BOL_CEPSAC'
      FixedChar = True
      Size = 8
    end
    object dstBoletosBOL_BAIRRO: TStringField
      FieldName = 'BOL_BAIRRO'
    end
    object dstBoletosBOL_CIDADE: TStringField
      FieldName = 'BOL_CIDADE'
    end
    object dstBoletosBOL_UFSACA: TStringField
      FieldName = 'BOL_UFSACA'
      FixedChar = True
      Size = 2
    end
    object dstBoletosBOL_CPFCGC: TStringField
      FieldName = 'BOL_CPFCGC'
      FixedChar = True
      Size = 18
    end
    object dstBoletosBOL_TPPESS: TStringField
      FieldName = 'BOL_TPPESS'
      FixedChar = True
      Size = 1
    end
    object dstBoletosBOL_VLANTE: TFloatField
      FieldName = 'BOL_VLANTE'
    end
    object dstBoletosBOL_VLCRED: TFloatField
      FieldName = 'BOL_VLCRED'
    end
    object dstBoletosBOL_VLREST: TFloatField
      FieldName = 'BOL_VLREST'
    end
    object dstBoletosBOL_VLFATU: TFloatField
      FieldName = 'BOL_VLFATU'
    end
    object dstBoletosBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstBoletosBOL_VLJURO: TFloatField
      FieldName = 'BOL_VLJURO'
    end
    object dstBoletosBOL_VLMULT: TFloatField
      FieldName = 'BOL_VLMULT'
    end
    object dstBoletosBOL_VLDESC: TFloatField
      FieldName = 'BOL_VLDESC'
    end
    object dstBoletosBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object dstBoletosBOL_DTPAG1: TStringField
      FieldName = 'BOL_DTPAG1'
      FixedChar = True
      Size = 8
    end
    object dstBoletosBOL_VLPAGO: TFloatField
      FieldName = 'BOL_VLPAGO'
    end
    object dstBoletosBOL_CDUSUA: TStringField
      FieldName = 'BOL_CDUSUA'
      FixedChar = True
      Size = 3
    end
    object dstBoletosBOL_CDCLIE: TStringField
      FieldName = 'BOL_CDCLIE'
      FixedChar = True
      Size = 7
    end
    object dstBoletosBOL_VLLIQU: TFloatField
      FieldName = 'BOL_VLLIQU'
    end
    object dstBoletosBOL_DTCRED: TDateField
      FieldName = 'BOL_DTCRED'
    end
    object dstBoletosBOL_DTCRE1: TStringField
      FieldName = 'BOL_DTCRE1'
      FixedChar = True
      Size = 8
    end
    object dstBoletosBOL_TPBAIX: TStringField
      FieldName = 'BOL_TPBAIX'
      FixedChar = True
      Size = 2
    end
    object dstBoletosBOL_QTIMPR: TFMTBCDField
      FieldName = 'BOL_QTIMPR'
      Precision = 15
      Size = 0
    end
    object dstBoletosBOL_OBSERV: TStringField
      FieldName = 'BOL_OBSERV'
      Size = 40
    end
    object dstBoletosBOL_USEDIT: TStringField
      FieldName = 'BOL_USEDIT'
      FixedChar = True
      Size = 3
    end
    object dstBoletosBOL_DTEDIT: TDateField
      FieldName = 'BOL_DTEDIT'
    end
    object dstBoletosBOL_DTEDI1: TStringField
      FieldName = 'BOL_DTEDI1'
      Size = 8
    end
    object dstBoletosBOL_HOEDIT: TStringField
      FieldName = 'BOL_HOEDIT'
      Size = 8
    end
    object dstBoletosBOL_MOTIV1: TStringField
      FieldName = 'BOL_MOTIV1'
      Size = 50
    end
    object dstBoletosBOL_MOTIV2: TStringField
      FieldName = 'BOL_MOTIV2'
      Size = 50
    end
    object dstBoletosBOL_MOTIV3: TStringField
      FieldName = 'BOL_MOTIV3'
      Size = 50
    end
  end
  object dspBoletos: TDataSetProvider
    DataSet = dstBoletos
    Left = 376
    Top = 408
  end
  object cdsBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoletos'
    Left = 464
    Top = 408
    object cdsBoletosBOL_NRDOCU: TStringField
      FieldName = 'BOL_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsBoletosBOL_NRFATU: TStringField
      FieldName = 'BOL_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsBoletosBOL_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'BOL_NRCART'
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsBoletosBOL_LOCPAG: TStringField
      FieldName = 'BOL_LOCPAG'
      Required = True
      Size = 50
    end
    object cdsBoletosBOL_DTVENC: TDateField
      Alignment = taRightJustify
      FieldName = 'BOL_DTVENC'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsBoletosBOL_NMCEDE: TStringField
      FieldName = 'BOL_NMCEDE'
      Required = True
      Size = 50
    end
    object cdsBoletosBOL_DTDOCU: TDateField
      Alignment = taRightJustify
      FieldName = 'BOL_DTDOCU'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsBoletosBOL_ACEITE: TStringField
      FieldName = 'BOL_ACEITE'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosBOL_VLDOCU: TFloatField
      FieldName = 'BOL_VLDOCU'
      currency = True
    end
    object cdsBoletosBOL_NMSACA: TStringField
      FieldName = 'BOL_NMSACA'
      Size = 50
    end
    object cdsBoletosBOL_ENDERE: TStringField
      FieldName = 'BOL_ENDERE'
      Size = 50
    end
    object cdsBoletosBOL_COMPLE: TStringField
      FieldName = 'BOL_COMPLE'
      Size = 45
    end
    object cdsBoletosBOL_CEPSAC: TStringField
      FieldName = 'BOL_CEPSAC'
      FixedChar = True
      Size = 8
    end
    object cdsBoletosBOL_BAIRRO: TStringField
      FieldName = 'BOL_BAIRRO'
    end
    object cdsBoletosBOL_CIDADE: TStringField
      FieldName = 'BOL_CIDADE'
    end
    object cdsBoletosBOL_UFSACA: TStringField
      FieldName = 'BOL_UFSACA'
      FixedChar = True
      Size = 2
    end
    object cdsBoletosBOL_CPFCGC: TStringField
      FieldName = 'BOL_CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsBoletosBOL_TPPESS: TStringField
      FieldName = 'BOL_TPPESS'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosBOL_VLANTE: TFloatField
      FieldName = 'BOL_VLANTE'
      currency = True
    end
    object cdsBoletosBOL_VLCRED: TFloatField
      FieldName = 'BOL_VLCRED'
      currency = True
    end
    object cdsBoletosBOL_VLREST: TFloatField
      FieldName = 'BOL_VLREST'
      currency = True
    end
    object cdsBoletosBOL_VLFATU: TFloatField
      FieldName = 'BOL_VLFATU'
      currency = True
    end
    object cdsBoletosBOL_FLSITU: TStringField
      FieldName = 'BOL_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosBOL_VLJURO: TFloatField
      FieldName = 'BOL_VLJURO'
    end
    object cdsBoletosBOL_VLMULT: TFloatField
      FieldName = 'BOL_VLMULT'
    end
    object cdsBoletosBOL_VLDESC: TFloatField
      FieldName = 'BOL_VLDESC'
    end
    object cdsBoletosBOL_DTPAGA: TDateField
      FieldName = 'BOL_DTPAGA'
    end
    object cdsBoletosBOL_DTPAG1: TStringField
      FieldName = 'BOL_DTPAG1'
      FixedChar = True
      Size = 8
    end
    object cdsBoletosBOL_VLPAGO: TFloatField
      FieldName = 'BOL_VLPAGO'
    end
    object cdsBoletosBOL_CDUSUA: TStringField
      FieldName = 'BOL_CDUSUA'
      FixedChar = True
      Size = 3
    end
    object cdsBoletosBOL_CDCLIE: TStringField
      FieldName = 'BOL_CDCLIE'
      FixedChar = True
      Size = 7
    end
    object cdsBoletosBOL_VLLIQU: TFloatField
      FieldName = 'BOL_VLLIQU'
    end
    object cdsBoletosBOL_DTCRED: TDateField
      Alignment = taRightJustify
      FieldName = 'BOL_DTCRED'
      EditMask = '99/99/9999;1;_'
    end
    object cdsBoletosBOL_DTCRE1: TStringField
      FieldName = 'BOL_DTCRE1'
      FixedChar = True
      Size = 8
    end
    object cdsBoletosBOL_TPBAIX: TStringField
      FieldName = 'BOL_TPBAIX'
      FixedChar = True
      Size = 2
    end
    object cdsBoletosBOL_QTIMPR: TFMTBCDField
      FieldName = 'BOL_QTIMPR'
      Precision = 15
      Size = 0
    end
    object cdsBoletosBOL_OBSERV: TStringField
      FieldName = 'BOL_OBSERV'
      Size = 40
    end
    object cdsBoletosBOL_USEDIT: TStringField
      FieldName = 'BOL_USEDIT'
      FixedChar = True
      Size = 3
    end
    object cdsBoletosBOL_DTEDIT: TDateField
      Alignment = taRightJustify
      FieldName = 'BOL_DTEDIT'
      EditMask = '99/99/9999;1;_'
    end
    object cdsBoletosBOL_DTEDI1: TStringField
      FieldName = 'BOL_DTEDI1'
      Size = 8
    end
    object cdsBoletosBOL_HOEDIT: TStringField
      FieldName = 'BOL_HOEDIT'
      Size = 8
    end
    object cdsBoletosBOL_MOTIV1: TStringField
      FieldName = 'BOL_MOTIV1'
      Size = 50
    end
    object cdsBoletosBOL_MOTIV2: TStringField
      FieldName = 'BOL_MOTIV2'
      Size = 50
    end
    object cdsBoletosBOL_MOTIV3: TStringField
      FieldName = 'BOL_MOTIV3'
      Size = 50
    end
  end
  object dstMovBoletos: TSQLDataSet
    CommandText = 'select * from ACCBOM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 552
    Top = 336
    object dstMovBoletosBOM_NRFATU: TStringField
      FieldName = 'BOM_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstMovBoletosBOM_NRCART: TStringField
      FieldName = 'BOM_NRCART'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstMovBoletosBOM_CDCLIE: TStringField
      FieldName = 'BOM_CDCLIE'
      Required = True
      FixedChar = True
      Size = 7
    end
    object dstMovBoletosBOM_DTREFE: TStringField
      FieldName = 'BOM_DTREFE'
      Required = True
      FixedChar = True
      Size = 6
    end
    object dstMovBoletosBOM_NMCRED: TStringField
      FieldName = 'BOM_NMCRED'
      Size = 21
    end
    object dstMovBoletosBOM_NMPLAN: TStringField
      FieldName = 'BOM_NMPLAN'
      Size = 7
    end
    object dstMovBoletosBOM_VLPARC: TFloatField
      FieldName = 'BOM_VLPARC'
    end
    object dstMovBoletosBOM_TPMOVI: TStringField
      FieldName = 'BOM_TPMOVI'
      FixedChar = True
      Size = 1
    end
  end
  object dspMovBoletos: TDataSetProvider
    DataSet = dstMovBoletos
    Left = 552
    Top = 384
  end
  object cdsMovBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovBoletos'
    Left = 544
    Top = 432
    object cdsMovBoletosBOM_NRFATU: TStringField
      FieldName = 'BOM_NRFATU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsMovBoletosBOM_NRCART: TStringField
      Alignment = taRightJustify
      FieldName = 'BOM_NRCART'
      Required = True
      EditMask = '9999 9999 99 999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsMovBoletosBOM_CDCLIE: TStringField
      FieldName = 'BOM_CDCLIE'
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsMovBoletosBOM_DTREFE: TStringField
      FieldName = 'BOM_DTREFE'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsMovBoletosBOM_NMCRED: TStringField
      FieldName = 'BOM_NMCRED'
      Size = 21
    end
    object cdsMovBoletosBOM_NMPLAN: TStringField
      FieldName = 'BOM_NMPLAN'
      Size = 7
    end
    object cdsMovBoletosBOM_VLPARC: TFloatField
      FieldName = 'BOM_VLPARC'
      currency = True
    end
    object cdsMovBoletosBOM_TPMOVI: TStringField
      FieldName = 'BOM_TPMOVI'
      FixedChar = True
      Size = 1
    end
  end
  object dstFeriados: TSQLDataSet
    CommandText = 'select * from ACCFER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 624
    Top = 16
    object dstFeriadosFER_DTFERI: TStringField
      FieldName = 'FER_DTFERI'
      Required = True
      Size = 10
    end
    object dstFeriadosFER_NMDESC: TStringField
      FieldName = 'FER_NMDESC'
      Required = True
      Size = 50
    end
  end
  object dspFeriados: TDataSetProvider
    DataSet = dstFeriados
    Left = 624
    Top = 72
  end
  object cdsFeriados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFeriados'
    Left = 624
    Top = 120
    object cdsFeriadosFER_DTFERI: TStringField
      FieldName = 'FER_DTFERI'
      Required = True
      Size = 10
    end
    object cdsFeriadosFER_NMDESC: TStringField
      FieldName = 'FER_NMDESC'
      Required = True
      Size = 50
    end
  end
  object dstCaixa: TSQLDataSet
    CommandText = 'select * from ACCCAI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 632
    Top = 176
    object dstCaixaCAI_CDMODA: TStringField
      FieldName = 'CAI_CDMODA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object dstCaixaCAI_VLMODA: TFloatField
      FieldName = 'CAI_VLMODA'
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = dstCaixa
    Left = 632
    Top = 224
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 632
    Top = 272
    object cdsCaixaCAI_CDMODA: TStringField
      FieldName = 'CAI_CDMODA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCaixaCAI_VLMODA: TFloatField
      FieldName = 'CAI_VLMODA'
    end
  end
  object dstModalidade: TSQLDataSet
    CommandText = 'select * from ACCMOD'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 632
    Top = 328
    object dstModalidadeMOD_CDMODA: TStringField
      FieldName = 'MOD_CDMODA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object dstModalidadeMOD_NMMODA: TStringField
      FieldName = 'MOD_NMMODA'
      Required = True
      Size = 30
    end
    object dstModalidadeMOD_NMABRE: TStringField
      FieldName = 'MOD_NMABRE'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dspModalidade: TDataSetProvider
    DataSet = dstModalidade
    Left = 632
    Top = 376
  end
  object cdsModalidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModalidade'
    Left = 649
    Top = 408
    object cdsModalidadeMOD_CDMODA: TStringField
      FieldName = 'MOD_CDMODA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsModalidadeMOD_NMMODA: TStringField
      FieldName = 'MOD_NMMODA'
      Required = True
      Size = 30
    end
    object cdsModalidadeMOD_NMABRE: TStringField
      FieldName = 'MOD_NMABRE'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dstMovCaixa: TSQLDataSet
    CommandText = 'select * from ACCMCA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 696
    Top = 8
    object dstMovCaixaMCA_NRSEQU: TStringField
      FieldName = 'MCA_NRSEQU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstMovCaixaMCA_NRDOCU: TStringField
      FieldName = 'MCA_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstMovCaixaMCA_CDNATU: TStringField
      FieldName = 'MCA_CDNATU'
      FixedChar = True
      Size = 3
    end
    object dstMovCaixaMCA_DTMOVI: TDateField
      FieldName = 'MCA_DTMOVI'
    end
    object dstMovCaixaMCA_DTMOV1: TStringField
      FieldName = 'MCA_DTMOV1'
      FixedChar = True
      Size = 8
    end
    object dstMovCaixaMCA_DTREFE: TStringField
      FieldName = 'MCA_DTREFE'
      FixedChar = True
      Size = 6
    end
    object dstMovCaixaMCA_HOMOVI: TStringField
      FieldName = 'MCA_HOMOVI'
      FixedChar = True
      Size = 8
    end
    object dstMovCaixaMCA_TPMOVI: TStringField
      FieldName = 'MCA_TPMOVI'
      FixedChar = True
      Size = 1
    end
    object dstMovCaixaMCA_CDMODA: TStringField
      FieldName = 'MCA_CDMODA'
      FixedChar = True
      Size = 2
    end
    object dstMovCaixaMCA_VLMODA: TFloatField
      FieldName = 'MCA_VLMODA'
    end
    object dstMovCaixaMCA_NMDESC: TStringField
      FieldName = 'MCA_NMDESC'
      Size = 50
    end
    object dstMovCaixaMCA_CDFUNC: TStringField
      FieldName = 'MCA_CDFUNC'
      FixedChar = True
      Size = 5
    end
  end
  object dspMovCaixa: TDataSetProvider
    DataSet = dstMovCaixa
    Left = 696
    Top = 64
  end
  object cdsMovCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovCaixa'
    Left = 704
    Top = 120
    object cdsMovCaixaMCA_NRSEQU: TStringField
      FieldName = 'MCA_NRSEQU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsMovCaixaMCA_NRDOCU: TStringField
      FieldName = 'MCA_NRDOCU'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsMovCaixaMCA_CDNATU: TStringField
      FieldName = 'MCA_CDNATU'
      FixedChar = True
      Size = 3
    end
    object cdsMovCaixaMCA_DTMOVI: TDateField
      FieldName = 'MCA_DTMOVI'
    end
    object cdsMovCaixaMCA_DTMOV1: TStringField
      FieldName = 'MCA_DTMOV1'
      FixedChar = True
      Size = 8
    end
    object cdsMovCaixaMCA_DTREFE: TStringField
      FieldName = 'MCA_DTREFE'
      FixedChar = True
      Size = 6
    end
    object cdsMovCaixaMCA_HOMOVI: TStringField
      FieldName = 'MCA_HOMOVI'
      FixedChar = True
      Size = 8
    end
    object cdsMovCaixaMCA_TPMOVI: TStringField
      FieldName = 'MCA_TPMOVI'
      FixedChar = True
      Size = 1
    end
    object cdsMovCaixaMCA_CDMODA: TStringField
      FieldName = 'MCA_CDMODA'
      FixedChar = True
      Size = 2
    end
    object cdsMovCaixaMCA_VLMODA: TFloatField
      FieldName = 'MCA_VLMODA'
    end
    object cdsMovCaixaMCA_NMDESC: TStringField
      FieldName = 'MCA_NMDESC'
      Size = 50
    end
    object cdsMovCaixaMCA_CDFUNC: TStringField
      FieldName = 'MCA_CDFUNC'
      FixedChar = True
      Size = 5
    end
  end
  object qryIncVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from SACMOV')
    SQLConnection = SQLConnection1
    Left = 712
    Top = 168
  end
  object qryLocCartao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCCAR')
    SQLConnection = SQLConnection1
    Left = 712
    Top = 216
    object qryLocCartaoCAR_NRCART: TStringField
      FieldName = 'CAR_NRCART'
      Required = True
      Size = 13
    end
    object qryLocCartaoCAR_CDCLIE: TStringField
      FieldName = 'CAR_CDCLIE'
      Required = True
      Size = 7
    end
    object qryLocCartaoCAR_NMCLIE: TStringField
      FieldName = 'CAR_NMCLIE'
      Required = True
      Size = 45
    end
    object qryLocCartaoCAR_VLLIMI: TFMTBCDField
      FieldName = 'CAR_VLLIMI'
      DisplayFormat = '0.#0'
      Precision = 15
      Size = 2
    end
    object qryLocCartaoCAR_VLUTIL: TFloatField
      FieldName = 'CAR_VLUTIL'
      DisplayFormat = '0.#0'
    end
    object qryLocCartaoCAR_DIAFAT: TIntegerField
      FieldName = 'CAR_DIAFAT'
    end
    object qryLocCartaoCAR_FLSITU: TStringField
      FieldName = 'CAR_FLSITU'
      FixedChar = True
      Size = 1
    end
    object qryLocCartaoCAR_DTUTIL: TDateField
      FieldName = 'CAR_DTUTIL'
    end
    object qryLocCartaoCAR_DTUTI1: TStringField
      FieldName = 'CAR_DTUTI1'
      Size = 8
    end
    object qryLocCartaoCAR_HOUTIL: TStringField
      FieldName = 'CAR_HOUTIL'
      Size = 8
    end
    object qryLocCartaoCAR_VLANTE: TFMTBCDField
      FieldName = 'CAR_VLANTE'
      DisplayFormat = '0.#0'
      Precision = 15
      Size = 2
    end
    object qryLocCartaoCAR_VLCRED: TFMTBCDField
      FieldName = 'CAR_VLCRED'
      DisplayFormat = '0.#0'
      Precision = 15
      Size = 2
    end
    object qryLocCartaoCAR_DTVALI: TStringField
      FieldName = 'CAR_DTVALI'
      FixedChar = True
      Size = 6
    end
    object qryLocCartaoCAR_NMSITU: TStringField
      FieldKind = fkLookup
      FieldName = 'CAR_NMSITU'
      LookupDataSet = cdsSituacao
      LookupKeyFields = 'SIT_CDSITU'
      LookupResultField = 'SIT_NMDESC'
      KeyFields = 'CAR_FLSITU'
      Size = 12
      Lookup = True
    end
  end
  object qryBuscaCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCCLI')
    SQLConnection = SQLConnection1
    Left = 712
    Top = 264
    object qryBuscaClienteCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Required = True
      Size = 7
    end
    object qryBuscaClienteCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Required = True
      Size = 45
    end
    object qryBuscaClienteCLI_NMCART: TStringField
      FieldName = 'CLI_NMCART'
      Size = 45
    end
    object qryBuscaClienteCLI_TPPESS: TStringField
      FieldName = 'CLI_TPPESS'
      FixedChar = True
      Size = 1
    end
    object qryBuscaClienteCLI_DTNASC: TDateField
      FieldName = 'CLI_DTNASC'
    end
    object qryBuscaClienteCLI_DTNAS1: TStringField
      FieldName = 'CLI_DTNAS1'
      Size = 8
    end
    object qryBuscaClienteCLI_SXCLIE: TStringField
      FieldName = 'CLI_SXCLIE'
      FixedChar = True
      Size = 1
    end
    object qryBuscaClienteCLI_ESTCIV: TStringField
      FieldName = 'CLI_ESTCIV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaClienteCLI_NRIDEN: TStringField
      FieldName = 'CLI_NRIDEN'
      Size = 14
    end
    object qryBuscaClienteCLI_ORGEMI: TStringField
      FieldName = 'CLI_ORGEMI'
      Size = 5
    end
    object qryBuscaClienteCLI_UFEMIS: TStringField
      FieldName = 'CLI_UFEMIS'
      FixedChar = True
      Size = 2
    end
    object qryBuscaClienteCLI_CPFCGC: TStringField
      FieldName = 'CLI_CPFCGC'
      Size = 11
    end
    object qryBuscaClienteCLI_NOMPAI: TStringField
      FieldName = 'CLI_NOMPAI'
      Size = 45
    end
    object qryBuscaClienteCLI_NOMMAE: TStringField
      FieldName = 'CLI_NOMMAE'
      Size = 45
    end
    object qryBuscaClienteCLI_FLSITU: TStringField
      FieldName = 'CLI_FLSITU'
      FixedChar = True
      Size = 1
    end
  end
  object qryCredeciado: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCCRE')
    SQLConnection = SQLConnection1
    Left = 712
    Top = 312
  end
  object qryAtualizaCartao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCCAR')
    SQLConnection = SQLConnection1
    Left = 712
    Top = 360
  end
  object qryDebito: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCDEB')
    SQLConnection = SQLConnection1
    Left = 720
    Top = 408
  end
  object qryLocVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCMOV')
    SQLConnection = SQLConnection1
    Left = 776
    Top = 240
  end
  object qryAtualizaDebito: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCDEB')
    SQLConnection = SQLConnection1
    Left = 738
    Top = 279
  end
  object qrySitucao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCSIT')
    SQLConnection = SQLConnection1
    Left = 240
    Top = 8
  end
  object qrySituacaoCartao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ACCSIT')
    SQLConnection = SQLConnection1
    Left = 144
    Top = 8
    object qrySituacaoCartaoSIT_SIGSIT: TStringField
      FieldName = 'SIT_SIGSIT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySituacaoCartaoSIT_NMSITU: TStringField
      FieldName = 'SIT_NMSITU'
      Required = True
      Size = 11
    end
  end
  object dstUsuarios: TSQLDataSet
    CommandText = 'select * from ACCSEN'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 448
    object dstUsuariosSEN_CDUSUA: TStringField
      FieldName = 'SEN_CDUSUA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstUsuariosSEN_NMUSUA: TStringField
      FieldName = 'SEN_NMUSUA'
      Required = True
      Size = 40
    end
    object dstUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Required = True
      Size = 6
    end
    object dstUsuariosSEN_NMCARG: TStringField
      FieldName = 'SEN_NMCARG'
      Size = 30
    end
    object dstUsuariosSEN_NMTERM: TStringField
      FieldName = 'SEN_NMTERM'
    end
    object dstUsuariosSEN_FLSUPE: TStringField
      FieldName = 'SEN_FLSUPE'
      FixedChar = True
      Size = 1
    end
    object dstUsuariosSEN_CDGRUP: TStringField
      FieldName = 'SEN_CDGRUP'
      FixedChar = True
      Size = 2
    end
    object dstUsuariosSEN_DTATUA: TDateField
      FieldName = 'SEN_DTATUA'
    end
    object dstUsuariosSEN_DTATU1: TStringField
      FieldName = 'SEN_DTATU1'
      Size = 8
    end
    object dstUsuariosSEN_FLEXCL: TStringField
      FieldName = 'SEN_FLEXCL'
      FixedChar = True
      Size = 1
    end
    object dstUsuariosSEN_FLLOGA: TStringField
      FieldName = 'SEN_FLLOGA'
      FixedChar = True
      Size = 1
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = dstUsuarios
    Left = 112
    Top = 448
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 192
    Top = 448
    object cdsUsuariosSEN_CDUSUA: TStringField
      Alignment = taRightJustify
      FieldName = 'SEN_CDUSUA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsUsuariosSEN_NMUSUA: TStringField
      FieldName = 'SEN_NMUSUA'
      Required = True
      Size = 40
    end
    object cdsUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Required = True
      Size = 6
    end
    object cdsUsuariosSEN_NMCARG: TStringField
      FieldName = 'SEN_NMCARG'
      Size = 30
    end
    object cdsUsuariosSEN_NMTERM: TStringField
      FieldName = 'SEN_NMTERM'
    end
    object cdsUsuariosSEN_FLSUPE: TStringField
      FieldName = 'SEN_FLSUPE'
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosSEN_CDGRUP: TStringField
      FieldName = 'SEN_CDGRUP'
      FixedChar = True
      Size = 2
    end
    object cdsUsuariosSEN_DTATUA: TDateField
      FieldName = 'SEN_DTATUA'
    end
    object cdsUsuariosSEN_DTATU1: TStringField
      FieldName = 'SEN_DTATU1'
      Size = 8
    end
    object cdsUsuariosSEN_FLEXCL: TStringField
      FieldName = 'SEN_FLEXCL'
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosSEN_FLLOGA: TStringField
      FieldName = 'SEN_FLLOGA'
      FixedChar = True
      Size = 1
    end
  end
end
