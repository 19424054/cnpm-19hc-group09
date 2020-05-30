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
    public partial class usListCustomerInfoSell : DevExpress.XtraEditors.XtraUserControl
    {
        public usListCustomerInfoSell()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmThongTinGiaoDich frm = new myFroms.frmThongTinGiaoDich(-1);
            frm.ShowDialog();
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
         //   myFroms.frmThongTinGiaoDich frm = new myFroms.frmThongTinGiaoDich();
           // frm.ShowDialog();
        }
    }
}
