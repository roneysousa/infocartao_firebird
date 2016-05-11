unit udmRelatorios;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, RpCon,
  RpConDS, RpRave, RpDefine, RpBase, RpSystem;

type
  TdmRelatorios = class(TDataModule)
    dstCartaoRel: TSQLDataSet;
    dstClientesRel: TSQLDataSet;
    dstBoletosRel: TSQLDataSet;
    dspCartaoRel: TDataSetProvider;
    cdsCartaoRel: TClientDataSet;
    RvSystem1: TRvSystem;
    rvpClientesporCartao: TRvProject;
    dscCartoes: TRvDataSetConnection;
    dstCartaoRelCAR_NRCART: TStringField;
    dstCartaoRelCAR_CDCLIE: TStringField;
    dstCartaoRelCLI_NMCLIE: TStringField;
    dstCartaoRelCAR_NMCLIE: TStringField;
    dstCartaoRelCAR_DTEMIS: TDateField;
    dstCartaoRelCAR_VLLIMI: TFMTBCDField;
    dstCartaoRelCAR_DIAFAT: TIntegerField;
    dstCartaoRelCAR_FLSITU: TStringField;
    dstCartaoRelSIT_NMSITU: TStringField;
    cdsCartaoRelCAR_NRCART: TStringField;
    cdsCartaoRelCAR_CDCLIE: TStringField;
    cdsCartaoRelCLI_NMCLIE: TStringField;
    cdsCartaoRelCAR_NMCLIE: TStringField;
    cdsCartaoRelCAR_DTEMIS: TDateField;
    cdsCartaoRelCAR_VLLIMI: TFMTBCDField;
    cdsCartaoRelCAR_DIAFAT: TIntegerField;
    cdsCartaoRelCAR_FLSITU: TStringField;
    cdsCartaoRelSIT_NMSITU: TStringField;
    dspClientesRel: TDataSetProvider;
    cdsClientesRel: TClientDataSet;
    cdsClientesRelCLI_CDCLIE: TStringField;
    cdsClientesRelCLI_NMCLIE: TStringField;
    cdsClientesRelCLI_NMCART: TStringField;
    cdsClientesRelCLI_TPPESS: TStringField;
    cdsClientesRelCLI_NRIDEN: TStringField;
    cdsClientesRelCLI_CPFCGC: TStringField;
    cdsClientesRelCLI_ENCLIE: TStringField;
    cdsClientesRelCLI_CEPCLI: TStringField;
    cdsClientesRelCLI_COMCLI: TStringField;
    cdsClientesRelCLI_BAICLI: TStringField;
    cdsClientesRelCLI_CIDCLI: TStringField;
    cdsClientesRelCLI_UFCLIE: TStringField;
    cdsClientesRelCLI_FONCLI: TStringField;
    cdsClientesRelCLI_NMEMPR: TStringField;
    cdsClientesRelCLI_ENEMPR: TStringField;
    cdsClientesRelCLI_CEPEMP: TStringField;
    cdsClientesRelCLI_BAEMPR: TStringField;
    cdsClientesRelCLI_CIEMPR: TStringField;
    cdsClientesRelCLI_VLSALA: TFloatField;
    cdsClientesRelCLI_FONEMP: TStringField;
    cdsClientesRelCLI_RAMEMP: TStringField;
    cdsClientesRelCLI_NMCARG: TStringField;
    cdsClientesRelCLI_NOMCJG: TStringField;
    cdsClientesRelCLI_EMPCJG: TStringField;
    cdsClientesRelCLI_FONCJG: TStringField;
    cdsClientesRelCLI_CELCJG: TStringField;
    cdsClientesRelCLI_CPFCJG: TStringField;
    cdsClientesRelCLI_FLSITU: TStringField;
    cdsClientesRelCLI_LIMANA: TFloatField;
    cdsClientesRelCLI_FLCONV: TStringField;
    cdsClientesRelCLI_NRCART: TStringField;
    rvpClientes: TRvProject;
    dscClientes: TRvDataSetConnection;
    dstClientesRelCLI_CDCLIE: TStringField;
    dstClientesRelCLI_NMCLIE: TStringField;
    dstClientesRelCLI_NMCART: TStringField;
    dstClientesRelCLI_TPPESS: TStringField;
    dstClientesRelCLI_NRIDEN: TStringField;
    dstClientesRelCLI_CPFCGC: TStringField;
    dstClientesRelCLI_ENCLIE: TStringField;
    dstClientesRelCLI_CEPCLI: TStringField;
    dstClientesRelCLI_COMCLI: TStringField;
    dstClientesRelCLI_BAICLI: TStringField;
    dstClientesRelCLI_CIDCLI: TStringField;
    dstClientesRelCLI_UFCLIE: TStringField;
    dstClientesRelCLI_FONCLI: TStringField;
    dstClientesRelCLI_NMEMPR: TStringField;
    dstClientesRelCLI_ENEMPR: TStringField;
    dstClientesRelCLI_CEPEMP: TStringField;
    dstClientesRelCLI_BAEMPR: TStringField;
    dstClientesRelCLI_CIEMPR: TStringField;
    dstClientesRelCLI_VLSALA: TFloatField;
    dstClientesRelCLI_FONEMP: TStringField;
    dstClientesRelCLI_RAMEMP: TStringField;
    dstClientesRelCLI_NMCARG: TStringField;
    dstClientesRelCLI_NOMCJG: TStringField;
    dstClientesRelCLI_EMPCJG: TStringField;
    dstClientesRelCLI_FONCJG: TStringField;
    dstClientesRelCLI_CELCJG: TStringField;
    dstClientesRelCLI_CPFCJG: TStringField;
    dstClientesRelCLI_FLSITU: TStringField;
    dstClientesRelCLI_LIMANA: TFloatField;
    dstClientesRelCLI_FLCONV: TStringField;
    dstClientesRelCLI_NRCART: TStringField;
    dstClientesRelCAR_DIAFAT: TIntegerField;
    cdsClientesRelCAR_DIAFAT: TIntegerField;
    dspBoletosRel: TDataSetProvider;
    cdsBoletosRel: TClientDataSet;
    rvpAvisoSPC: TRvProject;
    dscAviso: TRvDataSetConnection;
    dstBoletosRelBOL_NRDOCU: TStringField;
    dstBoletosRelBOL_NRFATU: TStringField;
    dstBoletosRelBOL_NRCART: TStringField;
    dstBoletosRelBOL_LOCPAG: TStringField;
    dstBoletosRelBOL_DTVENC: TDateField;
    dstBoletosRelBOL_NMCEDE: TStringField;
    dstBoletosRelBOL_DTDOCU: TDateField;
    dstBoletosRelBOL_VLDOCU: TFloatField;
    dstBoletosRelBOL_NMSACA: TStringField;
    dstBoletosRelBOL_ENDERE: TStringField;
    dstBoletosRelBOL_COMPLE: TStringField;
    dstBoletosRelBOL_CEPSAC: TStringField;
    dstBoletosRelBOL_BAIRRO: TStringField;
    dstBoletosRelBOL_CIDADE: TStringField;
    dstBoletosRelBOL_UFSACA: TStringField;
    dstBoletosRelBOL_CPFCGC: TStringField;
    dstBoletosRelBOL_TPPESS: TStringField;
    dstBoletosRelBOL_FLSITU: TStringField;
    dstBoletosRelBOL_DTPAGA: TDateField;
    dstBoletosRelBOL_CDCLIE: TStringField;
    cdsBoletosRelBOL_NRDOCU: TStringField;
    cdsBoletosRelBOL_NRFATU: TStringField;
    cdsBoletosRelBOL_NRCART: TStringField;
    cdsBoletosRelBOL_LOCPAG: TStringField;
    cdsBoletosRelBOL_DTVENC: TDateField;
    cdsBoletosRelBOL_NMCEDE: TStringField;
    cdsBoletosRelBOL_DTDOCU: TDateField;
    cdsBoletosRelBOL_VLDOCU: TFloatField;
    cdsBoletosRelBOL_NMSACA: TStringField;
    cdsBoletosRelBOL_ENDERE: TStringField;
    cdsBoletosRelBOL_COMPLE: TStringField;
    cdsBoletosRelBOL_CEPSAC: TStringField;
    cdsBoletosRelBOL_BAIRRO: TStringField;
    cdsBoletosRelBOL_CIDADE: TStringField;
    cdsBoletosRelBOL_UFSACA: TStringField;
    cdsBoletosRelBOL_CPFCGC: TStringField;
    cdsBoletosRelBOL_TPPESS: TStringField;
    cdsBoletosRelBOL_FLSITU: TStringField;
    cdsBoletosRelBOL_DTPAGA: TDateField;
    cdsBoletosRelBOL_CDCLIE: TStringField;
    rvpRecibo: TRvProject;
    dscRecibo: TRvDataSetConnection;
    rvpReciboEntrega: TRvProject;
    dscEntrega: TRvDataSetConnection;
    dstEnvelopesClientes: TSQLDataSet;
    dspEnvelClientes: TDataSetProvider;
    cdsEnvelClientes: TClientDataSet;
    dstEnvelopesClientesCLI_CDCLIE: TStringField;
    dstEnvelopesClientesCLI_NMCLIE: TStringField;
    dstEnvelopesClientesCLI_NMCART: TStringField;
    dstEnvelopesClientesCLI_ENCLIE: TStringField;
    dstEnvelopesClientesCLI_CEPCLI: TStringField;
    dstEnvelopesClientesCLI_COMCLI: TStringField;
    dstEnvelopesClientesCLI_BAICLI: TStringField;
    dstEnvelopesClientesCLI_CIDCLI: TStringField;
    dstEnvelopesClientesCLI_UFCLIE: TStringField;
    cdsEnvelClientesCLI_CDCLIE: TStringField;
    cdsEnvelClientesCLI_NMCLIE: TStringField;
    cdsEnvelClientesCLI_NMCART: TStringField;
    cdsEnvelClientesCLI_ENCLIE: TStringField;
    cdsEnvelClientesCLI_CEPCLI: TStringField;
    cdsEnvelClientesCLI_COMCLI: TStringField;
    cdsEnvelClientesCLI_BAICLI: TStringField;
    cdsEnvelClientesCLI_CIDCLI: TStringField;
    cdsEnvelClientesCLI_UFCLIE: TStringField;
    dstMovimentosRel: TSQLDataSet;
    dspMovimentoRel: TDataSetProvider;
    cdsMovimentoRel: TClientDataSet;
    rvpMovCredenciado: TRvProject;
    dscMovCredenciado: TRvDataSetConnection;
    dstMovimentosRelMOV_NRVEND: TStringField;
    dstMovimentosRelMOV_NRCART: TStringField;
    dstMovimentosRelMOV_CDCRED: TStringField;
    dstMovimentosRelMOV_DTMOVI: TDateField;
    dstMovimentosRelMOV_HOMOVI: TStringField;
    dstMovimentosRelMOV_VLVEND: TFloatField;
    dstMovimentosRelMOV_QTPARC: TIntegerField;
    dstMovimentosRelMOV_FLSITU: TStringField;
    dstMovimentosRelCRE_NMEXTR: TStringField;
    cdsMovimentoRelMOV_NRVEND: TStringField;
    cdsMovimentoRelMOV_NRCART: TStringField;
    cdsMovimentoRelMOV_CDCRED: TStringField;
    cdsMovimentoRelMOV_DTMOVI: TDateField;
    cdsMovimentoRelMOV_HOMOVI: TStringField;
    cdsMovimentoRelMOV_VLVEND: TFloatField;
    cdsMovimentoRelMOV_QTPARC: TIntegerField;
    cdsMovimentoRelMOV_FLSITU: TStringField;
    cdsMovimentoRelCRE_NMEXTR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorios: TdmRelatorios;

implementation

Uses udmInfoCartao;

{$R *.dfm}

end.
