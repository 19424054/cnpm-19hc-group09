using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QuanLyMuaBanXe.myReport
{
    public partial class rptMuaBan : DevExpress.XtraReports.UI.XtraReport
    {
        
        private int nam = DateTime.Now.Year;
        private int thang = DateTime.Now.Month;
        private int ngay = DateTime.Now.Day;
        public rptMuaBan( int year, int month, int day)
        {
            InitializeComponent();
           
            nam = year;
            thang = month;
            ngay = day;
            loadData();
        }
        private void loadData()
        {
            if (ngay == -1)
            {
                xrLabel1.Text = "BÁO CÁO MUA BAN XE THÁNG " + thang + "/" + nam;
            }
            else
            {
                xrLabel1.Text = "BÁO CÁO MUA BAN XE THÁNG "+ngay +"/"+ thang + "/" + nam;
            }
            bM_REPORT_BUY_SELLTableAdapter.Fill(dsSystem1.BM_REPORT_BUY_SELL,ngay,nam,thang);
        }

    }
}
