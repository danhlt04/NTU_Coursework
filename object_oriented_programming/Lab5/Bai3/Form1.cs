using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Bai3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            ptrbx1.SizeMode = PictureBoxSizeMode.Zoom;
            ptrbx1.Image = Image.FromFile(@".\images\aurora.jpg");
        }

        private void btn2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void openFileDialog1_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
        {
            openFileDialog1.InitialDirectory = @".\images";
        }

        private void btn1_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter =
            "Images|*.jpg;*.jpeg;*.png;*.bmp;*.gif";

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                ptrbx1.Image =
                    Image.FromFile(openFileDialog1.FileName);
            }
        }
    }
}
