object SalesOrderServerModule: TSalesOrderServerModule
  OldCreateOrder = False
  Height = 242
  Width = 306
  object SQLConnection1: TSQLConnection
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=15.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'HostName=server'
      'Database=AdventureWorks'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=user'
      'Password=password'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=True'
      'Prepare SQL=False')
    VendorLib = 'sqlncli10.dll'
    Connected = True
    Left = 72
    Top = 24
  end
  object spSalesOrderHeaders: TSQLStoredProc
    SchemaName = 'Sales'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Precision = 8
        Name = '@sales_order_begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Precision = 8
        Name = '@sales_order_end_date'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    StoredProcName = 'sp_Select_Sales_Order_Headers_v1'
    Left = 72
    Top = 88
  end
  object dsSalesOrderHeaders: TDataSource
    DataSet = spSalesOrderHeaders
    Left = 192
    Top = 88
  end
  object dspSalesOrders: TDataSetProvider
    DataSet = spSalesOrderHeaders
    Left = 192
    Top = 152
  end
  object spSalesOrderDetails: TSQLDataSet
    SchemaName = 'Sales'
    CommandText = 'sp_select_Sales_Order_Details_v1'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    DataSource = dsSalesOrderHeaders
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = 'SalesOrderID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 72
    Top = 152
  end
end
