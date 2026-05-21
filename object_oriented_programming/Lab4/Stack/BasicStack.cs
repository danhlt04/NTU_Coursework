using System;
using System.Collections.Generic;
using System.Text;

namespace Stack
{
    internal class BasicStack
    {
        protected int _Max;
        protected int _Top;
        protected int[] _Data;

        public int Max { get; set; }
        public int Top { get; set; }
        public int[] Data { get; set; }

        public BasicStack()
        {
            _Top = -1;
            _Data = new int[100000];
        }

        public void Push(int x)
        {
            _Data[++_Top] = x;
        }

        public void Pop()
        {
            --_Top;
        }

        public int Peek()
        {
            return _Data[_Top];
        }

        public bool IsEmpty()
        {
            return _Top == -1;
        }

        public virtual void Print()
        {
            while(!IsEmpty())
            {
                Console.Write($"{_Data[_Top--]} ");
            }
            Console.WriteLine();
        }
    }
}
