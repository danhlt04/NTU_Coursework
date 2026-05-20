namespace Bai2
{
    partial class frm1
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
            lblInputFirst = new Label();
            lblInputSecond = new Label();
            lblInputThird = new Label();
            btnSolve = new Button();
            btnExit = new Button();
            txtInputFirst = new TextBox();
            txtInputSecond = new TextBox();
            txtInputThird = new TextBox();
            txtSolution = new TextBox();
            lblSolution = new Label();
            SuspendLayout();
            // 
            // lblInputFirst
            // 
            lblInputFirst.AutoSize = true;
            lblInputFirst.Font = new Font("Segoe UI", 13F);
            lblInputFirst.Location = new Point(12, 33);
            lblInputFirst.Name = "lblInputFirst";
            lblInputFirst.Size = new Size(140, 30);
            lblInputFirst.TabIndex = 0;
            lblInputFirst.Text = "Nhập hệ số a";
            // 
            // lblInputSecond
            // 
            lblInputSecond.AutoSize = true;
            lblInputSecond.Font = new Font("Segoe UI", 13F);
            lblInputSecond.Location = new Point(12, 81);
            lblInputSecond.Name = "lblInputSecond";
            lblInputSecond.Size = new Size(142, 30);
            lblInputSecond.TabIndex = 0;
            lblInputSecond.Text = "Nhập hệ số b";
            // 
            // lblInputThird
            // 
            lblInputThird.AutoSize = true;
            lblInputThird.Font = new Font("Segoe UI", 13F);
            lblInputThird.Location = new Point(12, 129);
            lblInputThird.Name = "lblInputThird";
            lblInputThird.Size = new Size(139, 30);
            lblInputThird.TabIndex = 0;
            lblInputThird.Text = "Nhập hệ số c";
            // 
            // btnSolve
            // 
            btnSolve.Location = new Point(12, 198);
            btnSolve.Name = "btnSolve";
            btnSolve.Size = new Size(152, 43);
            btnSolve.TabIndex = 4;
            btnSolve.Text = "Giải";
            btnSolve.UseVisualStyleBackColor = true;
            btnSolve.Click += btnSolve_Click;
            // 
            // btnExit
            // 
            btnExit.Location = new Point(187, 198);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(152, 43);
            btnExit.TabIndex = 5;
            btnExit.Text = "Thoát";
            btnExit.UseVisualStyleBackColor = true;
            btnExit.Click += btnExit_Click;
            // 
            // txtInputFirst
            // 
            txtInputFirst.Location = new Point(158, 38);
            txtInputFirst.Name = "txtInputFirst";
            txtInputFirst.Size = new Size(128, 27);
            txtInputFirst.TabIndex = 1;
            // 
            // txtInputSecond
            // 
            txtInputSecond.Location = new Point(158, 86);
            txtInputSecond.Name = "txtInputSecond";
            txtInputSecond.Size = new Size(128, 27);
            txtInputSecond.TabIndex = 2;
            // 
            // txtInputThird
            // 
            txtInputThird.Location = new Point(158, 129);
            txtInputThird.Name = "txtInputThird";
            txtInputThird.Size = new Size(128, 27);
            txtInputThird.TabIndex = 3;
            // 
            // txtSolution
            // 
            txtSolution.Location = new Point(412, 81);
            txtSolution.Multiline = true;
            txtSolution.Name = "txtSolution";
            txtSolution.ReadOnly = true;
            txtSolution.Size = new Size(477, 160);
            txtSolution.TabIndex = 6;
            // 
            // lblSolution
            // 
            lblSolution.AutoSize = true;
            lblSolution.Font = new Font("Segoe UI", 13F);
            lblSolution.Location = new Point(412, 33);
            lblSolution.Name = "lblSolution";
            lblSolution.Size = new Size(266, 30);
            lblSolution.TabIndex = 0;
            lblSolution.Text = "Nghiệm của phương trình:";
            // 
            // frm1
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(911, 287);
            Controls.Add(txtSolution);
            Controls.Add(txtInputThird);
            Controls.Add(txtInputSecond);
            Controls.Add(txtInputFirst);
            Controls.Add(btnExit);
            Controls.Add(btnSolve);
            Controls.Add(lblSolution);
            Controls.Add(lblInputThird);
            Controls.Add(lblInputSecond);
            Controls.Add(lblInputFirst);
            Name = "frm1";
            StartPosition = FormStartPosition.CenterParent;
            Text = "Giải phương trình bậc 2";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblInputFirst;
        private Label lblInputSecond;
        private Label lblInputThird;
        private Button btnSolve;
        private Button btnExit;
        private TextBox txtInputFirst;
        private TextBox txtInputSecond;
        private TextBox txtInputThird;
        private TextBox txtSolution;
        private Label lblSolution;
    }
}
