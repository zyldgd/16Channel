using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;//用于调用串口类函数
using System.Drawing.Drawing2D;
using System.Timers;
using System.Collections;


namespace UART
{

    public partial class Form1 : Form
    {

        private SerialPort SP = new SerialPort();
        private Graphics G;
        private drawGph drawer;
        private int maxValue;
        private int curChannel;
        public float offset=0;
        //public ArrayList TextBoxList;
        public TextBox[] TextBoxList = new TextBox[16];
        private System.Timers.Timer timer = new System.Timers.Timer(50);//实例化Timer类，设置间隔时间；

        public Form1()
        {
            InitializeComponent();
            G = pictureBox.CreateGraphics();
            drawer = new drawGph(pictureBox.Width, pictureBox.Height);
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox_ports.Items.Clear();
            comboBox_ports.Items.AddRange(SerialPort.GetPortNames());
            timer.Elapsed += new System.Timers.ElapsedEventHandler(theout);//到达时间的时候执行事件；
            timer.AutoReset = true;//设置是执行一次（false）还是一直执行(true)；
            SP.DataReceived += new SerialDataReceivedEventHandler(Com_DataReceived);
            comboBox_rate.SelectedIndex = 2;
            comboBox_databit.SelectedIndex = 2;
            comboBox_stopbit.SelectedIndex = 0;
            comboBox_channel.SelectedIndex = 15;
            curChannel = comboBox_channel.SelectedIndex;
            maxValue = 4300; 

            TextBoxList[0] = textBox_dataRe_U10;
            TextBoxList[1] = textBox_dataRe_U11;
            TextBoxList[2] = textBox_dataRe_U12;
            TextBoxList[3] = textBox_dataRe_U13;
            TextBoxList[4] = textBox_dataRe_U14;
            TextBoxList[5] = textBox_dataRe_U15;
            TextBoxList[6] = textBox_dataRe_U16;
            TextBoxList[7] = textBox_dataRe_U17;
            TextBoxList[8] = textBox_dataRe_U18;
            TextBoxList[9] = textBox_dataRe_U19;
            TextBoxList[10] = textBox_dataRe_U20;
            TextBoxList[11] = textBox_dataRe_U21;
            TextBoxList[12] = textBox_dataRe_U22;
            TextBoxList[13] = textBox_dataRe_U23;
            TextBoxList[14] = textBox_dataRe_U24;
            TextBoxList[15] = textBox_dataRe_U25;


        }


        public bool SendData(byte[] data)
        {
            if (SP.IsOpen)
            {
                try
                {
                    //将消息传递给串口

                    SP.Write(data, 0, data.Length);
                    return true;
                }
                catch (Exception ex)
                {
                    //MessageBox.Show(ex.Message, "发送失败", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                    
                }
            }
            else
            {
                //MessageBox.Show("dis", "发送 ", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }


        static float MAP(float val, float smin, float smax, float dmin, float dmax)
        {
            return (val - smin) / (smax - smin) * (dmax - dmin) + dmin;
        }


        private void Com_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            if(SP.BytesToRead>=32)
            {
                byte[] ReDatas = new byte[32];
                SP.Read(ReDatas, 0, 32);
                SHOW(ReDatas);
                // MessageBox.Show("dis", "发送ing", MessageBoxButtons.OK, MessageBoxIcon.Error);
               
                /*
                byte dataL = ReDatas[26];
                byte dataH = ReDatas[27];
                Int16 data = (Int16)((dataH << 8) + dataL);
                // float value = MAP(data, -32768, 32767, -1250f, 1250f) + offset;
                // string OUT = data.ToString("0.000 mV");
                string OUT = data.ToString();
                AddContent(OUT + "\n");
                */
            }
            //drawGraph((int )MAP(value, -1250f, 1250f, - pictureBox.Height/2,  pictureBox.Height / 2));

            //byte[] ReDatas = new byte[SP.BytesToRead];
            //if (ReDatas.Length>=2)
            //{
            //    SP.Read(ReDatas, 0, 2);
            //    AddContent(ReDatas[]);
            //}
            // AddData(ReDatas);
        }

        public void SHOW(byte[] data)
        {
            short[] var = new short[16];
            if (data.Length==32)
            {
                for (int i=0; i<16; i++)
                {
                    var[i] = ((short)((data[2 * i + 1] << 8) + data[2 * i]));
                }
                BeginInvoke(new MethodInvoker(delegate {
                    for(int j = 0; j<16;j++)
                    {
                        if(checkBox_rawdata.Checked)
                        {
                            (TextBoxList[j]).AppendText(var[j].ToString("0\n"));
                        }
                        else
                        {
                            float value = MAP(var[j], -32768, 32767, -maxValue, maxValue) + offset;
                            (TextBoxList[j]).AppendText(value.ToString("0.00 mV\n"));
                        }
                    }

                    try
                    {
                        drawGraph((int)MAP(var[curChannel], -32768, 32767, -pictureBox.Height / 2, pictureBox.Height / 2));
                    }
                    catch
                    {
                        //
                    }
                   
                }));
            }
        }



        public void AddData(byte[] data)
        {

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sb.AppendFormat("{0:x2}" + " ", data[i]);
            }
            AddContent(sb.ToString().ToUpper());
          
            /*
                if (radioButton_Hex.Checked)
                {
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < data.Length; i++)
                    {
                        sb.AppendFormat("{0:x2}" + " ", data[i]);
                    }
                    AddContent(sb.ToString().ToUpper());
                }
                else if (radioButton_ASCII.Checked)
                {
                    AddContent(new ASCIIEncoding().GetString(data));
                }
                else if (radioButton_UTF8.Checked)
                {
                    AddContent(new UTF8Encoding().GetString(data));
                }
                else if (radioButton_Unicode.Checked)
                {
                    AddContent(new UnicodeEncoding().GetString(data));
                }
                else
                {
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < data.Length; i++)
                    {
                        sb.AppendFormat("{0:x2}" + " ", data[i]);
                    }
                    AddContent(sb.ToString().ToUpper());
                }
           */
        }


