Module Module1
    REM Lott�sz�m statisztika 
    Structure szamstatisztika
        Public szam As Integer
        Public db As Integer
    End Structure

    Sub Main()
        REM V�ltoz�k, konstansok deklar�l�sa
        Const lottoSzamokSzama As Integer = 90
        Const kihuzottSzamokSzama As Integer = 5
        Const huzasokSzama As Integer = 52
        Dim huzasok(huzasokSzama, kihuzottSzamokSzama) As Integer
        Dim huzasiSeged(lottoSzamokSzama) As Integer
        Dim szamstat(lottoSzamokSzama), cs As szamstatisztika
        Dim i, j, k, l, s As Integer
        Dim autoRand As New Random()

        REM Inform�ci�k ki�rat�sa
        System.Console.WriteLine("Lott�sz�m statisztika ...")
        System.Console.WriteLine("---------------")
        System.Console.WriteLine("")

        REM Bemeneti adatok gener�l�sa
        For i = 1 To huzasokSzama
            For k = 1 To lottoSzamokSzama
                huzasiSeged(k) = k
            Next
            For j = 1 To kihuzottSzamokSzama
                s = autoRand.Next(lottoSzamokSzama - j + 1) + 1
                huzasok(i, j) = huzasiSeged(s)
                For l = s To lottoSzamokSzama - j
                    huzasiSeged(l) = huzasiSeged(l + 1)
                Next
            Next
        Next

        REM Az eredm�ny kisz�m�t�sa / kihuzott szamok szamolasa
        For i = 1 To lottoSzamokSzama
            szamstat(i).db = 0
            szamstat(i).szam = i
        Next
        For i = 1 To huzasokSzama
            For j = 1 To kihuzottSzamokSzama
                szamstat(huzasok(i, j)).db += 1
            Next
        Next
        For i = 1 To lottoSzamokSzama - 1
            For j = i + 1 To lottoSzamokSzama
                If szamstat(i).db < szamstat(j).db Then
                    cs = szamstat(i)
                    szamstat(i) = szamstat(j)
                    szamstat(j) = cs
                End If
            Next
        Next

        REM Az eredm�ny megjelen�t�se
        System.Console.WriteLine("Az �v sor�n kih�zott sz�mok...")
        i = 1
        j = 1
        While i <= lottoSzamokSzama And szamstat(i).db <> 0
            System.Console.Write("[" & szamstat(i).szam & ";" & szamstat(i).db & "]")
            i += 1
            j += 1
            If j > 6 Then
                j = 1
                System.Console.WriteLine()
            End If
        End While
        If j <= 6 Then System.Console.WriteLine()
        

        REM Programbefejez�s
        System.Console.WriteLine("Nyomj [enter]-t a befejez�shez!")
        System.Console.ReadLine()
    End Sub

End Module
