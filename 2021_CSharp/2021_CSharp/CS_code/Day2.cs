using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2021_CSharp.CS_code
{
    internal class Day2
    {
        string filePath;


        public Day2(string filePath) { this.filePath = filePath; }

        public List<(String, int)>  DataEdit()
        {
            string[] allLines = System.IO.File.ReadAllLines(this.filePath);

            List<(String, int)> tupleList = new List<(String, int)>();

            foreach (string line in allLines)
            {

                string[] splitLine = line.Split(" ");
                tupleList.Add((splitLine[0], int.Parse(splitLine[1])));
            }

            return tupleList;
        }


        public string Run1()
        {
            int horizontal = 0;
            int vertical = 0;

            List<(String, int)> tupleList = this.DataEdit();

            foreach ((string command, int value) in tupleList)
            {
                if (command == "forward") { horizontal += value; }
                else if (command == "up") { vertical += -value; }
                else if (command == "down") { vertical += value; }
                else { Console.WriteLine(command); }
            }

            int answer = horizontal * vertical;

            return answer.ToString();
        }

        public string Run2()
        {
            int horizontal = 0;
            int vertical = 0;
            int aim = 0;

            List<(String, int)> tupleList = this.DataEdit();

            foreach ((string command, int value) in tupleList)
            {
                if (command == "forward") { 
                    horizontal += value;
                    vertical += aim * value;
                }
                else if (command == "up") { aim += -value; }
                else if (command == "down") { aim += value; }
                else { Console.WriteLine(command); }
            }

            int answer = horizontal * vertical;

            return answer.ToString();
        }
    }
}
