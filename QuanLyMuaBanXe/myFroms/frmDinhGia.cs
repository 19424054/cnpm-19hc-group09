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
    public partial class frmDinhGia : DevExpress.XtraEditors.XtraForm
    {
        private int m_id;
        public frmDinhGia(int id)
        {
            InitializeComponent();
            m_id = id;
        }

        private void labelControl5_Click(object sender, EventArgs e)
        {

        }

        private void frmDinhGia_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsSystem.BM_ThongTinXeBan' table. You can move, or remove it, as needed.
         
            // TODO: This line of code loads data into the 'dsSystem.BM_DinhGia_Ban' table. You can move, or remove it, as needed.
            loadData();

        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            saveData();
        }
        private void loadData()
        {
            this.bM_ThongTinXeBanTableAdapter.Fill(this.dsSystem.BM_ThongTinXeBan);
            if (m_id == -1)
            {
                bMDinhGiaBanBindingSource.EndEdit();
                bMDinhGiaBanBindingSource.AddNew();

            }
            else
            {
                bM_DinhGia_BanTableAdapter.FillBy(dsSystem.BM_DinhGia_Ban, m_id);
            }
        }
        private void saveData()
        {
            if (dxValidationProvider1.Validate())
            {
                if (m_id == -1)
                {
                    bMDinhGiaBanBindingSource.EndEdit();
                    bM_DinhGia_BanTableAdapter.Update(dsSystem.BM_DinhGia_Ban);
                    dsSystem.BM_DinhGia_Ban.AcceptChanges();
                    int id_xeBan = Convert.ToInt32(dsSystem.BM_ThongTinXeBan[0]["Id_xe"]);
                    bM_ThongTinXeBanTableAdapter.UpdateQueryTrangThai("Đã định giá bán", id_xeBan);
                }
                else
                {
                    bMDinhGiaBanBindingSource.EndEdit();
                    bM_DinhGia_BanTableAdapter.Update(dsSystem.BM_DinhGia_Ban);
                    dsSystem.BM_DinhGia_Ban.AcceptChanges();
                }
            }
          
        }
        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void searchLookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {

        }
    }
}