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
    public partial class usListProductionKyThuatSuaChua : DevExpress.XtraEditors.XtraUserControl
    {
        public usListProductionKyThuatSuaChua()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua();
            frm.ShowDialog();
        }

        private void barLargeButtonItem1_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua();
            frm.ShowDialog();
        }
    }
}
