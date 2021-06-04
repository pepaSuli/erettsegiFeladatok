unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls;

type
  TMatrix = Array['A'..'Z','A'..'Z'] of Char;
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    Edit2: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    Function KulcsAtalakit(K : String; SzHossz : Integer) : String;
    procedure Button1Click(Sender: TObject);
    Function SzovegAtalakit(Sz : String) : String;
    Function  Kodolas(Sz, KSz : String) : String;
    Procedure FajlbolOlvasTabla(Var VT : TMatrix);
    Procedure FajlbakiIr(Sz : String);
    Procedure KodolSzovegiKiir(Sz: String);
  private
    VigenereTabla : TMatrix;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
   FajlbolOlvasTabla(VigenereTabla);
end;

function TForm1.KulcsAtalakit(K: String; SzHossz: Integer): String;
Var cv, KHossz : Integer;
    S : String;
begin
  KHossz := Length(K);
  S := '';
  for cv := 0 to  SzHossz-1 do
    begin
       S := S + K[cv mod KHossz + 1];
    end;
  KulcsAtalakit := S;
end;

procedure TForm1.Button1Click(Sender: TObject);
Var Szoveg, Kulcs, KodoltSzoveg: String;
begin
 Szoveg := Edit2.Text;
 Kulcs := UpperCase(Edit1.Text);
 Label3.Caption := SzovegAtalakit(Szoveg);
 KodoltSzoveg := Kodolas(Szoveg,Kulcs);
 KodolSzovegiKiir(KodoltSzoveg);
end;

function TForm1.SzovegAtalakit(Sz: String): String;
Const ABC : Set of Char = ['a'..'z','A'..'Z'];
      Ekezetes : Set of Char = ['á','é','í','ó','ö','õ','ú','ü','û',
                                'Á','É','Í','Ó','Ö','Õ','Ú','Ü','Û'];
Var cv : integer;
    UjSz : String;
begin
  UjSz := '';
  for cv := 1 to length(Sz) do
  begin
    If Sz[cv] in Ekezetes then
      Case Sz[cv] of
        'á','Á' : Sz[cv]:= 'a';
        'é','É' : Sz[cv]:= 'e';
        'í','Í' : Sz[cv]:= 'i';
        'ó','ö','õ','Ó','Ö','Õ' : Sz[cv]:= 'o';
        'ú','ü','û','Ú','Ü','Û' : Sz[cv]:= 'u';
      End;
    if Sz[cv] in ABC Then
      UjSz := UjSz + Sz[cv];
  end;
  UjSz := UpperCase(UjSz);
  SzovegAtalakit := UjSz;
end;

function TForm1.Kodolas(Sz, KSz: String): String;
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

procedure TForm1.FajlbolOlvasTabla(Var VT: TMatrix);
Var i, j : 'A'..'Z';
    FN : TextFile;
begin
  if OpenDialog1.Execute then
    Begin
      AssignFile(FN, OpenDialog1.FileName);
      Reset(FN);
         for i := 'A' to 'Z' Do
           Begin
             for j := 'A' to 'Z' Do
                 Read(FN,VT[i,j]);
             Readln(FN);
           End;
      CloseFile(FN);
    End;
end;

procedure TForm1.FajlbakiIr(Sz: String);
Var FN : TextFile;
begin
  AssignFile(FN,'kodolt.dat');
  Rewrite(Fn);
    Writeln(Fn,Sz);
  CloseFile(FN);
end;

procedure TForm1.KodolSzovegiKiir(Sz: String);
begin
  Label3.Caption := Label3.Caption + #13 + Sz;
  FajlbakiIr(Sz);
end;

end.
