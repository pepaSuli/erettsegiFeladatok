Module Module1 
    REM K�r �s pont viszony�nak meghat�roz�sa 

    Sub Main() 

        REM V�ltoz�k, konstansok deklar�l�sa 
        Dim x, y, cx, cy, r As Double 
        Dim korlemezenVan As Boolean 

        REM Inform�ci�k ki�rat�sa 
        System.Console.WriteLine("K�r �s pont viszony�nak meghat�roz�sa") 
        System.Console.WriteLine("---------------------------------------------") 
        System.Console.WriteLine("A tizedes jel (./,) a be�ll�t�sokt�l f�gg!") 
        System.Console.WriteLine("") 

        REM Bemeneti adatok beolvas�sa a billenty�zetr�l 
        System.Console.Write("A k�r k�z�ppontj�nak x koordin�t�ja = ") 
        cx = System.Console.ReadLine() 
        System.Console.Write("A k�r k�z�ppontj�nak y koordin�t�ja = ") 
        cy = System.Console.ReadLine() 
        System.Console.Write("A k�r sugara = ") 
        r = System.Console.ReadLine() 
        System.Console.Write("A pont x koordin�t�ja = ") 
        x = System.Console.ReadLine() 
        System.Console.Write("A pont y koordin�t�ja = ") 
        y = System.Console.ReadLine() 

        REM Az eredm�ny kisz�m�t�sa 
        korlemezenVan = ((cx - x) * (cx - x) + (cy - y) * (cy - y)) <= (r * r) 

        REM Az eredm�ny megjelen�t�se 
        System.Console.WriteLine() 
        If korlemezenVan Then 
            System.Console.WriteLine("A pont a k�rlemezen helyezkedik el.") 
        Else 
            System.Console.WriteLine("A pont a k�rlemezen k�v�l helyezkedik el.") 
        End If 
        System.Console.WriteLine() 

        REM Programbefejez�s 
        System.Console.WriteLine("Nyomj [enter]-t a befejez�shez!") 
        System.Console.ReadLine() 

    End Sub 
End Module 
