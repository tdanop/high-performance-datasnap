unit HPDMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppserverMainUnit;

type
  THPDMainFormUI = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FAppserverMain : TServerMain;
  public
    { Public declarations }
  end;

var
  HPDMainFormUI: THPDMainFormUI;

implementation

{$R *.dfm}

procedure THPDMainFormUI.FormCreate(Sender: TObject);
begin
  FAppserverMain := TServerMain.Create(Self);
  FAppserverMain.DSServer.Start;
end;

end.
