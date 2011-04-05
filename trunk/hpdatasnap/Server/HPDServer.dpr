program HPDServer;

uses
  SvcMgr,
  Forms,
  SysUtils,
  WinSvc,
  Windows,
  ServerContainerUnit in 'ServerContainerUnit.pas' {HPDService: TService},
  HPDMainForm in 'HPDMainForm.pas' {HPDMainFormUI},
  SalesOrderServer in 'SalesOrderServer.pas' {SalesOrderServerModule: TDSServerModule},
  AppserverMainUnit in 'AppserverMainUnit.pas' {ServerMain: TDataModule};

{$R *.RES}

function Installing: Boolean;
begin
  result := FindCmdLineSwitch('install', true) or
            FindCmdLineSwitch('uninstall', true);
end;

{ This function checks to see if the service has been registered. If it has
  the appserver will start as a service. If you want to run this server as
  a standalone process, unregister the service.}
function RunAsService: Boolean;
var
  Mgr, Svc: Integer;
  UserName, ServiceStartName: string;
  Config: Pointer;
  Size: DWord;
begin
  Result := False;
  Mgr := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if Mgr <> 0 then
  begin
    Svc := OpenService(Mgr, PChar(HPDService.Name), SERVICE_ALL_ACCESS);
    Result := Svc <> 0;
    if Result then
    begin
      QueryServiceConfig(Svc, nil, 0, Size);
      Config := AllocMem(Size);
      try
        QueryServiceConfig(Svc, Config, Size, Size);
        ServiceStartName := PQueryServiceConfig(Config)^.lpBinaryPathName;
      finally
        Dispose(Config);
      end;
      CloseServiceHandle(Svc);
    end;
    CloseServiceHandle(Mgr);
  end;

  if Result then
  begin
    Size := MAX_PATH;
    SetLength(UserName, Size);
    UserName := Forms.Application.ExeName;
    SetLength(UserName, StrLen(PChar(UserName)));
    Result := CompareText(UserName, ServiceStartName) = 0;
  end;
end;

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if Installing or RunAsService then
  begin
    if (Win32Platform = VER_PLATFORM_WIN32_NT) and
      (((Win32MajorVersion = 5) and (Win32MinorVersion >= 2)) or
        (Win32MajorVersion > 5)) then
      SvcMgr.Application.DelayInitialize := True;

    if not SvcMgr.Application.DelayInitialize or SvcMgr.Application.Installing then
      SvcMgr.Application.Initialize;
    SvcMgr.Application.CreateForm(THPDService, HPDService);
    SvcMgr.Application.Run;
  end
  else
  begin
    Forms.Application.Initialize;
    Forms.Application.MainFormOnTaskBar := True;
    Forms.Application.CreateForm(THPDMainFormUI, HPDMainFormUI);
    Forms.Application.Run;
  end;
end.

