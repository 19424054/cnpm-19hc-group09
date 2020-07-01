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
    public partial class frmAddInfor : DevExpress.XtraEditors.XtraForm
    {
        int id_xe = -1;
        public frmAddInfor(int id)
        {
            InitializeComponent();
            id_xe = id;
        }

        private void frmAddInfor_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsSystem.BM_ThongTinXeBan' table. You can move, or remove it, as needed.
            //this.bM_ThongTinXeBanTableAdapter.Fill(this.dsSystem.BM_ThongTinXeBan);
            loadData();
        }

        private void btnSave_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(dxValidationProvider1.Validate())
            {
                if (cbbLoaiXe.SelectedIndex == 0)
                {
                    if (dxValidationProvider2.Validate())
                    {
                        saveData();
                    }

                }
                else
                {
                    saveData();
                }
            }
            
        }
        private void saveData()
        {
            if(XtraMessageBox.Show("Bạn có xác nhận cập nhật vào hệ thống?","Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Question)==DialogResult.Yes)
            {
                if (id_xe == -1)
                {
                    bMThongTinXeBanBindingSource.EndEdit();
                    dsSystem.BM_ThongTinXeBan[0]["Ngay_tao"] = DateTime.Now;
                    dsSystem.BM_ThongTinXeBan[0]["Trang_thai"] = "Mới tạo";
                    dsSystem.BM_ThongTinXeBan[0]["Gia_ban"] = 0;
                    bM_ThongTinXeBanTableAdapter.Update(dsSystem.BM_ThongTinXeBan);
                    dsSystem.BM_ThongTinXeBan.AcceptChanges();
                }
                else
                {
                    bMThongTinXeBanBindingSource.EndEdit();
                    bM_ThongTinXeBanTableAdapter.Update(dsSystem.BM_ThongTinXeBan);
                    dsSystem.BM_ThongTinXeBan.AcceptChanges();
                }
                this.Close();
            }
        }
        private void loadData()
        {
            if (id_xe == -1)
            {
                bMThongTinXeBanBindingSource.AddNew();
                bMThongTinXeBanBindingSource.EndEdit();
                textEdit1.EditValue = createCode();
                cbbLoaiXe.EditValue = "Xe máy";
            }
            else
            {
                cbbLoaiXe.ReadOnly = true;
                bM_ThongTinXeBanTableAdapter.FillBy(dsSystem.BM_ThongTinXeBan, id_xe);
            }
        }
        private void btnClose_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void cbbLoaiXe_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbLoaiXe.SelectedIndex == 1)
            {
                textEdit2.ReadOnly = true;
            }
            else
            {
                textEdit2.ReadOnly = false;
            }
        }
        String createCode()
        {
            String code = "";
                String codeDefault = "BX" + DateTime.Now.ToString("yy") + DateTime.Now.ToString("MM");
            int codeRun = Convert.ToInt32(bM_ThongTinXeBanTableAdapter.ScalarQueryGetMaxCode(codeDefault))+1;
            code = codeDefault + codeRun.ToString("000");
            return code;
        }
    }
}