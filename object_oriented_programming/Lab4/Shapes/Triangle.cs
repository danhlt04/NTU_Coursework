using System;
using System.Collections.Generic;
using System.Text;

namespace Shapes
{
    internal class Triangle : Shape
    {
        private double _EdgeOne;
        private double _EdgeTwo;
        private double _EdgeThree;

        public Triangle(double a, double b, double c)
        {
            _Name = "Hinh tam giac";
            _EdgeOne = a;
            _EdgeTwo = b;
            _EdgeThree = c;
        }

        public override double Area()
        {
            double p = (_EdgeOne + _EdgeTwo + _EdgeThree) / 2;
            return Math.Sqrt(p * (p - _EdgeOne) * (p - _EdgeTwo) * (p - _EdgeThree));
        }

        public override void Info()
        {
            base.Info();
        }
    }
}
