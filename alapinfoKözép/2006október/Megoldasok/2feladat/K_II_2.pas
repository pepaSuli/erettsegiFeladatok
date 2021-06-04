{K‚sz¡tsen programot, amely bek‚r billentyûzetr“l egy 3 jegyû
pozit¡v eg‚sz sz mot ‚s eld”nti r¢la, hogy Armstrong sz m-e!
A h romjegyû Armstrong sz mokra igaz, hogy a sz mjegyei k”b‚nek
”sszege megegyezik az eredeti sz mmal,
pl. 371 = 3^3+7^3+1^3.	(3^3=27, 7^3=343, 1^3=1)
Az eredm‚nyt a k‚perny“re irassa ki!
}
Program Armstrong;
uses crt;
Var s,s3,t,t3,e,e3,szam:word;
begin
     clrscr;
     writeln('Ez a program eld”nti, hogy a megadott sz m Armstrong sz m-e');
     repeat
                 write('Adja meg a sz mot: ');
                 readln(szam);
                 If not ((szam>99) and (szam<1000))
                    then writeln('A program csak h romjegyû term‚szetes sz mokkal mûk”dik');
     until (szam>99) and (szam<1000);
     s:=szam div 100;
     t:=(szam-s*100) div 10;
     e:=szam-(s*100+t*10);
     s3:=s*s*s;
     t3:=t*t*t;
     e3:=e*e*e;
     writeln(s3,'+',t3,'+',e3, '= ',s3+t3+e3);
     if s3+t3+e3=szam
         Then writeln('A sz m Armstrong sz m')
         Else writeln('A sz m NEM Armstrong sz m');
     readkey;
end.
