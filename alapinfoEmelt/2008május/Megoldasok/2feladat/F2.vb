Module Module1

    REM Tőzsdei záróárak
    Sub Main()
        REM Változók, konstansok deklarálása
        Const N As Integer = 10
        Dim zaroar(N), atlagosZaroar, magasZaras As Double
        Dim i As Integer

        REM Információk kiíratása
        System.Console.WriteLine("Átlagos záróárnál magasabb zárás...")
        System.Console.WriteLine("-----------------------------------")
        System.Console.WriteLine("A tizedes jel (./,) a Területi beállításoktól függ!")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvasása a billentyűzetről
        For i = 1 To N
            System.Console.Write("A(z) " & i & ". napi záró ár = ")
            zaroar(i) = System.Console.ReadLine()
        Next

        REM Az eredmény kiszámítása
        atlagosZaroar = 0
        For i = 1 To N
            atlagosZaroar += zaroar(i)
        Next
        atlagosZaroar /= N
        magasZaras = 0
        For i = 0 To N
            If zaroar(i) > atlagosZaroar Then magasZaras += 1
        Next

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A részvény az elért " & atlagosZaroar & " átlagos záróáránál " & magasZaras & " alkalommal zárt magasabban.")
        System.Console.WriteLine()

        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()
    End Sub

End Module


