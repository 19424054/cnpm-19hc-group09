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
    public partial class frmXacNhanMuaXe : DevExpress.XtraEditors.XtraForm
    {
        int m_id = -1;
        public frmXacNhanMuaXe(int id)
        {
            InitializeComponent();
            m_id = id;
        }

        private void barLargeButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void barLargeButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (dxValidationProvider1.Validate())
            {
                if(Convert.ToDouble(textEdit4.EditValue)>= Convert.ToDouble(textEdit2.EditValue) && Convert.ToDouble(textEdit4.EditValue) <= Convert.ToDouble(textEdit3.EditValue))
                {
                    bM_XACNHANMUAXE_DETAILSTableAdapter.UpdateQuery(Convert.ToDouble(textEdit4.EditValue), "Đã mua", m_id);
                    XtraMessageBox.Show("Cập nhật thành công");
                    this.Close();
                }
                else
                {
                    XtraMessageBox.Show("Giá nhập lớn hơn giá cao nhất hoặc nhỏ hơn giá thấp nhất. Vui lòng kiểm tra lại", "Thông báo");
                }
            }
        }
        private void loadData()
        {
            if (m_id != -1)
            {
                bM_XACNHANMUAXE_DETAILSTableAdapter.Fill(dsSystem.BM_XACNHANMUAXE_DETAILS, m_id);
            }
        }

        private void frmXacNhanMuaXe_Load(object sender, EventArgs e)
        {
            loadData();
        }
    }
}