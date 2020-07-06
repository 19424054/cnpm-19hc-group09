namespace QuanLyMuaBanXe.myFroms
{
    partial class frmBoPhanTiepNhan
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.ribbon = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.btnCustombuycar = new DevExpress.XtraBars.BarButtonItem();
            this.btnListCarBuy = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonPage1 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.tabMain = new DevExpress.XtraTab.XtraTabControl();
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tabMain)).BeginInit();
            this.SuspendLayout();
            // 
            // ribbon
            // 
            this.ribbon.ExpandCollapseItem.Id = 0;
            this.ribbon.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbon.ExpandCollapseItem,
            this.ribbon.SearchEditItem,
            this.btnCustombuycar,
            this.btnListCarBuy});
            this.ribbon.Location = new System.Drawing.Point(0, 0);
            this.ribbon.MaxItemId = 3;
            this.ribbon.Name = "ribbon";
            this.ribbon.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage1});
            this.ribbon.Size = new System.Drawing.Size(761, 158);
            this.ribbon.StatusBar = this.ribbonStatusBar;
            // 
            // btnCustombuycar
            // 
            this.btnCustombuycar.Caption = "Khách hàng bán xe";
            this.btnCustombuycar.Id = 1;
            this.btnCustombuycar.ImageOptions.Image = global::QuanLyMuaBanXe.Properties.Resources.Beetle;
            this.btnCustombuycar.ImageOptions.LargeImage = global::QuanLyMuaBanXe.Properties.Resources.Beetle;
            this.btnCustombuycar.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.btnCustombuycar.ItemAppearance.Normal.Options.UseFont = true;
            this.btnCustombuycar.Name = "btnCustombuycar";
            this.btnCustombuycar.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnCustombuycar_ItemClick);
            // 
            // btnListCarBuy
            // 
            this.btnListCarBuy.Caption = "Khách hàng mua xe";
            this.btnListCarBuy.Id = 2;
            this.btnListCarBuy.ImageOptions.Image = global::QuanLyMuaBanXe.Properties.Resources.User_Preppy_Red_icon;
            this.btnListCarBuy.ImageOptions.LargeImage = global::QuanLyMuaBanXe.Properties.Resources.User_Preppy_Red_icon;
            this.btnListCarBuy.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.btnListCarBuy.ItemAppearance.Normal.Options.UseFont = true;
            this.btnListCarBuy.Name = "btnListCarBuy";
            this.btnListCarBuy.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnListCarBuy_ItemClick);
            // 
            // ribbonPage1
            // 
            this.ribbonPage1.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup1});
            this.ribbonPage1.Name = "ribbonPage1";
            this.ribbonPage1.Text = "Tiếp nhận";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.ItemLinks.Add(this.btnCustombuycar);
            this.ribbonPageGroup1.ItemLinks.Add(this.btnListCarBuy);
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            this.ribbonPageGroup1.Text = "Danh sách tiếp nhận";
            // 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 425);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbon;
            this.ribbonStatusBar.Size = new System.Drawing.Size(761, 24);
            // 
            // tabMain
            // 
            this.tabMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabMain.Location = new System.Drawing.Point(0, 158);
            this.tabMain.Name = "tabMain";
            this.tabMain.Size = new System.Drawing.Size(761, 267);
            this.tabMain.TabIndex = 2;
            // 
            // frmBoPhanTiepNhan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(761, 449);
            this.Controls.Add(this.tabMain);
            this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.ribbon);
            this.IconOptions.Image = global::QuanLyMuaBanXe.Properties.Resources.shop_icon;
            this.Name = "frmBoPhanTiepNhan";
            this.Ribbon = this.ribbon;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.StatusBar = this.ribbonStatusBar;
            this.Text = "BỘ PHẬN TIẾP NHẬN";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tabMain)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbon;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage1;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
        private DevExpress.XtraBars.BarButtonItem btnCustombuycar;
        private DevExpress.XtraBars.BarButtonItem btnListCarBuy;
        private DevExpress.XtraTab.XtraTabControl tabMain;
    }
}