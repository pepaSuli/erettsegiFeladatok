Module Module1
    REM Madármegfigyelõ állomás
    Structure megfigyeles
        Public sorszam As Integer
        Public ertek As Integer
    End Structure

    Sub Main()
        REM Változók, konstansok deklarálása
        Const N As Integer = 10
        Dim napiGolyaszam(N), cs As megfigyeles
        Dim i, j As Integer
        
        REM Információk kiíratása
        System.Console.WriteLine("Megfigyelt gólya számok rendezése...")
        System.Console.WriteLine("------------------------------------")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvasása a billentyûzetrõl
        For i = 1 To N
            napiGolyaszam(i).sorszam = i
            System.Console.Write("A(z) " & i & ". napon megfigyelt gólyák száma = ")
            napiGolyaszam(i).ertek = System.Console.ReadLine()
        Next

        REM Az eredmény kiszámítása        
        For i = 1 To N - 1
            For j = i + 1 To N
                If napiGolyaszam(i).ertek > napiGolyaszam(j).ertek Then
                    cs = napiGolyaszam(i)
                    napiGolyaszam(i) = napiGolyaszam(j)
                    napiGolyaszam(j) = cs
                End If

            Next
        Next

        REM Az eredmény megjelenítése
        System.Console.WriteLine("A napok sorszáma a megfigyelt gólyák száma szerint növekvõen rendezve...: ")
        For i = 1 To N
            System.Console.Write(napiGolyaszam(i).sorszam & " ")
            If i < N Then
                If napiGolyaszam(i).ertek <> napiGolyaszam(i + 1).ertek Then
                    System.Console.WriteLine()
                End If
            End If
        Next
        
        REM Programbefejezés
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!")
        System.Console.ReadLine()
    End Sub

End Module
