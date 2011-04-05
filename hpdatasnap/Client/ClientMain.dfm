object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 512
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    610
    512)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 13
    Width = 66
    Height = 13
    Caption = 'Elapsed Time:'
  end
  object Label2: TLabel
    Left = 200
    Top = 13
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 360
    Top = 13
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 283
    Top = 13
    Width = 71
    Height = 13
    Caption = 'Header Count:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 594
    Height = 300
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ClientModule1.dsSalesOrderHeaders
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 350
    Width = 594
    Height = 154
    Anchors = [akLeft, akRight, akBottom]
    DataSource = ClientModule1.dsSalesOrderDetails
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Get Sales Data'
    TabOrder = 2
    OnClick = Button1Click
  end
end
