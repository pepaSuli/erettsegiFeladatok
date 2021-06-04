program Feladat3;

{$APPTYPE CONSOLE}

{
 Informatikai Alapismeretek
 K�z�pszint
 3. feladat
}
uses
  SysUtils;

Const Max=20;
Var Jegyek:Array[1..Max] of Byte;  // Az �rdemjegyek
    Jegydb:Array[1..5] of Byte;    // Melyik jegyb�l h�ny db van
    I,Db,Ind:byte;

begin
  {Beolvas�s}
  Writeln('Adja meg az dolgozatjegyeket! A kilepeshez adjon meg 0-t!');
  Writeln;
  I:=0;
  Repeat  // Jegyek beolvas�sa, 0 v�gjelig
    Inc(I);
    Repeat  // K�vetkez� jegy ellen�rz�tt beolvas�sa
      Write('  ',I,'. jegy: ');
      Readln(Jegyek[I]);
      If Not(Jegyek[I] In [0..5]) Then // Ha nem j� jegy, hiba�zenet
        Begin
          Writeln;
          Writeln('A jegyek 1 �s 5 k�ze essenek!');
          Writeln;
        End;
    Until (Jegyek[I]) In [0..5];  // Tov�bbl�p, ha j� a jegy, vagy v�gjel
  Until (Jegyek[I]=0) Or (I=Max); // V�ge, ha v�gjel, vagy megtelt a vektor
  If (Jegyek[I]=0) Then Db:=I-1   // Darabsz�m korrig�l�s, ha sz�ks�ges
                   Else Db:=I;

  {Feldolgoz�s}
  For I:=1 to Db do               // Jegyek sz�ml�l�sa
    Begin
      Inc(Jegydb[Jegyek[I]]);
    End;

  Ind:=1;                         // Leggyakoribb jegy meghat�roz�sa
  For I:=2 to 5 do
    If Jegydb[I]>Jegydb[Ind]
      Then
        Ind:=I;

  Writeln;                        // T�bl�zatos ki�rat�s
  Writeln('Jegy':8,'Db':8);
  For I:=5 Downto 1 Do
    Writeln(I:6,Jegydb[I]:10);

  Writeln;                        // Leggyakoribb jegyek ki�r�sa
  Write('  A leggyakoribb erdemjegy(ek): ');
  For I:=1 to 5 Do
    If Jegydb[I]=Jegydb[Ind]      // Ha az I. jegy darabsz�ma megegyezik a leggyakoribbnak tal�lt jegy sz�m�val
      Then
        Write(I,' ');

  Readln;
end.


