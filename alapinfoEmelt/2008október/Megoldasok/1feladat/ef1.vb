Module Module1

    REM Elektronikus céltábla
    Sub Main()
        REM Változók, konstansok deklarálása
        Const g As Double = 9.81
        Dim x, y, d As Double
        Dim pont As Integer

        REM Információk kiíratása
        System.Console.WriteLine("Adott koordinátákra becsapódó lövés pontétéke...")
        System.Console.WriteLine("-----------------------------------------------------")
        System.Console.WriteLine("A tizedes jel (./,) a Területi beállításoktól függ!")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvasása a billentyûzetrõl
        System.Console.Write("A becsapódás X koordinátája (x) = ")
        x = System.Console.ReadLine()
        System.Console.Write("A becsapódás Y koordinátája (y) = ")
        y = System.Console.ReadLine()
        
        REM Az eredmény kiszámítása
        d = Math.Sqrt(x * x + y * y)
        pont = (1000 - d) / 100

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A(z) (" & x & "," & y & ") koordinátákjra becsapódó lövés " & pont & " pontot ér.")
        System.Console.WriteLine()

        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()
    End Sub

End Module