        private void AddContent(string content)
        {
            BeginInvoke(new MethodInvoker(delegate
            {
                textBox_dataRe_U10.AppendText(content);
                //textBox_dataRe.Text = content;
            }));
        }


        private void button_scan_click(object sender, EventArgs e)
        {
            comboBox_ports.Items.Clear();
            comboBox_ports.Items.AddRange(SerialPort.GetPortNames());
        }


        private void button_connect_click(object sender, EventArgs e)
        {
            if(comboBox_ports.Items.Count<=0)
            {
                MessageBox.Show("没有任何端口连接！","提示",MessageBoxButtons.OK,MessageBoxIcon.Warning);
                return;
            }

            try
            {
                if (!SP.IsOpen)
                {
                    SP.BaudRate = int.Parse(comboBox_rate.SelectedItem.ToString());
                    SP.PortName = comboBox_ports.SelectedItem.ToString();
                    SP.Parity = Parity.None;
                    SP.DataBits = int.Parse(comboBox_databit.SelectedItem.ToString());
                    SP.StopBits = (StopBits)int.Parse(comboBox_stopbit.SelectedItem.ToString());
                    SP.Open();
                    button_connect.Text = "断开";

                }
                else
                {
                    if (SP.IsOpen && button_connect.Text == "断开")
                    {
                        SP.Close();
                        button_connect.Text = "连接";
                    }
                }
            }
            catch (Exception E)
            {
                MessageBox.Show("连接失败，请检测端口！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            if(SP.IsOpen)
            {
                SP.Close();
            }
        }


        private void button2_Click(object sender, EventArgs e)
        {
            for(int i=0;i<16;i++)
            {
                TextBoxList[i].Text = "";
            }
        }

        private void drawGraph(int Amp)
        {
            drawer.DrawOnAmp(Amp);
            G.DrawImage(drawer.picture,0,0);
           // pictureBox.Image = drawer.picture;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

            string rawText = ((TextBox)sender).Text;
            if(rawText.Length == 0)
            {
                offset = 0;
                return;
            }
                

            string text="";
            if ('0' <= (char)rawText[0] && (char)rawText[0] <= '9' || (char)rawText[0] == '-')
                text += rawText[0];

            for (int i=1;i<rawText.Length;i++)
            {
                if('0'<=(char)rawText[i] && (char)rawText[i] <='9' || (char)rawText[i] == '.')
                    text += rawText[i];
            }

            float ans = 0;
            ((TextBox)sender).Text = text;
           // ((TextBox)sender).Select(this.textBox1.TextLength, 0);
            ans = float.Parse(text);
            offset = ans;

        }

        public void theout(object source, System.Timers.ElapsedEventArgs e)
        {
            byte[] data = {0xff, 0x00};
            SendData(data);
        }

        private void button_send_Click(object sender, EventArgs e)
        {
            if(!timer.Enabled)
            {
                timer.Enabled = true;//是否执行System.Timers.Timer.Elapsed事件；
                button_send.Text = "停止接受";
            }
            else
            {
                if(button_send.Text == "停止接受")
                {
                    button_send.Text = "开始接受";
                }
                timer.Enabled = false;//是否执行System.Timers.Timer.Elapsed事件；
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox_dataRe_U22.Text != "")
                Clipboard.SetDataObject(textBox_dataRe_U22.Text);
        }



        private void textBox_maxValue_TextChanged(object sender, EventArgs e)
        {
            try
            {
                maxValue = Math.Abs(int.Parse(textBox_maxValue.Text));
            }
            catch
            {
                maxValue = 4000;
            }
            
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.linkLabel1.Links[0].LinkData = "www.zylcy.cn";
            System.Diagnostics.Process.Start(e.Link.LinkData.ToString());
        }

        private void comboBox_channel_SelectedIndexChanged(object sender, EventArgs e)
        {
            curChannel = comboBox_channel.SelectedIndex;
        }
    }
    
}
