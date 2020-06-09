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
    public partial class frmBoPhanTiepNhan : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmBoPhanTiepNhan()
        {
            InitializeComponent();
        }

        private void btnCustombuycar_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usListProduction uc = new myUsercontrol.usListProduction();
           var page = (from p in tabMain.TabPages
                        where p.Name == "ucTiepNhaXeBan"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Tiếp nhận xe bán",
                    Name = "ucTiepNhaXeBan"
                };
                uc.Dock = DockStyle.Fill;
                newPage.Controls.Add(uc);
                uc.loadDataBasic();
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }

        private void btnListCarBuy_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usListCustomerInfo uc = new myUsercontrol.usListCustomerInfo();
            var page = (from p in tabMain.TabPages
                        where p.Name == "usListCustomerInfo"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Tiếp nhận khách hàng",
                    Name = "usListCustomerInfo"
                };
                uc.Dock = DockStyle.Fill;
                newPage.Controls.Add(uc);
                uc.loadDataBasic();
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }
    }
}