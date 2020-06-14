﻿using System;
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
    public partial class usListProductionKyThuatDinhGia : DevExpress.XtraEditors.XtraUserControl
    {
        private int mYear = DateTime.Now.Year;
        private int mMonth = -1;
        myDataSet.dsSystemTableAdapters.BM_ThongTinXeBanTableAdapter taXeBan = new myDataSet.dsSystemTableAdapters.BM_ThongTinXeBanTableAdapter();
        public usListProductionKyThuatDinhGia()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                int m_id = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                if(Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai"))=="Đã định giá")
                {
                    if(XtraMessageBox.Show("Bạn có xác nhận hủy định giá của xe này không?","Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        taXeBan.UpdateQueryTrangThai("Mới tạo", m_id);
                    }
                }
            }
        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmKiemTraTinhTrangXeBan frm = new myFroms.frmKiemTraTinhTrangXeBan(-1);
            frm.ShowDialog();
            loadData(mYear, mMonth);
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
            loadData( mYear,  mMonth);
        }
        private void loadData(int mYear, int mMonth)
        {

        }
        public void loadDataBasic()
        {
            //loadKeyPress();
            DataTable dtMenu = new DataTable();// = Classes.Tools.laydata("api/purchasereceives/laydanhsachmenubywarehouseid/-1/-1/null/null/" + m_id);
            if (dtMenu != null && dtMenu.Rows.Count > 0)
            {
                gcMenu.DataSource = dtMenu;
                DateTime m_now = DateTime.Now;
                int m_Year = m_now.Year;
                int m_Month = m_now.Month;
                gvMenu.ExpandGroupLevel(0, false);
                int rowHandle = myClasses.Tools.FindRowHandleByRowObject(dtMenu, gvMenu, m_now.Month, m_now.Year);
                if (rowHandle >= 0)
                {
                    gvMenu.FocusedRowHandle = gvMenu.GetParentRowHandle(rowHandle);
                    // gvListTime.ExpandGroupRow(gvListTime.FocusedRowHandle, false);
                }
            }

        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                int m_id = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                myFroms.frmKiemTraTinhTrangXeBan frm = new myFroms.frmKiemTraTinhTrangXeBan(m_id);
                frm.ShowDialog();
                loadData(mYear, mMonth);
            }
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

        private void gcMain_DoubleClick(object sender, EventArgs e)
        {

        }
    }
}
