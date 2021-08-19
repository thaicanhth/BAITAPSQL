-- Tạo CSDL Bai1_IT20A3B
create database Bai1_IT20A3B
go
-- Mở CSDL Bai1_IT20A3B
use Bai1_IT20A3B
go
-- Tạo bảng KHACHHANG
create table  KHACHHANG
(
	MAKH			int identity primary key,
	HOTENKH		nvarchar(100),
	DIENTHOAI	varchar(15),
	DIACHI			nvarchar(100)
)
-- Nhập dữ liệu cho bảng KHACHHANG
insert into KHACHHANG 
values(N'Nguyễn Văn Anh','0905123123', N'Đà Nẵng')
insert into KHACHHANG 
values(N'Nguyễn Văn Tuấn','0905123124', N'Đà Nẵng')
insert into KHACHHANG 
values(N'Nguyễn Văn Cảnh','0905123125', N'Đà Nẵng')
-- Hiển thị dữ liệu
select * from KHACHHANG

-- 2. Tạo bảng MATHANG
create table MATHANG
(
	MAMH			int identity primary key,
	TENMH			nvarchar(50) not null,
	DVT				nvarchar(20),
	SOLUONG		int
)
-- Nhập dữ liệu cho bảng MATHANG
insert into MATHANG values(N'Sắt 6', 'Kg', 2000)
insert into MATHANG values(N'Sắt 8', 'Kg', 2000)
insert into MATHANG values(N'Xi măng', 'Bao',1000)
-- Hiển thị dữ liệu 
 select * from MATHANG

 -- 3. Tạo bảng MUA
 create  table MUA
 (
	MAKH		int foreign key references KHACHHANG(MAKH),
	MAMH		int foreign key references MATHANG(MAMH),
	SOLUONG int,
	DONGIA		float,
	constraint KhoaChinh_Mua primary key(MAKH, MAMH)
 )
  -- Nhập dữ liệu cho bảng MUA
  insert into MUA values(1, 1, 100, 16000)
  insert into MUA values(1, 3, 10, 70000)

  select * from KHACHHANG
  select * from MATHANG
  
  -- Hiển thị dữ liệu của bảng MUA
  select * from Mua

  -- Câu c:
  -- Liệt kê Mã khách hàng, Họ tên khách hàng, Số lượng, Đơn giá 
  -- của những khách hàng mua mặt hàng Xi măng

  select a.MAKH, a.HOTENKH, b.SOLUONG, b.DONGIA
  from KHACHHANG a, MUA b, MATHANG c
  where c.TENMH=N'Xi măng'
  and a.MAKH= b.MAKH
  and    b.MAMH= c.MAMH