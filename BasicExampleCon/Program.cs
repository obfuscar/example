using BasicExampleLibrary;
using System;

namespace BasicExampleCon
{
    class Program
    {
        static void Main(string[] args)
        {
            ClassX cx = new ClassX("Some Text");

            Console.WriteLine(cx.DisplayText);
        }
    }
}
