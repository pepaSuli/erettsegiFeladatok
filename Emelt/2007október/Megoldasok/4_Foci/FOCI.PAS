Program foci;
 Type
    TEgyMeccs = Record
                    Fordulo : Byte;
                    hGol, vGol : Byte;
                    hfGol, vfGol : Byte;
		    Hazai, Vendeg : String[20];
                    Volt : Boolean
		  End;
    TMeccsTomb = Array[1..400] Of TEgyMeccs;
 Var
    mSzam : Integer;
    Meccs : TMeccsTomb;
    Csapat : String;

 Procedure Feladat(i:Integer);
   Begin
     WriteLn('---- ', i, '. feladat ----');
   End;
 Procedure Beolvasas;
   Var be:Text;
       i : Integer;
       Csapatok : String;
       SzokozHely : Byte;
   Begin
     Assign(be, 'meccs.txt');
     ReSet(be);
     ReadLn(be, mSzam);
     For i:=1 To mSzam Do Begin
       Read(be, Meccs[i].Fordulo, Meccs[i].hGol, Meccs[i].vGol, Meccs[i].hfGol, Meccs[i].vfGol);
       ReadLn(be, Csapatok);
       Delete(Csapatok, 1, 1);
       SzokozHely:=Pos(' ', Csapatok);
       Meccs[i].Hazai:=Copy(Csapatok, 1, SzokozHely-1);
       Meccs[i].Vendeg:=Copy(Csapatok, Szokozhely+1, Length(Csapatok)-Szokozhely);
     End;
     Close(be);
   End;

 Procedure F2;
   Var i : Integer;
       Szoveg : String;
       Ford : Byte;
   Begin
     WriteLn('Adja meg egy fordulo sorszamat! ');
     ReadLn(Ford);
     Szoveg:='                        ';
     For i:=1 To mSzam Do Begin
       With meccs[i] Do Begin
         If Fordulo=Ford Then Begin
           WriteLn(Copy(Hazai+Szoveg, 1, 20), '-',
                   Copy(Vendeg+Szoveg, 1, 20), ': ',
                   hGol, ' - ', vGol,
                   ' (', hfGol, ' - ', vfGol, ') ');
         End;
       End;
     End;
   End;

 Procedure F3;
   Var i : Integer;
   Begin
     For i:=1 To mSzam Do Begin
       With meccs[i] Do Begin
         If (hgol-vgol)*(hfgol-vfgol)<0 Then Begin
           If hgol>vgol Then WriteLn(Fordulo:3, '.fordulo: ', Hazai)
           Else WriteLn(Fordulo:3, '.fordulo: ', Vendeg)
         End;
       End;
     End;
   End;

 Procedure F4;
   Begin
     WriteLn('Adjon meg egy csapatnevet! ');
     ReadLn(Csapat);
   End;

 Procedure F5;
   Var i : Integer;
       lott, kapott : Byte;
   Begin
     lott:=0; kapott:=0;
     For i:=1 To mSzam Do Begin
       If meccs[i].Hazai=Csapat Then Begin
         lott:=lott+meccs[i].hGol;
         kapott:=kapott+meccs[i].vGol;
       End;
       If meccs[i].Vendeg=Csapat Then Begin
         lott:=lott+meccs[i].vGol;
         kapott:=kapott+meccs[i].hGol;
       End;
     End;
     WriteLn('A lott golok szama: ', lott, ' a kapott golok szama: ', kapott)
   End;

 Procedure F6;
   Var i : Integer;
       melymeccs : Byte;
       melyfordulo : Byte;
   Begin
     melyfordulo:=21;
     For i:=1 To mSzam Do Begin
       If (meccs[i].Hazai=Csapat) And (meccs[i].hGol<meccs[i].vGol) Then
         If meccs[i].Fordulo<melymeccs Then Begin
           melyfordulo:=meccs[i].Fordulo;
           melymeccs:=i
         End
     End;
     If melyfordulo=21 Then WriteLn('A ', Csapat, ' csapat otthon veretlen maradt')
     Else WriteLn('A ', Csapat, ' otthon eloszor a ', meccs[melymeccs].Fordulo, '. forduloban kapott ki ',
                   ' az ellenfel ', meccs[melymeccs].Vendeg, ' volt.')
   End;

 Procedure F7;
   Var i : Integer;
       vdb, db : Integer;
       megnemvolt : Integer;
       hg, vg : Byte;
       ki : Text;
   Begin
     Assign(ki, 'stat.txt');
     ReWrite(ki);
     vdb:=0;
     megnemvolt:=1;
     While vdb < mSzam Do Begin
       db:=0;
       While meccs[megnemvolt].Volt Do inc(megnemvolt);
       hg:=meccs[megnemvolt].hGol;vg:=meccs[megnemvolt].vGol;
       For i:=megnemvolt To mSzam Do Begin
         If ((hg=meccs[i].hGol) And (vg=meccs[i].vGol)
              Or (vg=meccs[i].hGol) And (hg=meccs[i].vGol))Then Begin
           meccs[i].Volt:=True;
           inc(db);
           inc(vdb);
         End;
       End;
       If hg>vg Then WriteLn(ki, hg, '-', vg, ':', db:4, ' darab')
       Else WriteLn(ki, vg, '-', hg, ':', db:4, ' darab')
     End;
     Close(ki)
   End;

Begin
  Beolvasas;
  Feladat(2);
  F2;
  Feladat(3);
  F3;
  Feladat(4);
  F4;
  Feladat(5);
  F5;
  Feladat(6);
  F6;
  Feladat(7);
  F7;
End.