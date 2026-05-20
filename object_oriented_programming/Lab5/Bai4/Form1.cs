namespace Bai4
{
    public partial class Form1 : Form
    {
        private object tpInput;

        public Form1()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void TinhTien()
        {
            if (string.IsNullOrWhiteSpace(tbInput.Text))
            {
                return;
            }

            double s = double.Parse(tbInput.Text);
            double ans = 0.0;
            if (radioButton1.Checked)
            {
                if (s <= 1) ans = 17000;
                else if (s <= 5) ans = 17000 + (s - 1) * 15000;
                else if (s <= 100) ans = 17000 + 4 * 15000 + (s - 5) * 12000;
                else ans = 17000 + 4 * 15000 + 95 * 12000 + (s - 100) * 11000;
            }
            else if (radioButton2.Checked)
            {
                if (s <= 1) ans = 15000;
                else if (s <= 5) ans = 15000 + (s - 1) * 13500;
                else if (s <= 100) ans = 15000 + 4 * 13500 + (s - 5) * 11000;
                else ans = 15000 + 4 * 13500 + 95 * 11000 + (s - 100) * 10000;
            }
            if (chkbxDiscount.Checked)
            {
                ans *= 0.95;
            }
            tbAns.Text = ans.ToString("N0");
        }

        private void tbAns_TextChanged(object sender, EventArgs e)
        {
            TinhTien();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            TinhTien();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            TinhTien();
        }

        private void chkbxDiscount_CheckedChanged(object sender, EventArgs e)
        {
            TinhTien();
        }

        private void tbInput_TextChanged(object sender, EventArgs e)
        {
            TinhTien();
        }
    }
}
