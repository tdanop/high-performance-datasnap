unit SalesOrderServer;

interface

uses
  SysUtils, Classes, DSServer, DBXMSSQL, DB, SqlExpr, FMTBcd, Provider,
  AppserverMainUnit, DSCommonServer;

type
  TSalesOrderServerModule = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    spSalesOrderHeaders: TSQLStoredProc;
    dsSalesOrderHeaders: TDataSource;
    dspSalesOrders: TDataSetProvider;
    spSalesOrderDetails: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

