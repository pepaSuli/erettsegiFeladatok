Module Module1 
    REM Maxim�lis mag�nhangz� sz�m meghat�roz�sa 

    Sub Main() 

        REM V�ltoz�k, konstansok deklar�l�sa 
        Const N As Integer = 10 
        Dim szavak(N) As String 
        Dim i As Integer 
        Dim MGHsz, maxMGHszam As Integer 

        REM Inform�ci�k ki�rat�sa 
        System.Console.WriteLine("Maxim�lis mag�nhangz� sz�m meghat�roz�sa") 
        System.Console.WriteLine("-----------------------------------") 

        System.Console.WriteLine("") 

        REM Bemeneti adatok beolvas�sa a billenty�zetr�l 
        For i = 1 To N 
            System.Console.Write("A(z) " & i & ". sz� : ") 
            szavak(i) = System.Console.ReadLine() 
        Next 

        REM Az eredm�ny kisz�m�t�sa 
        maxMGHszam = 0 
        For i = 1 To N 
            MGHsz = MGHszam(szavak(i)) 
            If MGHsz > maxMGHszam Then 
                maxMGHszam = MGHsz 
            End If 
        Next 
         

        REM Az eredm�ny megjelen�t�se 
        System.Console.WriteLine() 
        System.Console.Write("Egy sz�ban legfeljebb " & maxMGHszam) 
        System.Console.WriteLine(" mag�nhangz� tal�lhat�.") 
        System.Console.WriteLine() 

        REM Programbefejez�s 
        System.Console.WriteLine("Nyomj [enter]-t a befejez�shez!") 
        System.Console.ReadLine() 

    End Sub 

    Function MGHszam(ByVal szo As String) As Integer 
        REM A param�terk�nt kapott sz�ban tal�lhat�mag�nhangz�k  
             REM sz�m�t adja vissza 
        Const MGH As String = "aeiouAEIOU" 
        Dim i, db As Integer 
        db = 0 
        For i = 0 To szo.Length - 1 
            If MGH.Contains(szo.Substring(i, 1)) Then 
                db = db + 1 
            End If 
        Next 
        Return db 
    End Function 

End Module 
