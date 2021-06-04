{3. feladat: (15 pont)
Egy k”z‚piskolai v‚gz‹s oszt lyba maximum 35 f‹ j r. Az ‚retts‚gi tant rgyak n‚gy
k”telez‹ valamint egy szabadon v lasztott tant rgy.
K‚sz¡tsen programot, amely beolvassa egy sz”veg f jlb¢l (vizsga.txt) a
di kok neveit, szabadon v lasztott ‚retts‚gi vizsgatant rgyaikat ‚s
meghat rozza minden fakultat¡v vizsgat rgyhoz az ‚retts‚giz‹k n‚vsor t.
Az eredm‚nyt a k‚perny‹re irassa ki!
A sz”veg f jlban minden di k neve ‚s tant rgya egy sorban pontosvessz‹vel (;)
elv lasztva szerepel. A f jl annyi sorb¢l  ll, amennyi di k szerepel benne.
}

Program vizsga;
uses crt;
Const maxlsz=35;
Type
     Telem=string;
     Tfile= Text;
     s20=string[20];
     Tadat=record
                 nev,targy:s20;
           end;
     Tavekt=array[1..maxlsz] of Tadat;
Var f:tfile;
    ef:Telem;
    eoff,siker:boolean;
    V,Vs:Tavekt;
    max:s20;
    vsz,i,j,maxi:byte;
   procedure olvas(var f:tfile;var ef:telem; var eoff:boolean);
   Begin
        eoff:=eof(f);
        If not eoff
           then    readln(f,ef);
   end;
   procedure megnyit(var siker:boolean);
   begin
        assign(f,'vizsga.txt');
        {$i-}reset(f);{$i+}
        siker:=(ioresult=0);
   end;
   procedure betolt;
   begin
        olvas(f,ef,eoff);
        vsz:=0;
        while (not eoff) and (vsz<maxlsz) do
              begin
                   vsz:=vsz+1;
                   v[vsz].nev:=copy(ef,1,pos(';',ef)-1);
                   delete(ef,1,pos(';',ef));
                   v[vsz].targy:=ef;
                   olvas(f,ef,eoff);
              end;
   end;
   procedure rendez;
      procedure csere(a,b:byte);
      var s:Tadat;
      begin
           s:=v[a];v[a]:=v[b];v[b]:=s;
      end;
   begin
        for i:=1 TO vsz-1 do
          begin
            maxi:=i;max:=v[i].targy;
            for j:=i+1 to vsz do
                if v[j].targy>max then begin maxi:=j;
                                             max:=v[j].targy;
                                       end;
            csere(i,maxi)
          end;
   end;
   procedure listaz;
   begin
        textattr:=11;writeln('Szabadon v lasztott t rgyak vizsg z¢i:');
        textattr:=7;
        for i:=1 to vsz do
          begin
            if (i=1) or ((i>2) and (v[i].targy<>v[i-1].targy))
               then write(v[i].targy:15)
               else write(' ':15);
            writeln(v[i].nev:20)
          end;
   end;
Begin
     clrscr;
     megnyit(siker);
     if {siker}true then
     begin
        betolt;
        rendez;
        listaz;
     end
     else   writeln('nincs adatfile, ¡gy nem tudok dolgozni.');
     readkey;
end.