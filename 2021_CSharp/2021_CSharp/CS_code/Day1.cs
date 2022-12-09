using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Runtime.ExceptionServices;
using System.Text;
using System.Threading.Tasks;

namespace _2021_CSharp.CS_code
{
    internal class Day1
    {
        string filePath;
        public Day1(string filePath) {
            this.filePath = filePath;

        }
        
        public int Run1 () {

            string[] allLines = System.IO.File.ReadAllLines(this.filePath);

            int isLarger = 0;
                
            for (int i = 0; i < (allLines.Length-1); i++ )
            {
                int firstNum = Int16.Parse(allLines[i]);
                int secondNum = Int16.Parse(allLines[i+1]);
                if (firstNum < secondNum)
                {
                    isLarger++;
                }
            }

            return isLarger;
                

        }
        public int Run2()
        {
            string[] allLines = System.IO.File.ReadAllLines(this.filePath);

            int[] allInts = Array.ConvertAll(allLines, s =>  int.Parse(s));

            int isLarger = 0;

            for (int i = 0; i < (allInts.Length - 3); i++)
            {
                int firstTripleSum = allInts[i] + allInts[i + 1] + allInts[i + 2]; 
                int secondTripleSum = allInts[i + 1] + allInts[i + 2] + allInts[i + 3];

                if (firstTripleSum < secondTripleSum)
                {
                    isLarger++;
                }
            }
            return isLarger;
        }

    
    }
}
