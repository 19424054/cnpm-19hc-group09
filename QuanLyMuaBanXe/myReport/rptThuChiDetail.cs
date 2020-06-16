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
        }
        private void loadData()
        {

        }

    }
}
