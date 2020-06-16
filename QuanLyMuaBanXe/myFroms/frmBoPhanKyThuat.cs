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
    public partial class frmBoPhanKyThuat : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmBoPhanKyThuat()
        {
            InitializeComponent();
        }

        private void barButtonItem1_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usListProductionKyThuatDinhGia uc = new myUsercontrol.usListProductionKyThuatDinhGia();
            var page = (from p in tabMain.TabPages
                        where p.Name == "usListProductionKyThuatDinhGia"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Kiểm định xe mua",
                    Name = "usListProductionKyThuatDinhGia"
                };
                uc.Dock = DockStyle.Fill;
                uc.loadDataBasic();
                newPage.Controls.Add(uc);
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }

        private void barButtonItem2_ItemClick(object sender, ItemClickEventArgs e)
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
                uc.loadDataBasic();
                newPage.Controls.Add(uc);
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }
    }
}