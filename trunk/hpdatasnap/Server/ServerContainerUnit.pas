unit ServerContainerUnit;

interface

uses
  SysUtils, Classes, 
  SvcMgr, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSAuth, AppserverMainUnit;

type
  THPDService = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceCreate(Sender: TObject);
  private
    FAppserverMain : TServerMain;
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  HPDService: THPDService;

implementation

uses Windows;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  HPDService.Controller(CtrlCode);
end;

function THPDService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function THPDService.DoContinue: Boolean;
begin
  Result := inherited;
  FAppserverMain.DSServer.Start;
end;

procedure THPDService.DoInterrogate;
begin
  inherited;
end;

function THPDService.DoPause: Boolean;
begin
  FAppserverMain.DSServer.Stop;
  Result := inherited;
end;

function THPDService.DoStop: Boolean;
begin
  FAppserverMain.DSServer.Stop;
  Result := inherited;
end;

procedure THPDService.ServiceCreate(Sender: TObject);
begin
  FAppserverMain := TServerMain.Create(Self);
end;

procedure THPDService.ServiceStart(Sender: TService; var Started: Boolean);
begin
  FAppserverMain.DSServer.Start;
end;

end.

