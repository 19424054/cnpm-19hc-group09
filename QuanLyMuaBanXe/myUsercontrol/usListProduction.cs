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
    public partial class usListProduction : DevExpress.XtraEditors.XtraUserControl
    {
        public usListProduction()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmAddInfor frm = new myFroms.frmAddInfor(-1);
            frm.ShowDialog();
        }
    }
}
