program kodol;
uses crt;
type
  TMatrix = Array['A'..'Z','A'..'Z'] of Char;
Var VigenereTabla : TMatrix;
    NyiltSzoveg, Kulcs, k , kodoltszoveg: String;
    cv : integer;
function KulcsAtalakit(K: String; SzHossz: Integer): String;
Var cv, KHossz : Integer;
    S : String;
begin
  KHossz := Length(K);
  S := '';
  for cv := 0 to  SzHossz-1 do
       S := S + K[cv mod KHossz + 1];
  KulcsAtalakit := S;
end;

function SzovegAtalakit(Sz: String): String;
Const ABC : Set of Char = ['a'..'z','A'..'Z'];
      Ekezetes : Set of Char = ['è','ê','°','ô','ö','†','Ç',
                                '°','¢','î','ì','£','Å','ñ'];
Var cv : integer;
    UjSz : String;
begin
  UjSz := '';
  for cv := 1 to length(Sz) do
  begin
    If Sz[cv] in Ekezetes then
      Case Sz[cv] of
        'è','†' : Sz[cv]:= 'a';
        'ê','Ç' : Sz[cv]:= 'e';
            '°' : Sz[cv]:= 'i';
        '¢','î','ì','ô' : Sz[cv]:= 'o';
        '£','Å','ñ','ö' : Sz[cv]:= 'u';
      End;
    if Sz[cv] in ABC Then
      UjSz := UjSz + UpCase(Sz[cv]);
  end;
  SzovegAtalakit := UjSz;
end;

function Kodolas(Sz, KSz: String): String;
Var cv : Byte;
    sor, oszlop : 'A'..'Z';
    kodolt, KeszKulcs, KodolandoSz  : String;
begin
  kodolt := '';
  KodolandoSz := SzovegAtalakit(Sz);
  Keszkulcs:= KulcsAtalakit(KSz,Length(KodolandoSz));
  for cv := 1 to Length(KodolandoSz) do
    Begin
     sor := kodolandoSz[cv];
     oszlop := Keszkulcs[cv];
     kodolt:= kodolt + VigenereTabla[sor,oszlop];
    End;
  Kodolas := kodolt;
end;

procedure FajlbolOlvasTabla(Var VT: TMatrix);
Var i, j : 'A'..'Z';
    FN : Text;
begin
  Assign(FN, 'vtabla.dat');
  Reset(FN);
    for i := 'A' to 'Z' Do
       Begin
         for j := 'A' to 'Z' Do
            Read(FN,VT[i,j]);
         Readln(FN);
       End;
  Close(FN);
end;

procedure FajlbakiIr(Sz: String);
Var FN : Text;
begin
  Assign(FN,'kodolt.dat');
  Rewrite(Fn);
    Writeln(Fn,Sz);
  Close(FN);
end;

procedure KodoltSzovegKiir(Sz: String);
begin
  Writeln(Sz);
  FajlbakiIr(Sz);
end;

BEGIN
 clrscr;
 FajlbolOlvasTabla(VigenereTabla);
 Writeln('Adja meg a k¢doland¢ szîveget!');
 Readln(NyiltSzoveg);
 Writeln('Adja meg a kulcsszîveget!');
 Readln(Kulcs);
 K:='';
 for cv := 1 to length(Kulcs) Do K := K + UpCase(Kulcs[cv]);
 Kulcs := K;
 Writeln('Ny°lt szîveg †talak°t†sa.');
 Writeln(Szovegatalakit(nyiltszoveg));
 KodoltSzoveg := Kodolas(NyiltSzoveg, Kulcs);
 Writeln('A k¢dolt szîveg:');
 Writeln(KodoltSzoveg);
 Readln;
END.