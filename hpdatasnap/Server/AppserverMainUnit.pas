unit AppserverMainUnit;

interface

uses
  SysUtils, Classes, DSCommonServer, DSTCPServerTransport, DSServer;

type
  TServerMain = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    dscSalesOrders: TDSServerClass;
    procedure dscSalesOrdersGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses SalesOrderServer;

{$R *.dfm}

procedure TServerMain.dscSalesOrdersGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TSalesOrderServerModule;
end;

end.
