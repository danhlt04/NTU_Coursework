namespace Bai3
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            ptrbx1 = new PictureBox();
            btn1 = new Button();
            btn2 = new Button();
            openFileDialog1 = new OpenFileDialog();
            ((System.ComponentModel.ISupportInitialize)ptrbx1).BeginInit();
            SuspendLayout();
            // 
            // ptrbx1
            // 
            ptrbx1.BorderStyle = BorderStyle.Fixed3D;
            ptrbx1.Location = new Point(12, 12);
            ptrbx1.Name = "ptrbx1";
            ptrbx1.Size = new Size(534, 426);
            ptrbx1.TabIndex = 0;
            ptrbx1.TabStop = false;
            // 
            // btn1
            // 
            btn1.Location = new Point(605, 35);
            btn1.Name = "btn1";
            btn1.Size = new Size(112, 34);
            btn1.TabIndex = 1;
            btn1.Text = "Open";
            btn1.UseVisualStyleBackColor = true;
            btn1.Click += btn1_Click;
            // 
            // btn2
            // 
            btn2.Location = new Point(605, 123);
            btn2.Name = "btn2";
            btn2.Size = new Size(112, 34);
            btn2.TabIndex = 1;
            btn2.Text = "Close";
            btn2.UseVisualStyleBackColor = true;
            btn2.Click += btn2_Click;
            // 
            // openFileDialog1
            // 
            openFileDialog1.FileName = "openFileDialog1";
            openFileDialog1.ShowReadOnly = true;
            openFileDialog1.FileOk += openFileDialog1_FileOk;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(btn2);
            Controls.Add(btn1);
            Controls.Add(ptrbx1);
            Name = "Form1";
            Text = "Simple Photo Viewer";
            ((System.ComponentModel.ISupportInitialize)ptrbx1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private PictureBox ptrbx1;
        private Button btn1;
        private Button btn2;
        private OpenFileDialog openFileDialog1;
    }
}
