object Form1: TForm1
  Left = 214
  Top = 150
  Width = 551
  Height = 403
  Caption = 'Telefonos híváslista kiértékelése'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BetoltButton: TButton
    Left = 408
    Top = 16
    Width = 113
    Height = 33
    Caption = 'Hivások betöltése'
    TabOrder = 0
    OnClick = BetoltButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 40
    Top = 8
    Width = 353
    Height = 74
    Caption = 'Telefonszám bekérése'
    TabOrder = 1
    object TelszamLabel: TLabel
      Left = 16
      Top = 42
      Width = 321
      Height = 25
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object TelszamEdit: TEdit
      Left = 16
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object TelszamButton: TButton
      Left = 184
      Top = 16
      Width = 153
      Height = 25
      Caption = 'Telefonszám meghatározás'
      TabOrder = 1
      OnClick = TelszamButtonClick
    end
  end
  object SzamlaPercGroupBox: TGroupBox
    Left = 40
    Top = 88
    Width = 353
    Height = 89
    Caption = 'Számlázott perc kiszámítása'
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 29
      Width = 72
      Height = 13
      Caption = 'Hívás kezdete:'
    end
    object Label2: TLabel
      Left = 22
      Top = 61
      Width = 58
      Height = 13
      Caption = 'Hívás vége:'
    end
    object szamlaPercLabel: TLabel
      Left = 232
      Top = 56
      Width = 105
      Height = 33
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object kora: TSpinEdit
      Left = 85
      Top = 24
      Width = 41
      Height = 22
      MaxValue = 23
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object kperc: TSpinEdit
      Left = 128
      Top = 24
      Width = 41
      Height = 22
      MaxValue = 60
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object kmp: TSpinEdit
      Left = 173
      Top = 24
      Width = 41
      Height = 22
      MaxValue = 60
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object vora: TSpinEdit
      Left = 85
      Top = 56
      Width = 41
      Height = 22
      MaxValue = 23
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object vperc: TSpinEdit
      Left = 128
      Top = 56
      Width = 41
      Height = 22
      MaxValue = 60
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object vmp: TSpinEdit
      Left = 172
      Top = 56
      Width = 41
      Height = 22
      MaxValue = 60
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
    object SzamlapercButton: TButton
      Left = 232
      Top = 24
      Width = 105
      Height = 25
      Caption = 'Számlázott percek'
      TabOrder = 6
      OnClick = SzamlapercButtonClick
    end
  end
  object PercekFajlbaButton: TButton
    Left = 408
    Top = 64
    Width = 121
    Height = 33
    Caption = 'Perceket kiír fájlba'
    Enabled = False
    TabOrder = 3
    OnClick = PercekFajlbaButtonClick
  end
  object GroupBox2: TGroupBox
    Left = 40
    Top = 184
    Width = 353
    Height = 58
    Caption = 'Csúcsidõs és azon kívüli hívások száma'
    TabOrder = 4
    object CsucsIdoLabel: TLabel
      Left = 21
      Top = 24
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MegszamolButton: TButton
      Left = 248
      Top = 24
      Width = 97
      Height = 25
      Caption = 'Megszámol'
      Enabled = False
      TabOrder = 0
      OnClick = MegszamolButtonClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 40
    Top = 248
    Width = 353
    Height = 57
    Caption = 'Mobil és belföldi beszélgetések'
    TabOrder = 5
    object MobVezetekLabel: TLabel
      Left = 21
      Top = 24
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MobVezetekSzumButton: TButton
      Left = 264
      Top = 24
      Width = 81
      Height = 25
      Caption = 'Összeg'
      Enabled = False
      TabOrder = 0
      OnClick = MobVezetekSzumButtonClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 40
    Top = 312
    Width = 353
    Height = 49
    Caption = 'Csúcsdíjas hívások ára'
    TabOrder = 6
    object CsucsfizetLabel: TLabel
      Left = 11
      Top = 19
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CsucsfizetButton: TButton
      Left = 264
      Top = 16
      Width = 81
      Height = 25
      Caption = 'Fizet'
      Enabled = False
      TabOrder = 0
      OnClick = CsucsfizetButtonClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    FileName = 'percek.txt'
    Left = 8
    Top = 40
  end
end
