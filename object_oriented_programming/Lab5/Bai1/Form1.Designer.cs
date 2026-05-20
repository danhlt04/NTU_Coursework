namespace Bai1
{
    partial class frm
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
            lblInput = new Label();
            txtInput = new TextBox();
            btnPerimeter = new Button();
            btnArea = new Button();
            btnExit = new Button();
            lblOutput = new Label();
            SuspendLayout();
            // 
            // lblInput
            // 
            lblInput.Font = new Font("Times New Roman", 13F, FontStyle.Bold, GraphicsUnit.Point, 163);
            lblInput.Location = new Point(31, 30);
            lblInput.Name = "lblInput";
            lblInput.Size = new Size(278, 41);
            lblInput.TabIndex = 1;
            lblInput.Text = "Nhập bán kính hình tròn:";
            lblInput.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // txtInput
            // 
            txtInput.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            txtInput.Location = new Point(301, 39);
            txtInput.Name = "txtInput";
            txtInput.Size = new Size(225, 27);
            txtInput.TabIndex = 2;
            // 
            // btnPerimeter
            // 
            btnPerimeter.BackColor = SystemColors.ActiveCaption;
            btnPerimeter.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            btnPerimeter.Location = new Point(31, 110);
            btnPerimeter.Name = "btnPerimeter";
            btnPerimeter.Size = new Size(151, 45);
            btnPerimeter.TabIndex = 3;
            btnPerimeter.Text = "Chu vi";
            btnPerimeter.UseVisualStyleBackColor = false;
            btnPerimeter.Click += btnPerimeter_Click;
            // 
            // btnArea
            // 
            btnArea.BackColor = SystemColors.ActiveCaption;
            btnArea.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            btnArea.Location = new Point(203, 110);
            btnArea.Name = "btnArea";
            btnArea.Size = new Size(151, 45);
            btnArea.TabIndex = 4;
            btnArea.Text = "Diện tích";
            btnArea.UseVisualStyleBackColor = false;
            btnArea.Click += btnArea_Click;
            // 
            // btnExit
            // 
            btnExit.BackColor = SystemColors.ActiveCaption;
            btnExit.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            btnExit.Location = new Point(375, 110);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(151, 45);
            btnExit.TabIndex = 5;
            btnExit.Text = "Thoát";
            btnExit.UseVisualStyleBackColor = false;
            btnExit.Click += btnExit_Click;
            // 
            // lblOutput
            // 
            lblOutput.BackColor = SystemColors.ButtonShadow;
            lblOutput.Font = new Font("Segoe UI", 13F, FontStyle.Regular, GraphicsUnit.Point, 163);
            lblOutput.Location = new Point(31, 197);
            lblOutput.Name = "lblOutput";
            lblOutput.Size = new Size(495, 176);
            lblOutput.TabIndex = 6;
            // 
            // frm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(582, 403);
            Controls.Add(lblOutput);
            Controls.Add(btnExit);
            Controls.Add(btnArea);
            Controls.Add(btnPerimeter);
            Controls.Add(txtInput);
            Controls.Add(lblInput);
            Name = "frm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Tính chu vi, diện tích hình tròn";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private Label lblInput;
        private TextBox txtInput;
        private Button btnPerimeter;
        private Button btnArea;
        private Button btnExit;
        private Label lblOutput;
    }
}
