// EECE 435L - Lab 11 - Majd Aboul Hosn
// Simple Windows console application packaged into an MSI with the WiX Toolset.
using System;

namespace HelloWorldMajd
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World from Majd_AboulHosn!");
            if (args.Length > 0 && (args[0] == "--version" || args[0] == "-v"))
            {
                Console.WriteLine("helloworld version 1.0.0");
            }
        }
    }
}
