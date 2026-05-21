using System;
using System.Collections.Generic;
using System.Text;

namespace Shapes
{
    internal class Shape
    {
        protected string _Name;
        public virtual double Area()
        {
            return 0.0;
        }

        public virtual void Info()
        {
            Console.WriteLine($"{_Name} co dien tich la {Area():F2}");
        }
    }
}
