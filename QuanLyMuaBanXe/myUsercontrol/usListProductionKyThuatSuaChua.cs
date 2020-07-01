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
    public partial class usListProductionKyThuatSuaChua : DevExpress.XtraEditors.XtraUserControl
    {
        private int mYear = DateTime.Now.Year;
        private int mMonth = -1;
        public usListProductionKyThuatSuaChua()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua(Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe")));
                frm.ShowDialog();
                loadData(mYear, mMonth);
            }
        }

        private void barLargeButtonItem1_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua(Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe")));
                frm.ShowDialog();
                loadData(mYear, mMonth);
            }
        }
        public void loadDataBasic()
        {
            //loadKeyPress();
            bM_LISTPRODUCT_MENUTableAdapter.FillByInforTech(dsSystem.BM_LISTPRODUCT_MENU,"dinhgia");
        //    DataTable dtMenu = new DataTable();// = Classes.Tools.laydata("api/purchasereceives/laydanhsachmenubywarehouseid/-1/-1/null/null/" + m_id);
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
                mMonth = Convert.ToInt32(gvMenu.GetFocusedRowCellValue("Pmonth"));
                mYear = Convert.ToInt32(gvMenu.GetFocusedRowCellValue("PYear"));
            }
            loadData(mYear, mMonth);
        }

        private void loadData(int mYear, int mMonth)
        {
            bM_INFORTECHNICAL_MAINTableAdapter.Fill(dsSystem.BM_INFORTECHNICAL_MAIN, mYear, mMonth);
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                if(!Convert.IsDBNull(view.GetFocusedRowCellValue("Trang_Thai")))
                {
                    if(Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai"))== "Sửa chữa")
                    {
                        int m_id = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                        myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua(m_id);
                        frm.ShowDialog();
                        loadData(mYear, mMonth);
                    }
                    else
                    {
                        XtraMessageBox.Show("Không thể cập nhật xe chưa sửa chữa. Vui lòng kiểm tra lại");
                    }
                }
            }
        }

        private void btnLamMoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            loadData(mYear, mMonth);
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

        private void gvMain_DoubleClick(object sender, EventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                myFroms.frmThongTinSuaChua frm = new myFroms.frmThongTinSuaChua(Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe")));   
                frm.ShowDialog();
                loadData(mYear, mMonth);
            }
        }
    }
}
