Module Module1 
    REM Sz� bels� bet�inek megkever�se 

    Sub Main() 

        REM V�ltoz�k, konstansok deklar�l�sa 
        Dim szoveg, kevertszoveg As String 
        Dim sz As Char() 
        Dim i, szk, szv, j, k As Integer 
        Dim csz As Char 
         
        REM Inform�ci�k ki�rat�sa 
        System.Console.WriteLine("Sz� bels� bet�inek megkever�se") 
        System.Console.WriteLine("-----------------------------------") 
        System.Console.WriteLine("") 

        REM Bemeneti adatok beolvas�sa a billenty�zetr�l 
        System.Console.WriteLine("Adja meg a bemen� sz�veget: ") 
        szoveg = System.Console.ReadLine() 
        sz = szoveg.ToCharArray 

        REM Az eredm�ny kisz�m�t�sa 
        i = 0 
        While i < sz.Length 

            REM A szo elejenek a keresese 
            While i < sz.Length AndAlso sz(i) = " " 
                i = i + 1 
            End While 
            szk = i 

            REM A szo vegenek a keresese 
            While i < sz.Length AndAlso sz(i) <> " " 
                i = i + 1 
            End While 
            szv = i - 1 

            REM A szo belso betuinek kever�se 
            REM Egy v�letlenszer� cser�vel m�dos�tott 
            REM rendez�si elgoritmussal 
            For j = szk + 1 To szv - 2 
                For k = j + 1 To szv - 1 
                    If Rnd() < 0.5 Then 
                        csz = sz(j) 
                        sz(j) = sz(k) 
                        sz(k) = csz 
                    End If 
                Next 
            Next 

        End While 

        kevertszoveg = New String(sz) 

        REM Az eredm�ny megjelen�t�se 
        System.Console.WriteLine() 
        System.Console.WriteLine("A sz�veg a szavak bels� bet�it megkeverve:") 
        System.Console.WriteLine(kevertszoveg) 
        System.Console.WriteLine() 

        REM Programbefejez�s 
        System.Console.WriteLine("Nyomj [enter]-t a befejez�shez!") 
        System.Console.ReadLine() 

    End Sub 
    
End Module 
