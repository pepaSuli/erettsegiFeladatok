Module Module1

    REM Elektronikus c�lt�bla
    Sub Main()
        REM V�ltoz�k, konstansok deklar�l�sa
        Const g As Double = 9.81
        Dim x, y, d As Double
        Dim pont As Integer

        REM Inform�ci�k ki�rat�sa
        System.Console.WriteLine("Adott koordin�t�kra becsap�d� l�v�s pont�t�ke...")
        System.Console.WriteLine("-----------------------------------------------------")
        System.Console.WriteLine("A tizedes jel (./,) a Ter�leti be�ll�t�sokt�l f�gg!")
        System.Console.WriteLine("")

        REM Bemeneti adatok beolvas�sa a billenty�zetr�l
        System.Console.Write("A becsap�d�s X koordin�t�ja (x) = ")
        x = System.Console.ReadLine()
        System.Console.Write("A becsap�d�s Y koordin�t�ja (y) = ")
        y = System.Console.ReadLine()
        
        REM Az eredm�ny kisz�m�t�sa
        d = Math.Sqrt(x * x + y * y)
        pont = (1000 - d) / 100

        REM Az eredm�ny megjelen�t�se
        System.Console.WriteLine("A(z) (" & x & "," & y & ") koordin�t�kjra becsap�d� l�v�s " & pont & " pontot �r.")
        System.Console.WriteLine()

        REM Programbefejez�s
        System.Console.WriteLine("Nyomj [enter]-t a befejez�shez!")
        System.Console.ReadLine()
    End Sub

End Module