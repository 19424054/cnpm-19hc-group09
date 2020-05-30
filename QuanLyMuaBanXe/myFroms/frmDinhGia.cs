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
        public frmDinhGia()
        {
            InitializeComponent();
        }

        private void labelControl5_Click(object sender, EventArgs e)
        {

        }

        private void frmDinhGia_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsSystem.BM_DinhGia_Ban' table. You can move, or remove it, as needed.
            this.bM_DinhGia_BanTableAdapter.Fill(this.dsSystem.BM_DinhGia_Ban);

        }
    }
}