program rejtveny;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  TTabla = Array[0..11,0..11] of Integer;
  TNevTomb = Array[1..10] of String;
Var
  i, Tsz, Db, RosszHajoDb, RosszHelyDb, HelyesDb, BiztosDb : Byte;
  Tabla, MTabla : TTabla;
  Fn : TextFile;
  Nev : String;
  NevLista, BiztosLista : TNevTomb;

Procedure Bekeres (var T : TTabla);
Var sor, oszlop, ertek : Byte;
Begin
  Writeln('Adja meg a vilagitotorony helyet es erteket!');
  Writeln('sor, oszlop, ertek (Szokozzel elvalasztva)');
  readln(sor, oszlop, ertek);
  T[sor, oszlop] := ertek;
  if ertek > 3 then writeln ('Nehez torony.');

End;

Procedure Kiiras(T: TTabla);
var i, j : Byte;
Begin
  for i := 1 to 10  do
    for j := 1 to 10 do
       if T[i,j] = 99  then Writeln(i,', ',j);
End;

Procedure Tiltottmezo(Var T : TTabla);
Var sor, oszlop, i, j  : Byte;
Begin
  for sor := 1 to 10 do
    For oszlop := 1 to 10 do
      if (T[sor,oszlop] > 0) and (T[sor, oszlop]< 11) then
         Begin
           for i := sor - 1 to sor + 1 do
             for j := oszlop - 1 to oszlop + 1 do
               if T[i,j] = 0 then
                  T[i,j] := 99;
         End;
End;
Procedure BeolvasasFilebol(Var T : TTabla);
var i, j : Byte;
Begin
  for i := 1 to 10 do
      begin
        for j := 1 to 10 do read(fn,T[i,j]);
        readln(fn);
      end;

End;
Function Atalakito(sor, oszlop, ertek: Byte) : String;
Begin
  Atalakito:= IntToStr(sor)+InttoStr(oszlop)+IntToStr(ertek);
End;

Function TablaEgyformae(T1,T2 : TTabla) : Boolean;
Var i, j, H1Db, H2Db : Byte;
    H1, H2 : TNevTomb;
Begin
  H1Db := 0; H2Db := 0;
  For i := 1 to 10 Do
    For j := 1 to 10 Do
      Begin
       If (T1[i,j]>0) and (T1[i,j] <= 10) then
          Begin
             inc(H1Db);
             H1[H1Db] := Atalakito(i, j, T1[i,j]);
          End;
       If (T2[i,j]>0) and (T2[i,j] <= 10) then
          Begin
             inc(H2Db);
             H2[H2Db] := Atalakito(i, j, T2[i,j]);
          End;
      End;
  if H1Db = H2Db then
    Begin
       i := 1;
       While (i<=H1Db) and (H1[i] = H2[i]) Do
          inc(i);
       Result := i > H1Db;
    End;
End;

Function Hajokszama(T: TTabla) : Byte;
Var i, j, Db : Byte;
Begin
  Db := 0;
  for i := 1 to 10 do
    for j := 1 to 10  do
      if T[i,j] = 11 then
         inc(Db);
  Result := Db;
End;

function VanHajoUtkozes(T :TTabla) : Boolean;
Var i, j, sor, oszlop : Byte;
    Utkozes : Boolean;
Begin
  Utkozes := false;
  for sor := 1 to 10 do
    for oszlop := 1 to 10 Do
      if (T[sor,oszlop] <> 0) and (T[sor, oszlop]<> 99) then
        Begin
          for i := sor - 1 to sor + 1 do
            for j := oszlop - 1 to oszlop + 1 do
               if (T[i,j] <> 0) and (T[i,j] <> 99) and (i <> sor) and (j <> oszlop)then
                   Utkozes := True;
        End;
   Result := Utkozes;
End;

Function MegoldasEllenorzo(T: TTabla) : Boolean;
Var s, o, i, HajoDb : Byte;
    Helyes : Boolean;
Begin
  Helyes := True;
  for s := 1 to 10 do
    for o := 1 to 10 do
       if (T[s,o] > 0) and (T[s,o] <= 10) then
          Begin
            HajoDb := 0;
            for i := 1 to 10 do
              Begin
                if  (T[s, i] = 11) then
                    inc(HajoDb);
                if  (T[i, o] = 11) then
                    inc(HajoDb);
              End;
            if HajoDb <> T[s, o] then
               Helyes := false;
          End;
  Result := Helyes;
End;



begin
    { TODO -oUser -cConsole Main : Insert code here }
  Writeln('1. feladat');

   Bekeres(Tabla);

  Writeln; Writeln('2. feladat');

   Tiltottmezo(Tabla);
   Writeln('Mezok, ahova nem kerulhet hajo:');
   Kiiras(Tabla);
   Writeln;

  Writeln('3. feladat');

   AssignFile(Fn, 'feladvany.txt');
   Reset(Fn);
    BeolvasasFilebol(Tabla);
   CloseFile(Fn);
   AssignFile(Fn, 'megoldas.txt');
   Reset(Fn);
   Readln(Fn, Tsz);
   Db := 0; RosszHajoDb := 0; RosszHelyDb := 0; HelyesDb := 0;
   For i := 1 to Tsz Do
     Begin
       Readln(Fn, Nev);
       BeolvasasFilebol(MTabla);
       if not TablaEgyformae(Tabla, MTabla) then
         Begin
           Writeln(Nev);
           inc(db);
         End
       else
         begin
           if Hajokszama(MTabla)<> 12 then
              Inc(RosszHajoDb)
           else
             Begin
               if VanHajoUtkozes(Mtabla) then
                  inc(RosszHelyDb)
               else
                 if MegoldasEllenorzo(Mtabla) then
                   Begin
                     inc(HelyesDb);
                     NevLista[HelyesDb] := Nev;
                   End;
             End;
         End;
     End;
   CloseFile(Fn);
   If Db = 0 then
     Writeln('Mindegyik megoldas erre a heti feladvanyra erkezett.');

  Writeln; Writeln('4. feladat' );

     Writeln('A megoldas ', RosszHajoDb, ' esetben volt rossz a hajok szama miatt.');

  Writeln; Writeln('5. feladat');

     If RosszHelyDb <> 0 then
        Writeln('A hajok elhelyezese nem szabalyszeru ', RosszHelyDb, ' esetben!');

  Writeln; Writeln('6. feladat');

     If HelyesDb <> 0 then
       for i := 1 to HelyesDb do
         Writeln(NevLista[i]);


   Readln;
end.
