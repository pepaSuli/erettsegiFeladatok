Module Module1

    REM Bicikliverseny 
    Structure eredmeny
        Public rajtszam As Integer
        Public ido As Double
    End Structure
    Sub Main()
        REM Változók, konstansok deklarálása
        Const indulokSzama As Integer = 36
        Const szakaszokSzama As Integer = 10
        Dim dijazas As Integer = 1000000
        Dim helyezesek(indulokSzama, szakaszokSzama) As Integer
        Dim feltSeged(indulokSzama) As Integer
        Dim szakElsSzama(indulokSzama) As Integer
        Dim nyertesek(indulokSzama), nyertesekSzama, max As Integer
        Dim er(indulokSzama) As eredmeny
        Dim i, j, k, l, s As Integer
        Dim autoRand As New Random()

        REM Információk kiíratása
        System.Console.WriteLine("Bicikliverseny...")
        System.Console.WriteLine("---------------")
        System.Console.WriteLine("")

        REM Bemeneti adatok generálása
        For i = 1 To szakaszokSzama
            For k = 1 To indulokSzama
                feltSeged(k) = k
            Next
            For j = 1 To indulokSzama
                s = autoRand.Next(indulokSzama - j + 1) + 1
                helyezesek(j, i) = feltSeged(s)
                For l = s To indulokSzama - j
                    feltSeged(l) = feltSeged(l + 1)
                Next
            Next
        Next

        REM Az eredmény kiszámítása / szakaszelsőségek megszámlálása
        For i = 1 To indulokSzama
            szakElsSzama(i) = 0
            For j = 1 To szakaszokSzama
                If helyezesek(i, j) = 1 Then
                    szakElsSzama(i) += 1
                End If
            Next
        Next


        REM Az eredmény kiszámítása / maximumérték és maximumhelyek meghatározása
        max = 0
        nyertesekSzama = 0
        For i = 1 To indulokSzama
            If szakElsSzama(i) > max Then
                nyertesekSzama = 1
                nyertesek(1) = i
                max = szakElsSzama(i)
            ElseIf szakElsSzama(i) = max Then
                nyertesekSzama += 1
                nyertesek(nyertesekSzama) = i
            End If
        Next

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A verseny nyertesei és díjaik...")
        For i = 1 To nyertesekSzama
            System.Console.WriteLine("(" & nyertesek(i) & ":" & Math.Truncate(dijazas / nyertesekSzama) & ")")
        Next

        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()
    End Sub



End Module
