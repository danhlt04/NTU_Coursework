namespace Bai2
{
    public partial class frm1 : Form
    {
        public frm1()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnSolve_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtInputFirst.Text)) txtInputFirst.Text = "0";
            if (string.IsNullOrEmpty(txtInputSecond.Text)) txtInputSecond.Text = "0";
            if (string.IsNullOrEmpty(txtInputThird.Text)) txtInputThird.Text = "0";
            double a = double.Parse(txtInputFirst.Text);
            double b = double.Parse(txtInputSecond.Text);
            double c = double.Parse(txtInputThird.Text);
            double delta = b * b - 4 * a * c;
            if(delta > 0)
            {
                double x1 = (-b + Math.Sqrt(delta)) / (2 * a);
                double x2 = (-b - Math.Sqrt(delta)) / (2 * a);
                txtSolution.Text = $"Phương trình có hai nghiệm phân biệt x1 = {x1:F2} và x2 = {x2:F2}";
            } else if(delta == 0)
            {
                double x = -b / (2 * a);
                txtSolution.Text = $"Phương trình có nghiệm kép x = {x:F2}";
            }
            else
            {
                txtSolution.Text = "Phương trình vô nghiệm";
            }
        }
    }
}
