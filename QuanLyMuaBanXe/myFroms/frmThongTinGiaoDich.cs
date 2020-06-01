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
            this.bM_ThongTinXeBanTableAdapter.Fill(this.dsSystem.BM_ThongTinXeBan);
            // TODO: This line of code loads data into the 'dsSystem.BM_ThongTinKhachHang' table. You can move, or remove it, as needed.
            this.bM_ThongTinKhachHangTableAdapter.Fill(this.dsSystem.BM_ThongTinKhachHang);
            loadData();

        }
        private void loadData()
        {
            if (m_id == -1)
            {

            }
            else { 
                    }
        }
        private void saveData()
        {
            if (m_id == -1)
            {

            }
            else
            {
            }
        }
    }
}