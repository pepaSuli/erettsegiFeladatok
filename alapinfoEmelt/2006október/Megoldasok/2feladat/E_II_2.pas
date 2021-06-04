{A FAT f jlrendszer fontos eleme, hogy az adatokat un. clusterekben (kl szter)
t rolja el. A cluster m‚rete 512 B jt (= 1 szektor) ‚s kett‹ valamilyen
hatv ny nak, szorzata. µltal ban KiloB jtban adj k meg.
A cluster lehet pl. 4 szektor (=4*512 B jt= 2 KB),
8, 16, stb., de nem lehet 3, 5, 6, stb. szektoros. A FAT teh t minden f jt
feldarabol cluster m‚retû szeletekre, elt rolja, majd bejegyzi egy t bl zatba,
hogy hova is tette a lemezen. Ha a f jl csak t”bb clusterben f‚r el, azokat
nem felt‚tlenl egym s mellett helyezi el. A t bl zatb¢l b rmikor vissza
tudja  ll¡tani az eredeti sorrendet. Egy clusterbe egyidejûleg csak egy
f jl ¡rhat. Ha nem t”lti ki teljesen, akkor az a terlet m s c‚lra nem
haszn lhat¢. Egy 100 b jtos f jl is lefoglal teh t 2 KB-ot, ha ekkora
a cluster.
K‚sz¡tsen programot, mely megadja a cluster m‚rete, illetve a
- maximum 15 - f jl m‚rete alapj n az  ltaluk lefoglalt terlet m‚ret‚t!
A f jlok m‚rete b jtban van megadva.
Az egyszerûs‚g kedv‚‚rt a legkisebb cluster m‚ret 1 KB legyen.}
Program klaszter_szamitas;
uses crt;
Var fsize,x,sum, foglalt, s, clustersize:longint;
    i:byte;
function sgn(x:longint):shortint;
begin
     If x =0 then sgn:=0
             else if x <0 then sgn:=-1
                          else sgn:=1;

end;
Begin
     clrscr;
     writeln('A klaszterm‚ret ‚s f jlm‚retek alapj n kisz m¡tom a t‚nyleges helyfoglal st.');
     repeat
       writeln('A szektor m‚ret: 512 KBajt.');
       writeln('A klaszterm‚ret = szektor m‚ret * kett‹ valamelyik hatv nya');
       write('Adja meg a klaszter m‚ret‚t KB jtban: ');readln(clustersize);
     until clustersize in [1,2,4,8,16,32,64,128];
     sum:=0;i:=1;
     writeln('Adja meg a max 15 f jl m‚ret‚t B jtban! (v‚ge 0 byte)');
     write(i,'. f jl m‚rete: ');readln(fsize);
     while not((i>15) or (fsize=0)) do
     begin
          x:=(fsize div (1024*clustersize));
          If fsize mod (1024*clustersize) > 0 then
                       x:=x+1;
          fsize:=x*clustersize;
          write('    Helyfoglal s: ',fsize);writeln(' KB');
          sum:=sum+fsize;
          i:=i+1;
          write(i,'. f jl m‚rete: ');readln(fsize);
     end;
     writeln('A f jlok egyttes helyfoglal sa: ',sum, ' KB.');
     readkey;
end.
