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
    public partial class frmThongTinSuaChua : DevExpress.XtraEditors.XtraForm
    {
        public frmThongTinSuaChua()
        {
            InitializeComponent();
        }

        private void frmThongTinSuaChua_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsSystem.BM_ThongTin_SuaChua' table. You can move, or remove it, as needed.
            this.bM_ThongTin_SuaChuaTableAdapter.Fill(this.dsSystem.BM_ThongTin_SuaChua);

        }
    }
}