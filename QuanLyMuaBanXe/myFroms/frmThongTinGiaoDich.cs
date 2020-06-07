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

namespace QuanLyMuaBanXe.myFroms
{
    public partial class frmThongTinGiaoDich : DevExpress.XtraEditors.XtraForm
    {
        private int m_id = -1;
        private int mIdXe = -1;
        private int mIdXeKH = -1;
        public frmThongTinGiaoDich(int id)
        {
            InitializeComponent();
            m_id = id;
        }

        private void labelControl9_Click(object sender, EventArgs e)
        {

        }

        private void frmThongTinGiaoDich_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsSystem.BM_ThongTinXeBan' table. You can move, or remove it, as needed.
           
            loadData();

        }
        private void loadData()
        {
            this.bM_ThongTinXeBanTableAdapter.Fill(this.dsSystem.BM_ThongTinXeBan);
            this.bM_ThongTinKhachHangTableAdapter.Fill(this.dsSystem.BM_ThongTinKhachHang);
            if (m_id == -1)
            {
                bMGiaoDichBindingSource.EndEdit();
                bMGiaoDichBindingSource.AddNew();
            }
            else { 

                    }
        }
        private void saveData()
        {
            if(dxValidationProvider1.Validate())
            {
                bMGiaoDichBindingSource.EndEdit();
                bM_GiaoDichTableAdapter.Update(dsSystem.BM_GiaoDich);
                dsSystem.BM_GiaoDich.AcceptChanges();
                mIdXe = Convert.ToInt32(searchLookUpEdit2.EditValue);
                mIdXeKH= Convert.ToInt32(searchLookUpEdit1.EditValue);
                bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã bán", mIdXe);
            }
            else
            {
                XtraMessageBox.Show("Bạn chưa nhập đầy đủ thông tin");
            }
           
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                if(MessageBox.Show( "Bạn có xác nhận lưu giao dịch vào hệ thống?","Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question)==DialogResult.Yes)
                {
                    saveData();
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void searchLookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            //object b = searchLookUpEdit1.EditValue;
           
                textEdit4.EditValue= this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Ho_ten").ToString()!=null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Ho_ten").ToString(): "";
                memoEdit1.EditValue = this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Dia_chi").ToString() != null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Dia_chi").ToString() : "";
                textEdit1.EditValue = this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("SDT").ToString() != null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("SDT").ToString() : "";
        }

        private void searchLookUpEdit2_EditValueChanged(object sender, EventArgs e)
        {
            textEdit2.EditValue = this.searchLookUpEdit2.Properties.View.GetFocusedRowCellValue("Loai_xe").ToString() != null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Loai_xe").ToString() : "";
        }
    }
}