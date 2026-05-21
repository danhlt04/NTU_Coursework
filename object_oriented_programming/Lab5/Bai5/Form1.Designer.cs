namespace DrawApp
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.grpShape = new System.Windows.Forms.GroupBox();
            this.rbElipse = new System.Windows.Forms.RadioButton();
            this.rbRect = new System.Windows.Forms.RadioButton();
            this.btnWhich = new System.Windows.Forms.Button();

            this.grpShape.SuspendLayout();
            this.SuspendLayout();

            // grpShape
            this.grpShape.Controls.Add(this.rbElipse);
            this.grpShape.Controls.Add(this.rbRect);
            this.grpShape.Location = new System.Drawing.Point(490, 40);
            this.grpShape.Size = new System.Drawing.Size(120, 80);
            this.grpShape.Text = "Shape";
            this.grpShape.TabIndex = 0;

            // rbElipse
            this.rbElipse.AutoSize = true;
            this.rbElipse.Location = new System.Drawing.Point(15, 22);
            this.rbElipse.Text = "Elipse";
            this.rbElipse.TabIndex = 0;

            // rbRect
            this.rbRect.AutoSize = true;
            this.rbRect.Location = new System.Drawing.Point(15, 46);
            this.rbRect.Text = "Rectangle";
            this.rbRect.Checked = true;
            this.rbRect.TabIndex = 1;

            // btnWhich
            this.btnWhich.Location = new System.Drawing.Point(490, 135);
            this.btnWhich.Size = new System.Drawing.Size(120, 30);
            this.btnWhich.Text = "Color";
            this.btnWhich.TabIndex = 1;
            this.btnWhich.Click += new System.EventHandler(this.btnWhich_Click);

            // Form1
            this.ClientSize = new System.Drawing.Size(634, 461);
            this.Text = "Draw Shapes";
            this.BackColor = System.Drawing.SystemColors.Control;
            this.Controls.Add(this.grpShape);
            this.Controls.Add(this.btnWhich);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Form1_MouseDown);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.Form1_MouseMove);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.Form1_MouseUp);
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.Form1_Paint);

            this.grpShape.ResumeLayout(false);
            this.grpShape.PerformLayout();
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.GroupBox grpShape;
        private System.Windows.Forms.RadioButton rbElipse;
        private System.Windows.Forms.RadioButton rbRect;
        private System.Windows.Forms.Button btnWhich;
    }
}