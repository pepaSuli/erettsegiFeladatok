object Form1: TForm1
  Left = 192
  Top = 122
  Width = 870
  Height = 500
  Caption = '1.feladat, list'#225'z'#243' program. 2. megold'#225's'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 16
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 40
    Top = 8
    Width = 75
    Height = 25
    Caption = 'beolvas'#225's'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 48
    Width = 817
    Height = 401
    ItemHeight = 13
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 8
  end
end
