program Feladat3;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 K�z�ppszint
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
 {Beolvas�s}
 WriteLn;
  I:=0;
  Repeat   // Nevek �s pontok beolvas�sa, �res string v�gjelig
    Inc(I);
    Writeln(I,'.  tanulo:');
    Write('  Nev: ');
    ReadLn(Nevek[I]);
    If Nevek[I]<>'' // Ha nem akar kil�pni a felhaszn�l� a bevitelb�l
      Then
        Repeat  // K�vetkez� pont ellen�rz�tt beolvas�sa
          Write('  Pontszam: ');
          ReadLn(Pont[I]);
        Until (Pont[I] In [0..Maxpont]);  // Tov�bbl�p, ha j� a pont
    Writeln;
  Until (Nevek[I]='') Or (I=Max);  // V�ge, ha v�gjel, vagy megtelt a vektor
  If (Nevek[I]='') Then Db:=I-1    // Darabsz�m korrig�l�s, ha sz�ks�ges
                   Else Db:=I;

  {Feldolgoz�s}
  For I:=1 to Db do
    Begin
      Szazalek[I]:=Trunc((Pont[I]/Maxpont)*100); // A sz�zal�kos teljes�tm�nyek meghat�roz�sa
      Case Szazalek[I] of                        // Az oszt�lyzatok meghat�roz�sa a sz�zal�k alapj�n
         0..39 :Osztalyzat[I]:=1;
        40..54 :Osztalyzat[I]:=2;
        55..69 :Osztalyzat[I]:=3;
        70..84 :Osztalyzat[I]:=4;
        85..100:Osztalyzat[I]:=5;
      End;
    End;

   Writeln('Nev':20,'Pont':10,'%':10,'Jegy':10);   // T�bl�zatszer� ki�r�s
   For I:=1 to Db do
     Begin
       Writeln(Nevek[I]:20,' ',Pont[I]:8,' ',Szazalek[I]:10,' ',Osztalyzat[I]:8);
     End;

   Atlag:=0;                                       // Oszt�lyzatok �tlag�nak meghat�roz�s
   For I:=1 to Db do
     Begin
       Atlag:=Atlag+Osztalyzat[I];
     End;
   Atlag:=Atlag/Db;
   Writeln;
   Writeln('Osztalyatlag:',Atlag:8:2);
  ReadLn;

End.

 
