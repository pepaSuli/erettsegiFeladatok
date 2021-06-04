Program robot;
Var UtSzam : Byte;
    Utasitas : Array[1..100] Of String;

Procedure Beolvasas;
  Var Be : Text;
      i  : Byte;
  Begin
    Assign(Be, 'program.txt');
    ReSet(Be);
    ReadLn(Be, UtSzam);
    For i:=1 To UtSzam Do Begin
      ReadLn(Be, Utasitas[i]);
    End;
    Close(Be)
  End;
Procedure Jellemzes;
  Var Melyik : Byte;
      ed, kn : Integer;
      MaxTav : Real;
      MaxLepes : Byte;
      i      :  Byte;
  Function Legvonal(dx,dy : Integer):Real;
    Begin
      Legvonal:=sqrt(sqr(dx)+sqr(dy));
    End;
  Begin
    Write('Kerem az utasitassor sorszamat! ');
    ReadLn(Melyik);
    If (Pos('ED', Utasitas[Melyik])>0) Or (Pos('DE', Utasitas[Melyik])>0) Or
       (Pos('KN', Utasitas[Melyik])>0) Or (Pos('NK', Utasitas[Melyik])>0) Then
       WriteLn('egyszerusitheto')
    Else WriteLn('nem egyszerusitheto');

    ed:=0; kn:=0;
    MaxTav:=0; MaxLepes:=0;
    For i:=1 To Length(Utasitas[Melyik]) Do Begin
      Case Utasitas[Melyik][i] Of
        'E' : inc(ed);
        'D' : dec(ed);
        'K' : inc(kn);
        'N' : dec(kn);
      End;
      If Legvonal(ed, kn)>MaxTav Then Begin
        MaxLepes:=i;
        MaxTav:=Legvonal(ed, kn)
      End;
    End;
    WriteLn(abs(ed), ' lepest kell tenni az ED, ', abs(kn), ' lepest a KN tengely menten');
    WriteLn('A robot a ', MaxLepes, ' lepest kovetoen volt a legtavolabb a kiindulasi ponttol.');
    WriteLn('A maximalis tavolsag ', MaxTav:0:3, 'cm volt')
  End;
Procedure Akku;
  Var i : Byte;
  Function Energia(Sor : String):Integer;
    Var i : Byte;
        Eddig : Integer;
    Begin
      Eddig:=2+1; {indulas es elso lepes}
      For i:=2 To Length(Sor) Do Begin
        If Sor[i]<>Sor[i-1] Then Inc(Eddig,2);
      Inc(Eddig)
    End;
    Energia:=Eddig
  End;
  Begin
    WriteLn('A kis kapacitasu akkuval vegrehajthato utasitassorok: ');
    For i:=1 To UtSzam Do Begin
      If Energia(Utasitas[i])<=100 Then
        WriteLn(i, '. utasitassor energiaszukseglete: ', Energia(Utasitas[i]));
    End;
    WriteLn;
  End;
Procedure Atir;
  Var i, j : Byte;
      db   : Byte;
      Ki : Text;
      Seged : String;
  Begin
    Assign(Ki, 'ujprog.txt');
    ReWrite(Ki);
    For i:=1 To UtSzam Do Begin
      Seged:=Utasitas[i]+'.';
      db:=1;
      For j:=2 To Length(Seged) Do Begin
        If Seged[j]=Seged[j-1] Then Inc(db)
        Else Begin
          If db>1 Then Write(Ki, db);
          Write(Ki, Seged[j-1]);
          db:=1;
        End
      End;
      WriteLn(Ki)
    End;
    Close(Ki);
  End;
Procedure Visszair;
  Var i, j : Byte;
      Ut, SzamS : String;
      Szam, Hiba : Integer;
  Begin
    Write('Kerek egy uj formatumu utasitassort! ');
    ReadLn(Ut);
    SzamS:='';
    For i:=1 To Length(Ut) Do Begin
      If Ut[i] in ['E', 'K', 'D', 'N'] Then Begin
        Val(SzamS, Szam, Hiba);
        If Szam=0 Then Szam:=1;
        For j:=1 To Szam Do Begin
          Write(Ut[i])
        End;
        SzamS:=''
      End
      Else SzamS:=SzamS+Ut[i]
    End;
  End;
Begin
  WriteLn('1. feladat');
  Beolvasas;

  WriteLn('2. feladat');
  Jellemzes;

  WriteLn('3. feladat');
  Akku;

  WriteLn('4. feladat');
  Atir;

  WriteLn('5. feladat');
  Visszair;
End.
