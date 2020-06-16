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
    public partial class frmAddInforCustomer : DevExpress.XtraEditors.XtraForm
    {
        private int m_id = -1;
        public frmAddInforCustomer(int id)
        {
            InitializeComponent();
            m_id = id;
        }

        private void frmAddInforCustomer_Load(object sender, EventArgs e)
        {

            loadData();
        }

        private void btnClose_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }
        private void loadData()
        {
            if (m_id == -1)
            {
                bMThongTinKhachHangBindingSource.AddNew();
                bMThongTinKhachHangBindingSource.EndEdit();
                txtCodeCus.EditValue = createCode();
            }
            else
            {
                bM_ThongTinKhachHangTableAdapter.FillBy(dsSystem.BM_ThongTinKhachHang, m_id);
            }
        }
        private void saveData()
        {
            
            if (m_id == -1)
            {
                bMThongTinKhachHangBindingSource.EndEdit();
                dsSystem.BM_ThongTinKhachHang[0]["Thoi_gian"] = DateTime.Now;
                dsSystem.BM_ThongTinKhachHang[0]["Trang_thai"] = "Mới tạo";
                bM_ThongTinKhachHangTableAdapter.Update(dsSystem.BM_ThongTinKhachHang);
                dsSystem.BM_ThongTinKhachHang.AcceptChanges();
                this.Close();

            }
            else
            {
                bMThongTinKhachHangBindingSource.EndEdit();
                bM_ThongTinKhachHangTableAdapter.Update(dsSystem.BM_ThongTinKhachHang);
                dsSystem.BM_ThongTinKhachHang.AcceptChanges();
                this.Close();
            }
        }
        private void btnSave_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                if(XtraMessageBox.Show("Bạn có xác nhận lưu khách hàng vào hệ thống?","Thông báo",MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    saveData();
                }
              
            }
            catch (Exception)
            {

            }
        }
        String createCode()
        {
            String code = "";
            String codeDefault = "BX" + DateTime.Now.ToString("yy") + DateTime.Now.ToString("MM");
            int codeRun = Convert.ToInt32(bM_ThongTinKhachHangTableAdapter.ScalarQueryMaKH(codeDefault)) + 1;
            code = codeDefault + codeRun.ToString("000");
            return code;
        }
    }
}