using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace DrawApp
{
    public partial class Form1 : Form
    {
        List<Shape> shapes = new List<Shape>();
        Shape current = null;
        Point startPt;
        bool drawing = false;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            startPt = e.Location;
            drawing = true;
            current = rbElipse.Checked ? (Shape)new EllipseShape() : new RectangleShape();
            current.Start = startPt;
            current.End = startPt;
        }

        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            if (!drawing || current == null) return;
            current.End = e.Location;
            Invalidate();
        }

        private void Form1_MouseUp(object sender, MouseEventArgs e)
        {
            if (!drawing || current == null) return;
            drawing = false;
            current.End = e.Location;
            shapes.Add(current);
            current = null;
            Invalidate();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            foreach (var s in shapes)
                s.Draw(e.Graphics);

            if (drawing && current != null)
                current.Draw(e.Graphics);
        }

        private void btnWhich_Click(object sender, System.EventArgs e)
        {
            if (shapes.Count == 0)
            {
                MessageBox.Show("No shapes drawn!", "Info");
                return;
            }

            Shape biggest = shapes[0];
            foreach (var s in shapes)
                if (s.Area() > biggest.Area())
                    biggest = s;

            biggest.Highlight(System.Drawing.Color.FromArgb(120, System.Drawing.Color.Yellow));
            Invalidate();

            MessageBox.Show(
                $"Largest shape: {biggest.ShapeName()}\nArea ≈ {biggest.Area():F1}",
                "Result");
        }
    }
}