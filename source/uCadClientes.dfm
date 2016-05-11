object frmCadClientes: TfrmCadClientes
  Left = 152
  Top = 104
  Width = 673
  Height = 457
  Caption = 'Clientes'
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 32
    Align = alTop
    Color = clBlue
    TabOrder = 0
    object DBText1: TDBText
      Left = 10
      Top = 4
      Width = 91
      Height = 24
      AutoSize = True
      DataField = 'CLI_NMCLIE'
      DataSource = dsClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlDadosComp: TPanel
    Left = 0
    Top = 32
    Width = 665
    Height = 312
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 663
      Height = 310
      ActivePage = tbsBasico
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object tbsBasico: TTabSheet
        Caption = 'Dados &B'#225'sico'
        ImageIndex = 5
        object Label53: TLabel
          Left = 89
          Top = 8
          Width = 76
          Height = 13
          Caption = 'Tipo de pessoa:'
        end
        object Label2: TLabel
          Left = 194
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Label1: TLabel
          Left = 16
          Top = 49
          Width = 76
          Height = 13
          Caption = 'Nome do cart'#227'o'
        end
        object Label6: TLabel
          Left = 16
          Top = 89
          Width = 53
          Height = 13
          Caption = 'Identidade:'
        end
        object Label11: TLabel
          Left = 16
          Top = 129
          Width = 64
          Height = 13
          Caption = 'Nome do Pai:'
        end
        object Label7: TLabel
          Left = 125
          Top = 89
          Width = 70
          Height = 13
          Caption = #211'rg'#227'o emissor:'
        end
        object Label8: TLabel
          Left = 207
          Top = 89
          Width = 17
          Height = 13
          Caption = 'UF:'
        end
        object Label9: TLabel
          Left = 264
          Top = 89
          Width = 50
          Height = 13
          Caption = 'CPF/CGC:'
        end
        object Label3: TLabel
          Left = 396
          Top = 49
          Width = 59
          Height = 13
          Caption = 'Nascimento:'
        end
        object Label4: TLabel
          Left = 500
          Top = 49
          Width = 27
          Height = 13
          Caption = 'Sexo:'
        end
        object Label12: TLabel
          Left = 16
          Top = 169
          Width = 70
          Height = 13
          Caption = 'Nome do M'#227'e:'
        end
        object Label10: TLabel
          Left = 396
          Top = 89
          Width = 31
          Height = 13
          Caption = 'E-mail:'
        end
        object Label5: TLabel
          Left = 593
          Top = 48
          Width = 57
          Height = 13
          Caption = 'Estado civil:'
        end
        object DBText2: TDBText
          Left = 16
          Top = 27
          Width = 65
          Height = 17
          DataField = 'CLI_CDCLIE'
          DataSource = dsClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 17
          Top = 8
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
        end
        object dbeNMCLIE: TDBEdit
          Left = 192
          Top = 24
          Width = 517
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_NMCLIE'
          DataSource = dsClientes
          TabOrder = 1
        end
        object dbeNMCART: TDBEdit
          Left = 16
          Top = 64
          Width = 375
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_NMCART'
          DataSource = dsClientes
          TabOrder = 2
          OnEnter = dbeNMCARTEnter
        end
        object dbeNRIDEN: TDBEdit
          Left = 16
          Top = 104
          Width = 110
          Height = 21
          DataField = 'CLI_NRIDEN'
          DataSource = dsClientes
          TabOrder = 6
          OnExit = dbeNRIDENExit
        end
        object DBEdit7: TDBEdit
          Left = 131
          Top = 104
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_ORGEMI'
          DataSource = dsClientes
          TabOrder = 7
        end
        object cmbUFEMISS: TDBComboBox
          Left = 205
          Top = 104
          Width = 55
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'CLI_UFEMIS'
          DataSource = dsClientes
          ItemHeight = 16
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PE'
            'PR'
            'PI'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 8
        end
        object dbeCPFCGC: TDBEdit
          Left = 264
          Top = 104
          Width = 129
          Height = 21
          DataField = 'CLI_CPFCGC'
          DataSource = dsClientes
          MaxLength = 15
          TabOrder = 9
          OnExit = dbeCPFCGCExit
        end
        object DBEdit11: TDBEdit
          Left = 396
          Top = 104
          Width = 313
          Height = 21
          CharCase = ecLowerCase
          DataField = 'CLI_EMAIL'
          DataSource = dsClientes
          TabOrder = 10
        end
        object DBEdit23: TDBEdit
          Left = 16
          Top = 144
          Width = 693
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_NOMPAI'
          DataSource = dsClientes
          TabOrder = 11
        end
        object DBEdit28: TDBEdit
          Left = 16
          Top = 184
          Width = 693
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_NOMMAE'
          DataSource = dsClientes
          TabOrder = 12
        end
        object dbeDTNASC: TDBDateEdit
          Left = 396
          Top = 64
          Width = 101
          Height = 21
          DataField = 'CLI_DTNASC'
          DataSource = dsClientes
          NumGlyphs = 2
          TabOrder = 3
          OnExit = dbeDTNASCExit
        end
        object cmbTPPESSO: TDBLookupComboBox
          Left = 88
          Top = 24
          Width = 95
          Height = 21
          DataField = 'CLI_TPDESC'
          DataSource = dsClientes
          TabOrder = 0
        end
        object DBLookupComboBox9: TDBLookupComboBox
          Left = 499
          Top = 64
          Width = 91
          Height = 21
          DataField = 'CLI_SXDESC'
          DataSource = dsClientes
          TabOrder = 4
        end
        object DBLookupComboBox10: TDBLookupComboBox
          Left = 592
          Top = 64
          Width = 118
          Height = 21
          DataField = 'CLI_ECDESC'
          DataSource = dsClientes
          TabOrder = 5
        end
      end
      object tbsResid: TTabSheet
        Caption = 'Dados &Resid'#234'nciais'
        object Label14: TLabel
          Left = 16
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
        end
        object Label15: TLabel
          Left = 488
          Top = 8
          Width = 24
          Height = 13
          Caption = 'CEP:'
        end
        object Label16: TLabel
          Left = 16
          Top = 48
          Width = 67
          Height = 13
          Caption = 'Complemento:'
        end
        object Label17: TLabel
          Left = 16
          Top = 88
          Width = 30
          Height = 13
          Caption = 'Bairro:'
        end
        object Label18: TLabel
          Left = 351
          Top = 88
          Width = 36
          Height = 13
          Caption = 'Cidade:'
        end
        object Label19: TLabel
          Left = 16
          Top = 128
          Width = 27
          Height = 13
          Caption = 'Fone:'
        end
        object Label20: TLabel
          Left = 352
          Top = 128
          Width = 24
          Height = 13
          Caption = 'Tipo:'
        end
        object Label21: TLabel
          Left = 552
          Top = 128
          Width = 35
          Height = 13
          Caption = 'Celular:'
        end
        object Label22: TLabel
          Left = 16
          Top = 168
          Width = 95
          Height = 13
          Caption = 'Tipo de Resid'#234'ncia:'
        end
        object Label23: TLabel
          Left = 352
          Top = 168
          Width = 106
          Height = 13
          Caption = 'Tempo : Anos - Meses'
        end
        object Label24: TLabel
          Left = 553
          Top = 168
          Width = 101
          Height = 13
          Caption = 'Valor  da Resid'#234'ncia:'
        end
        object Label72: TLabel
          Left = 631
          Top = 88
          Width = 17
          Height = 13
          Caption = 'UF:'
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 24
          Width = 463
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_ENCLIE'
          DataSource = dsClientes
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 488
          Top = 24
          Width = 106
          Height = 21
          DataField = 'CLI_CEPCLI'
          DataSource = dsClientes
          MaxLength = 9
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 16
          Top = 64
          Width = 463
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_COMCLI'
          DataSource = dsClientes
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 16
          Top = 104
          Width = 329
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_BAICLI'
          DataSource = dsClientes
          TabOrder = 3
        end
        object DBEdit13: TDBEdit
          Left = 349
          Top = 104
          Width = 276
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_CIDCLI'
          DataSource = dsClientes
          TabOrder = 4
        end
        object DBEdit14: TDBEdit
          Left = 16
          Top = 144
          Width = 126
          Height = 21
          DataField = 'CLI_FONCLI'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 6
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 352
          Top = 144
          Width = 196
          Height = 21
          DataField = 'CLI_TPFONE'
          DataSource = dsClientes
          TabOrder = 7
        end
        object DBEdit15: TDBEdit
          Left = 552
          Top = 144
          Width = 130
          Height = 21
          DataField = 'CLI_CELCLI'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 8
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 16
          Top = 184
          Width = 161
          Height = 21
          DataField = 'CLI_TPRES2'
          DataSource = dsClientes
          TabOrder = 9
        end
        object DBEdit16: TDBEdit
          Left = 352
          Top = 184
          Width = 97
          Height = 21
          DataField = 'CLI_TMRESI'
          DataSource = dsClientes
          MaxLength = 5
          TabOrder = 10
        end
        object DBEdit17: TDBEdit
          Left = 552
          Top = 184
          Width = 130
          Height = 21
          DataField = 'CLI_VLRESI'
          DataSource = dsClientes
          TabOrder = 11
        end
        object DBComboBox1: TDBComboBox
          Left = 629
          Top = 103
          Width = 55
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'CLI_UFCLIE'
          DataSource = dsClientes
          ItemHeight = 16
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PE'
            'PR'
            'PI'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 5
        end
      end
      object tbsTrabalho: TTabSheet
        Caption = '&Trabalho'
        ImageIndex = 1
        object Label25: TLabel
          Left = 16
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Empresa:'
        end
        object Label26: TLabel
          Left = 16
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
        end
        object Label27: TLabel
          Left = 496
          Top = 48
          Width = 24
          Height = 13
          Caption = 'CEP:'
        end
        object Label28: TLabel
          Left = 16
          Top = 88
          Width = 30
          Height = 13
          Caption = 'Bairro:'
        end
        object Label29: TLabel
          Left = 352
          Top = 88
          Width = 36
          Height = 13
          Caption = 'Cidade:'
        end
        object Label30: TLabel
          Left = 16
          Top = 128
          Width = 40
          Height = 13
          Caption = 'V'#237'nculo:'
        end
        object Label31: TLabel
          Left = 200
          Top = 128
          Width = 82
          Height = 13
          Caption = 'Tipo de empresa:'
        end
        object Label32: TLabel
          Left = 352
          Top = 128
          Width = 157
          Height = 13
          Caption = 'Tempo de Servi'#231'o: Anos - Meses'
        end
        object Label33: TLabel
          Left = 16
          Top = 168
          Width = 35
          Height = 13
          Caption = 'S'#225'lario:'
        end
        object Label34: TLabel
          Left = 200
          Top = 168
          Width = 74
          Height = 13
          Caption = 'Outras Rendas:'
        end
        object Label35: TLabel
          Left = 352
          Top = 166
          Width = 27
          Height = 13
          Caption = 'Fone:'
        end
        object Label36: TLabel
          Left = 466
          Top = 166
          Width = 33
          Height = 13
          Caption = 'Ramal:'
        end
        object Label38: TLabel
          Left = 15
          Top = 206
          Width = 31
          Height = 13
          Caption = 'Cargo:'
        end
        object Label39: TLabel
          Left = 352
          Top = 209
          Width = 25
          Height = 13
          Caption = 'CGC:'
        end
        object Label64: TLabel
          Left = 526
          Top = 168
          Width = 56
          Height = 13
          Caption = 'Propriet'#225'rio:'
        end
        object Label65: TLabel
          Left = 558
          Top = 185
          Width = 42
          Height = 13
          Caption = 'Sim/N'#227'o'
        end
        object Label67: TLabel
          Left = 558
          Top = 227
          Width = 42
          Height = 13
          Caption = 'Sim/N'#227'o'
        end
        object Label68: TLabel
          Left = 526
          Top = 207
          Width = 48
          Height = 13
          Caption = 'Conv'#234'nio:'
        end
        object Label69: TLabel
          Left = 263
          Top = 148
          Width = 82
          Height = 13
          Caption = 'P'#250'blica / priVada'
        end
        object DBEdit19: TDBEdit
          Left = 16
          Top = 24
          Width = 589
          Height = 21
          DataField = 'CLI_NMEMPR'
          DataSource = dsClientes
          TabOrder = 0
        end
        object DBEdit21: TDBEdit
          Left = 16
          Top = 64
          Width = 475
          Height = 21
          DataField = 'CLI_ENEMPR'
          DataSource = dsClientes
          TabOrder = 1
        end
        object DBEdit22: TDBEdit
          Left = 496
          Top = 64
          Width = 108
          Height = 21
          DataField = 'CLI_CEPEMP'
          DataSource = dsClientes
          MaxLength = 9
          TabOrder = 2
        end
        object DBEdit24: TDBEdit
          Left = 16
          Top = 104
          Width = 329
          Height = 21
          DataField = 'CLI_BAEMPR'
          DataSource = dsClientes
          TabOrder = 3
        end
        object DBEdit25: TDBEdit
          Left = 352
          Top = 104
          Width = 251
          Height = 21
          DataField = 'CLI_CIEMPR'
          DataSource = dsClientes
          TabOrder = 4
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 16
          Top = 144
          Width = 182
          Height = 21
          DataField = 'CLI_VIEMPR'
          DataSource = dsClientes
          TabOrder = 5
        end
        object edtTPEMPR: TDBEdit
          Left = 201
          Top = 144
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_TIPEMP'
          DataSource = dsClientes
          TabOrder = 6
          OnKeyPress = edtTPEMPRKeyPress
        end
        object DBEdit26: TDBEdit
          Left = 352
          Top = 144
          Width = 89
          Height = 21
          DataField = 'CLI_TMSERV'
          DataSource = dsClientes
          MaxLength = 5
          TabOrder = 7
          OnKeyPress = DBEdit26KeyPress
        end
        object DBEdit27: TDBEdit
          Left = 16
          Top = 182
          Width = 181
          Height = 21
          DataField = 'CLI_VLSALA'
          DataSource = dsClientes
          TabOrder = 8
        end
        object DBEdit29: TDBEdit
          Left = 201
          Top = 182
          Width = 144
          Height = 21
          DataField = 'CLI_VLOUTR'
          DataSource = dsClientes
          TabOrder = 9
        end
        object DBEdit30: TDBEdit
          Left = 352
          Top = 182
          Width = 111
          Height = 21
          DataField = 'CLI_FONEMP'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 10
        end
        object DBEdit31: TDBEdit
          Left = 466
          Top = 182
          Width = 56
          Height = 21
          DataField = 'CLI_RAMEMP'
          DataSource = dsClientes
          TabOrder = 11
        end
        object DBEdit9: TDBEdit
          Left = 526
          Top = 182
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_FLPROP'
          DataSource = dsClientes
          TabOrder = 12
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit32: TDBEdit
          Left = 16
          Top = 222
          Width = 329
          Height = 21
          DataField = 'CLI_NMCARG'
          DataSource = dsClientes
          TabOrder = 13
        end
        object DBEdit33: TDBEdit
          Left = 352
          Top = 222
          Width = 169
          Height = 21
          DataField = 'CLI_CGCEMP'
          DataSource = dsClientes
          MaxLength = 18
          TabOrder = 14
        end
        object DBEdit12: TDBEdit
          Left = 526
          Top = 222
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_FLCONV'
          DataSource = dsClientes
          TabOrder = 15
          OnKeyPress = DBEdit12KeyPress
        end
      end
      object tbsConjuge: TTabSheet
        Caption = '&C'#244'njuge'
        ImageIndex = 2
        object Label40: TLabel
          Left = 16
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Label41: TLabel
          Left = 16
          Top = 46
          Width = 110
          Height = 13
          Caption = 'Empresa que Trabalho:'
        end
        object Label42: TLabel
          Left = 16
          Top = 86
          Width = 86
          Height = 13
          Caption = 'Fone da Empresa:'
        end
        object Label43: TLabel
          Left = 160
          Top = 86
          Width = 35
          Height = 13
          Caption = 'Celular:'
        end
        object Label44: TLabel
          Left = 16
          Top = 127
          Width = 23
          Height = 13
          Caption = 'CPF:'
        end
        object DBEdit34: TDBEdit
          Left = 16
          Top = 24
          Width = 440
          Height = 21
          DataField = 'CLI_NOMCJG'
          DataSource = dsClientes
          TabOrder = 0
        end
        object DBEdit35: TDBEdit
          Left = 16
          Top = 62
          Width = 440
          Height = 21
          DataField = 'CLI_EMPCJG'
          DataSource = dsClientes
          TabOrder = 1
        end
        object DBEdit36: TDBEdit
          Left = 16
          Top = 101
          Width = 134
          Height = 21
          DataField = 'CLI_FONCJG'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 2
        end
        object DBEdit37: TDBEdit
          Left = 160
          Top = 101
          Width = 134
          Height = 21
          DataField = 'CLI_CELCJG'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 3
        end
        object DBEdit38: TDBEdit
          Left = 16
          Top = 144
          Width = 134
          Height = 21
          DataField = 'CLI_CPFCJG'
          DataSource = dsClientes
          MaxLength = 15
          TabOrder = 4
        end
      end
      object tbsCompl: TTabSheet
        Caption = 'Dados C&omplementares'
        ImageIndex = 3
        object Label45: TLabel
          Left = 16
          Top = 8
          Width = 83
          Height = 13
          Caption = 'Correspondencia:'
        end
        object Label46: TLabel
          Left = 135
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Outros Bens:'
        end
        object Label47: TLabel
          Left = 417
          Top = 7
          Width = 27
          Height = 13
          Caption = 'Valor:'
          FocusControl = DBEdit45
        end
        object Label49: TLabel
          Left = 16
          Top = 82
          Width = 55
          Height = 13
          Caption = 'Refer'#234'ncia:'
        end
        object Label50: TLabel
          Left = 416
          Top = 82
          Width = 27
          Height = 13
          Caption = 'Fone:'
        end
        object Label51: TLabel
          Left = 16
          Top = 122
          Width = 55
          Height = 13
          Caption = 'Refer'#234'ncia:'
        end
        object Label52: TLabel
          Left = 416
          Top = 122
          Width = 27
          Height = 13
          Caption = 'Fone:'
        end
        object Label37: TLabel
          Left = 16
          Top = 162
          Width = 79
          Height = 13
          Caption = 'Conta no banco:'
        end
        object Label48: TLabel
          Left = 16
          Top = 202
          Width = 45
          Height = 13
          Caption = 'Situa'#231#227'o:'
        end
        object Label66: TLabel
          Left = 416
          Top = 200
          Width = 49
          Height = 13
          Caption = 'Desconto:'
        end
        object Label60: TLabel
          Left = 16
          Top = 46
          Width = 63
          Height = 13
          Caption = 'Outro Cartao:'
          Transparent = True
        end
        object Label61: TLabel
          Left = 53
          Top = 63
          Width = 42
          Height = 13
          Caption = 'Sim/N'#227'o'
          Transparent = True
        end
        object Label70: TLabel
          Left = 416
          Top = 162
          Width = 74
          Height = 13
          Caption = 'Conta Especial:'
          Transparent = True
        end
        object Label71: TLabel
          Left = 450
          Top = 182
          Width = 42
          Height = 13
          Caption = 'Sim/N'#227'o'
          Transparent = True
        end
        object lbl_porcentagem: TLabel
          Left = 553
          Top = 222
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object DBEdit45: TDBEdit
          Left = 417
          Top = 25
          Width = 134
          Height = 21
          DataField = 'CLI_VLBENS'
          DataSource = dsClientes
          TabOrder = 2
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 16
          Top = 25
          Width = 113
          Height = 21
          DataField = 'CLI_ENCOR2'
          DataSource = dsClientes
          TabOrder = 0
        end
        object DBEdit39: TDBEdit
          Left = 132
          Top = 25
          Width = 279
          Height = 21
          DataField = 'CLI_NMBENS'
          DataSource = dsClientes
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 60
          Width = 32
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_OUTCAR'
          DataSource = dsClientes
          TabOrder = 3
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit40: TDBEdit
          Left = 16
          Top = 98
          Width = 394
          Height = 21
          DataField = 'CLI_NMREF1'
          DataSource = dsClientes
          TabOrder = 4
        end
        object DBEdit41: TDBEdit
          Left = 416
          Top = 98
          Width = 134
          Height = 21
          DataField = 'CLI_FOREF1'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 5
        end
        object DBEdit42: TDBEdit
          Left = 16
          Top = 136
          Width = 394
          Height = 21
          DataField = 'CLI_NMREF2'
          DataSource = dsClientes
          TabOrder = 6
        end
        object DBEdit43: TDBEdit
          Left = 416
          Top = 136
          Width = 134
          Height = 21
          DataField = 'CLI_FOREF2'
          DataSource = dsClientes
          MaxLength = 13
          TabOrder = 7
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 16
          Top = 177
          Width = 395
          Height = 21
          DataField = 'CLI_NMBANC'
          DataSource = dsClientes
          TabOrder = 8
        end
        object DBEdit20: TDBEdit
          Left = 416
          Top = 177
          Width = 33
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_FLESPE'
          DataSource = dsClientes
          TabOrder = 9
          OnKeyPress = DBEdit20KeyPress
        end
        object dbcSituacao: TDBLookupComboBox
          Left = 16
          Top = 216
          Width = 274
          Height = 21
          DataField = 'CLI_NMSITU'
          DataSource = dsClientes
          TabOrder = 10
        end
        object dbeVLDESC: TDBEdit
          Left = 416
          Top = 216
          Width = 134
          Height = 21
          DataField = 'CLI_PEDESC'
          DataSource = dsClientes
          TabOrder = 11
        end
      end
      object tbsAnalise: TTabSheet
        Caption = '&An'#225'lise'
        ImageIndex = 4
        object Label54: TLabel
          Left = 16
          Top = 9
          Width = 26
          Height = 13
          Caption = 'Data:'
        end
        object Label55: TLabel
          Left = 249
          Top = 9
          Width = 26
          Height = 13
          Caption = 'Hora:'
        end
        object Label56: TLabel
          Left = 16
          Top = 84
          Width = 105
          Height = 13
          Caption = 'Local registro do SPC:'
        end
        object Label57: TLabel
          Left = 16
          Top = 125
          Width = 61
          Height = 13
          Caption = 'Observa'#231#227'o:'
        end
        object Label58: TLabel
          Left = 16
          Top = 206
          Width = 45
          Height = 13
          Caption = 'Situa'#231#227'o:'
        end
        object Label59: TLabel
          Left = 249
          Top = 205
          Width = 30
          Height = 13
          Caption = 'Limite:'
        end
        object Label62: TLabel
          Left = 16
          Top = 47
          Width = 81
          Height = 13
          Caption = 'Registro no SPC:'
        end
        object Label63: TLabel
          Left = 50
          Top = 65
          Width = 42
          Height = 13
          Caption = 'Sim/N'#227'o'
        end
        object ckbReg: TDBCheckBox
          Left = 160
          Top = 53
          Width = 134
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Registro no SPC:'
          DataField = 'CLI_SPCANA'
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object edtData: TDBEdit
          Left = 16
          Top = 24
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'CLI_DATANA'
          DataSource = dsClientes
          MaxLength = 10
          ReadOnly = True
          TabOrder = 1
        end
        object edtHora: TDBEdit
          Left = 248
          Top = 24
          Width = 108
          Height = 21
          TabStop = False
          DataField = 'CLI_HORANA'
          DataSource = dsClientes
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 16
          Top = 62
          Width = 33
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_SPCANA'
          DataSource = dsClientes
          TabOrder = 3
          OnKeyPress = DBEdit8KeyPress
        end
        object DBEdit48: TDBEdit
          Left = 16
          Top = 101
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLI_LOCANA'
          DataSource = dsClientes
          TabOrder = 4
        end
        object DBLookupComboBox6: TDBLookupComboBox
          Left = 16
          Top = 221
          Width = 228
          Height = 21
          DataField = 'CLI_NMSITU'
          DataSource = dsClientes
          TabOrder = 6
        end
        object DBEdit6: TDBEdit
          Left = 250
          Top = 221
          Width = 132
          Height = 21
          DataField = 'CLI_LIMANA'
          DataSource = dsClientes
          TabOrder = 7
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 139
          Width = 369
          Height = 65
          DataField = 'CLI_OBSANA'
          DataSource = dsClientes
          TabOrder = 5
          OnKeyPress = DBMemo1KeyPress
        end
      end
    end
  end
  object pnlComandos: TPanel
    Left = 0
    Top = 383
    Width = 665
    Height = 40
    Align = alBottom
    TabOrder = 2
    object btAdicionar: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Adicionar'
      TabOrder = 0
      OnClick = btAdicionarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
        0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
        0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
        111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object btEditar: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Action = DataSetEdit1
      Caption = '&Editar'
      TabOrder = 1
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E0E0E0E0E0E0B08031B1B0A0E1818181818181818181809041B1B0E0E181B1B
        1B1B1B1B1B1B180A051B1B0E0E0E181B1B1B1B1B1B180B0A061B1B0E0E0E0E18
        1B1B1B1B180B0A0A061B1B0E10100E0E181B1B180E0B0A0A061B1B0E1313100E
        0E18180E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
        11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object btExcluir: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = btExcluirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
        0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
        0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
        11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object btGravar: TBitBtn
      Left = 512
      Top = 8
      Width = 69
      Height = 25
      Action = DataSetPost1
      Caption = '&Gravar'
      TabOrder = 4
      OnClick = btGravarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
        1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
        1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
        1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
        13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
    object btCancelar: TBitBtn
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Action = DataSetCancel1
      Caption = '&Cancelar'
      TabOrder = 5
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F1F1D
        111111111D1F0A08031F1F0A0E11131F1D11111D1F0E0B09041F1F0C11131111
        1F1D1D1F110E0B0A051F1F0E13111111111F1D110F0C0A0A061F1F0F13131111
        1D1F1F1D0E0B0A0A061F1F131515131D1F100F1F1D0A0A0A061F1F1318181D1F
        13130F0E1F1D0A0A061F1F151A191F151514110F0E1F0A0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
    object btLocalizar: TBitBtn
      Left = 261
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 3
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
    object btAplicar: TBitBtn
      Left = 687
      Top = 7
      Width = 75
      Height = 25
      Action = ClientDataSetApply1
      Caption = 'Aplicar'
      TabOrder = 6
      Visible = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF4F6B82
        3E5E84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF489DDD1A7FEA41638AFF00FFFF00FFFF00FF0D
        8FC90D8FC90D8FC90D8FC90D8FC90D8FC90D8FC9FF00FFFF00FFFF00FFFF00FF
        37A9FF1C7BE34C6387FF00FF0D8FC96DDAFC76D3F75DC7EF42BAE72FB1E328AB
        E226A9E00D8FC9FF00FFFF00FFFF00FFFF00FF38A7FF1F79D54D627F3B8EB09F
        B6BBABB7BD86BAD055C4EB3ABBEA30B1E32BADE20D8FC9FF00FFFF00FFFF00FF
        FF00FFFF00FF57B0F4A18C81D9C7A1FFFACBFFFBCBEBD8C08FAFBF45C5F03BBD
        EB35B6E90D8FC9FF00FFFF00FFFF00FFFF00FFFF00FF7491A6EFC997FFF2B6FF
        FFD1FFFFE0FFFFFFE1D4CE779FAB48C9F242C2EE0D8FC9FF00FFFF00FFFF00FF
        FF00FFFF00FFC99787F6CA8BF6D097FFFFD3FFFFEAFFFFF4F8F6D1C5AF9C58CF
        F251CFF40D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFCA9A8CFACF8FEDB475FB
        EFBCFFFFD9FFFFD8FBFACCC7B29F63D7F65ED9FA0D8FC9FF00FFFF00FFFF00FF
        FF00FFFF00FF7A8890EADAB4FBE3BDEFC086F4D49DFFF6BDF3E2B58FB0B467E1
        FE6CE2FE0D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAC9292F0E1D1FB
        D99CF7CA89F2CE9AAFB2B06FE0FA69E3FE72E7FF0D8FC9FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF4B88A0BCC1B5D1C7BBC1C5CBA3E7FE74E5FF69E2
        FE72E7FF0D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC99F
        F6FFD3F8FFD0F7FFADEFFF78E6FF6DE5FF74E9FF0D8FC9FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0D8FC99DEFFFADE3F69ADAF27BD5F258D0F258D4
        F46DE3FB0D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC955
        C0E65DBFE362C4E65EC4E752C1E63EBAE23ABBE30D8FC9FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0D8FC978CEEAA7EEFC99EFFF89EEFF7DEBFF75E9
        FF57D3EF0D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D
        8FC90D8FC90D8FC90D8FC90D8FC90D8FC90D8FC9FF00FFFF00FF}
    end
  end
  object GridClientes: TDBGrid
    Left = 0
    Top = 344
    Width = 665
    Height = 39
    Align = alBottom
    DataSource = dsClientes
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
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
        Width = 53
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
        Width = 329
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_CPFCGC'
        Title.Caption = 'CPF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 144
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CLI_FLSITU'
        Title.Caption = 'SITU'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 68
        Visible = True
      end>
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dmInfoCartao.cdsClientes
    OnStateChange = dsClientesStateChange
    OnDataChange = dsClientesDataChange
    Left = 360
    Top = 112
  end
  object ActionList1: TActionList
    Images = frmPrincipal.ImageList1
    Left = 472
    Top = 8
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = 'DataSetFirst1'
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = 'DataSetPrior1'
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = 'DataSetNext1'
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = 'DataSetLast1'
    end
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = 'DataSetInsert1'
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = 'DataSetDelete1'
    end
    object DataSetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = 'DataSetEdit1'
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'DataSetPost1'
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = 'DataSetCancel1'
    end
    object ClientDataSetApply1: TClientDataSetApply
      Category = 'Dataset'
      Caption = 'Apply Updates'
      ImageIndex = 37
      DisplayErrorDlg = False
    end
  end
end
