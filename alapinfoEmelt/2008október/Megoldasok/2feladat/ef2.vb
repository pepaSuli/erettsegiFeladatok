Module Module1
    REM Mad�rmegfigyel� �llom�s
    Structure megfigyeles
        Public sorszam As Integer
        Public ertek As Integer
    End Structure

    Sub Main()
        REM V�ltoz�k, konstansok deklar�l�sa
        Const N As Integer = 10
        Dim napiGolyaszam(N), cs As megfigyeles
        Dim i, j As Integer
        
        REM Inform�ci�k ki�rat�sa
        System.Console.WriteLine("Megfigyelt g�lya sz�mok rendez�se...")
        System.Console.WriteLine("------------------------------------")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvas�sa a billenty�zetr�l
        For i = 1 To N
            napiGolyaszam(i).sorszam = i
            System.Console.Write("A(z) " & i & ". napon megfigyelt g�ly�k sz�ma = ")
            napiGolyaszam(i).ertek = System.Console.ReadLine()
        Next

        REM Az eredm�ny kisz�m�t�sa        
        For i = 1 To N - 1
            For j = i + 1 To N
                If napiGolyaszam(i).ertek > napiGolyaszam(j).ertek Then
                    cs = napiGolyaszam(i)
                    napiGolyaszam(i) = napiGolyaszam(j)
                    napiGolyaszam(j) = cs
                End If

            Next
        Next

        REM Az eredm�ny megjelen�t�se
        System.Console.WriteLine("A napok sorsz�ma a megfigyelt g�ly�k sz�ma szerint n�vekv�en rendezve...: ")
        For i = 1 To N
            System.Console.Write(napiGolyaszam(i).sorszam & " ")
            If i < N Then
                If napiGolyaszam(i).ertek <> napiGolyaszam(i + 1).ertek Then
                    System.Console.WriteLine()
                End If
            End If
        Next
        
        REM Programbefejez�s
        System.Console.WriteLine("Nyomj [enter]-t a befejez�shez!")
        System.Console.ReadLine()
    End Sub

End Module
