program sms;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function kodol (sz: string):string;
type TBetusor = array ['a'..'z'] of byte;
Const betuk : TBetusor = (2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,7,8,8,8,9,9,9,9);
var cv : byte;
begin
  Result := '';
  for cv := 1 to Length(sz) do
    Result := Result + IntToStr(betuk[sz[cv]]);
end; // kodol

procedure karakterkodol;
var karakter : char;
begin
  Write('Kerem a karaktert: ');
  Readln(karakter);
  Writeln('Szammal: ' + kodol(karakter));
end; //karakterkodol

procedure szokod;
var szo : string;
begin
  Write('Kerem a szot: ');
  Readln(szo);
  Writeln('Szamokkal: ' + kodol(szo));
end;  //szokod

procedure leghosszabbszo;
var   f : TextFile;
      s : string;
    max : string;
begin
  AssignFile(f, 'szavak.txt');
  Reset (f);
  max := '';
  while not eof(f) do
    begin
      Readln(f, s);
      if Length(s)>Length(max) then
        max := s;
    end; // fájl vége
  CloseFile(f);
  Writeln('A leghosszabb szo: ' + max);
  Writeln('Hossza: ' + IntToStr(Length(max)));
end; //leghosszabbszo

procedure rovidszavak;
var    f : TextFile;
       s : string;
    szam : integer;
begin
  AssignFile(f, 'szavak.txt');
  szam := 0;
  Reset(f);
    while not Eof(f) do
      begin
        Readln(f, s);
        if Length(s)<=5 then inc (szam);
      end; // fájl vége
  CloseFile(f);
  Writeln('A rovid szavak szama: ' + IntToStr(szam));
end; //rovidszavak

procedure kodokfajlba;
var f1, f2 : TextFile;
         s : String;
begin
  AssignFile (f1, 'szavak.txt');
  AssignFile (f2, 'kodok.txt');
  Reset (f1);
  Rewrite (f2);
  While not eof (f1) do
    begin
      readln (f1,s);
      Writeln (f2, kodol(s));
    end; // fájl vége
  CloseFile (f2);
  CloseFile (f1);
end; //kodokfajlba

procedure kodhozszo;
var      f : TextFile;
    s1, s2 : String;
begin
  Write ('Kerem a szamsort (pl.: 225): ');
  ReadLn (s1);
  AssignFile (f, 'szavak.txt');
  Reset (f);
  While not eof (f) do
    begin
      readln (f,s2);
      if kodol(s2)=s1 then WriteLn (s2);
    end; // fájl vége
  CloseFile (f);
end; // kodhozszo

procedure ismetlodok;
type Tszo = record
       szo : string [15];
       kod : string [15];
     end; // szavak

    procedure csere (var a, b : Tszo);
    var s : Tszo;
    begin
      s := a; a := b; b := s;
    end; //csere

type  Tszavak = array [1..600] of Tszo;

var   szavak, azonosak : Tszavak;
          N, M, cv, mv : integer;
                     f : TextFile;
                    sz : integer;
          max, maxhely : integer;
begin
  N := 0;  M := 0;
  AssignFile (f, 'szavak.txt');
  Reset (f);
  While not eof(f) do
    begin
      inc (N);
      Readln (f, szavak[N].szo);
      szavak[N].kod := kodol(szavak[N].szo);
    end; //fájl vége
  CloseFile(f);
  // Rendezés kód szerint
  for cv := 1 to N-1 do
    for mv := cv to N do
      if szavak[mv].kod < szavak[cv].kod then csere (szavak[mv], szavak[cv]);
  // Rendezés vége
  for cv := 2 to N-1 do
    if (szavak[cv].kod=szavak[cv+1].kod) OR (szavak[cv].kod=szavak[cv-1].kod)
      then
        begin
          inc(M);
          azonosak[M] := szavak [cv];
          Write (szavak[cv].szo + ' : '+szavak[cv].kod + '; ');
        end;
  Writeln;
  //azonosak megszámlálása
  sz := 1;
  max := 0;
  maxhely := 1;
  for cv := 2 to M do
    if azonosak[cv].kod = azonosak[cv-1].kod
      then inc(sz)
      else
        begin
          if sz > max then
            begin
              max := sz; maxhely := cv-1;
            end;
          sz := 1;
        end;
   Writeln('Legtobbszor elofordulo kod: ' + azonosak[maxhely].kod);
   Write ('Jelentesei: ' + azonosak[maxhely].szo);
   While azonosak[maxhely].kod = azonosak[maxhely-1].kod do
     begin
       dec(maxhely);
       Write (', ', azonosak[maxhely].szo);
     end;
   Writeln;  
end; // ismetlodok

// -----------------------------------------------------------------------
begin // fõprogram
  karakterkodol;
  szokod;
  leghosszabbszo;
  rovidszavak;
  kodokfajlba;
  kodhozszo;
  ismetlodok;

  Writeln('Nyomd meg az ENTER-t!');
  Readln;
end. // fõprogram
