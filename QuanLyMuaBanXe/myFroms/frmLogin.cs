using DevExpress.XtraEditors;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace QuanLyMuaBanXe.myFroms
{
    public partial class frmLogin : DevExpress.XtraEditors.XtraForm
    {
        private QuanLyMuaBanXe.Properties.Settings setting;
        private string _idusername = "";

        public frmLogin()
        {
            setting = new Properties.Settings();
            InitializeComponent();
        }

        private string m_User = "";
        private string m_Password = "";
        private string m_idcompany = "-1";

        private void checkLogin(string _username, string _password)
        {
            //try
            //{
            //    Classes.Tools.showWating("Đang kiểm tra thông tin đăng nhập ...");
            //    var result = Classes.Tools.Api.call("api/resusers/dangnhap/" + _username + "/" + _password + "/" + m_idcompany, "get", "", false, false, false);
            //    if (result.IsSuccessStatusCode)
            //    {
            //        Classes.LoginInfo.user_name = _username;
            //        Classes.LoginInfo.password = _password;
            //        Classes.Tools.setWating("Nạp dữ liệu đăng nhập ...");
            //        Classes.Json json = new Classes.Json(result.Content.ReadAsStringAsync().Result);
            //        DataTable dt = json.toDataTable();
            //        if (dt.Rows.Count > 0)
            //        {
            //            _idusername = dt.Rows[0]["user_id"].ToString();
            //            Classes.LoginInfo.access_token = dt.Rows[0]["access_token"].ToString();
            //            Classes.LoginInfo.expiry_token = Convert.ToDateTime(dt.Rows[0]["expiry_token"]);
            //            Classes.LoginInfo.user_id = Convert.ToString(dt.Rows[0]["user_id"]);
            //            Classes.LoginInfo.employee_id = Convert.ToString(dt.Rows[0]["employee_id"]);
            //            Classes.LoginInfo.employee_name = Convert.ToString(dt.Rows[0]["employee_name"]);
            //            Classes.LoginInfo.employee_code = Convert.ToString(dt.Rows[0]["employee_code"]);
            //            Classes.LoginInfo.company_id = Convert.ToString(dt.Rows[0]["company_id"]);
            //            Classes.LoginInfo.currency_id = Convert.ToString(dt.Rows[0]["currency_id"]);
            //            Classes.LoginInfo.currency_name = Convert.ToString(dt.Rows[0]["currency_name"]);
            //            Classes.LoginInfo.avatar = Convert.ToString(dt.Rows[0]["avatar"]);
            //            Classes.LoginInfo.mobileCompany = Convert.ToString(dt.Rows[0]["mobileCompany"]);
            //            Classes.LoginInfo.faxCompany = Convert.ToString(dt.Rows[0]["faxCompany"]);
            //            Classes.LoginInfo.taxCompany = Convert.ToString(dt.Rows[0]["taxCompany"]);
            //            Classes.LoginInfo.isAdmin =Classes.Tools.toBool(dt.Rows[0]["is_admin"]);
            //            Classes.ProjectConfig.isEncrypt = Classes.Tools.toBool(dt.Rows[0]["isEncrypt"]);
            //            if (!string.IsNullOrEmpty(Classes.LoginInfo.avatar))
            //            {
            //                Stream stream = Classes.Tools.download(Classes.LoginInfo.avatar);
            //                if (stream != null)
            //                {
            //                    Classes.LoginInfo.imgAvatar = Image.FromStream(stream);
            //                }
            //            }
            //            string logoCompany = Convert.ToString(Convert.ToString(dt.Rows[0]["logoCompany"]));
            //            if (!string.IsNullOrEmpty(logoCompany))
            //            {
            //                Stream stream = Classes.Tools.download(logoCompany);
            //                if (stream != null)
            //                {
            //                    Classes.LoginInfo.logoCompany = Image.FromStream(stream);
            //                }
            //            }
            //        }
            //        Classes.ControlPermission.loadPermissionModule();
            //        Classes.Notifycation.ConnectAsync();

            //        //getUserInformation(_idusername);
            //        this.Hide();
            //        frmMain frm = new frmMain();
            //        Classes.Tools.closeWating();
            //        frm.Show();
            //    }
            //    else if (result.StatusCode == System.Net.HttpStatusCode.BadRequest)
            //    {
            //        Classes.clsBasic.RequestError(result);

            //        txtPassword.ResetText();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Classes.Tools.MesErr(ex.Message);
            //}
            //finally
            //{
            //    Classes.Tools.closeWating();
            //}
           
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            this.SaveLogin();

            loginSystem();
        }

        private void txtUser_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyData == Keys.Enter)
            {
                txtPassword.Focus();
            }
        }

        private void txtPassword_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyData == Keys.Enter)
            {
                this.SaveLogin();
                loginSystem();
            }
        }

        private void loginSystem()
        {
            if (dxValidationProvider1.Validate())
            {
                checkLogin(Convert.ToString(txtUser.EditValue), Convert.ToString(txtPassword.EditValue));
            }
            else
            {
                XtraMessageBox.Show("Vui lòng nhập tài khoản hoặc mật khẩu.");
            }
        }

        private void btnExsit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnForgorPassword_Click(object sender, EventArgs e)
        {
            try
            {
              //  frmForgotPassword frm = new frmForgotPassword();
              //  frm.Show();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show("Lỗi đăng nhập. Vui lòng thử lại.", "Thông báo", MessageBoxButtons.OK);
            }
        }

        private void saveUsername()
        {
            try
            {
                string[] str = setting.Login.Split(',');
                if (str.Length > 0)
                {
                    if (str[0] == "Yes")
                    {
                        this.chkRemember.Checked = true;
                        this.txtUser.Text = str[1];
                        //  this.txtPassword.Text = str[2].Trim();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void SaveLogin()
        {
            //Ghi nhớ mật khẩu
            string strValue = this.chkRemember.Checked == true ? "Yes" : "No";
            strValue += string.Format(",{0}", this.txtUser.Text.Trim());//, this.txtPassword.Text.Trim());
            this.setting.Login = strValue;
            this.setting.Save();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
         
            this.saveUsername();
        }

        private void getUserInformation(string _iduser)
        {
            //var result = Classes.Tools.Api.call("api/resusers/laychitiet/" + _iduser, "get", "", false, false);
            //if (result.IsSuccessStatusCode)
            //{
            //    Classes.Json json = new Classes.Json(result.Content.ReadAsStringAsync().Result);
            //    DataTable dt = json.toDataTable();
            //    if (dt.Rows.Count > 0)
            //    {
            //        Classes.LoginInfo.company_id = dt.Rows[0]["companyId"].ToString();
            //        Classes.LoginInfo.user_id = dt.Rows[0]["id"].ToString();
            //        Classes.LoginInfo.password = txtPassword.Text;
            //        Classes.LoginInfo.user_name = txtUser.Text;
            //    }
            //}
            //else if (result.StatusCode == System.Net.HttpStatusCode.BadRequest)
            //{
            //    Classes.clsBasic.RequestError(result);

            //    txtPassword.ResetText();
            //}
        }

        private void pickCompany_MouseClick(object sender, MouseEventArgs e)
        {
            
        }

        private void pickCompany_DoubleClick(object sender, EventArgs e)
        {
           // ftuvProject.frmConfigUpdateSoftware frm = new frmConfigUpdateSoftware();
          //  frm.Show();
        }
        private String decodeMD5(String password)
        {
          
                byte[] keyArray;
                var toEncryptArray = UTF8Encoding.UTF8.GetBytes(password);
                var hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes("***Lean-ERP----Approval-Module+TeamPro*** + 3/9/2013"));
                var tdes = new TripleDESCryptoServiceProvider();
                tdes.Key = keyArray;
                tdes.Mode = CipherMode.ECB;
                tdes.Padding = PaddingMode.PKCS7;

                var cTransform = tdes.CreateEncryptor();
                var resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

                return Convert.ToBase64String(resultArray, 0, resultArray.Length);
            
           
        }
    }
}