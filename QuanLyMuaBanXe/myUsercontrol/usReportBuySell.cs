using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraReports.UI;

namespace QuanLyMuaBanXe.myUsercontrol
{
    public partial class usReportBuySell : DevExpress.XtraEditors.XtraUserControl
    {
        int m_Ngay = DateTime.Now.Day;
        int m_thang = DateTime.Now.Month;
        int m_nam = DateTime.Now.Month;
        public usReportBuySell()
        {
            InitializeComponent();
        }

        private void gvMain_CustomDrawRowIndicator(object sender, DevExpress.XtraGrid.Views.Grid.RowIndicatorCustomDrawEventArgs e)
        {
            GridView view = sender as GridView;
            if (e.Info.IsRowIndicator && e.RowHandle >= 0)
            {
                e.Info.DisplayText = (e.RowHandle + 1).ToString();
                e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
                e.Appearance.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
                e.Appearance.ForeColor = Color.Blue;
                e.Appearance.Font = new Font("Times New Roman", 9, FontStyle.Bold);
            }
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            loadDetail();
        }
        private void loadDetail()
        {

            if (radioGroup1.SelectedIndex == 0)
            {
                m_Ngay = Convert.ToDateTime(dateEdit1.EditValue).Day;
                m_thang = Convert.ToDateTime(dateEdit1.EditValue).Month;
                m_nam = Convert.ToDateTime(dateEdit1.EditValue).Year;
            }
            else
            {
                m_Ngay = -1;
                m_thang = Convert.ToDateTime(dateEdit1.EditValue).Month;
                m_nam = Convert.ToDateTime(dateEdit1.EditValue).Year;
            }
            bM_REPORT_BUY_SELLTableAdapter.Fill(dsSystem.BM_REPORT_BUY_SELL, m_Ngay, m_nam, m_thang);
        }
        public void loadData()
        {
            dateEdit1.EditValue = DateTime.Now;
            radioGroup1.SelectedIndex = 0;
            //loadDetail();
           
        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void barLargeButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void radioGroup1_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadDetail();
        }

        private void dateEdit1_EditValueChanged(object sender, EventArgs e)
        {
            loadDetail();
        }

        private void barLargeButtonItem3_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myReport.rptMuaBan rpt = new myReport.rptMuaBan(m_nam,m_thang,m_Ngay);
            rpt.CreateDocument();
            rpt.ShowPreview();
        }
    }
}
