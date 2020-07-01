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
        private int mYear = DateTime.Now.Year;
        private int mMonth = -1;
        public usListProductionQuanLy()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(XtraMessageBox.Show("Bạn có muốn hủy bản định giá này không?","Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
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
                    if (Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai")) != "Đã định giá bán")
                    {
                        int id_xe = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                        // int id_dinhgia = Convert.ToInt32(view.GetFocusedRowCellValue("Id_gia_ban"));
                        myFroms.frmDinhGia frm = new myFroms.frmDinhGia(-1, id_xe);
                        frm.ShowDialog();
                        loadData(mYear, mMonth);
                    }
                    else
                    {
                        XtraMessageBox.Show("Sản phẩm đã được định giá vui lòng kiểm tra.");
                    }
                }
            }
            catch (Exception)
            {


            }
           
        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            
         
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                GridView view = gvMain;

                if (view.FocusedRowHandle > -1)
                {
                    if (Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai")) == "Đã định giá bán")
                    {
                        if(!Convert.IsDBNull(view.GetFocusedRowCellValue("Id_gia_ban")))
                        {
                            int id_xe = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                            int id_dinhgia = Convert.ToInt32(view.GetFocusedRowCellValue("Id_gia_ban"));
                            myFroms.frmDinhGia frm = new myFroms.frmDinhGia(id_dinhgia, id_xe);
                            frm.ShowDialog();
                            loadData(mYear, mMonth);
                        }
                      
                    }
                }
            }
            catch (Exception)
            {


            }
        }
        private void reloadData()
        {

        }

        private void btnLamMoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            loadData(mYear, mMonth);
        }
        public void loadDataBasic()
        {
            //loadKeyPress();
            //DataTable dtMenu = new DataTable();// = Classes.Tools.laydata("api/purchasereceives/laydanhsachmenubywarehouseid/-1/-1/null/null/" + m_id);
            bM_LISTPRODUCT_MENUTableAdapter.FillByDinhGiaBan(dsSystem.BM_LISTPRODUCT_MENU, "DinhGiaBan");
            if (dsSystem.BM_LISTPRODUCT_MENU != null && dsSystem.BM_LISTPRODUCT_MENU.Rows.Count > 0)
            {
                gcMenu.DataSource = dsSystem.BM_LISTPRODUCT_MENU;
                DateTime m_now = DateTime.Now;
                int m_Year = m_now.Year;
                int m_Month = m_now.Month;
                gvMenu.ExpandGroupLevel(0, false);
                int rowHandle = myClasses.Tools.FindRowHandleByRowObject(dsSystem.BM_LISTPRODUCT_MENU, gvMenu, m_now.Month, m_now.Year);
                if (rowHandle >= 0)
                {
                    gvMenu.FocusedRowHandle = gvMenu.GetParentRowHandle(rowHandle);
                    // gvListTime.ExpandGroupRow(gvListTime.FocusedRowHandle, false);
                }
            }

        }
        private void gvMenu_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {

            if (gvMenu.IsGroupRow(e.FocusedRowHandle))
            {
                if (gvMenu.GetRowLevel(e.FocusedRowHandle) == 0)
                {
                    mMonth = -1;
                    mYear = Convert.ToInt32(gvMenu.GetGroupRowValue(e.FocusedRowHandle, colyear));
                }
                else
                {
                    mMonth = Convert.ToInt32(gvMenu.GetGroupRowValue(e.FocusedRowHandle, colmonth));
                    mYear = Convert.ToInt32(gvMenu.GetGroupRowValue(e.FocusedRowHandle, colyear));
                }
            }
            else
            {
                mMonth = Convert.ToInt32(gvMenu.GetFocusedRowCellValue("month"));
                mYear = Convert.ToInt32(gvMenu.GetFocusedRowCellValue("year"));
            }
            loadData(mYear, mMonth);
        }
        private void loadData(int mYear, int mMonth)
        {
            bM_THONGTINXE_DINHGIA_DETAILSTableAdapter.Fill(dsSystem.BM_THONGTINXE_DINHGIA_DETAILS, mYear, mMonth);
        }

        private void gvMain_CustomDrawRowIndicator(object sender, RowIndicatorCustomDrawEventArgs e)
        {
            GridView view = sender as GridView;
            if (e.Info.IsRowIndicator && e.RowHandle >= 0)
            {
                e.Info.DisplayText = (e.RowHandle + 1).ToString();
                e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
                e.Appearance.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
                e.Appearance.ForeColor = Color.Blue;
                e.Appearance.Font = new Font("Times New Roman", 9, FontStyle.Bold);
            }
        }

        private void barLargeButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                GridView view = gvMain;
                if (view.FocusedRowHandle > -1)
                {
                    if(Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai"))!="Đã định giá bán")
                    {
                        int id_xe = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                        myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua(id_xe);
                        frm.ShowDialog();
                        loadData(mYear, mMonth);
                    }
                    else
                    {
                        int id_xe = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                        myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua(id_xe,1);
                        frm.ShowDialog();
                    }
                  
                }
            }
            catch (Exception)
            {


            }
        }
    }
}
