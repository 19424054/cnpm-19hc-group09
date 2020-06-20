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
        private int m_idKD = -1;
        private int m_edit = -1;
        private int m_check = -1;
        
        public frmThongTinGiaoDich(int id, int khKH)
        {
            InitializeComponent();
            m_id = id;
            m_idKD = khKH;
        }
        public frmThongTinGiaoDich(int id, int khKH, int edit)
        {
            InitializeComponent();
            m_id = id;
            m_idKD = khKH;
            m_edit = edit;
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
           

            this.bM_ThongTinKhachHangTableAdapter.Fill(this.dsSystem.BM_ThongTinKhachHang);
            if (m_id == -1)
            {
                loadDataxe();
                bMGiaoDichBindingSource.EndEdit();
                bMGiaoDichBindingSource.AddNew();
                cbbHinhThuc.SelectedIndex = 0;
                searchLookUpEdit1.EditValue = m_idKD;

                foreach(DataRow dr in this.dsSystem.BM_ThongTinKhachHang.Rows)
                {
                    if(m_idKD==Convert.ToInt32(dr["Id_KH"]))
                    {
                       // m_check = Convert.ToInt32(dr["Id_xe"]);
                        textEdit4.EditValue = dr["Ho_ten"].ToString() != null ? dr["Ho_ten"].ToString() : "";
                        memoEdit1.EditValue = dr["Dia_chi"].ToString() != null ? dr["Dia_chi"].ToString() : "";
                        textEdit1.EditValue = dr["SDT"].ToString() != null ? dr["SDT"].ToString() : "";
                    }
                }
            }
            else
            {
                
                bM_GiaoDichTableAdapter.FillBy(dsSystem.BM_GiaoDich, m_id);
                m_check = Convert.ToInt32(dsSystem.BM_GiaoDich.Rows[0]["Id_xe"]);
                loadDataxe();
               
             }
        }
        private void loadDataxe()
        {
            this.bM_ThongTinXeBanTableAdapter.FillByDadinhGia(this.dsSystem.BM_ThongTinXeBan);
            if (m_id != -1)
            {
                for (int i = this.dsSystem.BM_ThongTinXeBan.Rows.Count-1; i >= 0; i--)
                {
                    if (m_check!=Convert.ToInt32(this.dsSystem.BM_ThongTinXeBan.Rows[i]["Id_xe"]))
                    {
                        if (Convert.ToString(this.dsSystem.BM_ThongTinXeBan.Rows[i]["Trang_Thai"]) != "Đã định giá bán")
                            this.dsSystem.BM_ThongTinXeBan.Rows.Remove(this.dsSystem.BM_ThongTinXeBan.Rows[i]);
                    }
                  
                }
            }
            else
            {
                for(int i= this.dsSystem.BM_ThongTinXeBan.Rows.Count-1;i>=0;i--)
                {
                    if (Convert.ToString(this.dsSystem.BM_ThongTinXeBan.Rows[i]["Trang_Thai"]) != "Đã định giá bán")
                        this.dsSystem.BM_ThongTinXeBan.Rows.Remove(this.dsSystem.BM_ThongTinXeBan.Rows[i]);
                }
               
            }
        }
        private void saveData()
        {

            if (dxValidationProvider1.Validate())
            {
                if(m_id==-1)
                {
                    if (MessageBox.Show("Bạn có xác nhận lưu giao dịch vào hệ thống?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        bMGiaoDichBindingSource.EndEdit();
                        dsSystem.BM_GiaoDich.Rows[0]["Thoi_gian"] = DateTime.Now;
                        bM_GiaoDichTableAdapter.Update(dsSystem.BM_GiaoDich);
                        dsSystem.BM_GiaoDich.AcceptChanges();
                        mIdXe = Convert.ToInt32(searchLookUpEdit2.EditValue);
                        mIdXeKH = Convert.ToInt32(searchLookUpEdit1.EditValue);
                        bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã giao dịch", mIdXe);
                        bM_ThongTinKhachHangTableAdapter.UpdateQuery("Đã mua", mIdXeKH);
                        this.Close();
                    }
                }
                else
                {
                    if(m_check!= mIdXe)
                    {
                        if (MessageBox.Show("Bạn có xác nhận thay đổi xe giao dịch cho khách hàng vào hệ thống?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            bMGiaoDichBindingSource.EndEdit();
                            bM_GiaoDichTableAdapter.Update(dsSystem.BM_GiaoDich);
                            dsSystem.BM_GiaoDich.AcceptChanges();
                            mIdXe = Convert.ToInt32(searchLookUpEdit2.EditValue);
                            mIdXeKH = Convert.ToInt32(searchLookUpEdit1.EditValue);
                            bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã giao dịch", mIdXe);
                            bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã định giá bán", m_check);
                            bM_ThongTinKhachHangTableAdapter.UpdateQuery("Đã mua", mIdXeKH);
                            this.Close();
                        }
                    }
                    else
                    {
                        if (MessageBox.Show("Bạn có xác nhận cập nhật giao dịch vào hệ thống?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            bMGiaoDichBindingSource.EndEdit();
                            bM_GiaoDichTableAdapter.Update(dsSystem.BM_GiaoDich);
                            dsSystem.BM_GiaoDich.AcceptChanges();
                            this.Close();
                        }
                    }
                }
               
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
               
                    saveData();
               
            }
            catch (Exception ex)
            {

            }
        }

        private void searchLookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            //object b = searchLookUpEdit1.EditValue;
           
             //   textEdit4.EditValue= this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Ho_ten").ToString()!=null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Ho_ten").ToString(): "";
              //  memoEdit1.EditValue = this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Dia_chi").ToString() != null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Dia_chi").ToString() : "";
              //  textEdit1.EditValue = this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("SDT").ToString() != null ? this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("SDT").ToString() : "";
        }

        private void searchLookUpEdit2_EditValueChanged(object sender, EventArgs e)
        {
           
                if (!Convert.IsDBNull(searchLookUpEdit2.EditValue))
                {
                    //object c = this.searchLookUpEdit2.Properties.View.GetFocusedRowCellValue("Loai_xe");
                    textEdit2.EditValue = this.searchLookUpEdit2.Properties.View.GetFocusedRowCellValue("Loai_xe"); // Convert.ToString(this.searchLookUpEdit2.Properties.View.GetFocusedRowCellValue("Loai_xe")) != null ? Convert.ToString(this.searchLookUpEdit1.Properties.View.GetFocusedRowCellValue("Loai_xe").ToString()) : "";
                    textEdit5.EditValue = this.searchLookUpEdit2.Properties.View.GetFocusedRowCellValue("Dinh_gia");
                }

            

        }

        private void labelControl7_Click(object sender, EventArgs e)
        {

        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }
    }
}