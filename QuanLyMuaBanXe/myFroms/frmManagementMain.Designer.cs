namespace QuanLyMuaBanXe.myFroms
{
    partial class frmManagementMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmManagementMain));
            this.ribbon = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.btnStatusBuy = new DevExpress.XtraBars.BarButtonItem();
            this.btnPlanRepair = new DevExpress.XtraBars.BarButtonItem();
            this.btnListBuySell = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem1 = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonPage1 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup2 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
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
            this.btnStatusBuy,
            this.btnPlanRepair,
            this.btnListBuySell,
            this.barButtonItem1});
            this.ribbon.Location = new System.Drawing.Point(0, 0);
            this.ribbon.MaxItemId = 5;
            this.ribbon.Name = "ribbon";
            this.ribbon.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage1});
            this.ribbon.Size = new System.Drawing.Size(671, 158);
            this.ribbon.StatusBar = this.ribbonStatusBar;
            // 
            // btnStatusBuy
            // 
            this.btnStatusBuy.Caption = "Tình trạng mua xe";
            this.btnStatusBuy.Id = 1;
            this.btnStatusBuy.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnStatusBuy.ImageOptions.Image")));
            this.btnStatusBuy.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnStatusBuy.ImageOptions.LargeImage")));
            this.btnStatusBuy.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.btnStatusBuy.ItemAppearance.Normal.Options.UseFont = true;
            this.btnStatusBuy.Name = "btnStatusBuy";
            // 
            // btnPlanRepair
            // 
            this.btnPlanRepair.Caption = "Kế hoạch thay thế -sửa chữa";
            this.btnPlanRepair.Id = 2;
            this.btnPlanRepair.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnPlanRepair.ImageOptions.Image")));
            this.btnPlanRepair.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnPlanRepair.ImageOptions.LargeImage")));
            this.btnPlanRepair.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.btnPlanRepair.ItemAppearance.Normal.Options.UseFont = true;
            this.btnPlanRepair.Name = "btnPlanRepair";
            this.btnPlanRepair.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnPlanRepair_ItemClick);
            // 
            // btnListBuySell
            // 
            this.btnListBuySell.Caption = "Danh sách mua bán xe";
            this.btnListBuySell.Id = 3;
            this.btnListBuySell.ImageOptions.Image = global::QuanLyMuaBanXe.Properties.Resources.Report;
            this.btnListBuySell.ImageOptions.LargeImage = global::QuanLyMuaBanXe.Properties.Resources.Report;
            this.btnListBuySell.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.btnListBuySell.ItemAppearance.Normal.Options.UseFont = true;
            this.btnListBuySell.Name = "btnListBuySell";
            this.btnListBuySell.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnListBuySell_ItemClick);
            // 
            // barButtonItem1
            // 
            this.barButtonItem1.Caption = "Báo cáo thu chi mua bán xe";
            this.barButtonItem1.Id = 4;
            this.barButtonItem1.ImageOptions.Image = global::QuanLyMuaBanXe.Properties.Resources.Sales;
            this.barButtonItem1.ImageOptions.LargeImage = global::QuanLyMuaBanXe.Properties.Resources.Sales;
            this.barButtonItem1.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.barButtonItem1.ItemAppearance.Normal.Options.UseFont = true;
            this.barButtonItem1.Name = "barButtonItem1";
            this.barButtonItem1.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barButtonItem1_ItemClick);
            // 
            // ribbonPage1
            // 
            this.ribbonPage1.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup1,
            this.ribbonPageGroup2});
            this.ribbonPage1.Name = "ribbonPage1";
            this.ribbonPage1.Text = "Quản lý";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.ItemLinks.Add(this.btnStatusBuy);
            this.ribbonPageGroup1.ItemLinks.Add(this.btnPlanRepair);
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            this.ribbonPageGroup1.Text = "Theo dõi tình trạng";
            // 
            // ribbonPageGroup2
            // 
            this.ribbonPageGroup2.ItemLinks.Add(this.btnListBuySell);
            this.ribbonPageGroup2.ItemLinks.Add(this.barButtonItem1);
            this.ribbonPageGroup2.Name = "ribbonPageGroup2";
            this.ribbonPageGroup2.Text = "Báo cáo - thống kê";
            // 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 425);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbon;
            this.ribbonStatusBar.Size = new System.Drawing.Size(671, 24);
            // 
            // tabMain
            // 
            this.tabMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabMain.Location = new System.Drawing.Point(0, 158);
            this.tabMain.Name = "tabMain";
            this.tabMain.Size = new System.Drawing.Size(671, 267);
            this.tabMain.TabIndex = 2;
            // 
            // frmManagementMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(671, 449);
            this.Controls.Add(this.tabMain);
            this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.ribbon);
            this.IconOptions.Image = global::QuanLyMuaBanXe.Properties.Resources.shop_icon;
            this.Name = "frmManagementMain";
            this.Ribbon = this.ribbon;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.StatusBar = this.ribbonStatusBar;
            this.Text = "PHÂN HỆ QUẢN LÝ";
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
        private DevExpress.XtraBars.BarButtonItem btnStatusBuy;
        private DevExpress.XtraBars.BarButtonItem btnPlanRepair;
        private DevExpress.XtraBars.BarButtonItem btnListBuySell;
        private DevExpress.XtraBars.BarButtonItem barButtonItem1;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup2;
        private DevExpress.XtraTab.XtraTabControl tabMain;
    }
}