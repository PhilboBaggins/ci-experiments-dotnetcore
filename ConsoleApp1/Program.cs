using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            // Quick little demo of using a function from the shared class library
            int x = ClassLibrary1.Class1.ReturnFive();
            System.Diagnostics.Debug.Assert(x == 5);

            Console.WriteLine("Hello World!");
        }
    }
}
