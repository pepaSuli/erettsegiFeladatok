Module Module1 
    REM Maximális magánhangzó szám meghatározása 

    Sub Main() 

        REM Változók, konstansok deklarálása 
        Const N As Integer = 10 
        Dim szavak(N) As String 
        Dim i As Integer 
        Dim MGHsz, maxMGHszam As Integer 

        REM Információk kiíratása 
        System.Console.WriteLine("Maximális magánhangzó szám meghatározása") 
        System.Console.WriteLine("-----------------------------------") 

        System.Console.WriteLine("") 

        REM Bemeneti adatok beolvasása a billentyûzetrõl 
        For i = 1 To N 
            System.Console.Write("A(z) " & i & ". szó : ") 
            szavak(i) = System.Console.ReadLine() 
        Next 

        REM Az eredmény kiszámítása 
        maxMGHszam = 0 
        For i = 1 To N 
            MGHsz = MGHszam(szavak(i)) 
            If MGHsz > maxMGHszam Then 
                maxMGHszam = MGHsz 
            End If 
        Next 
         

        REM Az eredmény megjelenítése 
        System.Console.WriteLine() 
        System.Console.Write("Egy szóban legfeljebb " & maxMGHszam) 
        System.Console.WriteLine(" magánhangzó található.") 
        System.Console.WriteLine() 

        REM Programbefejezés 
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!") 
        System.Console.ReadLine() 

    End Sub 

    Function MGHszam(ByVal szo As String) As Integer 
        REM A paraméterként kapott szóban találhatómagánhangzók  
             REM számát adja vissza 
        Const MGH As String = "aeiouAEIOU" 
        Dim i, db As Integer 
        db = 0 
        For i = 0 To szo.Length - 1 
            If MGH.Contains(szo.Substring(i, 1)) Then 
                db = db + 1 
            End If 
        Next 
        Return db 
    End Function 

End Module 
