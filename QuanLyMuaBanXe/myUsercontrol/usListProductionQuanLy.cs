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

namespace QuanLyMuaBanXe.myUsercontrol
{
    public partial class usListProductionQuanLy : DevExpress.XtraEditors.XtraUserControl
    {
        public usListProductionQuanLy()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmDinhGia frm = new myFroms.frmDinhGia();
            frm.ShowDialog();
        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua();
            frm.ShowDialog();
        }
    }
}
