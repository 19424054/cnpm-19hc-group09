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
    public partial class usListProduction : DevExpress.XtraEditors.XtraUserControl
    {
        private int mYear = DateTime.Now.Year;
        private int mMonth = -1;
        myDataSet.dsSystemTableAdapters.BM_ThongTinXeBanTableAdapter taXeBan = new myDataSet.dsSystemTableAdapters.BM_ThongTinXeBanTableAdapter();
        public usListProduction()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                if(!Convert.IsDBNull(view.GetFocusedRowCellValue("Id_xe")))
                {
                    if (Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai")) == "Mới tạo")
                    {
                        if (XtraMessageBox.Show("Bạn có muốn xóa sản phẩm này không?","Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            int m_id = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                            gvMain.DeleteSelectedRows();
                            bM_LISTPRODUCT_DETAILSTableAdapter.DeleteQuery(m_id);
                        }
                    }
                    else
                    {
                        XtraMessageBox.Show("Bạn chỉ xóa được sản phẩm ở trạng thái mới tạo");
                    }
                }
            }
        }

        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            myFroms.frmAddInfor frm = new myFroms.frmAddInfor(-1);
            frm.ShowDialog();
            loadDataBasic();
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
        public void loadDataBasic()
        {
            //loadKeyPress();
            bM_LISTPRODUCT_MENUTableAdapter.Fill(dsSystem.BM_LISTPRODUCT_MENU,"SanPham");// = Classes.Tools.laydata("api/purchasereceives/laydanhsachmenubywarehouseid/-1/-1/null/null/" + m_id);
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
        private void loadData(int mYear, int mMonth)
        {
            bM_LISTPRODUCT_DETAILSTableAdapter.Fill(dsSystem.BM_LISTPRODUCT_DETAILS, mYear, mMonth);
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                int m_id = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                myFroms.frmAddInfor frm = new myFroms.frmAddInfor(m_id);
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

        private void btnLamMoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            loadData(mYear, mMonth);
        }

        private void btnXacNhan_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                int m_id = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                if(Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai"))=="Đã kiểm tra")
                {
                    if(XtraMessageBox.Show("Bạn xác nhận đã hoàn thành thủ tục mua xe này?","Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        myFroms.frmXacNhanMuaXe frm = new myFroms.frmXacNhanMuaXe(m_id);
                        frm.ShowDialog();
                        loadData(mYear, mMonth);
                    }
                }
                else if(Convert.ToString(view.GetFocusedRowCellValue("Trang_Thai")) == "Đã mua")
                {
                    if (XtraMessageBox.Show("Bạn xác nhận cập nhật lại thủ tục mua xe này?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        myFroms.frmXacNhanMuaXe frm = new myFroms.frmXacNhanMuaXe(m_id);
                        frm.ShowDialog();
                        loadData(mYear, mMonth);
                    }
                }
                else
                {
                    XtraMessageBox.Show("Xe hiện tại chưa định giá. Vui lòng liên hệ phòng kỹ thuật.");
                }
            }
        }
    }
}
