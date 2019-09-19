object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1077#1084' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
  ClientHeight = 202
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 288
    Top = 8
    Width = 47
    Height = 13
    Caption = 'IP '#1072#1076#1088#1077#1089':'
  end
  object Label2: TLabel
    Left = 288
    Top = 69
    Width = 29
    Height = 13
    Caption = #1055#1086#1088#1090':'
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 265
    Height = 153
    TabOrder = 0
  end
  object Button1: TButton
    Left = 279
    Top = 136
    Width = 75
    Height = 25
    Caption = #1057#1077#1088#1074#1077#1088
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 376
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 288
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 288
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnExecute = IdTCPServer1Execute
    Left = 304
    Top = 56
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 344
    Top = 56
  end
end
