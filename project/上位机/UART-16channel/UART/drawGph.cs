using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Threading.Tasks;

namespace UART
{
    class drawGph
    {
        public Bitmap picture;
        public int width;
        public int height;


        private Graphics g;
        private Graphics oldg;
        private Pen pen = new Pen(Color.FromArgb(20, 20, 250),1);
        private Pen Redpen = new Pen(Color.FromArgb(200, 20, 20));
        private Bitmap oldPicture;
        private float lastAmp;
        private float space=5;
        private PointF lastPoint=new PointF(0,0);
        private PointF curPoint = new PointF(0, 0);
        private float halfOfHeight;

        public drawGph(int width, int height)
        {
            this.width = width;
            this.height = height;
            this.halfOfHeight = this.height / 2;
            this.lastAmp = this.halfOfHeight;
            this.picture = new Bitmap(width, height);
            this.oldPicture = new Bitmap(width, height);
            this.g = Graphics.FromImage(picture);
            this.oldg = Graphics.FromImage(oldPicture);
            lastPoint.X = this.width - this.space;
            curPoint.X = this.width;
            //g.SmoothingMode = SmoothingMode.HighQuality;
            //oldg.SmoothingMode = SmoothingMode.HighQuality;
        }

        public void DrawOnAmp(float Amp)
        { 
            this.curPoint.Y = this.halfOfHeight - Amp;
            this.oldg.Clear(Color.White);
            this.oldg.DrawImage(this.picture, -space, 0);
            this.oldg.DrawLine(this.Redpen, 0f, this.halfOfHeight, this.width, this.halfOfHeight);
            // this.oldg.DrawLine(this.pen, this.width - this.space, this.lastAmp, this.width, this.curPoint.Y);
            this.oldg.DrawLine(this.pen, this.width - this.space, this.lastAmp, this.width - this.space, this.curPoint.Y);
            this.lastPoint.Y = this.curPoint.Y;
            this.g.DrawImage(this.oldPicture, 0, 0);
        }
    }
}
