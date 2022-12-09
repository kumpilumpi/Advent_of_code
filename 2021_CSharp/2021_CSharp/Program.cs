
using System;
using System.Diagnostics;

namespace _2021_CSharp.CS_code
{
    internal class Program
    {
        private static string inputfile;



        //public Day1() { }

        private static void Main() {         
            Console.WriteLine(Program.day3(2));
        }

        private static string day1(int problem)
        {
            Program.inputfile = @"C:\Users\jakak\Desktop\Git\Advent_of_code\2021_CSharp\2021_CSharp\input1.txt";
            Day1 day = new Day1(inputfile);
            if (problem == 1) { return day.Run1().ToString(); }
            else if(problem == 2){ return day.Run2().ToString(); }
            else { return "Uno problemo amigo"; }
        }

        private static string day2(int problem)
        {
            Program.inputfile = @"C:\Users\jakak\Desktop\Git\Advent_of_code\2021_CSharp\2021_CSharp\input2.txt";
            Day2 day = new Day2(inputfile);
            if (problem == 1) { return day.Run1().ToString(); }
            else if (problem == 2) { return day.Run2().ToString(); }
            else { return "Uno problemo amigo"; }
        }

        private static string day3(int problem)
        {
            Program.inputfile = @"C:\Users\jakak\Desktop\Git\Advent_of_code\2021_CSharp\2021_CSharp\input3.txt";
            Day3 day = new Day3(inputfile);
            if (problem == 1) { return day.Run1(); }
            else if (problem == 2) { return day.Run2(); }
            else { return "Uno problemo amigo"; }
        }

    }
}
