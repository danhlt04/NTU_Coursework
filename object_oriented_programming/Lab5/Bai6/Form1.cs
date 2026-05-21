

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Bai6
{
    public partial class Form1 : Form
    {
        int pipeSpeed = 4;
        int velocity = 0;
        int score = 0;
        Random rng = new Random();

        const int GRAVITY = 2;
        const int JUMP = -13;
        const int PIPE_SPACE = 250;
        const int NUM_PIPES = 3;

        List<PictureBox> topPipes = new List<PictureBox>();
        List<PictureBox> botPipes = new List<PictureBox>();

        bool gameStarted = false;

        public Form1()
        {
            InitializeComponent();
            InitPipes();
            lblScore.Text = "Nhấn Space để bắt đầu!";
        }

        private void InitPipes()
        {
            pipeTop.Visible = false;
            pipeBot.Visible = false;

            for (int i = 0; i < NUM_PIPES; i++)
            {
                var top = ClonePipe(pipeTop);
                var bot = ClonePipe(pipeBot);

                this.Controls.Add(top);
                this.Controls.Add(bot);

                Bird.BringToFront();
                lblScore.BringToFront();

                topPipes.Add(top);
                botPipes.Add(bot);

                SetPipePosition(i, 400 + i * PIPE_SPACE);
            }
        }

        private PictureBox ClonePipe(PictureBox source)
        {
            return new PictureBox
            {
                Width = source.Width,
                BackColor = source.BackColor,
                Image = source.Image,
                SizeMode = source.SizeMode,
                Visible = true
            };
        }

        private void SetPipePosition(int i, int x)
        {
            int gap = rng.Next(150, 200);
            int minTop = 60;
            int maxTop = Ground.Top - gap - 60;

            if (maxTop <= minTop) maxTop = minTop + 10;

            int topH = rng.Next(minTop, maxTop);

            topPipes[i].Left = x;
            topPipes[i].Top = 0;
            topPipes[i].Height = topH;

            botPipes[i].Left = x;
            botPipes[i].Top = topH + gap;
            botPipes[i].Height = Ground.Top - (topH + gap);
        }

        private void gameTimer_Tick(object sender, EventArgs e)
        {
            velocity += GRAVITY;
            Bird.Top += velocity;

            for (int i = 0; i < NUM_PIPES; i++)
            {
                topPipes[i].Left -= pipeSpeed;
                botPipes[i].Left -= pipeSpeed;

                if (topPipes[i].Left < -topPipes[i].Width)
                {
                    int maxX = 0;
                    foreach (var p in topPipes)
                        if (p.Left > maxX) maxX = p.Left;

                    SetPipePosition(i, maxX + PIPE_SPACE);

                    score++;
                    lblScore.Text = $"Score: {score}";

                    if (score % 3 == 0 && pipeSpeed < 20)
                        pipeSpeed++;

                    if (score % 5 == 0 && pipeSpeed >= 20 && pipeSpeed < 50)
                        pipeSpeed++;
                }

                if (Bird.Bounds.IntersectsWith(topPipes[i].Bounds) ||
                    Bird.Bounds.IntersectsWith(botPipes[i].Bounds))
                {
                    EndGame(); return;
                }
            }

            if (Bird.Bounds.IntersectsWith(Ground.Bounds) || Bird.Top < 0)
                EndGame();
        }

        private void EndGame()
        {
            gameTimer.Stop();
            gameStarted = false;
            lblScore.Text = $"Score: {score}. Gameover!!!";
        }

        private void gameKeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar != ' ') return;

            if (!gameStarted)
            {
                score = 0;
                pipeSpeed = 4;
                velocity = 0;
                Bird.Top = 200;
                gameStarted = true;
                lblScore.Text = "Score: 0";

                for (int i = 0; i < NUM_PIPES; i++)
                    SetPipePosition(i, 400 + i * PIPE_SPACE);

                gameTimer.Start();
            }
            else
            {
                velocity = JUMP;
            }
        }
    }
}