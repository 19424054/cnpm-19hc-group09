using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars;
using DevExpress.XtraTab;

namespace QuanLyMuaBanXe.myFroms
{
    public partial class frmManagementMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmManagementMain()
        {
            InitializeComponent();
        }

        private void btnPlanRepair_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usListProductionKyThuatSuaChua uc = new myUsercontrol.usListProductionKyThuatSuaChua();
            var page = (from p in tabMain.TabPages
                        where p.Name == "usListProductionKyThuatSuaChua"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Kiểm tra - sữa chữa",
                    Name = "usListProductionKyThuatSuaChua"
                };
                uc.Dock = DockStyle.Fill;
                newPage.Controls.Add(uc);
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }

        private void barButtonItem1_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usReportBuySellManagement uc = new myUsercontrol.usReportBuySellManagement();
            var page = (from p in tabMain.TabPages
                        where p.Name == "usReportBuySellManagement"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Báo cáo doanh thu",
                    Name = "usReportBuySellManagement"
                };
                uc.Dock = DockStyle.Fill;
                newPage.Controls.Add(uc);
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }

        private void btnListBuySell_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usReportBuySell uc = new myUsercontrol.usReportBuySell();
            var page = (from p in tabMain.TabPages
                        where p.Name == "usReportBuySell"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Báo cáo xe mua bán",
                    Name = "usReportBuySell"
                };
                uc.Dock = DockStyle.Fill;
                newPage.Controls.Add(uc);
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }
    }
}