CREATE DATABASE NewQLCHTL
USE [NewQLCHTL]
GO

CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL PRIMARY KEY,
	[TenNCC] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[DiaChi] [nvarchar](200) NULL,
)
GO

CREATE TABLE [dbo].[tblChatLieu](
	[MaChatLieu] [nvarchar](50) NOT NULL PRIMARY KEY,
	[TenChatLieu] [nvarchar](50) NULL,

)
GO

CREATE TABLE [dbo].[tblHang](
	[MaHang] [nvarchar](50) NOT NULL PRIMARY KEY,
	[TenHang] [nvarchar](50) NOT NULL,
	[MaChatLieu] [nvarchar](50) NOT NULL,
	[SoLuong] [float] NOT NULL,
	[DonGiaNhap] [float] NOT NULL,
	[DonGiaBan] [float] NOT NULL,
	[GhiChu] [nvarchar](200) NULL,
	CONSTRAINT [FK_tblHang_tblChatLieu] FOREIGN KEY([MaChatLieu])
	REFERENCES [dbo].[tblChatLieu] ([MaChatLieu])
) 
GO

CREATE TABLE [dbo].[tblKhach](
	[MaKhach] [nvarchar](50) NOT NULL PRIMARY KEY,
	[TenKhach] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
)
GO

CREATE TABLE [dbo].[tblNhanVien](
	[MaNhanVien] [nvarchar](50) NOT NULL PRIMARY KEY,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](15) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
)
GO

CREATE TABLE [dbo].[tblHDBan](
	[MaHDBan] [nvarchar](50) NOT NULL PRIMARY KEY,
	[MaNhanVien] [nvarchar](50) NULL,
	[NgayBan] [datetime] NULL,
	[MaKhach] [nvarchar](50) NULL,
	[TongTien] [float] NULL,
	 CONSTRAINT [FK_tblHDBan_tblNhanVien] FOREIGN KEY([MaNhanVien])
	REFERENCES [dbo].[tblNhanVien] ([MaNhanVien]),
	CONSTRAINT [FK_tblHDBan_tblKhach] FOREIGN KEY([MaKhach])
	REFERENCES [dbo].[tblKhach] ([MaKhach])
)
GO

CREATE TABLE [dbo].[tblChiTietHDBan](
	[MaHDBan] [nvarchar](50) NOT NULL,
	[MaHang] [nvarchar](50) NOT NULL,
	[SoLuong] [float] NOT NULL,
	[DonGia] [float] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	PRIMARY KEY([MaHDBan], [MaHang]),
	CONSTRAINT [FK_tblChiTietHDBan_tblHang] FOREIGN KEY([MaHang])
	REFERENCES [dbo].[tblHang] ([MaHang]),
	CONSTRAINT [FK_tblChiTietHDBan_tblHDBan] FOREIGN KEY([MaHDBan])
	REFERENCES [dbo].[tblHDBan] ([MaHDBan]),
)
GO

ALTER TABLE [dbo].[tblChiTietHDBan] CHECK CONSTRAINT [FK_tblChiTietHDBan_tblHang]
GO

CREATE TABLE [dbo].[tblQltkAdmin](
	[TenDangNhap] [nvarchar](50) NOT NULL PRIMARY KEY,
	[MatKhau] [nvarchar](50) NULL,

)
GO

CREATE TABLE [dbo].[tblQltkNhanVien](
	[TenDangNhap] [nvarchar](50) NOT NULL PRIMARY KEY,
	[MatKhau] [nvarchar](50) NULL,
)

GO
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212005', N'Kẹo')
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212010', N'Bánh')
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212015', N'Ống')
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212024', N'Ly')
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212031', N'Mỳ')
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212034', N'Hạtttttttttt')
INSERT [dbo].[tblChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'MCL6232022_212042', N'Dầu gội')
GO

