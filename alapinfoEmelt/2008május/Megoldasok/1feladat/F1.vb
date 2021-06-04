Module Module1

    REM A fonálinga lengéseinek száma P perc alatt...
    Sub Main()
        REM Változók, konstansok deklarálása
        Const g As Double = 9.81
        Dim t, l, p, teljesLengesekSzama As Double


        REM Információk kiíratása
        System.Console.WriteLine("A fonálinga lengéseinek száma P perc alatt...")
        System.Console.WriteLine("---------------------------------------------")
        System.Console.WriteLine("A tizedes jel (./,) a Területi beállításoktól függ!")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvasása a billentyűzetről
        System.Console.Write("Fonálhossz méterben (l) =")
        l = System.Console.ReadLine()
        System.Console.Write("Időtartam percben (p) =")
        p = System.Console.ReadLine()

        REM Az eredmény kiszámítása
        t = 2 * Math.PI * Math.Sqrt(l / g)
        teljesLengesekSzama = Math.Truncate((p * 60) / t)

        REM Az eredmény megjelenítése
        System.Console.WriteLine("Az " & l & " méter hosszú inga " & p & " perc alatt " & teljesLengesekSzama & " teljes lengést végez.")
        System.Console.WriteLine()

        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()
    End Sub

End Module

