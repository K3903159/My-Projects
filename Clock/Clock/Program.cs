using System;
namespace Clock
{
    public class Program
    {
        static void Main(string[] args)
        {
            Clock clock = new Clock();
            
            for (int i = 0; i < 86400; i++)
            {
                Thread.Sleep(100);
                Console.Clear();
                clock.Tick();
                Console.Write(clock.printTime());
            }
        }
    }
}