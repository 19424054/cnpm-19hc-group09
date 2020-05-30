USE [master]
GO
/****** Object:  Database [QuanLyMuaBanXe]    Script Date: 5/30/2020 10:38:51 PM ******/
CREATE DATABASE [QuanLyMuaBanXe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyMuaBanXe', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyMuaBanXe.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyMuaBanXe_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyMuaBanXe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyMuaBanXe] SET COMPATIBILITY_LEVEL = 110
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
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyMuaBanXe', N'ON'
GO
USE [QuanLyMuaBanXe]
GO
/****** Object:  Table [dbo].[BM_DinhGia_Ban]    Script Date: 5/30/2020 10:38:52 PM ******/
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
/****** Object:  Table [dbo].[BM_DinhGia_MuaXe]    Script Date: 5/30/2020 10:38:52 PM ******/
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
/****** Object:  Table [dbo].[BM_GiaoDich]    Script Date: 5/30/2020 10:38:52 PM ******/
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
/****** Object:  Table [dbo].[BM_TaiKhoan]    Script Date: 5/30/2020 10:38:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_TaiKhoan](
	[Id_Tk] [int] IDENTITY(1,1) NOT NULL,
	[tai_khoan] [nchar](50) NULL,
	[mat_khau] [nchar](50) NULL,
	[phan_quyen] [int] NULL,
 CONSTRAINT [PK_BM_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id_Tk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BM_ThongTin_SuaChua]    Script Date: 5/30/2020 10:38:52 PM ******/
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
/****** Object:  Table [dbo].[BM_ThongTinKhachHang]    Script Date: 5/30/2020 10:38:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_ThongTinKhachHang](
	[Id_KH] [int] IDENTITY(1,1) NOT NULL,
	[Ho_ten] [nvarchar](100) NULL,
	[SDT] [nchar](20) NULL,
	[Dia_chi] [nvarchar](250) NULL,
	[Yeu_cau] [nvarchar](max) NULL,
	[Trang_thai] [nvarchar](50) NULL,
	[Ma_KH] [nchar](10) NULL,
	[Thoi_gian] [datetime] NULL,
 CONSTRAINT [PK_BM_ThongTinKhachHang] PRIMARY KEY CLUSTERED 
(
	[Id_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BM_ThongTinXeBan]    Script Date: 5/30/2020 10:38:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM_ThongTinXeBan](
	[Id_xe] [int] IDENTITY(1,1) NOT NULL,
	[Ma_so_xe] [nvarchar](10) NULL,
	[Bien_so_xe] [nchar](20) NULL,
	[Ten_KH_Ban] [nvarchar](100) NULL,
	[SDT] [nchar](20) NULL,
	[Dia_chi] [nvarchar](200) NULL,
	[Trang_Thai] [nvarchar](50) NULL,
	[Gia_ban] [float] NULL,
	[Ngay_tao] [datetime] NULL,
	[Loai_xe] [nvarchar](50) NULL,
 CONSTRAINT [PK_BM_ThongTinXeBan] PRIMARY KEY CLUSTERED 
(
	[Id_xe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
USE [master]
GO
ALTER DATABASE [QuanLyMuaBanXe] SET  READ_WRITE 
GO
