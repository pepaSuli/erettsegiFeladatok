object Form1: TForm1
  Left = 195
  Top = 124
  Width = 496
  Height = 165
  Caption = 'Vigenére tábla'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 7
    Width = 63
    Height = 13
    Caption = 'Kulcsszöveg:'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 67
    Height = 13
    Caption = 'Kódolt szöveg'
  end
  object Label3: TLabel
    Left = 88
    Top = 64
    Width = 281
    Height = 57
    AutoSize = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 36
    Top = 37
    Width = 39
    Height = 13
    Caption = 'Szöveg:'
  end
  object Edit1: TEdit
    Left = 87
    Top = 4
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 250
    Top = 3
    Width = 105
    Height = 25
    Caption = 'Kódolás'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 88
    Top = 32
    Width = 393
    Height = 21
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 96
  end
end
