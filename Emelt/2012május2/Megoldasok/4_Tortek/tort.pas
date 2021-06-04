program tort;

uses crt;

  function lnko (a, b : Integer) : Integer;
  begin
    if a=b then lnko := a;
    if a<b then lnko := lnko (a, b-a);
    if a>b then lnko := lnko (a-b, b);
  end; //lnko

  function lkkt (a, b : Integer) : Integer;
  begin
    lkkt := a*b div lnko (a,b);
  end; //lkkt

  var t1sz, t1n, t2sz, t2n : Integer; //tîrt1sz†ml†l¢, tîrt1nevezã, ...

  function egesz (a, b : Integer) : boolean;
  begin
    egesz := (a mod b) = 0;
  end; //egesz

  function IntToStr (a : Integer) : string;
  var s : string;
  begin
    Str(a, s);
    IntToStr := s;
  end; //IntToStr

  procedure feladat1;
  begin
    Writeln ('1. feladat');
    Write ('Adja meg a sz†ml†l¢t: ');
    Readln (t1sz);
    Write ('Adja meg a nevezãt: ');
    Readln (t1n);
    If egesz (t1sz, t1n) then Writeln (t1sz div t1n)
                         else Writeln ('Nem egÇsz');

  end; //feladat1

  procedure feladat2;
  begin
    // az lnko fÅggvÇny val¢s°tja meg ezt a rÇszfeladatot
  end; //feladat2

  function egyszerusit (a, b: Integer): string;
  var s : string;
  begin
    s :=  IntToStr(a) + '/' + IntToStr(b) + ' = ';
    if egesz (a, b)
      then s := s + IntToStr(a div b)
      else s := s + IntToStr(a div lnko(a, b)) +
                '/' + IntToStr(b  div lnko(a, b));
    egyszerusit := s;
  end;//egyszerusit

  procedure feladat3;
  begin
    Writeln ('3. feladat');
    WriteLn (egyszerusit (t1sz, t1n));
  end; //feladat3

  function szoroz (a,b,c,d : integer): String;
  var s : string;
      sz, n : Integer;
  begin
    sz := a*c;
    n  := b*d;
    s  := IntToStr(a)+'/'+IntToStr(b)+' * '+IntToStr(c)+'/'+IntTostr(d)+' = ';
    s  := s + egyszerusit(sz,n);
    szoroz := s;
  end; //szoroz

  procedure feladat4;
  begin
    Writeln ('4. feladat');
    Write ('Adja meg a sz†ml†l¢t: ');
    Readln (t2sz);
    Write ('Adja meg a nevezãt: ');
    Readln (t2n);
    Writeln (szoroz(t1sz,t1n,t2sz,t2n));
  end; //feladat4

  procedure feladat5;
  begin
    // az lkkt fÅggvÇny val¢s°tja meg ezt a rÇszfeladatot
  end; //feladat5

  function osszegez (a,b,c,d : Integer): String;
  var s : String;
      sz1, sz2, sz, n : Integer;
  begin
    n := lkkt(b,d);
    sz1 := a*(n div b);
    sz2 := c*(n div d);
    sz := sz1+sz2;
    s := IntToStr(a)+'/'+IntToStr(b)+' + '+IntToStr(c)+'/'+IntTostr(d)+' = ';
    s := s + IntToStr(sz1)+'/'+IntToStr(n)+' + '+IntToStr(sz2)+'/'+IntTostr(n)
         +' = '+ egyszerusit(sz,n);
    osszegez := s;
  end; //îsszegez

  procedure feladat6;
  begin
    Writeln ('6. feladat');
    Writeln(osszegez(t1sz,t1n,t2sz,t2n));
  end; //feladat6

  procedure feladat7;
  var fbe, fki : text;
      muvelet : string;
  begin
    WriteLn('7. feladat f†jlba °r');
    Assign(fbe, 'adat.txt');
    Assign(fki, 'eredmeny.txt');
    Reset (fbe);
    Rewrite(fki);

    While not eof(fbe) do
      begin
        Read(fbe, t1sz);
        Read(fbe, t1n);
        Read(fbe, t2sz);
        Read(fbe, t2n);
        Readln(fbe, muvelet); muvelet := muvelet[2];
        if muvelet = '+'
          then Writeln (fki, osszegez(t1sz,t1n,t2sz,t2n))
          else Writeln (fki, szoroz(t1sz,t1n,t2sz,t2n));
      end;//while not end of file

    Close(fbe);
    Close(fki);
    Writeln('A f†jl °r†sa befejezãdîtt');
  end; //feladat7


BEGIN
  ClrScr;

  feladat1;
  feladat2;
  feladat3;
  feladat4;
  feladat5;
  feladat6;
  feladat7;

  Readkey;
END.