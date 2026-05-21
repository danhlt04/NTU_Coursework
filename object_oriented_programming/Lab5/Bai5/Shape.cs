using System;
using System.Drawing;

namespace DrawApp
{
    abstract class Shape
    {
        public Point Start { get; set; }
        public Point End { get; set; }
        public bool IsFilled { get; set; } = false;
        public Color FillColor { get; set; } = Color.Transparent;

        protected Rectangle GetRect()
        {
            return new Rectangle(
                Math.Min(Start.X, End.X),
                Math.Min(Start.Y, End.Y),
                Math.Abs(End.X - Start.X),
                Math.Abs(End.Y - Start.Y));
        }

        public abstract void Draw(Graphics g);
        public abstract double Area();
        public abstract string ShapeName();

        public void Highlight(Color color)
        {
            IsFilled = true;
            FillColor = color;
        }
    }

    class RectangleShape : Shape
    {
        public override string ShapeName() => "Rectangle";
        public override double Area()
        {
            var r = GetRect();
            return (double)r.Width * r.Height;
        }
        public override void Draw(Graphics g)
        {
            var rect = GetRect();
            if (rect.Width < 2 || rect.Height < 2) return;
            if (IsFilled)
                g.FillRectangle(new SolidBrush(FillColor), rect);
            g.DrawRectangle(new Pen(Color.Red, 2), rect);
        }
    }

    class EllipseShape : Shape
    {
        public override string ShapeName() => "Elipse";
        public override double Area()
        {
            var r = GetRect();
            return Math.PI * (r.Width / 2.0) * (r.Height / 2.0);
        }
        public override void Draw(Graphics g)
        {
            var rect = GetRect();
            if (rect.Width < 2 || rect.Height < 2) return;
            if (IsFilled)
                g.FillEllipse(new SolidBrush(FillColor), rect);
            g.DrawEllipse(new Pen(Color.Blue, 2), rect);
        }
    }
}