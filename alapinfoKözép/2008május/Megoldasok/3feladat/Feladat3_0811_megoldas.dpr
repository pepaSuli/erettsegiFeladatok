program Feladat3;

{$APPTYPE CONSOLE}

{
 Informatikai Alapismeretek
 Középszint
 3. feladat
}
uses
  SysUtils;

Const Max=20;
Var Jegyek:Array[1..Max] of Byte;  // Az érdemjegyek
    Jegydb:Array[1..5] of Byte;    // Melyik jegybõl hány db van
    I,Db,Ind:byte;

begin
  {Beolvasás}
  Writeln('Adja meg az dolgozatjegyeket! A kilepeshez adjon meg 0-t!');
  Writeln;
  I:=0;
  Repeat  // Jegyek beolvasása, 0 végjelig
    Inc(I);
    Repeat  // Következõ jegy ellenõrzött beolvasása
      Write('  ',I,'. jegy: ');
      Readln(Jegyek[I]);
      If Not(Jegyek[I] In [0..5]) Then // Ha nem jó jegy, hibaüzenet
        Begin
          Writeln;
          Writeln('A jegyek 1 és 5 köze essenek!');
          Writeln;
        End;
    Until (Jegyek[I]) In [0..5];  // Továbblép, ha jó a jegy, vagy végjel
  Until (Jegyek[I]=0) Or (I=Max); // Vége, ha végjel, vagy megtelt a vektor
  If (Jegyek[I]=0) Then Db:=I-1   // Darabszám korrigálás, ha szükséges
                   Else Db:=I;

  {Feldolgozás}
  For I:=1 to Db do               // Jegyek számlálása
    Begin
      Inc(Jegydb[Jegyek[I]]);
    End;

  Ind:=1;                         // Leggyakoribb jegy meghatározása
  For I:=2 to 5 do
    If Jegydb[I]>Jegydb[Ind]
      Then
        Ind:=I;

  Writeln;                        // Táblázatos kiíratás
  Writeln('Jegy':8,'Db':8);
  For I:=5 Downto 1 Do
    Writeln(I:6,Jegydb[I]:10);

  Writeln;                        // Leggyakoribb jegyek kiírása
  Write('  A leggyakoribb erdemjegy(ek): ');
  For I:=1 to 5 Do
    If Jegydb[I]=Jegydb[Ind]      // Ha az I. jegy darabszáma megegyezik a leggyakoribbnak talált jegy számával
      Then
        Write(I,' ');

  Readln;
end.


