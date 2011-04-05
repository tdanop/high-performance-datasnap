object ServerMain: TServerMain
  OldCreateOrder = False
  Height = 150
  Width = 511
  object DSServer: TDSServer
    AutoStart = False
    HideDSAdmin = True
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer
    BufferKBSize = 1000
    Filters = <>
    Left = 96
    Top = 73
  end
  object dscSalesOrders: TDSServerClass
    OnGetClass = dscSalesOrdersGetClass
    Server = DSServer
    LifeCycle = 'Invocation'
    Left = 280
    Top = 48
  end
end
