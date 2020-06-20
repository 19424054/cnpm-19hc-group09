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
    public partial class usListCustomerInfoSell : DevExpress.XtraEditors.XtraUserControl
    {
        private int mYear = DateTime.Now.Year;
        private int mMonth = -1;
        public usListCustomerInfoSell()
        {
            InitializeComponent();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                if (!Convert.IsDBNull(view.GetFocusedRowCellValue("Id_ban")))
                {
                    int id_ban = Convert.ToInt32(view.GetFocusedRowCellValue("Id_ban"));
                    int id_kh = Convert.ToInt32(view.GetFocusedRowCellValue("Id_KH"));
                    int id_xe = Convert.ToInt32(view.GetFocusedRowCellValue("Id_xe"));
                    if (XtraMessageBox.Show("Bạn có muốn hủy giao dịch này không?","Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question)==DialogResult.Yes)
                    {
                        bM_SELLPRODUCT_DETAILSTableAdapter.DeleteQueryId_Ban(id_ban);
                        bM_SELLPRODUCT_DETAILSTableAdapter.UpdateQuery("Mới tạo", id_kh);
                        bM_SELLPRODUCT_DETAILSTableAdapter.UpdateQueryTrangThaiXe("Đã định giá bán", id_xe);
                        loadData(mYear, mMonth);
                    }
                }
            }
        }
        private void btnAddNew_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if(view.FocusedRowHandle>-1)
            {
                if (Convert.IsDBNull(view.GetFocusedRowCellValue("Id_ban")))
                {
                    int id_kh = Convert.ToInt32(view.GetFocusedRowCellValue("Id_KH"));
                    myFroms.frmThongTinGiaoDich frm = new myFroms.frmThongTinGiaoDich(-1, id_kh);
                    frm.ShowDialog();
                    loadDataBasic();
                }
                else
                {
                    XtraMessageBox.Show("Khách hàng hiện tại đã thực hiện giao dịch. Vui lòng kiểm tra lại");
                }
            }
         
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
                if (!Convert.IsDBNull(view.GetFocusedRowCellValue("Id_ban")))
                {
                    int id_ban= Convert.ToInt32(view.GetFocusedRowCellValue("Id_ban"));
                    int id_kh = Convert.ToInt32(view.GetFocusedRowCellValue("Id_KH"));
                    myFroms.frmThongTinGiaoDich frm = new myFroms.frmThongTinGiaoDich(id_ban, id_kh);
                    frm.ShowDialog();
                    loadData(mYear, mMonth);
                }
                else
                {
                    XtraMessageBox.Show("Khách hàng hiện tại chưa thực hiện giao dịch. Vui lòng kiểm tra lại");
                }
            }
            //   myFroms.frmThongTinGiaoDich frm = new myFroms.frmThongTinGiaoDich();
            // frm.ShowDialog();
            
        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            GridView view = gvMain;
            if (view.FocusedRowHandle > -1)
            {
               
                    int id_kh = Convert.ToInt32(view.GetFocusedRowCellValue("Id_KH"));
                    myFroms.frmAddInforCustomer frm = new myFroms.frmAddInforCustomer(id_kh,2);
                    frm.ShowDialog();
               
            }
        }
        public void loadDataBasic()
        {
            //loadKeyPress();
            bM_LISTPRODUCT_MENUTableAdapter.FillBy(dsSystem.BM_LISTPRODUCT_MENU, "KhachHang");// = Classes.Tools.laydata("api/purchasereceives/laydanhsachmenubywarehouseid/-1/-1/null/null/" + m_id);
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

        private void gvMain_CustomDrawRowIndicator(object sender, DevExpress.XtraGrid.Views.Grid.RowIndicatorCustomDrawEventArgs e)
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
        private void loadData(int year, int month)
        {
            bM_SELLPRODUCT_DETAILSTableAdapter.Fill(dsSystem.BM_SELLPRODUCT_DETAILS, year, month);
        }
    }
}
