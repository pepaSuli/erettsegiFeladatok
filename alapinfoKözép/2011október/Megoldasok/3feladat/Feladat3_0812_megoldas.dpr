program Feladat3;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 Középpszint
 3. feladat
}

uses
  SysUtils;

Const Max=20;
      Maxpont=50;
Var Nevek:Array[1..Max] of String[40];
    Pont,Szazalek,Osztalyzat:Array[1..Max] of Byte;
    I,Db:byte;
    Atlag:real;


begin
 {Beolvasás}
 WriteLn;
  I:=0;
  Repeat   // Nevek és pontok beolvasása, üres string végjelig
    Inc(I);
    Writeln(I,'.  tanulo:');
    Write('  Nev: ');
    ReadLn(Nevek[I]);
    If Nevek[I]<>'' // Ha nem akar kilépni a felhasználó a bevitelbõl
      Then
        Repeat  // Következõ pont ellenõrzött beolvasása
          Write('  Pontszam: ');
          ReadLn(Pont[I]);
        Until (Pont[I] In [0..Maxpont]);  // Továbblép, ha jó a pont
    Writeln;
  Until (Nevek[I]='') Or (I=Max);  // Vége, ha végjel, vagy megtelt a vektor
  If (Nevek[I]='') Then Db:=I-1    // Darabszám korrigálás, ha szükséges
                   Else Db:=I;

  {Feldolgozás}
  For I:=1 to Db do
    Begin
      Szazalek[I]:=Trunc((Pont[I]/Maxpont)*100); // A százalékos teljesítmények meghatározása
      Case Szazalek[I] of                        // Az osztályzatok meghatározása a százalék alapján
         0..39 :Osztalyzat[I]:=1;
        40..54 :Osztalyzat[I]:=2;
        55..69 :Osztalyzat[I]:=3;
        70..84 :Osztalyzat[I]:=4;
        85..100:Osztalyzat[I]:=5;
      End;
    End;

   Writeln('Nev':20,'Pont':10,'%':10,'Jegy':10);   // Táblázatszerû kiírás
   For I:=1 to Db do
     Begin
       Writeln(Nevek[I]:20,' ',Pont[I]:8,' ',Szazalek[I]:10,' ',Osztalyzat[I]:8);
     End;

   Atlag:=0;                                       // Osztályzatok átlagának meghatározás
   For I:=1 to Db do
     Begin
       Atlag:=Atlag+Osztalyzat[I];
     End;
   Atlag:=Atlag/Db;
   Writeln;
   Writeln('Osztalyatlag:',Atlag:8:2);
  ReadLn;

End.

 
