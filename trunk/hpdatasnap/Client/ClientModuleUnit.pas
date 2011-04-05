unit ClientModuleUnit;

interface

uses
  SysUtils, Classes, ClientClassesUnit, DBXDataSnap, DBXCommon, DB, SqlExpr,
  DBClient, DSConnect;

type
  TClientModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    dspSalesOrders: TDSProviderConnection;
    cdsSalesOrderHeaders: TClientDataSet;
    dsSalesOrderHeaders: TDataSource;
    cdsSalesOrderHeadersSalesOrderID: TIntegerField;
    cdsSalesOrderHeadersRevisionNumber: TByteField;
    cdsSalesOrderHeadersOrderDate: TSQLTimeStampField;
    cdsSalesOrderHeadersDueDate: TSQLTimeStampField;
    cdsSalesOrderHeadersShipDate: TSQLTimeStampField;
    cdsSalesOrderHeadersStatus: TByteField;
    cdsSalesOrderHeadersOnlineOrderFlag: TBooleanField;
    cdsSalesOrderHeadersSalesOrderNumber: TWideStringField;
    cdsSalesOrderHeadersPurchaseOrderNumber: TWideStringField;
    cdsSalesOrderHeadersAccountNumber: TWideStringField;
    cdsSalesOrderHeadersCustomerID: TIntegerField;
    cdsSalesOrderHeadersContactID: TIntegerField;
    cdsSalesOrderHeadersSalesPersonID: TIntegerField;
    cdsSalesOrderHeadersTerritoryID: TIntegerField;
    cdsSalesOrderHeadersBillToAddressID: TIntegerField;
    cdsSalesOrderHeadersShipToAddressID: TIntegerField;
    cdsSalesOrderHeadersShipMethodID: TIntegerField;
    cdsSalesOrderHeadersCreditCardID: TIntegerField;
    cdsSalesOrderHeadersCreditCardApprovalCode: TStringField;
    cdsSalesOrderHeadersCurrencyRateID: TIntegerField;
    cdsSalesOrderHeadersSubTotal: TFMTBCDField;
    cdsSalesOrderHeadersTaxAmt: TFMTBCDField;
    cdsSalesOrderHeadersFreight: TFMTBCDField;
    cdsSalesOrderHeadersTotalDue: TFMTBCDField;
    cdsSalesOrderHeadersComment: TWideStringField;
    cdsSalesOrderHeadersspSalesOrderDetails: TDataSetField;
    cdsSalesOrderDetails: TClientDataSet;
    dsSalesOrderDetails: TDataSource;
    cdsSalesOrderDetailsSalesOrderID: TIntegerField;
    cdsSalesOrderDetailsSalesOrderDetailID: TIntegerField;
    cdsSalesOrderDetailsCarrierTrackingNumber: TWideStringField;
    cdsSalesOrderDetailsOrderQty: TSmallintField;
    cdsSalesOrderDetailsProductID: TIntegerField;
    cdsSalesOrderDetailsSpecialOfferID: TIntegerField;
    cdsSalesOrderDetailsUnitPrice: TFMTBCDField;
    cdsSalesOrderDetailsUnitPriceDiscount: TFMTBCDField;
    cdsSalesOrderDetailsLineTotal: TFMTBCDField;
  private
    FInstanceOwner: Boolean;
    function GetHeaderCount: Integer;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GetSalesOrderData(BeginDate, EndDate : TDateTime);

    property HeaderCount : Integer read GetHeaderCount;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
end;

var
  ClientModule1: TClientModule1;

implementation

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  inherited;
end;

function TClientModule1.GetHeaderCount: Integer;
begin
  result := cdsSalesOrderHeaders.RecordCount;
end;

procedure TClientModule1.GetSalesOrderData(BeginDate, EndDate: TDateTime);
begin
  cdsSalesOrderHeaders.Close;
  cdsSalesOrderHeaders.Params.ParamByName('@sales_order_begin_date').AsDateTime := BeginDate;
  cdsSalesOrderHeaders.Params.ParamByName('@sales_order_end_date').AsDateTime := EndDate;
  cdsSalesOrderHeaders.Active := True;
end;

end.
