unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXDataSnap, DBXCommon, DB, SqlExpr, Grids, DBGrids, StdCtrls;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses ClientModuleUnit;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  BeginDate : TDateTime;
  EndDate : TDateTime;
  T1, T2: TDateTime;
begin
  BeginDate := EncodeDate(2001, 1, 1);
  EndDate := EncodeDate(2001, 8, 1);
  T1 := Now;
  ClientModule1.GetSalesOrderData(BeginDate, EndDate);
  T2 := Now;
  Label2.Caption := FormatDateTime('nn:ss.zzzz', T2 - T1);
  Label3.Caption := IntToStr(ClientModule1.HeaderCount);
end;

end.
