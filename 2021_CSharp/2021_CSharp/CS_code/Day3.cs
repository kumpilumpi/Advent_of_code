using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2021_CSharp.CS_code
{
    internal class Day3
    {
        string filePath;
        private char regressive;
        private char dominant;

        public Day3(string filePath) { this.filePath = filePath; }


        public string Run1()
        {
            string[] allLines = System.IO.File.ReadAllLines(this.filePath);
            int length = allLines[0].Length;
            int[] digits = new int[length];

            foreach(string line in allLines)
            {
                for (int i = 0; i < length; i++)
                {
                    digits[i] += int.Parse(line[i].ToString());
                }
            }

            string gamma = "";
            string epsilon = "";

            for (int i = 0; i < length; i++)
            {
                if (digits[i] > (allLines.Length/2))
                {
                    gamma += "1";
                    epsilon += "0";
                }
                else
                {
                    gamma += "0";
                    epsilon += "1";
                }
            }

            int gammaInt = Convert.ToInt32(gamma, 2);
            int epsilonInt = Convert.ToInt32(epsilon, 2);
            int answer = gammaInt * epsilonInt;

            return answer.ToString();
        }



        public string Run2()
        {
            string[] allLines = System.IO.File.ReadAllLines(this.filePath);
            List<string> strings = allLines.OfType<string>().ToList();
            int length = allLines[0].Length;
            int[] digits = new int[length];

            List<string> clonedList = new List<string>(strings);

            for(int i = 0; i < length; i++)
            {
                foreach (string line in clonedList)
                {
                    digits[i] += int.Parse(line[i].ToString());
                }

                if (digits[i] * 2 >= (clonedList.Count))
                {
                    this.regressive = '0';
                }
                else
                {
                    this.regressive = '1';
                }

                clonedList.RemoveAll(s => (s[i] == this.regressive));
            }
            var oxygen = Convert.ToInt32(clonedList[0], 2); // To je ok -> bug je naprej


            List<string> clonedList2 = new List<string>(strings);
            digits = new int[length];
            clonedList2.RemoveAll(s => (s[0] == clonedList[0][0]));

            for (int i = 1; i < length; i++)
            {
                if(clonedList2.Count == 1) { 
                    break;
                }

                foreach (string line in clonedList2)
                {
                    digits[i] += int.Parse(line[i].ToString());
                }

                if (digits[i] * 2 >= (clonedList2.Count))
                {
                    this.dominant = '1';
                }
                else
                {
                    this.dominant = '0';
                }

                clonedList2.RemoveAll(s => (s[i] == this.dominant));
            }
            var co2 = Convert.ToInt32(clonedList2[0], 2);

            var answer = oxygen * co2;
            return answer.ToString();
        }
    }
}
