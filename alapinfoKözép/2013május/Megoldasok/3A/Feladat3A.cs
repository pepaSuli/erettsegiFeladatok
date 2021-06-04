using System;

namespace SerpinskiTri
{
    class Program
    {
        static void Main()
        {
            Console.CursorVisible = false; //nem része a megoldandó feladatnak!
            Console.SetWindowSize(80, 40); //nem része a megoldandó feladatnak!
            
            Random rnd = new Random();
            const int N = 1000;
            int X = 35;
            int Y = 20; 
            int szelektor;
            
            for (int i = 0; i < N; i++)
            {
                szelektor = rnd.Next(0, 3);
                switch (szelektor)
                {
                    case 0:
                        X = (X + 35) / 2;
                        Y = (Y + 1) / 2;
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.SetCursorPosition(X, Y);
                        Console.Write(".");
                        break;
                    case 1:
                        X = (X + 1) / 2;
                        Y = (Y + 35) / 2;
                        Console.ForegroundColor = ConsoleColor.Blue;
                        Console.SetCursorPosition(X, Y);
                        Console.Write(".");
                        break;
                    case 2:
                        X = (X + 70) / 2;
                        Y = (Y + 35) / 2;
                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.SetCursorPosition(X, Y);
                        Console.Write(".");
                        break;
                }
            }

            Console.ReadKey();  //nem része a megoldandó feladatnak!
        }
    }
}
