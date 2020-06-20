using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QuanLyMuaBanXe.myReport
{
    public partial class rptThuChiDetail : DevExpress.XtraReports.UI.XtraReport
    {
        private int id_xe = -1;
        public rptThuChiDetail(int id)
        {
            InitializeComponent();
            id_xe = id;
            loadData();
        }
        private void loadData()
        {
            bM_REPORT_BUY_SELL_DETAILS_EACHTableAdapter.Fill(dsSystem2.BM_REPORT_BUY_SELL_DETAILS_EACH, id_xe);
            if(dsSystem2.BM_REPORT_BUY_SELL_DETAILS_EACH.Rows.Count>0)
            {
                xrLabel1.Text = "BÁO CÁO THU CHI SẢN PHẨM "+ Convert.ToString( dsSystem2.BM_REPORT_BUY_SELL_DETAILS_EACH.Rows[0]["Ma_so_xe"]);
            }
           
        }

    }
}
