Program sms;
Const MaxTarolt = 10;
Type Tuzenet=Record
               ora, perc : Integer;
               kuldo : String[9];
               szoveg : String[100]
             End;
     TuzenetTomb = Array[1..100] Of Tuzenet;
Var uzenet : TuzenetTomb;
    UzenetSzam  : Integer;

Procedure F1(Var Uzenet_:TuzenetTomb; Var UzenetSzam_:Integer);
  Var be : Text;
      szokoz : Char;
      i : Integer;
      Ora, Perc : Integer;
  Begin
    Assign(be, 'sms.txt');
    ReSet(be);
    ReadLn(be, UzenetSzam_);
    For i:=1 To UzenetSzam_ Do Begin
      ReadLn(be, Uzenet_[i].Ora, Uzenet_[i].Perc, Szokoz, Uzenet_[i].Kuldo);
      ReadLn(be, Uzenet_[i].Szoveg);
    End;
    Close(be);
  End;

Procedure F2(Uzenet_:TuzenetTomb; UzenetSzam_:Integer);
  Begin
    If MaxTarolt<UzenetSzam_ Then WriteLn(Uzenet_[MaxTarolt].Szoveg)
    Else WriteLn(Uzenet_[UzenetSzam_].Szoveg)
  End;

Procedure F3(Uzenet_:TuzenetTomb; UzenetSzam_:Integer);
  Var MaxHely, MinHely : Integer;
      i : Integer;
  Begin
    MaxHely:=1; MinHely:=1;
    For i:=2 To UzenetSzam_ Do Begin
      If Length(Uzenet_[i].Szoveg)>Length(Uzenet_[MaxHely].Szoveg)
        Then MaxHely:=i;
      If Length(Uzenet_[i].Szoveg)<Length(Uzenet_[MinHely].Szoveg)
        Then MinHely:=i;
    End;
    WriteLn('A legr”videbb zenet:');
    WriteLn(Uzenet_[Minhely].Ora, ' ', Uzenet_[Minhely].Perc, ' ', Uzenet_[Minhely].Kuldo, ' ', Uzenet_[Minhely].szoveg);
    WriteLn('A leghosszabb zenet:');
    WriteLn(Uzenet_[Maxhely].Ora, ' ', Uzenet_[Maxhely].Perc, ' ', Uzenet_[Maxhely].Kuldo, ' ', Uzenet_[Maxhely].szoveg);
  End;

Procedure F4(Uzenet_:TuzenetTomb; UzenetSzam_:Integer);
  Var d01, d21, d41, d61, d81 : Integer;
      i : Integer;
  Begin
    d01:=0; d21:=0; d41:=0; d61:=0; d81:=0;
    For i:=1 To UzenetSzam_ Do Begin
      Case length(Uzenet_[i].Szoveg) Of
         1.. 20 : Inc(d01);
        21.. 40 : Inc(d21);
        41.. 60 : Inc(d41);
        61.. 80 : Inc(d61);
        81..100 : Inc(d81);
      End;
    End;
    WriteLn(' 1- 20: ', d01:4, ' darab');
    WriteLn('21- 40: ', d21:4, ' darab');
    WriteLn('41- 60: ', d41:4, ' darab');
    WriteLn('61- 80: ', d61:4, ' darab');
    WriteLn('81-100: ', d81:4, ' darab');
  End;

Procedure F5(Uzenet_:TuzenetTomb; UzenetSzam_:Integer);
  Var Ora : Array[0..24] Of Integer;
      i : Integer;
      Kozpontban : Integer;
  Begin
    For i:=0 To 23 Do Ora[i]:=0;
    For i:=1 To UzenetSzam_ Do Inc(Ora[Uzenet_[i].Ora]);
    Kozpontban:=0;
    For i:=0 To 23 Do Begin
      If Ora[i]>10 Then Inc(Kozpontban, (Ora[i]-10));
    End;
    WriteLn('A kozpontban tarolt uzenetek szama:', Kozpontban)
  End;

Procedure F6(Uzenet_:TuzenetTomb; UzenetSzam_:Integer);
  Var i : Integer;
      fontos : Integer;
      elozo, kezd : Integer;
      eltelt : Integer;
  Begin
    fontos:=0;
    For i:=1 To UzenetSzam_ Do Begin
      If Uzenet_[i].Kuldo='123456789' Then Inc(fontos)
    End;
    If i<=2 Then WriteLn('Nincs elegendo uzenet')
    Else Begin
      i:=1;
      While Uzenet_[i].Kuldo<>'123456789' Do Inc(i);
      elozo:=i;
      kezd:=i;
      For i:=kezd+1 To UzenetSzam_ Do Begin
        If Uzenet_[i].Kuldo='123456789' Then Begin
          Eltelt:=(Uzenet_[i].Ora*60+Uzenet_[i].Perc)-(Uzenet_[elozo].Ora*60+Uzenet_[elozo].Perc);
          elozo:=i;
        End;
      End;
    End;
    WriteLn('A leghosszabb id‹: ', Eltelt div 60, ' ora ', Eltelt mod 60, ' perc');
  End;

Procedure F7(Var Uzenet_:TuzenetTomb; Var UzenetSzam_:Integer);
  Begin
    Inc(UzenetSzam_);
    Write('Ora: ');
    ReadLn(Uzenet_[UzenetSzam_].Ora);
    Write('Perc: ');
    ReadLn(Uzenet_[UzenetSzam_].Perc);
    Write('Kuldo: ');
    ReadLn(Uzenet_[UzenetSzam_].Kuldo);
    Write('Szoveg: ');
    ReadLn(Uzenet_[UzenetSzam_].Szoveg);
  End;

Procedure F8(Uzenet_:TuzenetTomb; UzenetSzam_:Integer);
  Var aktszam : String[9];
      i, j : Integer;
      Seged : TUzenet;
      ki : Text;
  Begin
    For i:=1 To UzenetSzam-1 Do Begin
      For j:=1 To UzenetSzam-i Do Begin
        If Uzenet[j].Kuldo>Uzenet[j+1].Kuldo Then Begin
          Seged:=Uzenet[j];
          Uzenet[j]:=Uzenet[j+1];
          Uzenet[j+1]:=Seged;
        End;
      End;
    End;
    Assign(ki, 'smski.txt');
    ReWrite(ki);
    aktszam:='';
    For i:=1 To UzenetSzam Do Begin
      If Uzenet[i].Kuldo<>aktszam Then Begin
        WriteLn(ki, Uzenet[i].Kuldo);
        aktszam:=Uzenet[i].Kuldo;
      End;
      WriteLn(ki, '  ', Uzenet[i].Ora, ' ', Uzenet[i].Perc, ' ', Uzenet[i].szoveg)
    End;
    Close(ki);
  End;

Begin
  WriteLn('1. feladat');
  F1(Uzenet, UzenetSzam);
  WriteLn('2. feladat');
  F2(Uzenet, UzenetSzam);
  WriteLn('3. feladat');
  F3(Uzenet, UzenetSzam);
  WriteLn('4. feladat');
  F4(Uzenet, UzenetSzam);
  WriteLn('5. feladat');
  F5(Uzenet, UzenetSzam);
  WriteLn('6. feladat');
  F6(Uzenet, UzenetSzam);
  WriteLn('7. feladat');
  F7(Uzenet, UzenetSzam);
  WriteLn('8. feladat');
  F8(Uzenet, UzenetSzam);
End.