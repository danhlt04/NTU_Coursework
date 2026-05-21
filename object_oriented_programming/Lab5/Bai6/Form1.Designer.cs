namespace Bai6
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.pipeTop = new System.Windows.Forms.PictureBox();
            this.Bird = new System.Windows.Forms.PictureBox();
            this.pipeBot = new System.Windows.Forms.PictureBox();
            this.Ground = new System.Windows.Forms.PictureBox();
            this.lblScore = new System.Windows.Forms.Label();
            this.gameTimer = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pipeTop)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Bird)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pipeBot)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Ground)).BeginInit();
            this.SuspendLayout();
            // 
            // pipeTop
            // 
            this.pipeTop.Image = global::Bai6.Properties.Resources.pipedown;
            this.pipeTop.Location = new System.Drawing.Point(657, -32);
            this.pipeTop.Name = "pipeTop";
            this.pipeTop.Size = new System.Drawing.Size(57, 174);
            this.pipeTop.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pipeTop.TabIndex = 0;
            this.pipeTop.TabStop = false;
            // 
            // Bird
            // 
            this.Bird.Image = global::Bai6.Properties.Resources.bird;
            this.Bird.Location = new System.Drawing.Point(31, 171);
            this.Bird.Name = "Bird";
            this.Bird.Size = new System.Drawing.Size(85, 73);
            this.Bird.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Bird.TabIndex = 0;
            this.Bird.TabStop = false;
            // 
            // pipeBot
            // 
            this.pipeBot.Image = global::Bai6.Properties.Resources.pipe;
            this.pipeBot.Location = new System.Drawing.Point(366, 234);
            this.pipeBot.Name = "pipeBot";
            this.pipeBot.Size = new System.Drawing.Size(57, 242);
            this.pipeBot.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pipeBot.TabIndex = 0;
            this.pipeBot.TabStop = false;
            // 
            // Ground
            // 
            this.Ground.Image = global::Bai6.Properties.Resources.ground;
            this.Ground.Location = new System.Drawing.Point(-26, 409);
            this.Ground.Name = "Ground";
            this.Ground.Size = new System.Drawing.Size(860, 112);
            this.Ground.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Ground.TabIndex = 0;
            this.Ground.TabStop = false;
            // 
            // lblScore
            // 
            this.lblScore.AutoSize = true;
            this.lblScore.Font = new System.Drawing.Font("Times New Roman", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lblScore.Location = new System.Drawing.Point(12, 446);
            this.lblScore.Name = "lblScore";
            this.lblScore.Size = new System.Drawing.Size(104, 30);
            this.lblScore.TabIndex = 1;
            this.lblScore.Text = "Score: 0";
            // 
            // gameTimer
            // 
            this.gameTimer.Tick += new System.EventHandler(this.gameTimer_Tick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Aqua;
            this.ClientSize = new System.Drawing.Size(798, 505);
            this.Controls.Add(this.lblScore);
            this.Controls.Add(this.Ground);
            this.Controls.Add(this.pipeBot);
            this.Controls.Add(this.Bird);
            this.Controls.Add(this.pipeTop);
            this.Name = "Form1";
            this.Text = "Flapy Bird";
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.gameKeyPress);
            ((System.ComponentModel.ISupportInitialize)(this.pipeTop)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Bird)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pipeBot)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Ground)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pipeTop;
        private System.Windows.Forms.PictureBox Bird;
        private System.Windows.Forms.PictureBox pipeBot;
        private System.Windows.Forms.PictureBox Ground;
        private System.Windows.Forms.Label lblScore;
        private System.Windows.Forms.Timer gameTimer;
    }
}

