using System;
using System.Collections.Generic;
using System.Text;

namespace Stack
{
    internal class PrimeStack : BasicStack
    {
        public override void Print()
        {
            int nums = _Data[_Top--];
            for(int i = 2; i * i <= nums; i++)
            {
                if (nums % i == 0)
                {
                    while (nums % i == 0)
                    {
                        Push(i);
                        nums /= i;
                    }
                }
            }
            if (nums > 0) Push(nums);
            while (!IsEmpty())
            {
                Console.Write($"{_Data[_Top--]} ");
            }
            Console.WriteLine();
        }
    }
}
