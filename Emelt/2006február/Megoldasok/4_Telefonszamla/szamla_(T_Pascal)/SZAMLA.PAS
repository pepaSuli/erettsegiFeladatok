Program szamla;
Uses crt;
Type
  TTelSzam = String[10];
  TIdo = Record
    o,p,s : byte;
  end;
  THivas = Record
    kezd, vege : TIdo;
    Telszam : TTelSzam;
  end;
  THivasTomb = Array[1..200] of THivas;
Var
  N, cv, csdb : Byte;
  Hivasok : THivasTomb;
  Tel : TTelSzam;
  hkezd, hvege : TIdo;
  egyhivas : THivas;
  HivasTomb : THivasTomb;
  InFN, outFN : Text;
  mobilpercek,vezetekpercek : Integer;
{----------------------------------------------------------------------------}
Function TelefonMobile(Telsz : TTelSzam) : boolean;
Var S : String;
    korzet : byte;
    mobil_e : boolean;
    mobilos : set of byte;
    code : integer;
Begin
  mobilos := [39,41,71];
  mobil_e := false;
  S := Copy(Telsz,1,2);
  val(s,korzet,code);
  if korzet in mobilos then mobil_e := true;
  TelefonMobile := mobil_e;
End;

Function IdoToMasodperc(Ido : TIdo) : word;
Begin
 IdoToMasodperc := Ido.o * 3600 + ido.p * 60 + ido.s;
End;

Function SzamlazottPerc(hk,hv : TIdo) : Byte;
Var ksec, vsec, bsec : Integer;
    szperc : Byte;
Begin
  ksec := IdoToMasodperc(hk);
  vsec := IdoToMasodperc(hv);
  bsec := vsec - ksec;
  szperc := bsec div 60;
  if bsec mod 60 <> 0 then inc(szperc);
  SzamlazottPerc := szperc;
End;

Function csucsido_e(hk :TIdo): Boolean;
Var csido : Boolean;
    ms : word;
Begin
  csido := false;
  ms := IdoToMasodperc(hk);
  if (ms >= 25200) AND (ms <= 64800) then
     csido := true;
  csucsido_e := csido;
End;

Procedure MegszamolCsucsidok(N : Byte; T : THivasTomb; Var Db : Byte);
Var cv : Byte;
Begin
 Db := 0;
 for cv := 1 to N Do
  if Csucsido_e(T[cv].kezd) then inc(Db);
End;

Procedure SzumMobilVezetekes(N: Byte;T : THivasTomb; Var Szm,Szv : Integer);
Var cv : Byte;
Begin
  szm := 0; szv := 0;
  for cv := 1 to N Do
    if TelefonMobile(T[cv].TelSzam) then
      szm := szm + Szamlazottperc(T[cv].kezd,T[cv].vege)
    else
      szv := szv + Szamlazottperc(T[cv].kezd,T[cv].vege);
End;

Function CsucsdijFizet(N: Byte; T: THivasTomb) : Real;
Var cv : Byte;
    Szum : Real;
Begin
  Szum := 0;
  for cv := 1 to N Do
    if csucsido_e(T[cv].kezd) then
      if telefonMobile(T[cv].TelSzam) then
        szum := szum + Szamlazottperc(T[cv].kezd,T[cv].vege) * 69.175
    else
      szum := szum + Szamlazottperc(T[cv].kezd,T[cv].vege) * 30;
  CsucsdijFizet := szum;
End;
{------------------------------- PROGRAM ------------------------------------}
BEGIN
  clrscr;
  Write('Adjon meg egy telefonsz mot!: ');
  Readln(tel);
  Write('A telefonsz m ');
  if TelefonMobile(tel) then Writeln('mobil') else writeln('vezet‚kes');

{----------------------------------------------------------------------------}
  Writeln('Adja meg a h¡v s kezdet‚nek idej‚t!');
  Write('¢ra: ');   Readln(Hkezd.o);
  Write('perc: ');  Readln(Hkezd.p);
  Write('mperc: '); Readln(Hkezd.s);
  Writeln('Adja meg a h¡v s v‚g‚nek id“pontj nak idej‚t!');
  Write('¢ra: ');   Readln(Hvege.o);
  Write('perc: ');  Readln(Hvege.p);
  Write('mperc: '); Readln(Hvege.s);
  Writeln('A sz ml zott percek sz ma: ',SzamlazottPerc(Hkezd, Hvege));

{----------------------------------------------------------------------------}
  Assign(InFN, 'hivasok.txt');
  Assign(OutFN, 'percek.txt');
  Reset(InFN);
  ReWrite(OutFN);
   N := 1;
   While not eof(inFN) Do
    Begin
      Read(InFN,Hkezd.o);
      Read(InFN,Hkezd.p);
      Read(InFN,Hkezd.s);
      Read(InFN,Hvege.o);
      Read(InFN,Hvege.p);
      Readln(InFN,Hvege.s);
      Readln(InFN,Tel);
      egyhivas.kezd := Hkezd;
      egyhivas.vege := Hvege;
      egyhivas.telszam := tel;
      HivasTomb[N] := egyhivas;
      Write(OutFN,SzamlazottPerc(egyhivas.kezd,egyhivas.vege));
      Write(OutFN,' ');
      Writeln(OutFN,egyhivas.telszam);
      inc(N);
    End;
    N := N - 1;
  Close(InFN);
  Close(OutFN);

{----------------------------------------------------------------------------}

  MegszamolCsucsidok(N,HivasTomb,CsDb);
  Writeln('A cs£csid“s h¡v sok sz ma: ', csDb);
  Writeln('A cs£csid“n k¡vli h¡v sok sz ma: ', N - CsDb);

{----------------------------------------------------------------------------}
  SzumMobilVezetekes(N,HivasTomb,mobilpercek,vezetekpercek);
  Writeln('A mobil sz mos h¡v sok sz ml zott percei: ', mobilpercek);
  Writeln('A vezet‚kes h¡v sok sz ml zott percei:', vezetekpercek);

{----------------------------------------------------------------------------}
  Writeln('A cs£csd¡jas h¡v sok‚rt fizetend“ : ',
           CsucsdijFizet(N,HivasTomb):3:2);
  readln;
END.