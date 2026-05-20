namespace Bai4
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
            chkbxDiscount = new CheckBox();
            lblInput = new Label();
            radioButton1 = new RadioButton();
            radioButton2 = new RadioButton();
            lblAnsTxt = new Label();
            btnExit = new Button();
            tbAns = new TextBox();
            groupBox1 = new GroupBox();
            tbInput = new TextBox();
            groupBox1.SuspendLayout();
            SuspendLayout();
            // 
            // chkbxDiscount
            // 
            chkbxDiscount.AutoSize = true;
            chkbxDiscount.Location = new Point(430, 193);
            chkbxDiscount.Name = "chkbxDiscount";
            chkbxDiscount.Size = new Size(108, 29);
            chkbxDiscount.TabIndex = 0;
            chkbxDiscount.Text = "Giảm giá";
            chkbxDiscount.UseVisualStyleBackColor = true;
            chkbxDiscount.CheckedChanged += chkbxDiscount_CheckedChanged;
            // 
            // lblInput
            // 
            lblInput.AutoSize = true;
            lblInput.Location = new Point(67, 56);
            lblInput.Name = "lblInput";
            lblInput.Size = new Size(235, 25);
            lblInput.TabIndex = 1;
            lblInput.Text = "Quãng đường đi được (km):";
            // 
            // radioButton1
            // 
            radioButton1.AutoSize = true;
            radioButton1.Location = new Point(30, 45);
            radioButton1.Name = "radioButton1";
            radioButton1.Size = new Size(81, 29);
            radioButton1.TabIndex = 2;
            radioButton1.TabStop = true;
            radioButton1.Text = "7 chỗ";
            radioButton1.UseVisualStyleBackColor = true;
            radioButton1.CheckedChanged += radioButton1_CheckedChanged;
            // 
            // radioButton2
            // 
            radioButton2.AutoSize = true;
            radioButton2.Location = new Point(166, 45);
            radioButton2.Name = "radioButton2";
            radioButton2.Size = new Size(81, 29);
            radioButton2.TabIndex = 2;
            radioButton2.TabStop = true;
            radioButton2.Text = "4 chỗ";
            radioButton2.UseVisualStyleBackColor = true;
            radioButton2.CheckedChanged += radioButton2_CheckedChanged;
            // 
            // lblAnsTxt
            // 
            lblAnsTxt.AutoSize = true;
            lblAnsTxt.Location = new Point(67, 303);
            lblAnsTxt.Name = "lblAnsTxt";
            lblAnsTxt.Size = new Size(162, 25);
            lblAnsTxt.TabIndex = 1;
            lblAnsTxt.Text = "Số tiền thanh toán:";
            // 
            // btnExit
            // 
            btnExit.Location = new Point(421, 359);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(117, 61);
            btnExit.TabIndex = 3;
            btnExit.Text = "Thoát";
            btnExit.UseVisualStyleBackColor = true;
            btnExit.Click += btnExit_Click;
            // 
            // tbAns
            // 
            tbAns.Font = new Font("Segoe UI Black", 9F, FontStyle.Bold, GraphicsUnit.Point, 163);
            tbAns.Location = new Point(74, 359);
            tbAns.Multiline = true;
            tbAns.Name = "tbAns";
            tbAns.ReadOnly = true;
            tbAns.Size = new Size(307, 61);
            tbAns.TabIndex = 4;
            tbAns.TextAlign = HorizontalAlignment.Right;
            tbAns.TextChanged += tbAns_TextChanged;
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(radioButton2);
            groupBox1.Controls.Add(radioButton1);
            groupBox1.Location = new Point(74, 172);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(307, 94);
            groupBox1.TabIndex = 5;
            groupBox1.TabStop = false;
            groupBox1.Text = "Loại xe";
            // 
            // tbInput
            // 
            tbInput.Font = new Font("Segoe UI Black", 9F, FontStyle.Bold, GraphicsUnit.Point, 163);
            tbInput.Location = new Point(308, 53);
            tbInput.Name = "tbInput";
            tbInput.Size = new Size(230, 31);
            tbInput.TabIndex = 4;
            tbInput.TextChanged += tbInput_TextChanged;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(640, 450);
            Controls.Add(groupBox1);
            Controls.Add(tbInput);
            Controls.Add(tbAns);
            Controls.Add(btnExit);
            Controls.Add(lblAnsTxt);
            Controls.Add(lblInput);
            Controls.Add(chkbxDiscount);
            Name = "Form1";
            StartPosition = FormStartPosition.CenterParent;
            Text = "Tính tiền";
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private CheckBox chkbxDiscount;
        private Label lblInput;
        private RadioButton radioButton1;
        private RadioButton radioButton2;
        private Label lblAnsTxt;
        private Button btnExit;
        private TextBox tbAns;
        private GroupBox groupBox1;
        private TextBox tbInput;
    }
}
