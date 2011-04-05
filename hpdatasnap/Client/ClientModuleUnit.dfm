object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      'Filters={}')
    Connected = True
    Left = 48
    Top = 40
    UniqueId = '{E5F5DEBA-8841-411F-96FD-0B7B5ECC051C}'
  end
  object dspSalesOrders: TDSProviderConnection
    ServerClassName = 'TSalesOrderServerModule'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 176
    Top = 40
  end
  object cdsSalesOrderHeaders: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftTimeStamp
        Precision = 8
        Name = '@sales_order_begin_date'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftTimeStamp
        Precision = 8
        Name = '@sales_order_end_date'
        ParamType = ptInput
        Value = 37104d
      end>
    ProviderName = 'dspSalesOrders'
    RemoteServer = dspSalesOrders
    Left = 56
    Top = 112
    object cdsSalesOrderHeadersSalesOrderID: TIntegerField
      FieldName = 'SalesOrderID'
      Required = True
    end
    object cdsSalesOrderHeadersRevisionNumber: TByteField
      FieldName = 'RevisionNumber'
      Required = True
    end
    object cdsSalesOrderHeadersOrderDate: TSQLTimeStampField
      FieldName = 'OrderDate'
      Required = True
    end
    object cdsSalesOrderHeadersDueDate: TSQLTimeStampField
      FieldName = 'DueDate'
      Required = True
    end
    object cdsSalesOrderHeadersShipDate: TSQLTimeStampField
      FieldName = 'ShipDate'
    end
    object cdsSalesOrderHeadersStatus: TByteField
      FieldName = 'Status'
      Required = True
    end
    object cdsSalesOrderHeadersOnlineOrderFlag: TBooleanField
      FieldName = 'OnlineOrderFlag'
      Required = True
    end
    object cdsSalesOrderHeadersSalesOrderNumber: TWideStringField
      FieldName = 'SalesOrderNumber'
      Required = True
      Size = 50
    end
    object cdsSalesOrderHeadersPurchaseOrderNumber: TWideStringField
      FieldName = 'PurchaseOrderNumber'
      Size = 50
    end
    object cdsSalesOrderHeadersAccountNumber: TWideStringField
      FieldName = 'AccountNumber'
      Size = 30
    end
    object cdsSalesOrderHeadersCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Required = True
    end
    object cdsSalesOrderHeadersContactID: TIntegerField
      FieldName = 'ContactID'
      Required = True
    end
    object cdsSalesOrderHeadersSalesPersonID: TIntegerField
      FieldName = 'SalesPersonID'
    end
    object cdsSalesOrderHeadersTerritoryID: TIntegerField
      FieldName = 'TerritoryID'
    end
    object cdsSalesOrderHeadersBillToAddressID: TIntegerField
      FieldName = 'BillToAddressID'
      Required = True
    end
    object cdsSalesOrderHeadersShipToAddressID: TIntegerField
      FieldName = 'ShipToAddressID'
      Required = True
    end
    object cdsSalesOrderHeadersShipMethodID: TIntegerField
      FieldName = 'ShipMethodID'
      Required = True
    end
    object cdsSalesOrderHeadersCreditCardID: TIntegerField
      FieldName = 'CreditCardID'
    end
    object cdsSalesOrderHeadersCreditCardApprovalCode: TStringField
      FieldName = 'CreditCardApprovalCode'
      Size = 15
    end
    object cdsSalesOrderHeadersCurrencyRateID: TIntegerField
      FieldName = 'CurrencyRateID'
    end
    object cdsSalesOrderHeadersSubTotal: TFMTBCDField
      FieldName = 'SubTotal'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsSalesOrderHeadersTaxAmt: TFMTBCDField
      FieldName = 'TaxAmt'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsSalesOrderHeadersFreight: TFMTBCDField
      FieldName = 'Freight'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsSalesOrderHeadersTotalDue: TFMTBCDField
      FieldName = 'TotalDue'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsSalesOrderHeadersComment: TWideStringField
      FieldName = 'Comment'
      Size = 256
    end
    object cdsSalesOrderHeadersspSalesOrderDetails: TDataSetField
      FieldName = 'spSalesOrderDetails'
    end
  end
  object dsSalesOrderHeaders: TDataSource
    DataSet = cdsSalesOrderHeaders
    Left = 192
    Top = 112
  end
  object cdsSalesOrderDetails: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSalesOrderHeadersspSalesOrderDetails
    Params = <>
    Left = 56
    Top = 176
    object cdsSalesOrderDetailsSalesOrderID: TIntegerField
      FieldName = 'SalesOrderID'
      Required = True
    end
    object cdsSalesOrderDetailsSalesOrderDetailID: TIntegerField
      FieldName = 'SalesOrderDetailID'
      Required = True
    end
    object cdsSalesOrderDetailsCarrierTrackingNumber: TWideStringField
      FieldName = 'CarrierTrackingNumber'
      Size = 50
    end
    object cdsSalesOrderDetailsOrderQty: TSmallintField
      FieldName = 'OrderQty'
      Required = True
    end
    object cdsSalesOrderDetailsProductID: TIntegerField
      FieldName = 'ProductID'
      Required = True
    end
    object cdsSalesOrderDetailsSpecialOfferID: TIntegerField
      FieldName = 'SpecialOfferID'
      Required = True
    end
    object cdsSalesOrderDetailsUnitPrice: TFMTBCDField
      FieldName = 'UnitPrice'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsSalesOrderDetailsUnitPriceDiscount: TFMTBCDField
      FieldName = 'UnitPriceDiscount'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsSalesOrderDetailsLineTotal: TFMTBCDField
      FieldName = 'LineTotal'
      Required = True
      Precision = 32
      Size = 6
    end
  end
  object dsSalesOrderDetails: TDataSource
    DataSet = cdsSalesOrderDetails
    Left = 192
    Top = 176
  end
end
