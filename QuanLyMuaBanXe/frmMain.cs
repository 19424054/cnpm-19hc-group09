using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace QuanLyMuaBanXe
{
    public partial class frmMain : DevExpress.XtraEditors.XtraForm
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void tileItem3_ItemClick(object sender, TileItemEventArgs e)
        {
            myFroms.frmManagementMain frm = new myFroms.frmManagementMain();
            frm.ShowDialog();
        }

        private void tileItem1_ItemClick(object sender, TileItemEventArgs e)
        {
            myFroms.frmBoPhanKyThuat frm = new myFroms.frmBoPhanKyThuat();
            frm.ShowDialog();
        }

        private void tileItem4_ItemClick(object sender, TileItemEventArgs e)
        {
            myFroms.frmBoPhanTiepNhan frm = new myFroms.frmBoPhanTiepNhan();
            frm.ShowDialog();
        }

        private void tileItem2_ItemClick(object sender, TileItemEventArgs e)
        {
            myFroms.frmBoPhanBanXe frm = new myFroms.frmBoPhanBanXe();
            frm.ShowDialog();
        }
    }
}