Program zene;
Type Tszam = Record
              ado : byte;
              perc, mp : byte;
              nev : String[50]
            end;
     TszamTomb = Array[1..1000] of TSzam;
     TAdoTomb = Array[1..3] Of Integer;
Var Szam : TSzamTomb;
    Ado : TAdoTomb;
    db : Integer;
Procedure F1;
  Var Be : Text;
      i : integer;
      szokoz : Char;
  Begin
    Assign(Be, 'musor.txt');
    ReSet(Be);
    ReadLn(Be, db);
    For i:=1 To db Do Begin
      Read(Be, Szam[i].ado, Szam[i].perc, Szam[i].mp, szokoz);
      ReadLn(Be, Szam[i].nev)
    End;
    Close(Be)
  End;
Procedure F2;
  Var i: Integer;
  Begin
    For i:=1 To 3 Do Ado[i]:=0;
    For i:=1 To db Do Inc(Ado[Szam[i].ado]);
    For i:=1 To 3 Do Begin
      WriteLn('Az ', i, '. radioban ', Ado[i], ' szam hangzott el.')
    End;
  End;
Procedure F3;
  Var elso, utolso, i : integer;
      ossz : Longint;
  Begin
    elso:=db; utolso:=1;
    For i:=1 To db Do Begin
      If (Szam[i].ado=1) and (Pos('Eric Clapton', Szam[i].nev)=1) Then
        utolso:=i;
    End;
    For i:=db DownTo 1 Do Begin
      If (Szam[i].ado=1) and (Pos('Eric Clapton', Szam[i].nev)=1) Then
        elso:=i;
    End;
    ossz:=0;
    For i:=elso To utolso Do Begin
      If Szam[i].ado=1 Then Begin
        ossz:=ossz+Szam[i].perc*60+Szam[i].mp;
      End
    End;
    WriteLn(ossz div 3600, ':', (ossz mod 3600) div 60, ':', ossz mod 60);
  End;
Procedure F4;
  Var utolso : Array[1..3] Of String;
      i : integer;
      ado : integer;
  Begin
    For i:=1 To 3 Do utolso[i]:='';
    i:=1;
    While Szam[i].nev<>'Omega:Legenda' Do Begin
      utolso[Szam[i].ado]:=Szam[i].nev;
      i:=i+1;
    End;
    ado:=Szam[i].ado;
    WriteLn('Az Omega:Legenda cimu szam a ', ado, '. adon volt hallhato');
    For i:=1 To 3 Do Begin
      If i<>ado Then Begin
        WriteLn('A(z) ', i, '.adon jelenleg a(z) ', utolso[i], ' szam hallhato');
      End;
    End;

  End;
Procedure F5;
  Var ismert, aktszam : String;
      i, j, talalt : integer;
      Ki : Text;
  Begin
    Assign(Ki, 'keres.txt');
    ReWrite(Ki);
    Write('Adja meg a felismert karaktereket! ');
    ReadLn(ismert);
    WriteLn(Ki, ismert);
    For i:=1 To db Do Begin
      aktszam:=Szam[i].nev;
      talalt:=1;
      For j:=1 To length(aktszam) Do Begin
        If UpCase(ismert[talalt])=UpCase(aktszam[j]) Then Inc(talalt);
      End;
      If talalt>length(ismert) Then WriteLn(Ki, aktszam)
    End;
    Close(Ki)
  End;
Procedure F6;
  Var i : integer;
      aktido, akthossz : LongInt;
      ora, egyora : Integer;
  Begin
    ora:=0;
    aktido:=180;
    For i:=1 To db Do Begin
      If Szam[i].ado=1 Then Begin
        akthossz:=60+Szam[i].perc*60+Szam[i].mp;
        If aktido+akthossz>60*60 Then Begin
          aktido:=180+akthossz;
          Inc(ora)
        End
        Else aktido:=aktido+akthossz;
      End;
    End;
    WriteLn(ora, ':', aktido div 60, ':', aktido mod 60)
  End;

Begin
  WriteLn('1. feladat');
  F1;
  WriteLn('2. feladat');
  F2;
  WriteLn('3. feladat');
  F3;
  WriteLn('4. feladat');
  F4;
  WriteLn('5. feladat');
  F5;
  WriteLn('6. feladat');
  F6;
End.