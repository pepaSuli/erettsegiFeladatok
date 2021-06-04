Module Module1
    REM Síkfutás 
    Structure eredmeny
        Public rajtszam As Integer
        Public ido As Double
    End Structure

    Sub Main()
        REM Változók, konstansok deklarálása
        Const versenyzokSzama As Integer = 8
        Const korokSzama As Integer = 25
        Dim korido(versenyzokSzama, korokSzama), smp As Double
        Dim er(versenyzokSzama), cs As eredmeny
        Dim i, j, sp As Integer
        Dim autoRand As New Random()

        REM Információk kiíratása
        System.Console.WriteLine("10000m síkfutás")
        System.Console.WriteLine("---------------")
        System.Console.WriteLine("")

        REM Bemeneti adatok generálása
        For i = 1 To versenyzokSzama
            For j = 1 To korokSzama
                korido(i, j) = Math.Round(60 + autoRand.NextDouble() * 40, 2)
            Next
        Next

        REM Az eredmény kiszámítása / időeredmények összesítése
        For i = 1 To versenyzokSzama
            er(i).rajtszam = i
            er(i).ido = 0
            For j = 1 To korokSzama
                er(i).ido += korido(i, j)
            Next
        Next

        REM Az eredmény kiszámítása / rendezés az időeredmények szerint
        For i = 1 To versenyzokSzama - 1
            For j = i + 1 To versenyzokSzama
                If er(i).ido > er(j).ido Then
                    cs = er(i)
                    er(i) = er(j)
                    er(j) = cs
                End If
            Next
        Next

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A 10000m-es síkfutás eredményei...: ")
        For i = 1 To versenyzokSzama
            sp = Math.Truncate(er(i).ido / 60)
            smp = Math.Round(er(i).ido - sp * 60, 2)
            System.Console.WriteLine("[" & er(i).rajtszam & "-" & sp & ":" & smp & "]")
        Next


        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()
    End Sub

End Module



