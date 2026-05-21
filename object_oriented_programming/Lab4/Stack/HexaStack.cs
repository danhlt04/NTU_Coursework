using System;
using System.Collections.Generic;
using System.Text;

namespace Stack
{
    internal class HexaStack : BasicStack
    {
        private string hex = "0123456789ABCDEF";
        public override void Print()
        {
            int nums = _Data[_Top--];
            while(nums > 0)
            {
                Push(nums % 16);
                nums /= 16;
            }
            while(!IsEmpty())
            {
                Console.Write($"{hex[_Data[_Top--]]} ");
            }
        }
    }
}
