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
    public partial class frmKiemTraTinhTrangXeBan : DevExpress.XtraEditors.XtraForm
    {
        private int m_id = -1;
        private int id_xe;
        public frmKiemTraTinhTrangXeBan(int id, int xe)
        {
            InitializeComponent();
            m_id = id;
            id_xe = xe;
        }

        private void labelControl5_Click(object sender, EventArgs e)
        {

        }

        private void frmKiemTraTinhTrangXeBan_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsSystem.BM_ThongTinXeBan' table. You can move, or remove it, as needed.
            // TODO: This line of code loads data into the 'dsSystem.BM_DinhGia_MuaXe' table. You can move, or remove it, as needed.
            loadData();

        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            saveData();
            this.Close();
        }
        private void loadData()
        {
            this.bM_ThongTinXeBanTableAdapter.Fill(this.dsSystem.BM_ThongTinXeBan);
            if (m_id == -1)
            {

                bMDinhGiaMuaXeBindingSource.EndEdit();
                bMDinhGiaMuaXeBindingSource.AddNew();
                slkFind.EditValue = id_xe;
                foreach (DataRow dr in dsSystem.BM_ThongTinXeBan.Rows)
                {
                    if(id_xe==Convert.ToInt32(dr["Id_xe"]))
                    textEdit3.EditValue = dr["Loai_xe"];
                }
            }
            else
            {
                bM_DinhGia_MuaXeTableAdapter.FillBy(dsSystem.BM_DinhGia_MuaXe, m_id);
                if(dsSystem.BM_DinhGia_MuaXe.Rows.Count>0)
                {
                    textEdit3.EditValue = dsSystem.BM_DinhGia_MuaXe.Rows[0]["Loai_xe"];
                }
            }
        }
        private void saveData()
        {
            if (m_id == -1)
            {
                bMDinhGiaMuaXeBindingSource.EndEdit();
                bM_DinhGia_MuaXeTableAdapter.Update(dsSystem.BM_DinhGia_MuaXe);
                dsSystem.BM_DinhGia_MuaXe.AcceptChanges();

                bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã định giá mua", id_xe);
             
            }
            else
            {
                bMDinhGiaMuaXeBindingSource.EndEdit();
                bM_DinhGia_MuaXeTableAdapter.Update(dsSystem.BM_DinhGia_MuaXe);
                dsSystem.BM_DinhGia_MuaXe.AcceptChanges();
            }
            bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã kiểm tra", Convert.ToInt32(dsSystem.BM_DinhGia_MuaXe.Rows[0]["Id_xe"]));
        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void slkFind_EditValueChanged(object sender, EventArgs e)
        {
           // if(!Convert.IsDBNull(slkFind.EditValue))
            //textEdit3.EditValue = this.slkFind.Properties.View.GetFocusedRowCellValue("Loai_xe").ToString() != null ? this.slkFind.Properties.View.GetFocusedRowCellValue("Loai_xe").ToString() : "";
        }
    }
}