INSERT [dbo].[tblHang] ([MaHang], [TenHang], [MaChatLieu], [SoLuong], [DonGiaNhap], [DonGiaBan], [GhiChu]) VALUES (N'HH6252022_191446', N'Kẹo mút', N'MCL6232022_212005', 88, 2000, 3000, N'')
INSERT [dbo].[tblHang] ([MaHang], [TenHang], [MaChatLieu], [SoLuong], [DonGiaNhap], [DonGiaBan], [GhiChu]) VALUES (N'HH6252022_191513', N'Ống nhựa pvc', N'MCL6232022_212015', 100, 10000, 12000, N'')
INSERT [dbo].[tblHang] ([MaHang], [TenHang], [MaChatLieu], [SoLuong], [DonGiaNhap], [DonGiaBan], [GhiChu]) VALUES (N'HH6252022_191537', N'Ly sứ', N'MCL6232022_212024', 83, 10000, 15000, N'')
INSERT [dbo].[tblHang] ([MaHang], [TenHang], [MaChatLieu], [SoLuong], [DonGiaNhap], [DonGiaBan], [GhiChu]) VALUES (N'HH6252022_191600', N'Mỳ omachi', N'MCL6232022_212031', 98, 5000, 6000, N'')
INSERT [dbo].[tblHang] ([MaHang], [TenHang], [MaChatLieu], [SoLuong], [DonGiaNhap], [DonGiaBan], [GhiChu]) VALUES (N'HH6252022_191618', N'Hạt hướng dương', N'MCL6232022_212034', 1000, 5000, 7000, N'')
INSERT [dbo].[tblHang] ([MaHang], [TenHang], [MaChatLieu], [SoLuong], [DonGiaNhap], [DonGiaBan], [GhiChu]) VALUES (N'HH6252022_200355', N'Bánh ngọt', N'MCL6232022_212005', 100, 20000, 25000, N'')
GO

INSERT [dbo].[tblNhanVien] ([MaNhanVien], [TenNhanVien], [GioiTinh], [DiaChi], [DienThoai], [NgaySinh]) VALUES (N'NV6132022_230824', N'Nhân viên B', N'Nam', N'Thủ đức', N'(104) 424-4343', CAST(N'2022-06-13T23:08:24.000' AS DateTime))
INSERT [dbo].[tblNhanVien] ([MaNhanVien], [TenNhanVien], [GioiTinh], [DiaChi], [DienThoai], [NgaySinh]) VALUES (N'NV6132022_230844', N'Nhân viên C', N'Nam', N'Sài gòn', N'(312) 154-1312', CAST(N'2022-06-13T23:08:44.000' AS DateTime))
INSERT [dbo].[tblNhanVien] ([MaNhanVien], [TenNhanVien], [GioiTinh], [DiaChi], [DienThoai], [NgaySinh]) VALUES (N'NV6252022_194509', N'Nhân Viên A', N'Nam', N'Thủ Đức', N'(321) 312-4513', CAST(N'2000-02-16T19:45:09.000' AS DateTime))
GO

INSERT [dbo].[tblKhach] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH6102022_032409', N'Khách D', N'quận 9', N'(321) 321-3213')
INSERT [dbo].[tblKhach] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH6122022_213912', N'Khách hàng C', N'Quận 2', N'(312) 221-5131')
GO

INSERT [dbo].[tblQltkAdmin] ([TenDangNhap], [MatKhau]) VALUES (N'admin1', N'admin')
INSERT [dbo].[tblQltkAdmin] ([TenDangNhap], [MatKhau]) VALUES (N'admin123', N'admin123')
INSERT [dbo].[tblQltkAdmin] ([TenDangNhap], [MatKhau]) VALUES (N'admin2', N'admin2')
GO
INSERT [dbo].[tblQltkNhanVien] ([TenDangNhap], [MatKhau]) VALUES (N'nhanvien2', N'nhanvien2')
INSERT [dbo].[tblQltkNhanVien] ([TenDangNhap], [MatKhau]) VALUES (N'nhanvien3', N'nhanvien3')
GO

INSERT [dbo].[tblHDBan] ([MaHDBan], [MaNhanVien], [NgayBan], [MaKhach], [TongTien]) VALUES (N'HDB6262022_091746', N'NV6132022_230824', CAST(N'2022-06-26T09:17:46.000' AS DateTime), N'KH6102022_032409', 6000)
INSERT [dbo].[tblHDBan] ([MaHDBan], [MaNhanVien], [NgayBan], [MaKhach], [TongTien]) VALUES (N'HDB6262022_115239', N'NV6252022_194509', CAST(N'2022-06-26T11:52:39.000' AS DateTime), N'KH6122022_213912', 213750)
INSERT [dbo].[tblHDBan] ([MaHDBan], [MaNhanVien], [NgayBan], [MaKhach], [TongTien]) VALUES (N'HDB6262022_115739', N'NV6132022_230824', CAST(N'2022-06-26T11:57:39.000' AS DateTime), N'KH6102022_032409', 29400)
INSERT [dbo].[tblHDBan] ([MaHDBan], [MaNhanVien], [NgayBan], [MaKhach], [TongTien]) VALUES (N'HDB6292022_202409', N'NV6132022_230824', CAST(N'2022-06-29T20:24:09.000' AS DateTime), N'KH6122022_213912', 41280)
GO

