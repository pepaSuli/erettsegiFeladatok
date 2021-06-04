Program Lotto;
Uses Crt;
Type TLottoHet = Array[1..5] of byte;
     TLottoEv  = Array[1..52] of TLottoHet;
     TLottoSzamok = Array[1..90] of Byte;
Var   Het52 : TLottoHet;
    LottoEv : TLottoEv;
        Het : Byte;
   SzamGyak : TLottoSzamok;
       Volt : Boolean;
Procedure BekerEgyHet(Var LottoHet : TLottoHet);
Var cv : Byte;
Begin
  Clrscr;
  GotoXY(10,1);
  Writeln('Adja meg az 52. h‚t lott¢sz mait!');
  for cv := 1 to 5 do
    begin
      GotoXY(10,1+cv*2);
      Write(cv,'. sz m = ');
      Read(LottoHet[cv]);
    end;
End;

Procedure RendezEgyHet(Var LottoHet : TLottoHet);
Var i, j, s : Byte;
Begin
  for i := 1 to 4 do
    for j := i+1 to 5 do
      if LottoHet[i] > LottoHet[j] then
        Begin
          s := LottoHet[i];
          LottoHet[i] := LottoHet[j];
          LottoHet[j] := s;
        end;
End;

Procedure KiirEgyHet(LottoHet : TLottoHet);
Var cv : Byte;
Begin
  For cv := 1 to 5 Do
    Write(LottoHet[cv], '  ');
  Writeln;
End;

Procedure Egyszersem(LottoHet : TlottoEv;Var Volt : Boolean);
Var i, j, szam, db : Byte;
Begin
 i := 1; j := 1; szam := 1;
 While (szam <= 90) Do
  Begin
    i := 1;
    While (i <= 51) Do
      Begin
        j := 1;
        While (j <= 5) AND (Lottohet[i,j] <> szam) Do j := j + 1;
        i := i + 1;
      End;
    szam := szam + 1;
  End;
 if i < 51 then volt := false else volt := true;
End;

Procedure FileBeolvas(Var LEv : TLottoEv);
Var  Fn : Text;
     i, j : Byte;
Begin
  Assign(Fn,'lottosz.dat');
  Reset(Fn);
  For i := 1 to 51 Do
    For j := 1 to 5 Do
      Read(Fn,LEv[i,j]);
  Close(Fn);
End;

Function Paratlan(Lev : TLottoEv) : Integer;
Var i,j : Byte;
     Db : Integer;
Begin
 Db := 0;
 For i := 1 to 51 do
   For j := 1 to 5 do
     If Lev[i,j] mod 2 = 1 then
        inc(Db);
 Paratlan := Db;
End;

Procedure FileKiir(Lev : TLottoEv);
Var i, j : Byte;
    Fn : Text;
Begin
  Assign(Fn, 'lotto52.ki');
  Rewrite(Fn);
  For i := 1 to 52 do
   Begin
     For j := 1 to 5 Do
       Begin
         Write(Fn,Lev[i,j]);
         Write(Fn,' ');
       End;
     Writeln(Fn);
   End;
  Close(Fn);
End;

Procedure SzamGyakorisag(Lev : TLottoEv; Var Gyak90 : TLottoSzamok);
Var i, j : Byte;
    Fn : Text;
Begin
  for i := 1 to 90 Do Gyak90[i] := 0;
    Assign(Fn,'lotto52.ki');
  Reset(Fn);
  For i := 1 to 52 Do
    For j := 1 to 5 Do
     Begin
      Read(Fn,LEv[i,j]);
      Gyak90[Lev[i,j]] := Gyak90[Lev[i,j]] + 1;
     End;
  Close(Fn);
End;

Procedure RendezettKiir(Gyak90 : TLottoSzamok);
var i , X, Y : Byte;
Begin
  Clrscr;
  Y := 1; i := 1;
  While i <= 90 Do
   Begin
     for X := 1 to 15 Do
       Begin
         GotoXY(5+3*X,5+2*Y) ;
         Write(Gyak90[i]);
         Inc(i);
       End;
     Inc(Y);
    End;
End;

Procedure Primnem(Gyak90 : TLottoSzamok);
Var primek : set of Byte;
         i : Byte;
Begin
  primek := [2,3,5,7,11,13,17,19,23,29,31,37,
            41,43,47,53,59,61,67,71,73,79,83,89];

  for i := 1 to 90 do
   if (Gyak90[i] = 0) AND (i in primek) then
     Write(i, '   ');
End;

BEGIN
  Clrscr;
  {1. feladat}
  BekerEgyHet(Het52);
  Writeln;
  {2. feladat}
  RendezEgyHet(Het52);
  GotoXY(10,13);
  KiirEgyHet(Het52);
  {3. feladat}
  GotoXY(10,15);
  Write('Adjon meg egy sz mot 1-51 k”z”tt! N = ');
  Readln(Het);
  {4. feladat}
  FileBeolvas(LottoEv);
  GotoXY(10,17);
  KiirEgyHet(LottoEv[Het]);
  {5. feladat}
  Egyszersem(LottoEv,Volt);
  GotoXY(10,19);
  if Volt then
    Write('Van olyan sz m, amit nem h£ztak ki.')
  else
    Write('Nincs olyan sz m, amit nem h£ztak ki.');
  {6. feladat}
  GotoXY(10,21);
  Write(Paratlan(LottoEv), ' alkalommal h£ztak p ratlan sz mot.');
  {7. feladat}
  LottoEv[52] := Het52;
  FileKiir(LottoEv);
  GotoXY(10,23);
  Writeln('A f jl ki¡r sa befejez“d”tt');
  Readln;
  {8. feladat}
  GotoXY(10,2);
  Write('A kih£zott sz mok gyakoris ga.');
  SzamGyakorisag(LottoEv, SzamGyak);
  RendezettKiir(SzamGyak);
  {9. feladat}
  GotoXY(10,22);
  Writeln('A k”vetkez“ pr¡meket nem h£zt k ki.');
  GotoXY(10,24);
  Primnem(SzamGyak);
  Readln;
  Readln;
END.
