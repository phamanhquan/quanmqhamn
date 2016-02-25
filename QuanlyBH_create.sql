-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-01-23 11:13:37.259
create database QLBH




-- tables
-- Table: ChiTietHoaDon
CREATE TABLE ChiTietHoaDon (
    MaSP char(10)  NOT NULL,
    MaHD char(10)  NOT NULL,
    Soluong char(10)  NOT NULL,
    DonGia money  NOT NULL,
    MACTHD char(10)  NOT NULL,
    CONSTRAINT ChiTietHoaDon_pk PRIMARY KEY  (MACTHD)
)
;





-- Table: HoaDon
CREATE TABLE HoaDon (
    MaHD char(10)  NOT NULL,
    Makh char(10)  NOT NULL,
    NgayLap datetime  NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY  (MaHD)
)
;





-- Table: KhachHang
CREATE TABLE KhachHang (
    Makh char(10)  NOT NULL,
    TenKH nvarchar(200)  NOT NULL,
    DiaChi nvarchar(200)  NOT NULL,
    SDT int  NOT NULL,
    CONSTRAINT KhachHang_pk PRIMARY KEY  (Makh)
)
;





-- Table: MaLSP
CREATE TABLE MaLSP (
    TenSP nvarchar(200)  NOT NULL,
    MaLSP char(10)  NOT NULL,
    CONSTRAINT MaLSP_pk PRIMARY KEY  (MaLSP)
)
;





-- Table: SanPham
CREATE TABLE SanPham (
    MaSP char(10)  NOT NULL,
    Soluong varchar(200)  NOT NULL,
    MaLSP char(10)  NOT NULL,
    Mota varchar(200)  NOT NULL,
    TenSP varchar(200)  NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY  (MaSP)
)
;









-- foreign keys
-- Reference:  ChiTietHoaDon_HoaDon (table: ChiTietHoaDon)

ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_HoaDon 
    FOREIGN KEY (MaHD)
    REFERENCES HoaDon (MaHD)
;

-- Reference:  ChiTietHoaDon_SanPham (table: ChiTietHoaDon)

ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_SanPham 
    FOREIGN KEY (MaSP)
    REFERENCES SanPham (MaSP)
;

-- Reference:  HoaDon_KhachHang (table: HoaDon)

ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_KhachHang 
    FOREIGN KEY (Makh)
    REFERENCES KhachHang (Makh)
;

-- Reference:  SanPham_MaLSP (table: SanPham)

ALTER TABLE SanPham ADD CONSTRAINT SanPham_MaLSP 
    FOREIGN KEY (MaLSP)
    REFERENCES MaLSP (MaLSP)
;





-- End of file.
--chendulieu bang khachhang
DELETE FROM dbo.KhachHang
insert into dbo.KhachHang values(N'Makh1',N'Nguyen Van A',N'Cau Giay',01626331760)
insert into dbo.KhachHang values(N'Makh2',N'Nguyen Van B',N'Tu Liem',01626331760)
insert into dbo.KhachHang values(N'Makh3',N'Nguyen Van C',N'Dong Da',01626331760)
insert into dbo.KhachHang values(N'Makh4',N'Nguyen Van D',N'Cau Giay',01626331760)
insert into dbo.KhachHang values(N'Makh5',N'Nguyen Van E',N'Tu Liem',01626331760)
select * from dbo.KhachHang
--chendulieu bang hoadon
DELETE FROM dbo.HoaDon
insert into dbo.HoaDon values(N'MaHD1',N'Makh1',01/01/2015)
insert into dbo.HoaDon values(N'MaHD2',N'Makh2',01/01/2015)
insert into dbo.HoaDon values(N'MaHD3',N'Makh3',01/01/2015)
insert into dbo.HoaDon values(N'MaHD4',N'Makh4',01/01/2015)
insert into dbo.HoaDon values(N'MaHD5',N'Makh5',01/01/2015)
SELECT * FROM dbo.HoaDon
--chendulieu bang Maloaisp
DELETE FROM dbo.MaLSP
insert into dbo.MaLSP values(N'AO',N'MaLSP1')
insert into dbo.MaLSP values(N'QUAN',N'MaLSP2')
insert into dbo.MaLSP values(N'GIAY',N'MaLSP3')
insert into dbo.MaLSP values(N'DEP',N'MaLSP4')
insert into dbo.MaLSP values(N'TAT',N'MaLSP5')
select * from dbo.MaLSP
--chendulieu bang sanpham
DELETE FROM dbo.SanPham
insert into dbo.SanPham values(N'MaSP1',N'1',N'MaLSP1',N'dep',N'AO')
insert into dbo.SanPham values(N'MaSP2',N'2',N'MaLSP2',N'phongcach',N'AO')
insert into dbo.SanPham values(N'MaSP3',N'3',N'MaLSP3',N'noibat',N'TAT')
insert into dbo.SanPham values(N'MaSP4',N'4',N'MaLSP4',N'thoitran',N'GIAY')
insert into dbo.SanPham values(N'MaSP5',N'5',N'MaLSP5',N'xau',N'QUAN')
SELECT * FROM dbo.SanPham
--chendulieu bang chitiethoadon
DELETE FROM dbo.ChiTietHoaDon
insert into dbo.ChiTietHoaDon values(N'MaSP1',N'MaHD1',N'1',100000,N'MACTHD1')
insert into dbo.ChiTietHoaDon values(N'MaSP2',N'MaHD2',N'2',200000,N'MACTHD2')
insert into dbo.ChiTietHoaDon values(N'MaSP3',N'MaHD3',N'3',300000,N'MACTHD3')
insert into dbo.ChiTietHoaDon values(N'MaSP4',N'MaHD4',N'4',400000,N'MACTHD4')
insert into dbo.ChiTietHoaDon values(N'MaSP5',N'MaHD5',N'5',500000,N'MACTHD5')
SELECT * FROM dbo.ChiTietHoaDon



