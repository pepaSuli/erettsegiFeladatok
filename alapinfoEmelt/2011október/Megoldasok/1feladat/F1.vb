Module Module1 
    REM Kör és pont viszonyának meghatározása 

    Sub Main() 

        REM Változók, konstansok deklarálása 
        Dim x, y, cx, cy, r As Double 
        Dim korlemezenVan As Boolean 

        REM Információk kiíratása 
        System.Console.WriteLine("Kör és pont viszonyának meghatározása") 
        System.Console.WriteLine("---------------------------------------------") 
        System.Console.WriteLine("A tizedes jel (./,) a beállításoktól függ!") 
        System.Console.WriteLine("") 

        REM Bemeneti adatok beolvasása a billentyûzetrõl 
        System.Console.Write("A kör középpontjának x koordinátája = ") 
        cx = System.Console.ReadLine() 
        System.Console.Write("A kör középpontjának y koordinátája = ") 
        cy = System.Console.ReadLine() 
        System.Console.Write("A kör sugara = ") 
        r = System.Console.ReadLine() 
        System.Console.Write("A pont x koordinátája = ") 
        x = System.Console.ReadLine() 
        System.Console.Write("A pont y koordinátája = ") 
        y = System.Console.ReadLine() 

        REM Az eredmény kiszámítása 
        korlemezenVan = ((cx - x) * (cx - x) + (cy - y) * (cy - y)) <= (r * r) 

        REM Az eredmény megjelenítése 
        System.Console.WriteLine() 
        If korlemezenVan Then 
            System.Console.WriteLine("A pont a körlemezen helyezkedik el.") 
        Else 
            System.Console.WriteLine("A pont a körlemezen kívül helyezkedik el.") 
        End If 
        System.Console.WriteLine() 

        REM Programbefejezés 
        System.Console.WriteLine("Nyomj [enter]-t a befejezéshez!") 
        System.Console.ReadLine() 

    End Sub 
End Module 
