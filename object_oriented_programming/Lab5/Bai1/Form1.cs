using System;

namespace Bai1
{
    public partial class frm : Form
    {
        public frm()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnPerimeter_Click(object sender, EventArgs e)
        {
            string InputText = txtInput.Text;
            if(string.IsNullOrEmpty(InputText))
            {
                MessageBox.Show("Bán kính chưa được nhập!");
                txtInput.Text = string.Empty;
                return;
            }
            double Radius = double.Parse(txtInput.Text);
            if (Radius < 0)
            {
                MessageBox.Show("Bán kính phải là số dương!");
                txtInput.Text = string.Empty;
                return;
            }
            double Perimeter = Radius * 2 * Math.PI;
            lblOutput.Text = $"Chu vi hình tròn = {Perimeter:F2}";
        }

        private void btnArea_Click(object sender, EventArgs e)
        {
            string InputText = txtInput.Text;
            if (string.IsNullOrEmpty(InputText))
            {
                MessageBox.Show("Bán kính chưa được nhập!");
                txtInput.Text = string.Empty;
                return;
            }
            double Radius = double.Parse(txtInput.Text);
            if (Radius < 0)
            {
                MessageBox.Show("Bán kính phải là số dương!");
                txtInput.Text = string.Empty;
                return;
            }
            double Area = Radius * Radius * Math.PI;
            lblOutput.Text = $"Diện tích hình tròn = {Area:F2}";
        }
    }
}