INSERT [dbo].[tblChiTietHDBan] ([MaHDBan], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB6262022_091746', N'HH6252022_191446', 2, 3000, 0, 6000)
INSERT [dbo].[tblChiTietHDBan] ([MaHDBan], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB6262022_115239', N'HH6252022_191537', 15, 15000, 5, 213750)
INSERT [dbo].[tblChiTietHDBan] ([MaHDBan], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB6262022_115739', N'HH6252022_191446', 10, 3000, 2, 29400)
INSERT [dbo].[tblChiTietHDBan] ([MaHDBan], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB6292022_202409', N'HH6252022_191537', 2, 15000, 2, 29400)
INSERT [dbo].[tblChiTietHDBan] ([MaHDBan], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB6292022_202409', N'HH6252022_191600', 2, 6000, 1, 11880)
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BCDoanhThu]
@NgayBan datetime
as
select c.MaHDBan, c.MaHang, TenHang, c.SoLuong, DonGiaNhap, DonGiaBan, GiamGia, ThanhTien
from tblHDBan as a, tblHang as b, tblChiTietHDBan as c
where b.MaHang = c.MaHang and a.MaHDBan = c.MaHDBan and NgayBan >= @NgayBan
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dangNhap](
	@Loai	varchar(20),
	@TenDangNhap	nvarchar(50),
	@MatKhau	nvarchar(50)
	
)
as
begin
	if @Loai = 'QL' 
			select * from tblQltkAdmin where TenDangNhap = @TenDangNhap and MatKhau = @MatKhau

		 else 
			select * from tblQltkNhanVien where TenDangNhap = @TenDangNhap and MatKhau = @MatKhau
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectAllNV]
as
begin
	select * from tblQltkNhanVien
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllChatLieu]
as
select * from tblChatLieu
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllHang]
as
select * from tblHang
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllHDBan]
as
select * from tblHDBan
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllKhach]
as
select * from tblKhach
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllNhanVien]
as
select * from tblNhanVien
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SuaChatLieu]
@MaChatLieu nvarchar(50),
@TenChatLieu nvarchar(50)
as
Update tblChatLieu
set TenChatLieu = @TenChatLieu
where MaChatLieu = @MaChatLieu
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SuaKhachHang]
@MaKhach nvarchar(10),
@TenKhach nvarchar(50),
@DiaChi nvarchar(50),
@DienThoai nvarchar(50)
as
update tblKhach
set 
TenKhach = @TenKhach,
DiaChi = @DiaChi,
DienThoai = @DienThoai
where MaKhach = @MaKhach
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SuaNhanVien]
@MaNhanVien nvarchar(50),
@TenNhanVien nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi nvarchar(50),
@DienThoai nvarchar(15),
@NgaySinh datetime
as
update tblNhanVien
set 
TenNhanVien = @TenNhanVien,
GioiTinh = @GioiTinh,
DiaChi = @DiaChi,
DienThoai = @DienThoai,
NgaySinh = @NgaySinh
where MaNhanVien = @MaNhanVien
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemChatLieu]
@MaChatLieu nvarchar(50),
@TenChatLieu nvarchar(50)
as
insert into tblChatLieu(MaChatLieu,TenChatLieu)
values(@MaChatLieu,@TenChatLieu)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemHang]
@MaHang nvarchar(50),
@TenHang nvarchar(50),
@MaChatLieu nvarchar(50),
@SoLuong float,
@DonGiaNhap float,
@DonGiaBan float,
@GhiChu nvarchar(200)
as
insert into tblHang(MaHang,TenHang,MaChatLieu,SoLuong,DonGiaNhap,DonGiaBan,GhiChu)
VALUEs(@MaHang,@TenHang,@MaChatLieu,@SoLuong,@DonGiaNhap,@DonGiaBan,@GhiChu)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemKhachHang]
@MaKhach nvarchar(10),
@TenKhach nvarchar(50),
@DiaChi nvarchar(50),
@DienThoai nvarchar(50)
as
insert into tblKhach(MaKhach,TenKhach,DiaChi,DienThoai)
values(@MaKhach,@TenKhach,@DiaChi,@DienThoai)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemNhanVien]
@MaNhanVien nvarchar(50),
@TenNhanVien nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi nvarchar(50),
@DienThoai nvarchar(15),
@NgaySinh datetime
as
insert into tblNhanVien(MaNhanVien,TenNhanVien,GioiTinh,DiaChi,DienThoai,NgaySinh)
values(@MaNhanVien,@TenNhanVien,@GioiTinh,@DiaChi,@DienThoai,@NgaySinh)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaChatLieu]
@MaChatLieu nvarchar(50)
as
Delete tblChatLieu
where MaChatLieu = @MaChatLieu
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaKhachHang]
@MaKhach nvarchar (10)
as
delete from tblKhach
where MaKhach = @MaKhach
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaNhanVien]
@MaNhanVien nvarchar (50)
as
delete from tblNhanVien
where MaNhanVien = @MaNhanVien
GO