USE [master]
GO
IF db_id('QuanLyMuaBanXe') IS NOT NULL
	DROP DATABASE QuanLyMuaBanXe
GO
CREATE DATABASE QuanLyMuaBanXe
GO
USE QuanLyMuaBanXe
GO
ALTER DATABASE [QuanLyMuaBanXe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyMuaBanXe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyMuaBanXe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyMuaBanXe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyMuaBanXe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyMuaBanXe', N'ON'
GO
USE [QuanLyMuaBanXe]
GO
/****** Object:  Table [dbo].[BM_DinhGia_Ban]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_DinhGia_Ban](
	[Id_gia_ban] [int] IDENTITY(1,1) NOT NULL,
	[Id_xe] [int] NULL,
	[Loi_nhuan] [float] NULL,
	[Chi_phi] [float] NULL,
	[Gia_mua] [float] NULL,
	[Dinh_gia] [float] NULL,
 CONSTRAINT [PK_BM_DinhGia_Ban] PRIMARY KEY CLUSTERED 
(
	[Id_gia_ban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BM_DinhGia_MuaXe]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_DinhGia_MuaXe](
	[Id_kiemTra] [int] IDENTITY(1,1) NOT NULL,
	[Id_xe] [int] NULL,
	[Trang_thai] [nvarchar](250) NULL,
	[Gia_thap_nhat] [float] NULL,
	[Gia_cao_nhat] [float] NULL,
 CONSTRAINT [PK_BM_DinhGia_MuaXe] PRIMARY KEY CLUSTERED 
(
	[Id_kiemTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BM_GiaoDich]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_GiaoDich](
	[Id_ban] [int] IDENTITY(1,1) NOT NULL,
	[Id_KH] [int] NULL,
	[Id_xe] [int] NULL,
	[Gia_ban] [float] NULL,
	[Hinh_thuc] [nvarchar](50) NULL,
	[Ghi_chu] [nvarchar](250) NULL,
	[Thoi_gian] [datetime] NULL,
 CONSTRAINT [PK_BM_GiaoDich] PRIMARY KEY CLUSTERED 
(
	[Id_ban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BM_TaiKhoan]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_TaiKhoan](
	[Id_Tk] [int] IDENTITY(1,1) NOT NULL,
	[tai_khoan] [varchar](50) NULL,
	[mat_khau] [varchar](50) NULL,
	[phan_quyen] [int] NULL,
	[MD5Code] [varchar](1000) NULL,
 CONSTRAINT [PK_BM_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id_Tk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM_ThongTin_SuaChua]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_ThongTin_SuaChua](
	[Id_sua] [int] IDENTITY(1,1) NOT NULL,
	[Id_xe] [int] NULL,
	[Dien_giai] [nvarchar](500) NULL,
	[Phu_tung] [nvarchar](500) NULL,
	[Chi_phi] [float] NULL,
	[Hoan_thanh] [bit] NULL,
	[Thoi_gian] [datetime] NULL,
	[Bo_phan] [nvarchar](250) NULL,
 CONSTRAINT [PK_BM_ThongTin_SuaChua] PRIMARY KEY CLUSTERED 
(
	[Id_sua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BM_ThongTinKhachHang]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_ThongTinKhachHang](
	[Id_KH] [int] IDENTITY(1,1) NOT NULL,
	[Ho_ten] [nvarchar](100) NULL,
	[SDT] [varchar](50) NULL,
	[Dia_chi] [nvarchar](250) NULL,
	[Yeu_cau] [nvarchar](max) NULL,
	[Trang_thai] [nvarchar](50) NULL,
	[Ma_KH] [varchar](50) NULL,
	[Thoi_gian] [datetime] NULL,
 CONSTRAINT [PK_BM_ThongTinKhachHang] PRIMARY KEY CLUSTERED 
(
	[Id_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM_ThongTinXeBan]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_ThongTinXeBan](
	[Id_xe] [int] IDENTITY(1,1) NOT NULL,
	[Ma_so_xe] [nvarchar](10) NULL,
	[Bien_so_xe] [varchar](50) NULL,
	[Ten_KH_Ban] [nvarchar](100) NULL,
	[SDT] [varchar](50) NULL,
	[Dia_chi] [nvarchar](200) NULL,
	[Trang_Thai] [nvarchar](50) NULL,
	[Gia_ban] [float] NULL,
	[Ngay_tao] [datetime] NULL,
	[Loai_xe] [nvarchar](50) NULL,
	[Ngay_mua] [datetime] NULL,
 CONSTRAINT [PK_BM_ThongTinXeBan] PRIMARY KEY CLUSTERED 
(
	[Id_xe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BM_DinhGia_Ban] ON 

INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (4, 4, NULL, 800000, 8500000, 16500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (5, 5, NULL, 200000, 780000, 1200000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (6, 6, NULL, 150000, 1000000, 1700000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (7, 7, NULL, 2400000, 6800000, 12000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (8, 8, NULL, 1500000, 8500000, 15500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (9, 9, NULL, 1200000, 850000, 1350000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (10, 10, NULL, 1500000, 7500000, 14000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (13, 13, NULL, 1500000, 5200000, 9500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (14, 14, NULL, 2500000, 6000000, 14500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (15, 12, NULL, 2500000, 7000000, 12500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (16, 15, NULL, 2200000, 8000000, 14500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (17, 16, NULL, 300000, 720000, 1400000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (21, 45, NULL, 2350000, 10800000, 14500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (22, 46, NULL, 2100000, 12500000, 14850000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (23, 17, NULL, 200000, 890000, 1200000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (24, 18, NULL, 1000000, 14000000, 18000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (25, 19, NULL, 320000, 900000, 1400000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (26, 20, NULL, 2400000, 22500000, 31000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (27, 21, NULL, 350000, 850000, 1600000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (28, 22, NULL, 2500000, 16800000, 20000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (29, 23, NULL, 2000000, 24000000, 36000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (30, 24, NULL, 1800000, 12800000, 18000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (31, 25, NULL, 2200000, 12000000, 18720000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (32, 26, NULL, 450000, 1250000, 1800000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (33, 27, NULL, 400000, 920000, 1600000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (34, 28, NULL, 320000, 890000, 1500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (35, 29, NULL, 200000, 720000, 1400000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (36, 30, NULL, 2400000, 7200000, 14500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (37, 31, NULL, 2110000, 16900000, 23000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (38, 32, NULL, 1980000, 13800000, 18500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (39, 33, NULL, 1890000, 12000000, 16800000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (40, 34, NULL, 2480000, 18200000, 25000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (42, 35, NULL, 2945000, 13200000, 18500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (43, 36, NULL, 1984000, 15200000, 19500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (45, 43, NULL, 1899000, 21500000, 25000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (46, 44, NULL, 1925000, 12000000, 17500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (47, 47, NULL, 2450000, 11200000, 17800000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (48, 48, NULL, 1450000, 11800000, 18000000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (49, 50, NULL, 445000, 1100000, 1900000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (50, 51, NULL, 2540000, 13800000, 21500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (51, 52, NULL, 2345000, 8900000, 17500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (52, 53, NULL, 245000, 1100000, 1920000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (53, 54, NULL, 380000, 1000000, 1750000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (57, 37, NULL, 2549000, 15000000, 18500000)
INSERT [dbo].[BM_DinhGia_Ban] ([Id_gia_ban], [Id_xe], [Loi_nhuan], [Chi_phi], [Gia_mua], [Dinh_gia]) VALUES (65, 55, NULL, 2750000, 14000000, 18500000)
SET IDENTITY_INSERT [dbo].[BM_DinhGia_Ban] OFF
SET IDENTITY_INSERT [dbo].[BM_DinhGia_MuaXe] ON 

INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (5, 4, N'Hỏng ít, trầy xước ít, mới 85%', 8000000, 9000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (6, 5, N'Hư hỏng nhiều, trầy xước nhiều, mới 55%', 550000, 990000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (7, 6, N'Hư hỏng ít, trầy ít, mới 78%', 850000, 1300000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (8, 7, N'Hư hỏng nhiều, trầy nhiều, mới 68%', 6200000, 7200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (9, 8, N'Hư hỏng ít, trầy xước ít, mới 89%', 8200000, 9200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (10, 9, N'Hư hỏng ít, trầy xướt nhiều, mới 75%', 750000, 1000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (12, 10, N'Hư hỏng nhiều, trầy xướt ít', 7000000, 8200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (13, 12, N'Hư hỏng ít, trầy xướt ít, mới 80%', 7000000, 8000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (14, 13, N'Hư hỏng nặng, trầy nhiều, mới 65%', 4500000, 6200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (15, 14, N'Hư hỏng nhiều, trầy nhiều, mới 68%', 4800000, 6500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (16, 15, N'Trầy ít, hết bình, mới 82%', 7800000, 9200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (17, 16, N'Trầy ít, hư hỏng nhiều, mới 75%', 640000, 800000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (18, 17, N'Trầy nhiều, hư ít, mới 78%', 780000, 1000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (19, 18, N'Trầy ít, hư ít, mới 90%', 12000000, 15000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (20, 19, N'Trầy nhiều, hư ít, mới 82%', 820000, 1250000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (21, 20, N'Hư nhiều, trầy nhiều, mới 68%', 18000000, 24000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (22, 21, N'Hư nặng, trầy nhiều, mới 62%', 750000, 1000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (23, 22, N'Trầy nhiều, hư nhiều, mới 72%', 14000000, 18000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (24, 23, N'Trầy nhiều, hư ít, mới 80%', 23000000, 26000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (25, 24, N'Trầy ít, hư ít, mới 85%', 12000000, 14000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (26, 25, N'Trầy nhiều, hư hỏng ít, mới 78%', 9000000, 14000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (27, 26, N'Trầy ít, hư hỏng ít, mới 82%', 1000000, 1400000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (28, 27, N'Trầy nhiều, hư ít, mới 75%', 750000, 1100000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (29, 28, N'Có trầy xướt, hư ít, mới 85%', 750000, 1000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (30, 29, N'Hư nhiều, trầy nhiều, mới 65%', 400000, 850000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (31, 30, N'Có trầy xướt, hư hỏng nặng, mới 72%', 6200000, 8200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (32, 31, N'Hư hỏng nhiều, có trầy xướt, mới 75%', 15200000, 18500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (33, 43, N'Hư hỏng nhiều. trầy nhiều, mới 68%', 19000000, 24000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (34, 44, N'Hư ít, trầy xướt ít, mới 82%', 10000000, 14000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (35, 45, N'Hư ít, trầy xướt nhiều, mới 78%', 8500000, 12500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (36, 46, N'Hư hỏng nặng, trầy nhiều, mới 68%', 10000000, 14000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (37, 32, N'Hư hỏng nhiều, trầy nhiều, mới 72%', 12000000, 15000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (38, 33, N'Hư nhiều, trầy nhiều, mới 75%', 10500000, 13400000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (39, 34, N'Trầy ít, hư ít, mới 82%', 16000000, 20000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (40, 35, N'Hư nhiều, trầy ít, mới 78%', 12000000, 14500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (41, 36, N'Trầy nhiều, hư hỏng ít, mới 82%', 14000000, 16500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (42, 37, N'Trầy ít, hư hỏng ít, mới 82%', 14000000, 16800000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (43, 38, N'Hư hỏng ít, trầy nhiều, mới 79%', 10000000, 12500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (44, 39, N'Hư hỏng ít, trầy nhiều, mới 82%', 8500000, 12000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (45, 40, N'Hư hỏng nhiều, trầy ít, mới 78%', 7800000, 10000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (46, 41, N'Trầy ít, hư hỏng ít, mới 82%', 12000000, 15000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (48, 42, N'Hư nhiều, trầy xướt nhiều, mới 62%
', 9500000, 13200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (50, 47, N'Hư hỏng ít, trầy nhiều, mới 80%', 8850000, 12450000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (51, 48, N'Hư hỏng ít, trầy xước nhiều, 79%', 8900000, 12650000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (52, 50, N'Hư hỏng ít, trầy xước ít. mới 82%', 850000, 1200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (53, 51, N'Hư hỏng ít, trầy xước ít, mới 89%', 12000000, 15000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (54, 52, N'Hư hỏng nặng, trầy ước ít, mới 68%', 7200000, 10000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (55, 53, N'Hư hỏng ít, trầy xước nhiều', 700000, 1200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (56, 54, N'Hư hỏng ít, trầy ít, mới 85%', 720000, 1250000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (57, 55, N'Hư hỏng nặng, trầy nhiều, mới 78%', 12500000, 16200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (59, 56, N'Hư hỏng nhẹ, trầy nhiều, mới 75%', 8200000, 12400000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (60, 57, N'Hư hỏng nhẹ, trầy ít, 82%', 9500000, 14200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (61, 58, N'Hư hỏng nhẹ, trầy nhiều, mới 79%', 11500000, 15000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (62, 59, N'Hư hỏng ít, trầy ít, mới 85%', 14000000, 18000000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (63, 60, N'Trầy nhiều, hư hỏng nhiều, mới 65%', 7200000, 9400000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (64, 61, N'Trầy ít, hư hỏng nhiều, mới 74%', 6500000, 8900000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (65, 62, N'Hư hỏng ít, trầy nhiều, mới 75%', 7400000, 9500000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (66, 63, N'Hư hỏng nhiều, trầy nhiều, mới 62%', 5400000, 8200000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (67, 64, N'Trầy nhiều, hư ít, mới 72%', 500000, 850000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (68, 65, N'Hư hỏng nhiều, trầy nhiều, mới 75%', 7200000, 9450000)
INSERT [dbo].[BM_DinhGia_MuaXe] ([Id_kiemTra], [Id_xe], [Trang_thai], [Gia_thap_nhat], [Gia_cao_nhat]) VALUES (69, 66, N'Hư hỏng ít, trầy ít, mới 89%', 9200000, 14500000)
SET IDENTITY_INSERT [dbo].[BM_DinhGia_MuaXe] OFF
SET IDENTITY_INSERT [dbo].[BM_GiaoDich] ON 

INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (11, 2, 4, 17100000, N'Thanh toán trực tiếp', N'600,000 VNĐ phí dịch vụ', CAST(N'2020-07-01 02:56:36.533' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (12, 3, 6, 2000000, N'Chuyển khoản', N'300,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 02:57:29.730' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (14, 5, 5, 1250000, N'Thanh toán trực tiếp', N'50,000 VNĐ phí dịch vụ', CAST(N'2020-07-01 12:07:57.083' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (15, 6, 10, 14500000, N'Thanh toán trực tiếp', N'500,000 VNĐ phí dịch vụ', CAST(N'2020-07-01 12:22:27.880' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (16, 7, 14, 15000000, N'Thanh toán trực tiếp', N'500,000 VNĐ phí dịch vụ', CAST(N'2020-07-01 12:23:35.517' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (17, 8, 9, 1400000, N'Thanh toán trực tiếp', N'50,000 VNĐ phí dịch vụ', CAST(N'2020-07-01 12:24:27.950' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (18, 9, 13, 10000000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 15:02:33.827' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (19, 4, 7, 12500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí giao dịch', CAST(N'2020-07-01 15:08:41.520' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (20, 1, 8, 16200000, N'Thanh toán trực tiếp', N'700,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 15:10:54.270' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (21, 10, 12, 13000000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 15:12:14.743' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (22, 11, 16, 1450000, N'Thanh toán trực tiếp', N'50,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 15:12:54.750' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (23, 12, 15, 15000000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 15:13:43.290' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (24, 13, 46, 15500000, N'Thanh toán trực tiếp', N'650,000 VNĐ Phí giao dịch', CAST(N'2020-07-01 16:47:47.950' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (26, 14, 45, 15000000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:11:49.877' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (27, 15, 18, 18500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:13:10.023' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (28, 16, 23, 36500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:13:31.460' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (29, 17, 20, 31500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:13:52.183' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (30, 18, 21, 1650000, N'Thanh toán trực tiếp', N'50,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:14:17.200' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (31, 19, 22, 20500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:14:38.130' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (32, 20, 19, 1450000, N'Thanh toán trực tiếp', N'50,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:15:14.997' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (33, 21, 24, 18500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:15:33.670' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (34, 22, 28, 1550000, N'Thanh toán trực tiếp', N'50,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:15:52.537' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (35, 23, 30, 15000000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:16:08.577' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (36, 24, 31, 23500000, N'Thanh toán trực tiếp', N'500,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:16:50.143' AS DateTime))
INSERT [dbo].[BM_GiaoDich] ([Id_ban], [Id_KH], [Id_xe], [Gia_ban], [Hinh_thuc], [Ghi_chu], [Thoi_gian]) VALUES (37, 25, 27, 1650000, N'Thanh toán trực tiếp', N'50,000 VNĐ Phí dịch vụ', CAST(N'2020-07-01 20:17:10.510' AS DateTime))
SET IDENTITY_INSERT [dbo].[BM_GiaoDich] OFF
SET IDENTITY_INSERT [dbo].[BM_TaiKhoan] ON 

INSERT [dbo].[BM_TaiKhoan] ([Id_Tk], [tai_khoan], [mat_khau], [phan_quyen], [MD5Code]) VALUES (1, N'huutrong                                          ', N'123456                                            ', 0, N'vXqiyaehilg=')
INSERT [dbo].[BM_TaiKhoan] ([Id_Tk], [tai_khoan], [mat_khau], [phan_quyen], [MD5Code]) VALUES (2, N'anhthu                                           ', N'123456                                            ', 1, N'vXqiyaehilg=')
INSERT [dbo].[BM_TaiKhoan] ([Id_Tk], [tai_khoan], [mat_khau], [phan_quyen], [MD5Code]) VALUES (3, N'maitinh                                           ', N'123456                                            ', 2, N'vXqiyaehilg=')
INSERT [dbo].[BM_TaiKhoan] ([Id_Tk], [tai_khoan], [mat_khau], [phan_quyen], [MD5Code]) VALUES (4, N'tiepnhan', N'123456                                            ', 3, N'vXqiyaehilg=')
SET IDENTITY_INSERT [dbo].[BM_TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[BM_ThongTin_SuaChua] ON 

INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (10, 4, N'Chưa hoàn thành', N'Kính chiếu hậu, yên xe', 800000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Kính chiếu hậu, yên xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (12, 5, N'Chưa hoàn thành', N'Sơn lại chiếc xe', 200000, NULL, CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'Trày xướt nhiều')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (13, 6, N'Hoàn thành', N'Vỏ xe, sửa thắng', 150000, 1, CAST(N'2020-06-26 00:00:00.000' AS DateTime), N'Vỏ xe, thắng xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (14, 7, N'Hoàn thành', N'Vỏ xe, bình xe, trầy xướt nhiều', 2400000, 1, CAST(N'2020-06-27 00:00:00.000' AS DateTime), N'Vỏ xe, bình xe, trầy xướt nhiều')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (15, 8, N'Hoàn thành', N'Buri, yên xe', 1500000, 1, CAST(N'2020-06-28 00:00:00.000' AS DateTime), N'Buri, yên xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (16, 9, N'Hoàn thành', N'Sơn xe, thay ruột xe', 200000, 1, CAST(N'2020-06-20 00:00:00.000' AS DateTime), N'Trày xướt nhiều, ruột hỏng')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (17, 10, N'Chưa hoàn thành', N'Buri, yên xe, bình xe', 1500000, NULL, CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'Buri, yên xe, bình xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (18, 12, N'Chưa hoàn thành', N'Vỏ xe, yên xe, bình xe', 2000000, NULL, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'Vỏ xe, yên xe, bình xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (19, 13, N'Chưa hoàn thành', N'Vỏ xe, bình xe, ruột xe', 1500000, NULL, CAST(N'2020-07-08 00:00:00.000' AS DateTime), N'Vỏ xe, bình xe, ruột xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (20, 14, N'Hoàn thành', N'Yên xe, ruột xe, vỏ xe', 2500000, 1, CAST(N'2020-07-01 00:00:00.000' AS DateTime), N'Yên xe, ruột xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (21, 15, N'Hoàn thành', N'Buri, bình xe, thay vỏ xe', 2200000, 1, CAST(N'2020-07-01 00:00:00.000' AS DateTime), N'Buri, bình xe, thay vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (22, 16, N'Hoàn thành', N'Thay ruột, sơn lại xe', 300000, 1, CAST(N'2020-07-01 00:00:00.000' AS DateTime), N'Thay ruột, sơn lại xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (23, 17, N'Hoàn thành', N'Sơn xe, vỏ xe', 200000, NULL, CAST(N'2020-07-01 00:00:00.000' AS DateTime), N'Sơn xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (24, 18, N'Chưa hoàn thành', N'Buri, bình xe', 1000000, NULL, CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'Buri, bình xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (25, 19, N'Chưa hoàn thành', N'Sơn xe, vỏ xe', 320000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Sơn xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (26, 20, N'Chưa hoàn thành', N'Buri, yên xe, vỏ xe', 2400000, NULL, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'Buri, yên xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (27, 21, N'Chưa hoàn thành', N'Sơn lại xe, thay vỏ xe', 350000, NULL, CAST(N'2020-07-06 00:00:00.000' AS DateTime), N'Sơn lại xe, thay vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (28, 22, N'Chưa hoàn thành', N'Bình xe, buri, vỏ xe', 2500000, NULL, CAST(N'2020-07-07 00:00:00.000' AS DateTime), N'Bình xe, buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (29, 23, N'Chưa hoàn thành', N'Bình xe, vỏ xe', 2000000, NULL, CAST(N'2020-07-06 00:00:00.000' AS DateTime), N'Bình xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (30, 24, N'Chưa hoàn thành', N'Buri, vỏ xe', 1800000, NULL, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'Buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (31, 25, N'Chưa hoàn thành', N'Bình xe, vỏ xe', 2200000, NULL, CAST(N'2020-07-08 00:00:00.000' AS DateTime), N'Bình xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (32, 26, N'Chưa hoàn thành', N'Sơn lại xe, thay xích', 450000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Sơn lại xe, thay xích')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (33, 27, N'Chưa hoàn thành', N'Ruột xe, sơn xe, xích xe', 400000, NULL, CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'Ruột xe, sơn xe, xích xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (34, 28, N'Chưa hoàn thành', N'Ruột xe, sơn xe', 320000, NULL, CAST(N'2020-07-06 00:00:00.000' AS DateTime), N'Ruột xe, sơn xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (35, 29, N'Chưa hoàn thành', N'Ruột xe, vỏ xe', 200000, NULL, CAST(N'2020-07-06 00:00:00.000' AS DateTime), N'Ruột xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (36, 30, N'Chưa hoàn thành', N'Vỏ xe, Buri, yên xe', 2400000, NULL, CAST(N'2020-07-08 00:00:00.000' AS DateTime), N'Vỏ xe, Buri, yên xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (37, 31, N'Chưa hoàn thành', N'Buri, bình xe, vỏ xe', 2110000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Buri, bình xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (38, 43, N'Chưa hoàn thành', N'Yên xe, vỏ xe', 1899000, NULL, CAST(N'2020-07-10 00:00:00.000' AS DateTime), N'Yên xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (39, 44, N'Chưa hoàn thành', N'Vỏ xe, ruột xe', 1925000, NULL, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'Vỏ xe, ruột xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (40, 45, N'Chưa hoàn thành', N'Bình xe, yên xe, vỏ xe', 2350000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Bình xe, yên xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (41, 46, N'Chưa hoàn thành', N'Buri, vỏ xe', 2100000, NULL, CAST(N'2020-07-09 00:00:00.000' AS DateTime), N'Buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (44, 32, N'Chưa hoàn thành', N'Buri, vỏ xe', 1980000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (45, 33, N'Chưa hoàn hành', N'Buri, vỏ xe', 1890000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (46, 42, N'Chưa hoàn thành', N'Vỏ xe, bình xe', 2100000, NULL, CAST(N'2020-07-09 00:00:00.000' AS DateTime), N'Vỏ xe, bình xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (47, 34, N'Chưa hoàn thành', N'Bình xe, yên xe, vỏ xe', 2480000, NULL, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'Bình xe, yên xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (48, 35, N'Chưa hoàn thành', N'Bình yên, buri, vỏ xe', 2945000, NULL, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'Bình yên, buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (49, 36, N'Chưa hoàn thành', N'Buri, vỏ xe', 1984000, NULL, CAST(N'2020-07-08 00:00:00.000' AS DateTime), N'Buri, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (50, 37, N'Chưa hoàn thành', N'Gương xe, vỏ xe, thắng xe', 2549000, NULL, CAST(N'2020-07-09 00:00:00.000' AS DateTime), N'Gương xe, vỏ xe, thắng xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (51, 47, N'Chưa hoàn thành', N'Buri, ruột xe, vỏ xe', 2450000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Buri, ruột xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (52, 48, N'Chưa hoàn thành', N'Yên xe, vỏ xe', 1450000, NULL, CAST(N'2020-07-06 00:00:00.000' AS DateTime), N'Yên xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (53, 50, N'Chưa hoàn thành', N'Sơn xe, ruột xe', 445000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Sơn xe, ruột xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (54, 51, N'Chưa hoàn thành', N'Gương xe, vỏ xe, ruột xe', 2540000, NULL, CAST(N'2020-07-06 00:00:00.000' AS DateTime), N'Gương xe, vỏ xe, ruột xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (55, 52, N'Chưa hoàn thành', N'Buri, vỏ xe, ruột xe', 2345000, NULL, CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'Buri, vỏ xe, ruột xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (56, 53, N'Chưa hoàn thành', N'Sơn xe, thay dây xích', 245000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Sơn xe, thay dây xích')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (57, 54, N'Chưa hoàn thành', N'Sơn xe, thay chống xe', 380000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Sơn xe, thay chống xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (58, 55, N'Chưa hoàn thành', N'Buri, vỏ xe, bình xe', 2750000, NULL, CAST(N'2020-07-03 00:00:00.000' AS DateTime), N'Buri, vỏ xe, bình xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (59, 38, N'Chưa hoàn thành', N'Buri, bình xe, câm xe, vỏ xe', 3150000, NULL, CAST(N'2020-07-14 00:00:00.000' AS DateTime), N'Buri, bình xe, câm xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (60, 39, N'Chưa hoàn thành', N'Bình xe, yên xe, vỏ xe', 2490000, NULL, CAST(N'2020-07-09 00:00:00.000' AS DateTime), N'Bình xe, yên xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (61, 40, N'Chưa hoàn thành', N'Buri, gương xe, vỏ xe', 1980000, NULL, CAST(N'2020-07-10 00:00:00.000' AS DateTime), N'Buri, gương xe, vỏ xe')
INSERT [dbo].[BM_ThongTin_SuaChua] ([Id_sua], [Id_xe], [Dien_giai], [Phu_tung], [Chi_phi], [Hoan_thanh], [Thoi_gian], [Bo_phan]) VALUES (62, 41, N'Chưa hoàn thành', N'Buri, bình xe, yên xe, vỏ xe', 3210000, NULL, CAST(N'2020-07-14 00:00:00.000' AS DateTime), N'Buri, bình xe, yên xe, vỏ xe')
SET IDENTITY_INSERT [dbo].[BM_ThongTin_SuaChua] OFF
SET IDENTITY_INSERT [dbo].[BM_ThongTinKhachHang] ON 

INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (1, N'NGUYỄN TRỌNG', N'0123456789', N'HCM', N'AB 2019', N'Đã mua', N'BX2006001', CAST(N'2020-06-19 16:36:38.907' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (2, N'NGUYÊN THƯ', N'0123456788', N'HCM', N'Vespa 2019', N'Đã mua', N'BX2006002', CAST(N'2020-06-19 16:41:00.407' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (3, N'ĐẶNG TÍNH', N'0123456777', N'HN', N'Wave RSX 2019', N'Đã mua', N'BX2006001', CAST(N'2020-06-19 16:36:38.907' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (4, N'TRỌNG', N'0123456789', N'HCM', N'Xe đạp leo núi', N'Đã mua', N'BX2006001', CAST(N'2020-06-19 16:36:38.907' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (5, N'THƯ', N'0123456779', N'HCM', N'Future 2018', N'Đã mua', N'BX2006003', CAST(N'2020-06-30 21:49:54.290' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (6, N'TÍNH', N'0123356789', N'HCM', N'Winner 2019', N'Đã mua', N'BX2006004', CAST(N'2020-06-30 21:51:02.503' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (7, N'NGUYỄN HOÀNG ANH THƯ', N'0124455667', N'An Giang', N'Wave RSX 2020', N'Đã mua', N'BX2006005', CAST(N'2020-06-30 22:03:26.560' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (8, N'NGUYỄN HỮU TRỌNG', N'0123456234', N'Bến Tre', N'AB 2020', N'Đã mua', N'BX2006006', CAST(N'2020-06-30 22:04:08.060' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (9, N'ĐẶNG MAI TÍNH', N'0123452345', N'Bình Dương', N'Serius 2019', N'Đã mua', N'BX2006007', CAST(N'2020-06-30 22:04:51.510' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (10, N'HOÀNG', N'0945681289', N'Thủ Đức', N'Cup 50', N'Đã mua', N'BX2006008', CAST(N'2020-06-30 23:32:31.983' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (11, N'VIỆT', N'0934761542', N'Bình Dương', N'Exciter', N'Đã mua', N'BX2006009', CAST(N'2020-06-30 23:33:26.557' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (12, N'VĨ', N'0945712498', N'Hồ Chí Minh', N'AB 2020', N'Đã mua', N'BX2006010', CAST(N'2020-06-30 23:34:04.187' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (13, N'TOÀN', N'0945712859', N'Bình Dương', N'SH 2019', N'Đã mua', N'BX2006011', CAST(N'2020-06-30 23:34:37.677' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (14, N'TÚ', N'0124289768', N'Hồ Chí Minh', N'AB 2020 đen nhám', N'Đã mua', N'BX2006012', CAST(N'2020-06-30 23:35:18.220' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (15, N'HÒA', N'0986257896', N'Hồ Chí Minh', N'Sirius Fi', N'Đã mua', N'BX2006013', CAST(N'2020-06-30 23:36:03.517' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (16, N'HIỆP', N'0934685369', N'Hồ Chí Minh', N'Wave RSX Fi', N'Đã mua', N'BX2006014', CAST(N'2020-06-30 23:36:42.427' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (17, N'LÊ', N'0124765987', N'Hồ Chí Minh', N'Xe đạp nữ', N'Đã mua', N'BX2006015', CAST(N'2020-06-30 23:37:24.043' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (18, N'TRUNG', N'0923589075', N'Hồ Chí Minh', N'Xe đạp tay ngang', N'Đã mua', N'BX2006016', CAST(N'2020-06-30 23:38:01.840' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (19, N'CHÍ', N'0945698798', N'Hồ Chí Minh', N'AB 2020 đỏ đô', N'Đã mua', N'BX2006017', CAST(N'2020-06-30 23:38:42.360' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (20, N'PHƯƠNG', N'0983458749', N'Hồ Chí Minh', N'SH mode', N'Đã mua', N'BX2006018', CAST(N'2020-06-30 23:39:17.207' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (21, N'PHƯỢNG', N'0124789654', N'Hồ Chí Minh', N'SH 2020', N'Đã mua', N'BX2006019', CAST(N'2020-06-30 23:39:52.780' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (22, N'VI', N'0123598642', N'Bình Phước', N'AB 2020', N'Đã mua', N'BX2006020', CAST(N'2020-06-30 23:40:31.463' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (23, N'VƯƠNG', N'0945312789', N'Thủ Đức', N'Wave RSX Fi', N'Đã mua', N'BX2006021', CAST(N'2020-06-30 23:41:31.620' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (24, N'THÚY', N'0945875217', N'Hồ Chí Minh', N'SH mode', N'Đã mua', N'BX2006022', CAST(N'2020-06-30 23:42:05.827' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (25, N'VY', N'0945317845', N'Hồ Chí Minh', N'Xe đạp nữ', N'Đã mua', N'BX2006023', CAST(N'2020-06-30 23:42:38.967' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (26, N'THỦY', N'0123412671', N'Hồ Chí Minh', N'Vespa', N'Mới tạo', N'BX2007001', CAST(N'2020-07-01 02:47:27.467' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (27, N'HẢI', N'0123761898', N'Hồ Chí Minh', N'Exciter 2019', N'Mới tạo', N'BX2007002', CAST(N'2020-07-01 02:48:10.547' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (28, N'PHONG', N'0912312312', N'Thủ Đức', N'Winner', N'Mới tạo', N'BX2007003', CAST(N'2020-07-01 02:48:44.793' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (29, N'HÀO', N'0123745129', N'Nhà Bè', N'PXC 2018', N'Mới tạo', N'BX2007004', CAST(N'2020-07-01 02:49:30.863' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (30, N'BẢO', N'0121212787', N'Hồ Chí Minh', N'Xe đạp tay ngang', N'Mới tạo', N'BX2007005', CAST(N'2020-07-01 02:50:17.470' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (31, N'HỌA', N'0934129585', N'Hồ Chí Minh', N'Wave RSX Fi 2019', N'Mới tạo', N'BX2007006', CAST(N'2020-07-01 16:05:50.170' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (32, N'THANH', N'0912538528', N'Bình Dương', N'Winner 2019', N'Mới tạo', N'BX2007007', CAST(N'2020-07-01 16:06:23.907' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (33, N'THỨC', N'0942498358', N'Bến Tre', N'Sirius Fi', N'Mới tạo', N'BX2007008', CAST(N'2020-07-01 16:07:02.010' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (34, N'NHƯ', N'0912398596', N'Hồ Chí Minh', N'Vespa 2019', N'Mới tạo', N'BX2007009', CAST(N'2020-07-01 16:07:41.293' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (35, N'HÀO', N'0951209567', N'Bình Dương', N'Xe đạp leo núi', N'Mới tạo', N'BX2007010', CAST(N'2020-07-01 16:08:29.433' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (36, N'HÙNG', N'0941346794', N'Thủ Đức', N'SH mode', N'Mới tạo', N'BX2007011', CAST(N'2020-07-01 16:09:02.440' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (38, N'ĐỊNH', N'0904239506', N'Hồ Chí Minh', N'Wave RSX 2018', N'Mới tạo', N'BX2007012', CAST(N'2020-07-01 19:57:11.180' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (39, N'HẢI', N'0904592045', N'Thủ Đức', N'Future', N'Mới tạo', N'BX2007013', CAST(N'2020-07-01 19:57:42.487' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (40, N'BÌNH', N'0903412893', N'Hồ Chí Minh', N'SH 2019', N'Mới tạo', N'BX2007014', CAST(N'2020-07-01 19:58:47.217' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (41, N'GIANG', N'0903419584', N'Biên Hòa', N'Xe đạp địa hình', N'Mới tạo', N'BX2007015', CAST(N'2020-07-01 19:59:14.970' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (42, N'LUẬT', N'0912350294', N'Bình Dương', N'Winner', N'Mới tạo', N'BX2007016', CAST(N'2020-07-01 19:59:45.530' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (43, N'ĐẠT', N'0901239450', N'Hồ Chí Minh', N'Vespa 2019', N'Mới tạo', N'BX2007017', CAST(N'2020-07-01 20:00:20.907' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (44, N'ĐẠO', N'0923198045', N'Hồ Chí Minh', N'Sirius Fi 219', N'Mới tạo', N'BX2007018', CAST(N'2020-07-01 20:01:21.870' AS DateTime))
INSERT [dbo].[BM_ThongTinKhachHang] ([Id_KH], [Ho_ten], [SDT], [Dia_chi], [Yeu_cau], [Trang_thai], [Ma_KH], [Thoi_gian]) VALUES (45, N'THI', N'0912430596', N'Hồ Chí Minh', N'Xe đạp nữ', N'Mới tạo', N'BX2007019', CAST(N'2020-07-01 20:02:44.783' AS DateTime))
SET IDENTITY_INSERT [dbo].[BM_ThongTinKhachHang] OFF
SET IDENTITY_INSERT [dbo].[BM_ThongTinXeBan] ON 

INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (4, N'BX2006003', N'77-B5 51999', N'Nguyễn Thư', N'0123456789', N'Tp Ho Chi Minh
', N'Đã giao dịch', 8500000, CAST(N'2020-06-30 19:11:52.947' AS DateTime), N'Xe máy', CAST(N'2020-06-30 22:23:25.713' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (5, N'BX2006004', NULL, N'Mai Tính', N'0123456788', N'Tp Ho Chi Minh
', N'Đã giao dịch', 780000, CAST(N'2020-06-30 21:36:16.290' AS DateTime), N'Xe đạp', CAST(N'2020-06-30 22:23:40.937' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (6, N'BX2006005', NULL, N'Hữu Trọng', N'0123456777', N'Tp Ha Noi', N'Đã giao dịch', 1000000, CAST(N'2020-06-30 21:36:53.383' AS DateTime), N'Xe đạp', CAST(N'2020-06-30 22:24:13.267' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (7, N'BX2006006', N'89-A5 12999', N'Thư', N'0123456666', N'Tp Ha Noi', N'Đã giao dịch', 6800000, CAST(N'2020-06-30 21:38:56.977' AS DateTime), N'Xe máy', CAST(N'2020-06-30 22:24:29.967' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (8, N'BX2006007', N'87-B5 32999', N'Trọng', N'0123455555', N'Tp Ha Noi', N'Đã giao dịch', 8500000, CAST(N'2020-06-30 21:39:35.327' AS DateTime), N'Xe máy', CAST(N'2020-06-30 23:06:58.907' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (9, N'BX2006008', NULL, N'Tính', N'0123444444', N'Tp Ha Noi', N'Đã giao dịch', 850000, CAST(N'2020-06-30 21:40:08.787' AS DateTime), N'Xe đạp', CAST(N'2020-06-30 23:07:43.370' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (10, N'BX2006009', N'55-T3 89555', N'Nguyễn Hoàng Anh Thư', N'0123456789', N'Tp Ha Noi', N'Đã giao dịch', 7500000, CAST(N'2020-06-30 21:40:46.513' AS DateTime), N'Xe máy', CAST(N'2020-06-30 23:08:04.217' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (12, N'BX2006010', N'55-C5 65999', N'Phúc', N'0123456789', N'Tp Ho Chi Minh
', N'Đã giao dịch', 7500000, CAST(N'2020-06-30 21:43:50.297' AS DateTime), N'Xe máy', CAST(N'2020-06-30 23:08:25.730' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (13, N'BX2006011', N'62-C9 55712', N'Mai', N'0123456345', N'Tp Hồ Chí Minh', N'Đã giao dịch', 5200000, CAST(N'2020-06-30 23:16:16.197' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:13:25.063' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (14, N'BX2006012', N'65-S1 45123', N'Lan', N'0123451321', N'Bến Tre', N'Đã giao dịch', 6000000, CAST(N'2020-06-30 23:16:50.730' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:13:45.830' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (15, N'BX2006013', N'65-S2 45212', N'Huệ', N'0123464213', N'Bình Dương', N'Đã giao dịch', 8000000, CAST(N'2020-06-30 23:17:36.483' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:14:04.320' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (16, N'BX2006014', NULL, N'Thọ', N'0123462446', N'Long An', N'Đã giao dịch', 720000, CAST(N'2020-06-30 23:18:20.963' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 00:14:22.127' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (17, N'BX2006015', NULL, N'Thiên', N'0123453113', N'Bình Phước', N'Đã định giá bán', 890000, CAST(N'2020-06-30 23:18:45.443' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 00:14:51.243' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (18, N'BX2006016', N'45-C1 54213', N'Hồng', N'0123512451', N'Biên Hòa', N'Đã giao dịch', 14000000, CAST(N'2020-06-30 23:19:29.730' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:15:04.710' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (19, N'BX2006017', NULL, N'Hoa', N'0124553456', N'Long Thành', N'Đã giao dịch', 900000, CAST(N'2020-06-30 23:20:35.983' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 00:15:20.197' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (20, N'BX2006018', N'65-S7 56123', N'Vũ', N'0123412345', N'Đồng Nai', N'Đã giao dịch', 22500000, CAST(N'2020-06-30 23:21:15.627' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:15:31.353' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (21, N'BX2006019', NULL, N'Hoài', N'0123454789', N'Hồ Chí Minh', N'Đã giao dịch', 850000, CAST(N'2020-06-30 23:22:11.947' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 00:46:01.460' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (22, N'BX2006020', N'65-S6 45234', N'Dung', N'0355456789', N'Tiền Giang', N'Đã giao dịch', 16800000, CAST(N'2020-06-30 23:23:18.700' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:15:46.397' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (23, N'BX2006021', N'64-A1 45123', N'Long', N'0123451239', N'Hồ Chí Minh', N'Đã giao dịch', 24000000, CAST(N'2020-06-30 23:24:07.557' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:46:14.950' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (24, N'BX2006022', N'66-A5 54346', N'Minh', N'0932456789', N'Hồ Chí Minh', N'Đã giao dịch', 12800000, CAST(N'2020-06-30 23:25:00.180' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:46:29.250' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (25, N'BX2006023', N'69-D2 56421', N'Thông', N'0123451234', N'Hồ Chí Minh', N'Đã định giá bán', 12000000, CAST(N'2020-06-30 23:25:38.670' AS DateTime), N'Xe máy', CAST(N'2020-07-01 00:16:09.590' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (26, N'BX2006024', NULL, N'Cúc', N'0123452345', N'Hồ Chí Minh', N'Đã định giá bán', 1250000, CAST(N'2020-06-30 23:26:32.263' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 00:46:46.423' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (27, N'BX2006025', NULL, N'Lộc', N'0123451239', N'Hồ Chí Minh', N'Đã giao dịch', 920000, CAST(N'2020-06-30 23:27:11.213' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 00:16:31.393' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (28, N'BX2006026', NULL, N'Tin', N'0123451285', N'Hồ Chí Minh', N'Đã giao dịch', 890000, CAST(N'2020-06-30 23:27:44.837' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 02:44:30.543' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (29, N'BX2006027', NULL, N'Toán', N'0123986427', N'Hồ Chí Minh', N'Đã định giá bán', 720000, CAST(N'2020-06-30 23:28:13.527' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 02:45:31.663' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (30, N'BX2006028', N'45-A7 89345', N'Nghĩa', N'0123123432', N'Hồ Chí Minh', N'Đã giao dịch', 7200000, CAST(N'2020-06-30 23:29:09.030' AS DateTime), N'Xe máy', CAST(N'2020-07-01 02:46:20.823' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (31, N'BX2006029', N'62-D1 59812', N'Nhân', N'0923587123', N'Bình Dương', N'Đã giao dịch', 16900000, CAST(N'2020-06-30 23:29:56.410' AS DateTime), N'Xe máy', CAST(N'2020-07-01 02:46:03.533' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (32, N'BX2006030', N'52-D4 67129', N'Trang', N'0128734756', N'Hồ Chí Minh', N'Đã định giá bán', 13800000, CAST(N'2020-06-30 23:30:41.060' AS DateTime), N'Xe máy', CAST(N'2020-07-01 14:47:53.700' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (33, N'BX2006031', N'49-D1 64891', N'Tuấn', N'0983456788', N'Thủ Đức', N'Đã định giá bán', 12000000, CAST(N'2020-06-30 23:31:39.983' AS DateTime), N'Xe máy', CAST(N'2020-07-01 14:48:08.310' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (34, N'BX2006032', N'55-D5 12379', N'Võ', N'0123598743', N'Hồ Chí Minh', N'Đã định giá bán', 18200000, CAST(N'2020-06-30 23:44:03.473' AS DateTime), N'Xe máy', CAST(N'2020-07-01 14:48:22.047' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (35, N'BX2006033', N'55-D5 99123', N'Huỳnh', N'0912341235', N'Hồ Chí Minh', N'Đã định giá bán', 13200000, CAST(N'2020-06-30 23:44:58.987' AS DateTime), N'Xe máy', CAST(N'2020-07-01 14:48:46.780' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (36, N'BX2006034', N'89-D5 98567', N'Ngọc', N'0123123768', N'Hồ Chí Minh', N'Đã định giá bán', 15200000, CAST(N'2020-06-30 23:45:38.947' AS DateTime), N'Xe máy', CAST(N'2020-07-01 14:49:00.077' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (37, N'BX2006035', N'88-D5 98588', N'Anh', N'0123126783', N'Hồ Chí Minh', N'Đã định giá bán', 15000000, CAST(N'2020-06-30 23:46:21.710' AS DateTime), N'Xe máy', CAST(N'2020-07-01 15:59:33.957' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (38, N'BX2006036', N'44-D5 98567', N'Kiệt', N'0912312343', N'Hồ Chí Minh', N'Sửa chữa', 11400000, CAST(N'2020-06-30 23:47:09.143' AS DateTime), N'Xe máy', CAST(N'2020-07-01 15:59:45.330' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (39, N'BX2006037', N'42-D5 54123', N'Bích', N'56-D5 85912', N'Hồ Chí Minh', N'Sửa chữa', 10800000, CAST(N'2020-06-30 23:47:51.953' AS DateTime), N'Xe máy', CAST(N'2020-07-01 16:00:12.657' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (40, N'BX2006038', N'45-D5 98128', N'Trâm', N'0123123985', N'Hồ Chí Minh', N'Sửa chữa', 8900000, CAST(N'2020-06-30 23:48:37.230' AS DateTime), N'Xe máy', CAST(N'2020-07-01 16:58:45.570' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (41, N'BX2006039', N'45-D5 56989', N'Trí', N'0123765989', N'Hồ Chí Minh', N'Sửa chữa', 13900000, CAST(N'2020-06-30 23:49:40.777' AS DateTime), N'Xe máy', CAST(N'2020-07-01 16:58:58.673' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (42, N'BX2006040', N'45-D5 61898', N'Nhật', N'0978978968', N'Hồ Chí Minh', N'Sửa chữa', 12000000, CAST(N'2020-06-30 23:50:29.157' AS DateTime), N'Xe máy', CAST(N'2020-07-01 16:59:30.327' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (43, N'BX2007001', N'46-B1 56454', N'Quang', N'0943768098', N'Hồ Chí Minh', N'Đã định giá bán', 21500000, CAST(N'2020-07-01 02:51:46.277' AS DateTime), N'Xe máy', CAST(N'2020-07-01 12:41:05.427' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (44, N'BX2007002', N'46-B1 69545', N'Đăng', N'0985675698', N'Hò Chí Minh', N'Đã định giá bán', 12000000, CAST(N'2020-07-01 02:52:50.457' AS DateTime), N'Xe máy', CAST(N'2020-07-01 12:41:24.223' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (45, N'BX2007003', N'45-B1 89656', N'Hạnh', N'0345348759', N'Hồ Chí Minh', N'Đã giao dịch', 10800000, CAST(N'2020-07-01 02:53:44.667' AS DateTime), N'Xe máy', CAST(N'2020-07-01 12:41:35.207' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (46, N'BX2007004', N'51-D5 98985', N'Nhi', N'0967453498', N'Hồ Chí Minh', N'Đã giao dịch', 12500000, CAST(N'2020-07-01 02:54:35.753' AS DateTime), N'Xe máy', CAST(N'2020-07-01 12:41:58.890' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (47, N'BX2007005', N'34-D5 99565', N'Thoại', N'0123980789', N'Hồ Chí Minh', N'Đã định giá bán', 11200000, CAST(N'2020-07-01 15:57:28.773' AS DateTime), N'Xe máy', CAST(N'2020-07-01 21:02:26.533' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (48, N'BX2007006', N'34-D8 56589', N'Công', N'0967934058', N'Hồ Chí Minh', N'Đã định giá bán', 11800000, CAST(N'2020-07-01 15:58:13.850' AS DateTime), N'Xe máy', CAST(N'2020-07-01 21:03:19.597' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (50, N'BX2007007', NULL, N'Lý', N'0945612397', N'Bình Dương', N'Đã định giá bán', 1100000, CAST(N'2020-07-01 15:59:18.350' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 21:02:47.730' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (51, N'BX2007008', N'95-D5 96912', N'Duyên', N'0923154126', N'Hồ Chí Minh', N'Đã định giá bán', 13800000, CAST(N'2020-07-01 16:01:09.227' AS DateTime), N'Xe máy', CAST(N'2020-07-01 21:04:05.957' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (52, N'BX2007009', N'56-D5 67012', N'Nguyệt', N'0934129695', N'Hồ Chí Minh', N'Đã định giá bán', 8900000, CAST(N'2020-07-01 16:02:20.810' AS DateTime), N'Xe máy', CAST(N'2020-07-01 21:04:18.247' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (53, N'BX2007010', NULL, N'Dũng', N'0945213958', N'Hồ Chí Minh', N'Đã định giá bán', 1100000, CAST(N'2020-07-01 16:02:56.390' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 21:03:44.187' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (54, N'BX2007011', NULL, N'Tiên', N'0934129583', N'Hồ Chí Minh', N'Đã định giá bán', 1000000, CAST(N'2020-07-01 16:03:20.433' AS DateTime), N'Xe đạp', CAST(N'2020-07-01 21:04:33.987' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (55, N'BX2007012', N'44-D5 98126', N'Nam', N'0124195839', N'Hồ Chí Minh', N'Đã định giá bán', 14000000, CAST(N'2020-07-01 16:03:46.833' AS DateTime), N'Xe máy', CAST(N'2020-07-01 21:04:49.297' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (56, N'BX2007013', N'45-D5 99812', N'Thành', N'0912398495', N'Hồ Chí Minh', N'Đã mua', 10200000, CAST(N'2020-07-01 16:04:38.363' AS DateTime), N'Xe máy', CAST(N'2020-07-01 23:55:49.677' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (57, N'BX2007014', N'45-D5 45529', N'Phú', N'0912349869', N'Hồ Chí Minh', N'Đã mua', 12400000, CAST(N'2020-07-01 16:05:12.940' AS DateTime), N'Xe máy', CAST(N'2020-07-01 23:56:27.880' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (58, N'BX2007015', N'45-D5 99184', N'Kiên', N'0923598014', N'Bình Dương', N'Đã mua', 13400000, CAST(N'2020-07-01 19:50:16.637' AS DateTime), N'Xe máy', CAST(N'2020-07-01 23:56:51.147' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (59, N'BX2007016', N'45-D5 96958', N'Tánh', N'0945981024', N'Bình Chánh', N'Đã mua', 15800000, CAST(N'2020-07-01 19:51:00.790' AS DateTime), N'Xe máy', CAST(N'2020-07-01 23:57:01.193' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (60, N'BX2007017', N'56-D5 93459', N'Cường', N'0923451989', N'Biên Hòa', N'Đã mua', 8200000, CAST(N'2020-07-01 19:51:43.627' AS DateTime), N'Xe máy', CAST(N'2020-07-02 00:02:28.503' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (61, N'BX2007018', N'56-D5 91124', N'Linh', N'0912419498', N'Hồ Chí Minh', N'Đã mua', 7800000, CAST(N'2020-07-01 19:52:29.167' AS DateTime), N'Xe máy', CAST(N'2020-07-02 00:02:40.613' AS DateTime))
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (62, N'BX2007019', N'89-D5 98293', N'Thu', N'0903492049', N'Hồ Chí Minh', N'Đã kiểm tra', 0, CAST(N'2020-07-01 19:53:21.480' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (63, N'BX2007020', N'89-D5 94893', N'Vân', N'0945829458', N'Hồ Chí Minh', N'Đã kiểm tra', 0, CAST(N'2020-07-01 19:54:02.880' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (64, N'BX2007021', NULL, N'Trân', N'0904294849', N'Hồ Chí Minh', N'Đã kiểm tra', 0, CAST(N'2020-07-01 19:54:41.333' AS DateTime), N'Xe đạp', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (65, N'BX2007022', N'45-D5 99343', N'Tùng', N'0903492849', N'Hồ Chí Minh', N'Đã kiểm tra', 0, CAST(N'2020-07-01 19:55:22.740' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (66, N'BX2007023', N'48-D5 69385', N'Khoa', N'0904294895', N'Thủ Đức', N'Đã kiểm tra', 0, CAST(N'2020-07-01 19:55:56.900' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (67, N'BX2007024', N'54-D5 59239', N'Thiên', N'0934389395', N'Hồ Chí Minh', N'Mới tạo', 0, CAST(N'2020-07-01 23:00:40.890' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (68, N'BX2007025', N'55-D5 56129', N'Long', N'0950249569', N'Hồ Chí Minh', N'Mới tạo', 0, CAST(N'2020-07-01 23:03:00.450' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (69, N'BX2007026', N'59-D5 68274', N'Khang', N'0958388427', N'Hồ Chí Minh', N'Mới tạo', 0, CAST(N'2020-07-01 23:03:51.277' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (70, N'BX2007027', N'45-D5 69846', N'Thịnh', N'0945938684', N'Hồ Chí Minh', N'Mới tạo', 0, CAST(N'2020-07-01 23:04:28.337' AS DateTime), N'Xe máy', NULL)
INSERT [dbo].[BM_ThongTinXeBan] ([Id_xe], [Ma_so_xe], [Bien_so_xe], [Ten_KH_Ban], [SDT], [Dia_chi], [Trang_Thai], [Gia_ban], [Ngay_tao], [Loai_xe], [Ngay_mua]) VALUES (71, N'BX2007028', N'54-D5 56924', N'Phúc', N'0956836926', N'Hồ Chí Minh', N'Mới tạo', 0, CAST(N'2020-07-01 23:05:11.613' AS DateTime), N'Xe máy', NULL)
SET IDENTITY_INSERT [dbo].[BM_ThongTinXeBan] OFF
ALTER TABLE [dbo].[BM_DinhGia_Ban]  WITH CHECK ADD  CONSTRAINT [FK_BM_DinhGia_Ban_BM_ThongTinXeBan] FOREIGN KEY([Id_xe])
REFERENCES [dbo].[BM_ThongTinXeBan] ([Id_xe])
GO
ALTER TABLE [dbo].[BM_DinhGia_Ban] CHECK CONSTRAINT [FK_BM_DinhGia_Ban_BM_ThongTinXeBan]
GO
ALTER TABLE [dbo].[BM_DinhGia_MuaXe]  WITH CHECK ADD  CONSTRAINT [FK_BM_DinhGia_MuaXe_BM_ThongTinXeBan] FOREIGN KEY([Id_xe])
REFERENCES [dbo].[BM_ThongTinXeBan] ([Id_xe])
GO
ALTER TABLE [dbo].[BM_DinhGia_MuaXe] CHECK CONSTRAINT [FK_BM_DinhGia_MuaXe_BM_ThongTinXeBan]
GO
ALTER TABLE [dbo].[BM_GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK_BM_GiaoDich_BM_ThongTinKhachHang] FOREIGN KEY([Id_KH])
REFERENCES [dbo].[BM_ThongTinKhachHang] ([Id_KH])
GO
ALTER TABLE [dbo].[BM_GiaoDich] CHECK CONSTRAINT [FK_BM_GiaoDich_BM_ThongTinKhachHang]
GO
ALTER TABLE [dbo].[BM_GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK_BM_GiaoDich_BM_ThongTinXeBan] FOREIGN KEY([Id_xe])
REFERENCES [dbo].[BM_ThongTinXeBan] ([Id_xe])
GO
ALTER TABLE [dbo].[BM_GiaoDich] CHECK CONSTRAINT [FK_BM_GiaoDich_BM_ThongTinXeBan]
GO
ALTER TABLE [dbo].[BM_ThongTin_SuaChua]  WITH CHECK ADD  CONSTRAINT [FK_BM_ThongTin_SuaChua_BM_ThongTinXeBan] FOREIGN KEY([Id_xe])
REFERENCES [dbo].[BM_ThongTinXeBan] ([Id_xe])
GO
ALTER TABLE [dbo].[BM_ThongTin_SuaChua] CHECK CONSTRAINT [FK_BM_ThongTin_SuaChua_BM_ThongTinXeBan]
GO
/****** Object:  StoredProcedure [dbo].[BM_CUSTOMER_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_CUSTOMER_DETAILS]
	-- Add the parameters for the stored procedure here
	@Year int, @Month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select A.Id_KH,A.Ho_ten,A.Dia_chi,A.Ma_KH,A.SDT,A.Trang_thai,A.Yeu_cau from BM_ThongTinKhachHang A
	LEFT JOIN BM_GiaoDich B ON A.Id_KH=B.Id_KH
	WHERE (YEAR(A.Thoi_gian)=@Year OR @Year=-1) AND (Month(A.Thoi_gian)=@Month OR @Month=-1) AND (A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã mua')
 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_CUSTOMER_MENU]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_CUSTOMER_MENU]
	-- Add the parameters for the stored procedure here
	@SanPham NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select MONTH(A.Thoi_gian) Pmonth, YEAR(A.Thoi_gian) PYear from BM_ThongTinKhachHang A
	LEFT JOIN BM_GiaoDich B ON A.Id_KH=B.Id_KH
	WHERE A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã mua'
	GROUP BY MONTH(A.Thoi_gian) , YEAR(A.Thoi_gian) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_DINHGIA_MENU]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_DINHGIA_MENU]
	-- Add the parameters for the stored procedure here
	@SanPham NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select MONTH(A.Ngay_tao) Pmonth, YEAR(A.Ngay_tao) PYear from BM_ThongTinXeBan A
	LEFT JOIN BM_ThongTin_SuaChua B ON A.Id_xe=B.Id_xe
	LEFT JOIN BM_DinhGia_Ban C ON A.Id_xe=B.Id_xe
	WHERE (A.Trang_Thai=N'Đã mua' OR A.Trang_Thai=N'Sửa chữa' OR A.Trang_Thai=N'Đã định giá bán')
	GROUP BY MONTH(A.Ngay_tao) , YEAR(A.Ngay_tao) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_DINHGIA_MUA_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_DINHGIA_MUA_DETAILS]
	-- Add the parameters for the stored procedure here
	@Year INT, @Month INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select A.Id_xe,B.Id_kiemTra,ISNULL(B.Gia_thap_nhat,0)Gia_thap_nhat,IsNULL(B.Gia_cao_nhat,0)Gia_cao_nhat,A.Trang_Thai,A.Loai_xe,B.Trang_thai TinhTrang, A.Ma_so_xe from BM_ThongTinXeBan A
	LEFT JOIN BM_DinhGia_MuaXe B ON A.Id_xe=B.Id_xe
	WHERE (A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã kiểm tra' )
	AND (MONTH(A.Ngay_tao)=@Month OR @Month=-1) AND( YEAR(A.Ngay_tao) =@Year OR @Year=-1)
	--GROUP BY MONTH(A.Ngay_tao) , YEAR(A.Ngay_tao) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_DINHGIA_MUA_MENU]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_DINHGIA_MUA_MENU]
	-- Add the parameters for the stored procedure here
	@SanPham NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select MONTH(A.Ngay_tao) Pmonth, YEAR(A.Ngay_tao) PYear from BM_ThongTinXeBan A
	LEFT JOIN BM_DinhGia_MuaXe B ON A.Id_xe=B.Id_xe
	WHERE (A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã kiểm tra')
	GROUP BY MONTH(A.Ngay_tao) , YEAR(A.Ngay_tao) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_INFORTECHNICAL__MENU]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_INFORTECHNICAL__MENU]
	-- Add the parameters for the stored procedure here
	@SanPham NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select MONTH(A.Ngay_tao) Pmonth, YEAR(A.Ngay_tao) PYear from BM_ThongTinXeBan A
	LEFT JOIN BM_ThongTin_SuaChua B ON A.Id_xe=B.Id_xe
	WHERE A.Trang_Thai=N'Đã mua' OR A.Trang_Thai=N'Sửa chữa'
	GROUP BY MONTH(A.Ngay_tao) , YEAR(A.Ngay_tao) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_INFORTECHNICAL_MAIN]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_INFORTECHNICAL_MAIN]
	-- Add the parameters for the stored procedure here
	@Year INT, @Month INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Id_xe,A.Ma_so_xe,A.Loai_xe, SUM(ISNULL(B.Chi_phi,0)) TongChiPhi, MAX(B.Thoi_gian) ThoiGian,A.Trang_Thai FROM BM_ThongTinXeBan A
	LEFT JOIN BM_ThongTin_SuaChua B ON A.Id_xe=B.Id_xe --AND (YEAR(A.Ngay_tao)=@Year OR @Year=-1) AND (MONTH(A.Ngay_tao)=@Month Or @Month=-1)
	WHERE (YEAR(A.Ngay_tao)=@Year OR @Year=-1) AND (MONTH(A.Ngay_tao)=@Month Or @Month=-1) AND  (A.Trang_Thai=N'Đã mua' OR A.Trang_Thai=N'Sửa chữa')
	GROUP BY A.Ma_so_xe,A.Loai_xe,A.Id_xe,A.Trang_Thai
END


GO
/****** Object:  StoredProcedure [dbo].[BM_KHACHHANG_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_KHACHHANG_DETAILS]
	-- Add the parameters for the stored procedure here
	@Nam INT, @Thang INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROm BM_ThongTinKhachHang A
	WHERE (YEAR(A.Thoi_gian)=@Nam or @Nam=-1) 
	AND (Month(A.Thoi_gian)=@Thang OR @Thang=-1)
END


GO
/****** Object:  StoredProcedure [dbo].[BM_LISTPRODUCT_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_LISTPRODUCT_DETAILS]
	-- Add the parameters for the stored procedure here
	@Year int, @Month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select A.Id_xe,A.Loai_xe,A.Bien_so_xe,A.Ma_so_xe,A.Ten_KH_Ban,A.SDT,ISNULL(A.Gia_ban,0) Gia_ban, A.Dia_chi,
		B.Id_kiemTra,ISNULL(B.Gia_cao_nhat,0) Gia_cao_nhat,ISNULL(B.Gia_thap_nhat,0) Gia_thap_nhat,A.Trang_Thai FROM BM_ThongTinXeBan A
		LEFT JOIN BM_DinhGia_MuaXe B ON A.Id_xe=B.Id_xe
		WHERE (A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã kiểm tra' OR A.Trang_Thai=N'Đã mua')
		AND (YEAR(A.Ngay_tao)=@Year OR @Year=-1) AND (Month(A.Ngay_tao)=@Month OR @Month=-1)
		--GROUP BY MONTH(A.Ngay_tao) , YEAR(A.Ngay_tao) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_LISTPRODUCT_MENU]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_LISTPRODUCT_MENU]
	-- Add the parameters for the stored procedure here
	@SanPham NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select MONTH(A.Ngay_tao) Pmonth, YEAR(A.Ngay_tao) PYear from BM_ThongTinXeBan A
	LEFT JOIN BM_DinhGia_MuaXe B ON A.Id_xe=B.Id_xe
	WHERE A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã kiểm tra' OR A.Trang_Thai=N'Đã mua'
	GROUP BY MONTH(A.Ngay_tao) , YEAR(A.Ngay_tao) 
END


GO
/****** Object:  StoredProcedure [dbo].[BM_REPORT_BUY_SELL]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_REPORT_BUY_SELL] 
	-- Add the parameters for the stored procedure here
	@Day int, @Year int, @Month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Id_xe,A.Loai_xe, N'Đã mua' AS Trang_Thai, A.Gia_ban GiaMua,0 Gia_ban,A.Ma_so_xe  FROM BM_ThongTinXeBan A
WHERE A.Trang_Thai<>N'Đã giao dịch' AND  A.Trang_Thai<>N'Mới tạo' AND (DAY(A.Ngay_mua)=@Day OR @Day =-1) AND  (Year(A.Ngay_mua)=@Year OR @Year =-1) AND  (Month(A.Ngay_mua)=@Month OR @Month =-1)
UNION
SELECT A.Id_xe,A.Loai_xe,A.Trang_Thai, A.Gia_ban GiaMua,B.Gia_ban,A.Ma_so_xe  FROM BM_ThongTinXeBan A
INNER JOIN BM_GiaoDich B ON A.Id_xe=B.Id_xe AND (DAY(B.Thoi_gian)=@Day OR @Day =-1) AND  (Year(B.Thoi_gian)=@Year OR @Year =-1) AND  (Month(B.Thoi_gian)=@Month OR @Month =-1)
WHERE A.Trang_Thai=N'Đã giao dịch'
END


GO
/****** Object:  StoredProcedure [dbo].[BM_REPORT_BUY_SELL_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_REPORT_BUY_SELL_DETAILS]
	-- Add the parameters for the stored procedure here
	@Day int, @Year int, @Month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Id_xe,A.Loai_xe, N'Đã mua' AS Trang_Thai, A.Gia_ban GiaMua,0 Gia_ban,A.Ma_so_xe, ISNULL(SUM(C.Chi_phi),0) ChiPhi, 0 LoiNhuan  FROM BM_ThongTinXeBan A
	LEFT JOIN BM_ThongTin_SuaChua C ON C.Id_xe=A.Id_xe
WHERE A.Trang_Thai<>N'Đã giao dịch' AND  A.Trang_Thai<>N'Mới tạo' AND (DAY(A.Ngay_mua)=@Day OR @Day =-1) AND  (Year(A.Ngay_mua)=@Year OR @Year =-1) AND  (Month(A.Ngay_mua)=@Month OR @Month =-1)
GROUP BY A.Id_xe,A.Loai_xe, A.Gia_ban ,A.Ma_so_xe
UNION
SELECT A.Id_xe,A.Loai_xe,A.Trang_Thai, A.Gia_ban GiaMua,B.Gia_ban,A.Ma_so_xe, ISNULL(SUM(C.Chi_phi),0) ChiPhi, B.Gia_ban-(A.Gia_ban+ISNULL(SUM(C.Chi_phi),0)) LoiNhuan  FROM BM_ThongTinXeBan A
LEFT JOIN BM_ThongTin_SuaChua C ON C.Id_xe=A.Id_xe
INNER JOIN BM_GiaoDich B ON A.Id_xe=B.Id_xe AND (DAY(B.Thoi_gian)=@Day OR @Day =-1) AND  (Year(B.Thoi_gian)=@Year OR @Year =-1) AND  (Month(B.Thoi_gian)=@Month OR @Month =-1)
WHERE A.Trang_Thai=N'Đã giao dịch'
GROUP BY  A.Id_xe,A.Loai_xe,A.Trang_Thai, A.Gia_ban ,B.Gia_ban,A.Ma_so_xe
END


GO
/****** Object:  StoredProcedure [dbo].[BM_REPORT_BUY_SELL_DETAILS_EACH]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_REPORT_BUY_SELL_DETAILS_EACH]
	-- Add the parameters for the stored procedure here
	@IdXe Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT A.Id_xe,A.Loai_xe,A.Trang_Thai, A.Gia_ban GiaMua,B.Gia_ban,A.Ma_so_xe, ISNULL(SUM(C.Chi_phi),0) ChiPhi, B.Gia_ban-(A.Gia_ban+ISNULL(SUM(C.Chi_phi),0)) LoiNhuan  FROM BM_ThongTinXeBan A
LEFT JOIN BM_ThongTin_SuaChua C ON C.Id_xe=A.Id_xe
INNER JOIN BM_GiaoDich B ON A.Id_xe=B.Id_xe 
WHERE A.Id_xe=@IdXe
GROUP BY  A.Id_xe,A.Loai_xe,A.Trang_Thai, A.Gia_ban ,B.Gia_ban,A.Ma_so_xe
END


GO
/****** Object:  StoredProcedure [dbo].[BM_SELLPRODUCT_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_SELLPRODUCT_DETAILS]
	-- Add the parameters for the stored procedure here
	@Year int, @Month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select A.Id_KH,A.Ho_ten,A.Dia_chi,A.Ma_KH,A.SDT,A.Trang_thai,A.Yeu_cau,B.Id_xe,B.Gia_ban,C.Bien_so_xe,C.Ma_so_xe,C.Loai_xe,B.Id_ban from BM_ThongTinKhachHang A
	LEFT JOIN BM_GiaoDich B ON A.Id_KH=B.Id_KH
	LEFT JOIN BM_ThongTinXeBan C ON C.Id_xe=B.Id_xe
	WHERE (YEAR(A.Thoi_gian)=@Year OR @Year=-1) AND (Month(A.Thoi_gian)=@Month OR @Month=-1) AND (A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã mua')
	--WHERE A.Trang_Thai=N'Mới tạo' OR A.Trang_Thai=N'Đã mua' AND (YEAR(A.Thoi_gian)=@Year OR @Year=-1) AND (Month(A.Thoi_gian)=@Month OR @Month=-1)
END


GO
/****** Object:  StoredProcedure [dbo].[BM_THONGTINXE_DINHGIA]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_THONGTINXE_DINHGIA]
	-- Add the parameters for the stored procedure here
	@Id_xe INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Id_xe,A.Loai_xe,  A.Ma_so_xe,A.Gia_ban,SUM(ISNULL(B.Chi_phi,0)) ChiPhi FROM BM_ThongTinXeBan A
LEFT JOIN BM_ThongTin_SuaChua B ON A.Id_xe=B.Id_xe
WHERE A.Id_xe=@Id_xe
GROUP BY A.Id_xe,A.Loai_xe,  A.Ma_so_xe,A.Gia_ban
END


GO
/****** Object:  StoredProcedure [dbo].[BM_THONGTINXE_DINHGIA_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_THONGTINXE_DINHGIA_DETAILS]
	-- Add the parameters for the stored procedure here
	@Year INT, @Month INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Id_xe,A.Loai_xe,  A.Ma_so_xe,A.Gia_ban,SUM(ISNULL(B.Chi_phi,0)) ChiPhi,IsNULL(C.Dinh_gia,0) Dinh_gia,A.Trang_Thai,C.Id_gia_ban FROM BM_ThongTinXeBan A
LEFT JOIN BM_ThongTin_SuaChua B ON A.Id_xe=B.Id_xe
LEFT JOIN BM_DinhGia_Ban C ON A.Id_xe=C.Id_xe
WHERE (MONTH(A.Ngay_tao)=@Month OR @Month=-1) AND (YEAR(A.Ngay_tao)=@Year OR @Year=-1) AND (A.Trang_Thai=N'Đã mua' OR A.Trang_Thai=N'Sửa chữa' OR A.Trang_Thai=N'Đã định giá bán')
GROUP BY A.Id_xe,A.Loai_xe,  A.Ma_so_xe,A.Gia_ban,C.Dinh_gia ,A.Trang_Thai,C.Id_gia_ban
END


GO
/****** Object:  StoredProcedure [dbo].[BM_XACNHANMUAXE_DETAILS]    Script Date: 05/07/2020 10:31:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BM_XACNHANMUAXE_DETAILS]
	-- Add the parameters for the stored procedure here
	 @Id_xe INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Id_xe,A.Ma_so_xe,B.Gia_cao_nhat,B.Gia_thap_nhat,A.Ngay_mua, A.Gia_ban,A.Loai_xe FROM BM_ThongTinXeBan A
	INNER JOIN BM_DinhGia_MuaXe B ON A.Id_xe=B.Id_xe And A.Id_xe=@Id_xe
END


GO
USE [master]
GO
ALTER DATABASE [QuanLyMuaBanXe] SET  READ_WRITE 
GO
