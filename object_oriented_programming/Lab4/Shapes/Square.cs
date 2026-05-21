using System;
using System.Collections.Generic;
using System.Text;

namespace Shapes
{
    internal class Square : Rectangle
    {
        private double _Edge;

        public Square(double e = 0) : base(e, e)
        {
            _Name = "Hinh vuong";
            _Edge = e;
        }

        public override double Area()
        {
            return _Edge * _Edge;
        }

        public override void Info()
        {
            base.Info();
        }
    }
}
