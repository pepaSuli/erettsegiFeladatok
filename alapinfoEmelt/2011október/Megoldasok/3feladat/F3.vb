Module Module1 
    REM Szó belsõ betûinek megkeverése 

    Sub Main() 

        REM Változók, konstansok deklarálása 
        Dim szoveg, kevertszoveg As String 
        Dim sz As Char() 
        Dim i, szk, szv, j, k As Integer 
        Dim csz As Char 
         
        REM Információk kiíratása 
        System.Console.WriteLine("Szó belsõ betûinek megkeverése") 
        System.Console.WriteLine("-----------------------------------") 
        System.Console.WriteLine("") 

        REM Bemeneti adatok beolvasása a billentyûzetrõl 
        System.Console.WriteLine("Adja meg a bemenõ szöveget: ") 
        szoveg = System.Console.ReadLine() 
        sz = szoveg.ToCharArray 

        REM Az eredmény kiszámítása 
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

            REM A szo belso betuinek keverése 
            REM Egy véletlenszerû cserével módosított 
            REM rendezési elgoritmussal 
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

        REM Az eredmény megjelenítése 
        System.Console.WriteLine() 
        System.Console.WriteLine("A szöveg a szavak belsõ betûit megkeverve:") 
        System.Console.WriteLine(kevertszoveg) 
        System.Console.WriteLine() 

        REM Programbefejezés 
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!") 
        System.Console.ReadLine() 

    End Sub 
    
End Module 
