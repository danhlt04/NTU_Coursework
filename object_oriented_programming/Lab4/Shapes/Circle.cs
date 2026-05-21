using System;
using System.Collections.Generic;
using System.Text;

namespace Shapes
{
    internal class Circle : Shape
    {
        private double _Radius;
        public const double Pi = 3.14;

        public Circle(double r = 0)
        {
            _Name = "Hinh tron";
            _Radius = r;
        }

        public override double Area()
        {
            return Pi * _Radius * _Radius;
        }

        public override void Info()
        {
            base.Info();
        }
    }
}
