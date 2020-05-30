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
    public partial class frmBoPhanBanXe : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmBoPhanBanXe()
        {
            InitializeComponent();
        }

        private void barButtonItem1_ItemClick(object sender, ItemClickEventArgs e)
        {
            myUsercontrol.usListCustomerInfoSell uc = new myUsercontrol.usListCustomerInfoSell();
            var page = (from p in tabMain.TabPages
                        where p.Name == "usListCustomerInfoSell"
                        select p).FirstOrDefault();
            if (page != null)
            {
                tabMain.SelectedTabPage = (XtraTabPage)page;
            }
            else
            {
                XtraTabPage newPage = new XtraTabPage()
                {
                    Text = "Khách hàng mua xe",
                    Name = "usListCustomerInfoSell"
                };
                uc.Dock = DockStyle.Fill;
                newPage.Controls.Add(uc);
                tabMain.TabPages.Add(newPage);
                tabMain.SelectedTabPage = newPage;
            }
        }
    }
}