using DevExpress.XtraEditors;
using System;
using System.Drawing;
using System.Windows.Forms;

namespace QuanLyMuaBanXe.myFroms
{
    public partial class frmMain : DevExpress.XtraEditors.XtraForm
    {
        // private ME_UserAccount.MyDataSets.dsLibraryTableAdapters.ADMIN_MODULE_LISTTableAdapter taMO;
        // private bool _isLogoff;
        
        private int phan_quyen;
        public frmMain(int pd)
        {
            InitializeComponent();
            phan_quyen = pd;
            // taMO = new ME_UserAccount.MyDataSets.dsLibraryTableAdapters.ADMIN_MODULE_LISTTableAdapter();
        }
        void phanquyenhethong()
        {

        }
        private void UIButtonMain_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            try
            {
                string tag = Convert.ToString(e.Button.Properties.Tag);
                switch (tag)
                {
                    case "exit":
                        System.Windows.Forms.DialogResult exit = XtraMessageBox.Show("Bạn muốn thoát LEANERP?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (exit == System.Windows.Forms.DialogResult.Yes)
                            Application.Exit();
                        break;

                    case "logoff":
                        System.Windows.Forms.DialogResult logoff = XtraMessageBox.Show("Bạn muốn đăng xuất?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (logoff == System.Windows.Forms.DialogResult.Yes)
                        {
                            // _isLogoff = true;
                            Application.Restart();
                        }
                        break;

                    case "setting":
                        break;

                    case "permission":
                      
                        break;

                    case "mini":
                    
                        break;
                }
                LoadPermission();
                LoadModule();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void frmManHinhChinh_Load(object sender, EventArgs e)
        {
            try
            {
                phanquyenhethong();
                LoadPermission();
                LoadModule();
        
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void tileItemQuotation_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                this.Hide();
                
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void LoadPermission()
        {
            try
            {
                if (phan_quyen == 0)
                {
                    lblTen.Text = "QUẢN LÝ";
                }
                else if (phan_quyen==1)
                {
                    lblTen.Text = "KỸ THUẬT";
                    tileItemProduction.Enabled = false;
                    tileItemCRM.Enabled = false;
                    tileItemOffice.Enabled = false;
                }
                else if (phan_quyen == 2)
                {
                    lblTen.Text = "BÁN XE";
                    tileItemProduction.Enabled = false;
                    tileItemCRM.Enabled = false;
                    tileItemOMM.Enabled = false;
                }
                else if (phan_quyen == 3)
                {
                    lblTen.Text = "TIẾP NHẬN";
                    tileItemOMM.Enabled = false;
                    tileItemOffice.Enabled = false;
                    tileItemProduction.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void LoadModule()
        {
            try
            {
                //DataTable dt = taMO.GetPROC_ADMIN_MODULE_PERMISSION_BY_ACCOUNTID(ME_Utils.LoginInfo.AccountID);
                //foreach (DataRow dr in dt.Rows)
                //{
                //    foreach (TileGroup tg in tileControl.Groups)
                //    {
                //        TileItem ti = tg.GetTileItemByName(Convert.ToString(dr["ControlName"]));
                //        if (ti != null)
                //            ti.Enabled = true;
                //        //foreach (TileItem ti in tg.Items)
                //        //{
                //        //    ti.Enabled = true;
                //        //}
                //    }
                //}
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void tileItemTechPM_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //ftuvProject.RAD.frmRadSystem frm = new RAD.frmRadSystem();
                //Classes.Notifycation.JoinGroup("rad");
                //frm.Show();
                //ME_TechPM.MyForms.frmSamplePSManagement frm = new ME_TechPM.MyForms.frmSamplePSManagement();
                // frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            
        }

        private void tileItemOffice_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
               // this.Hide();
                myFroms.frmBoPhanBanXe frm = new myFroms.frmBoPhanBanXe();
                frm.Show();
                //ME_LeanERP.MyDataSets.dsUsersTableAdapters.NhanVienTableAdapter nhanVienTableAdapter = new MyDataSets.dsUsersTableAdapters.NhanVienTableAdapter();
                //ME_LeanERP.MyDataSets.dsUsers.NhanVienDataTable dt = new MyDataSets.dsUsers.NhanVienDataTable();
                //this.Hide();
                //Approval_Module.Basic.frmDangNhap frm = new Approval_Module.Basic.frmDangNhap();
                //frm.fileConfig = "ME_LeanERP.exe.config";
                //if (ME_Utils.LoginInfo.Email != null)
                //    nhanVienTableAdapter.FillByEmail(dt, ME_Utils.LoginInfo.Email);
                //else
                //    nhanVienTableAdapter.FillByTenDangNhap(dt, ME_Utils.LoginInfo.Account);
                //if (dt != null && dt.Rows.Count > 0)
                //{
                //    string username = dt.Rows[0]["TenDangNhap"] + "";
                //    string pass = dt.Rows[0]["MatKhau"] + "";
                //    frm.txtTaiKhoan.Text = username;
                //    frm.txtMatKhau.Text = Approval_Module.Util.Decryption(pass);
                //    frm.frmDangNhap_Load(frm, null);
                //    //frm.btnDangNhap.PerformClick();
                //    frm.simpleButton1_Click(frm, null);
                //    frm.frmDangNhap_FormClosed(frm, null);
                //    if (frm.DialogResult != System.Windows.Forms.DialogResult.Cancel)
                //    {
                //        Approval_Module.Util.m_close = 1;
                //        Approval_Module.Basic.frmNhanVien nv = new Approval_Module.Basic.frmNhanVien();
                //        nv.ShowDialog();
                //        //nv.Close();
                //    }
                //}
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void tileItemLibrary_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //this.Hide();
                //frmLibSystem frm = new frmLibSystem();
                //frm.Show();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            // this.Show();
        }

        private bool drag = false;
        private Point dragCursor, dragForm;

        private void pnlThongTinNhanVien_MouseMove(object sender, MouseEventArgs e)
        {
            int wid = SystemInformation.VirtualScreen.Width;
            int hei = SystemInformation.VirtualScreen.Height;
            if (drag)
            {
                // Phải using System.Drawing;
                Point change = Point.Subtract(Cursor.Position, new Size(dragCursor));
                Point newpos = Point.Add(dragForm, new Size(change));
                // QUyết định có cho form chui ra ngoài màn hình không
                if (newpos.X < 0) newpos.X = 0;
                if (newpos.Y < 0) newpos.Y = 0;
                if (newpos.X + this.Width > wid) newpos.X = wid - this.Width;
                if (newpos.Y + this.Height > hei) newpos.Y = hei - this.Height;
                this.Location = newpos;
            }
        }

        private void pnlThongTinNhanVien_MouseDown(object sender, MouseEventArgs e)
        {
            drag = true;
            dragCursor = Cursor.Position;
            dragForm = this.Location;
        }

        private void pnlThongTinNhanVien_MouseUp(object sender, MouseEventArgs e)
        {
            drag = false;
        }

        private void tileItemOMM_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
               // this.Hide();
                myFroms.frmBoPhanKyThuat frm = new myFroms.frmBoPhanKyThuat();
                frm.Show();
                //OMM.frmOmmSystem frm = new OMM.frmOmmSystem();
                //frm.Show();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
           
        }

        private void tileItemUsers_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
              //  this.Hide();
                myFroms.frmBoPhanTiepNhan frm = new myFroms.frmBoPhanTiepNhan();
                frm.Show();
                // System.Diagnostics.Process.Start("http://www.ishisei.vn");
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void tileItemHRM_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //this.Hide();
                //HRM.frmHrmSystem frm = new HRM.frmHrmSystem();
                //frm.Show();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void lblMaNhanVien_Click(object sender, EventArgs e)
        {
            try
            {
                this.Hide();
                //ME_UserAccount.MyUserControls.ucAccountInfo uc = new ME_UserAccount.MyUserControls.ucAccountInfo();
                // Form frm = ME_Utils.Tools.FormWithUCSize(uc, "Thông tin tài khoản");
                // frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void tileItemContract_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                this.Hide();
                //CONTRACT_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.HoTen = ME_Utils.LoginInfo.FullName;
                //CONTRACT_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.NhanVienId = ME_Utils.LoginInfo.AccountID;
                //CONTRACT_MANAGEMENT.frmContractManagement frm = new CONTRACT_MANAGEMENT.frmContractManagement();
                //frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void tileItemInventory_ItemClick(object sender, TileItemEventArgs e)
        {
        }

        private void tileItemPlanning_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //Classes.Notifycation.JoinGroup("planning");
                //PLANNING.frmPlanningSystem frm = new PLANNING.frmPlanningSystem();
                //frm.Show();
                //this.Hide();
                //ME_Utils.LoginInfo.IsFac = true;
                //ProductionScheduleDLL.MyForms1.frmMain frm = new ProductionScheduleDLL.MyForms1.frmMain();
                //frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private static void SetERPUser()
        {
            //MyDataSets.dsUsersTableAdapters.HRM_EMPLOYERTableAdapter ta = new MyDataSets.dsUsersTableAdapters.HRM_EMPLOYERTableAdapter();
            //DataTable dt = ta.GetDataBy(ME_Utils.LoginInfo.Account);
            //if (dt.Rows.Count > 0)
            //{
            //}
            //else
            //{
            //    XtraMessageBox.Show("Tài khoản không tồn tại.");
            //}
        }

        private void tileItemProduction_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                this.Hide();
                SetERPUser();
                //frm3.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void textEdit1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyData == Keys.Enter)
            {
                //frmTimKiemNhanh frm = new frmTimKiemNhanh();
                //frm.textEdit1.Text = textEdit1.Text;
                //frm.simpleButton1_Click(null, null);
                //frm.ShowDialog();
            }
        }

        private void tileItemPurchasing_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                try
                {
                   // this.Hide();
                    //PurchasingModule.frmMain frm = new PurchasingModule.frmMain();
                    //PurchasingModule.Utils.EID = ME_Utils.LoginInfo.EID;
                    //PurchasingModule.Utils.Account = ME_Utils.LoginInfo.Account;
                    //PurchasingModule.Utils.Email = ME_Utils.LoginInfo.Email;
                    //PurchasingModule.Utils.HoTen = ME_Utils.LoginInfo.FullName;
                    //PurchasingModule.Utils.PhongBanId = ME_Utils.LoginInfo.DepID;
                    //frm.ShowDialog();
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }
             //   this.Show();

                // Inventory.
                // inve
                //PurchasingModule.Utils.EID = ME_Utils.LoginInfo.EID;
                //PurchasingModule.Utils.Account = ME_Utils.LoginInfo.Account;
                //PurchasingModule.Utils.Email = ME_Utils.LoginInfo.Email;
                //PurchasingModule.Utils.HoTen = ME_Utils.LoginInfo.FirstName;
                //PurchasingModule.Utils.PhongBanId = ME_Utils.LoginInfo.DepID;
                //PurchasingModule.frmMain frm = new PurchasingModule.frmMain();
                //frm.ShowDialog();
                //ME_Purchasing.MyForms.frmPurchasing frm = new ME_Purchasing.MyForms.frmPurchasing();
                //frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void tileItemQuality_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //this.Hide();
                //QMDLL.My_Forms.frmMain frm = new QMDLL.My_Forms.frmMain();
                //frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void tileItemProduction_ItemClick_1(object sender, TileItemEventArgs e)
        {
            try
            {
               // this.Hide();
                myFroms.frmManagementMain frm = new myFroms.frmManagementMain();
                frm.Show();

                //ME_Utils.LoginInfo.IsFac = true;
                ////PLANNING.FORMS.frmSapMayNhuom frm = new PLANNING.FORMS.frmSapMayNhuom();
                ////frm.ShowDialog();
                ////E_KanBan.MyForm1.frmKanbanDistribution frm = new E_KanBan.MyForm1.frmKanbanDistribution();
                ////frm.ShowDialog();
                //E_KanBanv1.frmMainv1 frm = new E_KanBanv1.frmMainv1(ME_Utils.LoginInfo.EID, ME_Utils.LoginInfo.FullName);
                //frm.ShowDialog();
                //PRODUCTION.frmProductionSystem frm = new PRODUCTION.frmProductionSystem();
                //frm.Show();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void tileItemOutsourcing_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //this.Hide();
                //ME_OUTSOURCING.MyForms.frmMain frm = new ME_OUTSOURCING.MyForms.frmMain();
                //frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void tile_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //WAREHOUSE.Forms.frmWareHouseLayout frm = new WAREHOUSE.Forms.frmWareHouseLayout();
                //frm.Show();
                //XtraForm frm = null;
                //string tag = Convert.ToString(e.Item.Tag);
                //switch (tag)
                //{
                //    //bbtnDepartment
                //    case "hrm":
                //        frm = new ME_HRM.MyForms.frmHRM();
                //        break;
                //    case "inventory":
                //        //frm = new ME_Inventory.MyForms.frmInventory();
                //        Inventory.Utils.EID = ME_Utils.LoginInfo.EID;
                //        Inventory.Utils.Account = ME_Utils.LoginInfo.Account;
                //        Inventory.Utils.Email = ME_Utils.LoginInfo.Email;
                //        Inventory.Utils.HoTen = ME_Utils.LoginInfo.FirstName;
                //        Inventory.Utils.PhongBanId = ME_Utils.LoginInfo.DepID;

                //        frm = new Inventory.frmInventory();
                //        break;
                //    default: break;
                //}
                //if (frm != null)
                //{
                //    ME_Utils.LoginInfo.ModuleTAG = tag;
                //    this.Hide();
                //    frm.ShowDialog();
                //}
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void tileItemBSC_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                //this.Hide();
                //MyForms.frmMainBSC frm = new frmMainBSC();
                //frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
            this.Show();
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            //if (!_isLogoff) Application.Exit();
        }

        private void tileItemTPM_ItemClick(object sender, TileItemEventArgs e)
        {
            //try
            //{
            //    DataTable dtTPM = ME_Utils.DAO.csLibrary.GetTPMLoginByEID(ME_Utils.LoginInfo.EID);
            //    if (dtTPM.Rows.Count > 0)
            //    {
            //        DataRow drTPM = dtTPM.Rows[0];
            //        ME_Utils.LoginInfoTPM.EID = Convert.IsDBNull(drTPM["EID"]) ? -1 : Convert.ToInt64(drTPM["EID"]);
            //        ME_Utils.LoginInfoTPM.Email = Convert.ToString(drTPM["Email"]);
            //        ME_Utils.LoginInfoTPM.EmployeeNo = Convert.ToString(drTPM["EmployeeNo"]);
            //        ME_Utils.LoginInfoTPM.FullName = Convert.ToString(drTPM["FullName"]);
            //        ME_Utils.LoginInfoTPM.FirstName = Convert.ToString(drTPM["FirstName"]);
            //        ME_Utils.LoginInfoTPM.LastName = Convert.ToString(drTPM["LastName"]);
            //        ME_Utils.LoginInfoTPM.ComID = Convert.IsDBNull(drTPM["CompanyID"]) ? -1 : Classes.Tools.toInt(drTPM["CompanyID"]);
            //        ME_Utils.LoginInfoTPM.IsFac = Convert.ToBoolean(drTPM["IsFac"]);
            //        ME_Utils.LoginInfoTPM.FacID = Convert.IsDBNull(drTPM["FactoryId"]) ? -1 : Classes.Tools.toInt(drTPM["FactoryId"]);
            //        ME_Utils.LoginInfoTPM.DepID = Convert.IsDBNull(drTPM["DepartmentID"]) ? -1 : Classes.Tools.toInt(drTPM["DepartmentID"]);
            //        //CompanyID
            //        ME_Utils.LoginInfoTPM.IsAdmin = Convert.IsDBNull(drTPM["IsAdmin"]) ? false : Convert.ToBoolean(drTPM["IsAdmin"]);
            //        ME_Utils.LoginInfoTPM.ServerIP = "192.168.1.222";

            //        LeanTPMProject.frmMain frm = new LeanTPMProject.frmMain();
            //        this.Hide();
            //        frm.ShowDialog();
            //    }
            //    else
            //    {
            //        ME_Utils.Tools.messageboxError("Không thể đăng nhập!");
            //    }
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message);
            //}

            //this.Show();
        }

        private void tileItemLogistic_ItemClick(object sender, TileItemEventArgs e)
        {
            try
            {
                // SetLogicsticUser();
                //LOGISTIC_MANAGEMENT.frmLogisticManagement frm = new LOGISTIC_MANAGEMENT.frmLogisticManagement();
                // frm.ShowDialog();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void SetLogicsticUser()
        {
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.TKID = ME_Utils.LoginInfo.AccountID;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.NhanVienId = ME_Utils.LoginInfo.EID;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.Email = ME_Utils.LoginInfo.Email;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.HoTen = ME_Utils.LoginInfo.FullName;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.Ten = ME_Utils.LoginInfo.FirstName;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.HoLot = ME_Utils.LoginInfo.LastName;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.LaQuanTriVien = ME_Utils.LoginInfo.IsAdmin;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.MaNhanVien = ME_Utils.LoginInfo.EmployeeNo;
            //LOGISTIC_MANAGEMENT.CLASSES.User.TaiKhoanDangNhap.TaiKhoan = ME_Utils.LoginInfo.Account;
        }

        private void tileItemRD_ItemClick(object sender, TileItemEventArgs e)
        {
            //RAD.frmRadSystem frm = new RAD.frmRadSystem();
            //Classes.Notifycation.JoinGroup("rad");
            //frm.Show();
        }

        private void lblTen_Click(object sender, EventArgs e)
        {
            //ME_Utils.Utils.SendHTMLMail("test", "test", "it.lethanhdat@gmail.com", null,null);
        }
    }
}