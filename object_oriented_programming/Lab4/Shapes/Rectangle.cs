using System;
using System.Collections.Generic;
using System.Text;

namespace Shapes
{
    internal class Rectangle : Shape
    {
        protected double _Width;
        protected double _Height;

        public Rectangle(double w = 0, double h = 0)
        {
            _Name = "Hinh chu nhat";
            _Width = w;
            _Height = h;
        }

        public override double Area()
        {
            return _Width * _Height;
        }

        public override void Info()
        {
            base.Info();
        }
    }
}
