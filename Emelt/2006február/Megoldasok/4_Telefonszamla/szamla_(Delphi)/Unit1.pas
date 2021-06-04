{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin;

type
  TTelSzam  = String[10];
  TIdo = Record
    o,p,s : byte;
  end;
  THivas = Record
    kezd, vege : TIdo;
    Telszam : TTelSzam;
  end;
  THivasTomb = Array[1..200] of THivas;

  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    BetoltButton: TButton;
    GroupBox1: TGroupBox;
    TelszamEdit: TEdit;
    TelszamButton: TButton;
    TelszamLabel: TLabel;
    SzamlaPercGroupBox: TGroupBox;
    kora: TSpinEdit;
    kperc: TSpinEdit;
    kmp: TSpinEdit;
    vora: TSpinEdit;
    vperc: TSpinEdit;
    vmp: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SzamlapercButton: TButton;
    szamlaPercLabel: TLabel;
    PercekFajlbaButton: TButton;
    GroupBox2: TGroupBox;
    MegszamolButton: TButton;
    CsucsIdoLabel: TLabel;
    GroupBox3: TGroupBox;
    MobVezetekSzumButton: TButton;
    MobVezetekLabel: TLabel;
    GroupBox4: TGroupBox;
    CsucsfizetButton: TButton;
    CsucsfizetLabel: TLabel;
    procedure HivasokBetoltFajlbol(Var N : Byte; Var H : THivasTomb);
    function TelSzamMobil_e(Telsz : TTelSzam): Boolean;
    function Szamlazottperc(hk,hv : TIdo) : Byte;
    procedure SzamlazottPercekFajlbol(N : Byte;Adatok : THivasTomb);
    function csucsido_e(hk : TIdo): Boolean;
    function IdoToSec(Ido : TIdo) : Integer;
    function MegszamolCsucsidok(N : Byte;Adatok : THivasTomb): Byte;
    procedure SzumMobilVezetekPerc(N : Byte;Adatok : THivasTomb; Var szumm,szumb : integer);
    function CsucsdijFizet(N : Byte;Adatok : THivasTomb): Real;
    function MaxBeszelgetes(N: Byte; Adatok : THivasTomb) : byte;
    procedure BetoltButtonClick(Sender: TObject);
    procedure TelszamButtonClick(Sender: TObject);
    procedure SzamlapercButtonClick(Sender: TObject);
    procedure PercekFajlbaButtonClick(Sender: TObject);
    procedure MegszamolButtonClick(Sender: TObject);
    procedure MobVezetekSzumButtonClick(Sender: TObject);
    procedure MaxhivasButtonClick(Sender: TObject);
    procedure CsucsfizetButtonClick(Sender: TObject);
  private
    N : byte;
    Hivasok : THivasTomb;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.HivasokBetoltFajlbol(var N: Byte; var H: THivasTomb);
Var FN : TextFile;
    cv : byte;
    hk,hv : TIdo;
    egyhivas: THivas;
    tel : TTelSzam;
begin
  If OpenDialog1.Execute then
    Begin
      AssignFile(FN,OpenDialog1.FileName);
      Reset(FN);
        cv := 1;
        While not eof(FN) Do
          Begin
            Read(FN,hk.o);
            Read(FN,hk.p);
            Read(FN,hk.s);
            Read(FN,hv.o);
            Read(FN,hv.p);
            Readln(FN,hv.s);
            Readln(FN,tel);
            egyhivas.kezd := hk;
            egyhivas.vege := hv;
            egyhivas.Telszam := tel;
            H[cv] := egyhivas;
            inc(cv);
          End;
      CloseFile(FN);
      N := cv-1;
    End;
end;

procedure TForm1.BetoltButtonClick(Sender: TObject);
begin
HivasokBetoltFajlbol(N,Hivasok);
CsucsfizetButton.Enabled := true;
MegszamolButton.Enabled := true;
PercekFajlbaButton.Enabled := true;
MobVezetekSzumButton.enabled := true;
end;

function TForm1.TelSzamMobil_e(Telsz: TTelSzam): Boolean;
Var S :String;
    korzetszam : byte;
    mobil_e : boolean;
    mobilos : Set of byte;
begin
   mobilos := [39,41,71];
   mobil_e := false;
   S := Copy(Telsz,1,2);
   korzetszam := StrToInt(S);
   If korzetszam in mobilos then
        mobil_e := true;
   Result := mobil_e;
end;

procedure TForm1.TelszamButtonClick(Sender: TObject);
Var telsz : TTelSzam;
begin
  telsz := TelSzamEdit.Text;
  if TelSzamMobil_e(telsz) then
     TelszamLabel.Caption := 'A telefonszám mobil szám.'
  else
     TelszamLabel.Caption := 'A telefonszám nem mobil szám.';
end;

function TForm1.Szamlazottperc(hk, hv: TIdo): Byte;
Var ksec, vsec, bsec : Integer;
    szamlazottperc : Byte;
begin
  ksec := hk.o*3600 + hk.p*60 + hk.s;
  vsec := hv.o*3600 + hv.p*60 + hv.s;
  bsec := vsec - ksec;
  szamlazottperc := bsec div 60;
  if bsec mod 60 <> 0 then
     inc(szamlazottperc);
  Result := szamlazottperc;
end;

procedure TForm1.SzamlapercButtonClick(Sender: TObject);
Var hk, hv : TIdo;
begin
   with hk do
    Begin
      o := kora.Value;
      p := kperc.Value;
      s := kmp.Value;
    End;
   with hv do
    Begin
      o := vora.Value;
      p := vperc.Value;
      s := vmp.Value;
    End;
   szamlaPercLabel.Caption := IntToStr(Szamlazottperc(hk,hv)) + ' perc';
end;

procedure TForm1.SzamlazottPercekFajlbol(N : Byte;Adatok: THivasTomb);
Var cv : byte;
    FN : TextFile;
begin
  if SaveDialog1.execute then
    begin
      AssignFile(FN,savedialog1.FileName);
      Rewrite(FN);
      for cv := 1 to N do
        begin
         Write(FN,Szamlazottperc(adatok[cv].kezd,adatok[cv].vege));
         Write(FN,' ');
         Writeln(FN,Adatok[cv].telszam);
        end;
      CloseFile(FN);
     end;
end;

procedure TForm1.PercekFajlbaButtonClick(Sender: TObject);
begin
 SzamlazottPercekFajlbol(N,Hivasok);
end;

function TForm1.csucsido_e(hk: TIdo): Boolean;
Var csido : boolean;
begin
  csido := false;
  if (IdoToSec(hk)>=25200) and (IdoToSec(hk)<64800) then
    csido := true;
  Result := csido;
end;

function TForm1.IdoToSec(Ido: TIdo): Integer;
begin
 Result := ido.o*3600 + ido.p*60 + ido.s;
end;

function TForm1.MegszamolCsucsidok(N: Byte; Adatok: THivasTomb): Byte;
Var cv, csidodb : byte;
begin
  csidodb := 0;
  for cv := 1 to N do
  begin
    if csucsido_e(adatok[cv].kezd) then inc(Csidodb);
  end;
  Result := csidodb;
end;

procedure TForm1.MegszamolButtonClick(Sender: TObject);
Var csucsido : Byte;
begin
   csucsido := MegszamolCsucsidok(N,Hivasok);
   CsucsIdoLabel.Caption := 'Csúcsidõs : ' +
         IntToStr(csucsido) +
         ' Csúcsidõn kívüli : ' + IntToStr(N-csucsido);
end;

procedure TForm1.SzumMobilVezetekPerc(N: Byte; Adatok: THivasTomb; var szumm,
  szumb: integer);
Var cv, szamlaperc : Byte;
begin
  szumm := 0; szumb := 0;
  For cv := 1 to N Do
    Begin
      Szamlaperc := Szamlazottperc(Adatok[cv].kezd,Adatok[cv].vege);
      if TelSzamMobil_e(Adatok[cv].Telszam) then
         szumm := szumm + szamlaperc
      else
         szumb:= szumb + szamlaperc;
    End;
end;

procedure TForm1.MobVezetekSzumButtonClick(Sender: TObject);
Var SzumMob, SzumBelf : Integer;
begin
   SzumMobilVezetekPerc(N, Hivasok,SzumMob,SzumBelf);
   MobVezetekLabel.Caption := 'Mobil percek: ' +
       IntToStr(SzumMob) + ' Belföldi percek: '  +
       IntToStr(SzumBelf);

end;

function TForm1.CsucsdijFizet(N: Byte; Adatok: THivasTomb): Real;
Var cv : byte;
    Szum : Real;
begin
  Szum := 0;
  for cv := 1 to N do
  begin
    if csucsido_e(Adatok[cv].kezd) then
      if TelSzamMobil_e(Adatok[cv].Telszam) then
         Szum := Szum + Szamlazottperc(Adatok[cv].kezd,Adatok[cv].vege)*69.175
      else
         Szum := Szum + Szamlazottperc(Adatok[cv].kezd,Adatok[cv].vege)*30;
  end;
  Result := Szum;
end;

procedure TForm1.MaxhivasButtonClick(Sender: TObject);
Var index : Byte;
    Hivasido : integer;
begin
  Index := MaxBeszelgetes(N, Hivasok);
  hivasido := IdoToSec(Hivasok[index].vege) - IdoToSec(Hivasok[index].kezd);
end;

function TForm1.MaxBeszelgetes(N: Byte; Adatok: THivasTomb): byte;
Var max, cv : byte;
    ks, vs, bs, maxs : integer;
begin
  max := 1;
  maxs := IdoToSec(Adatok[1].vege) - IdoToSec(Adatok[1].kezd);
  for cv := 2 to N Do
    Begin
      ks := IdoToSec(Adatok[cv].kezd);
      vs := IdoToSec(Adatok[cv].vege);
      bs := vs-ks;
      if bs > maxs then
        begin
          maxs:= bs;
          Max:= cv;
        end;
    End;
  Result := Max;
end;

procedure TForm1.CsucsfizetButtonClick(Sender: TObject);
Var Fizetendo : Real;
begin
 Fizetendo := CsucsdijFizet(N, Hivasok);
 CsucsFizetLabel.Caption := FloatToStrF(Fizetendo,ffNumber,8,2) + ' Ft';
end;

end.
