using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2021_CSharp.CS_code
{

    // mark checked numbers with -1

    internal class Day4
    {
        public string filePath;


        public Day4(string filePath) { this.filePath = filePath; }

        public string Run1()
        {
            string[] allLines = System.IO.File.ReadAllLines(this.filePath);

            // first line

            string[] drawnNumbers = allLines[0].Split(",");

            //allLines.RemoveAt(0);

            foreach (string line in allLines) 
            {
                
            }


            return "Working on it.";
        }


        public bool isWinner()
        {
            //checks row

            //checks collumns

            return true;
        }



        }
}
