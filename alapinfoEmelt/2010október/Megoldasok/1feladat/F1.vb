Module Module1

    Sub Main()
        REM Változók, konstansok deklarálása
        Const g As Double = 9.81
        Dim sxmax, v0, alfa, alfarad As Double

        REM Információk kiíratása
        System.Console.WriteLine("A ferdén hajított test által megtett távolság...")
        System.Console.WriteLine("---------------------------------------------")
        System.Console.WriteLine("A tizedes jel (./,) a Területi beállításoktól függ!")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvasása a billentyűzetről
        System.Console.Write("Kezdősebesség m/s (smax) = ")
        v0 = System.Console.ReadLine()
        System.Console.Write("Hajítás szöge fokban (alfa) = ")
        alfa = System.Console.ReadLine()
        REM Konvertálás radiánra
        alfarad = alfa * Math.PI / 180

        REM Az eredmény kiszámítása
        sxmax = v0 * v0 * Math.Sin(2 * alfarad) / g

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A(z) " & v0 & " (m/s) kezdősebességgel " & alfa & " fokos szögben elhajított tárgy " & Math.Round(sxmax, 2) & " méterre repül.")
        System.Console.WriteLine()

        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()


    End Sub

End Module
