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
            if(XtraMessageBox.Show("Bạn có muốn bản định giá này không?","Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {

            }
        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                GridView view = gvMain;
                if (view.FocusedRowHandle > -1)
                {
                    myFroms.frmDinhGia frm = new myFroms.frmDinhGia(-1);
                    frm.ShowDialog();
                }
            }
            catch (Exception ex)
            {


            }
           
        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                GridView view = gvMain;
                if (view.FocusedRowHandle > -1)
                {
                    myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua();
                    frm.ShowDialog();
                }
            }
            catch (Exception ex)
            {


            }
         
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                GridView view = gvMain;
                if (view.FocusedRowHandle > -1)
                {

                }
            }
            catch (Exception ex)
            {

               
            }
        }
        private void reloadData()
        {

        }

        private void btnLamMoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            reloadData();
        }
    }
}
