Module Module1

    Sub Main()
        REM Változók, konstansok deklarálása
        Const N As Integer = 10
        Const SebHat As Integer = 90
        Dim sebesseg(N), szabAtlag As Double
        Dim i, szabDb, gyorsDb As Integer

        REM Információk kiíratása
        System.Console.WriteLine("Átlagsebesség és gyorshajtók...")
        System.Console.WriteLine("-------------------------------")
        System.Console.WriteLine("A tizedes jel (./,) a Területi beállításoktól függ!")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvasása a billentyűzetről
        For i = 1 To N
            System.Console.Write("A(z) " & i & ". autó sebessége (km/h) = ")
            sebesseg(i) = System.Console.ReadLine()
        Next

        REM Az eredmény kiszámítása
        szabAtlag = 0
        szabDb = 0
        gyorsDb = 0
        For i = 1 To N
            If sebesseg(i) <= SebHat Then
                szabDb += 1
                szabAtlag += sebesseg(i)
            Else
                gyorsDb += 1
            End If
        Next
        szabAtlag /= szabDb

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A szabályosan haladók átlagsebessége: " & Math.Round(szabAtlag, 2))
        System.Console.WriteLine("A gyorshajtók száma: " & gyorsDb)
        System.Console.WriteLine()

        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()


    End Sub

End Module
