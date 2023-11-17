create database QLBH_NHOM6;
use QLBH_NHOM6;

-- Bang khach hang
create table khachhang(
	makhachhang varchar(10) primary key,
	hoten nvarchar(255) not null,
	diachi nvarchar(255) not null,
	namsinh int,
	gioitinh int,
	sdt varchar(10)
	)
	go
-- Bang nhan vien
create table nhanvien(
	manhanvien varchar(10) primary key,
	hoten nvarchar(255) not null,
	diachi nvarchar(255) not null,
	namsinh int not null,
	gioitinh int not null,
	sdt varchar(10)
	)
	go
create table hoadon(
	mahoadon varchar(10) primary key,
	ngaytao date not null,
	makhachhang varchar(10),
	manhanvien varchar(10),
	tongtien float not null,
	trangthai nvarchar(50) not null,
	foreign key (makhachhang) references khachhang(makhachhang),
	foreign key (manhanvien) references nhanvien(manhanvien)
)

go
create table danhmuc(
	madanhmuc varchar(10) primary key,
	tendanhmuc nvarchar(255) not null
)
go

create table sanpham(
    masanpham varchar(10) primary key,
	tensanpham nvarchar(255) not null,
	soluongotn int not null,
	giaban float not null,
	madanhmuc varchar(10),
	trangthai nvarchar(50) not null,
	mausac nvarchar(50) not null,
	ngaytao date,
	foreign key (madanhmuc) references danhmuc(madanhmuc)
)
go
create table hoadonchitiet(
    masanpham varchar(10),
	mahoadon varchar(10),
	soluong int not null,
	dongia float not null,
	ngaytao date not null,
	foreign key (masanpham) references sanpham(masanpham),
	foreign key (mahoadon) references hoadon(mahoadon)
)
go

INSERT INTO khachhang (makhachhang, hoten, diachi, namsinh, gioitinh, sdt)
VALUES 
    ('KH001', 'John Doe', '123 Main Street', 1990, 1, '1234567890'),
    ('KH002', 'Jane Smith', '456 Park Avenue', 1985, 0, '9876543210'),
    ('KH003', 'Mike Johnson', '789 Elm Road', 1995, 1, '4567890123'),
    ('KH004', 'Emily Davis', '321 Oak Lane', 1992, 0, '7890123456'),
    ('KH005', 'David Wilson', '654 Pine Street', 1988, 1, '2345678901');
	go
	INSERT INTO nhanvien (manhanvien, hoten, diachi, namsinh, gioitinh, sdt)
VALUES 
    ('NV001', 'Sarah Johnson', '123 Main Street', 1987, 0, '1234567890'),
    ('NV002', 'Michael Brown', '456 Park Avenue', 1992, 1, '9876543210'),
    ('NV003', 'Jessica Smith', '789 Elm Road', 1990, 0, '4567890123'),
    ('NV004', 'Christopher Lee', '321 Oak Lane', 1985, 1, '7890123456'),
    ('NV005', 'Jennifer Davis', '654 Pine Street', 1989, 0, '2345678901');
	go
	INSERT INTO hoadon (mahoadon, ngaytao, makhachhang, manhanvien, tongtien, trangthai)
VALUES 
    ('HD001', '2023-10-01', 'KH001', 'NV001', 100.50, 'Completed'),
    ('HD002', '2023-10-02', 'KH002', 'NV002', 75.25, 'Pending'),
    ('HD003', '2023-10-03', 'KH003', 'NV003', 50.00, 'Completed'),
    ('HD004', '2023-10-04', 'KH004', 'NV004', 120.75, 'Completed'),
    ('HD005', '2023-10-05', 'KH005', 'NV005', 90.30, 'Pending');
	go
	INSERT INTO danhmuc (madanhmuc, tendanhmuc)
VALUES 
    ('DM001', 'Electronics'),
    ('DM002', 'Clothing'),
    ('DM003', 'Home Appliances'),
    ('DM004', 'Books'),
    ('DM005', 'Sports Equipment');
	go
	INSERT INTO sanpham (masanpham, tensanpham, soluongotn, giaban, madanhmuc, trangthai, mausac, ngaytao)
VALUES 
    ('SP001', 'Laptop', 10, 1500.00, 'DM001', 'Available', 'Silver', '2023-10-01'),
    ('SP002', 'T-shirt', 50, 25.99, 'DM002', 'Available', 'Red', '2023-10-02'),
    ('SP003', 'Refrigerator', 5, 800.00, 'DM003', 'Out of Stock', 'White', '2023-10-03'),
    ('SP004', 'Novel', 20, 12.50, 'DM004', 'Available', 'Blue', '2023-10-04'),
    ('SP005', 'Football', 30, 19.99, 'DM005', 'Available', 'Yellow', '2023-10-05');
	go
 INSERT INTO hoadonchitiet (masanpham, mahoadon, soluong, dongia, ngaytao)
VALUES
    ('SP001', 'HD001', 2, 3000.00, '2023-10-01'),
    ('SP002', 'HD001', 1, 2500.00, '2023-10-01'),
    ('SP003', 'HD002', 3, 1500.00, '2023-10-02'),
    ('SP004', 'HD002', 2, 2000.00, '2023-10-02'),
    ('SP005', 'HD003', 1, 5000.00, '2023-10-03');

select *from khachhang
select *from nhanvien
select *from hoadon
select *from danhmuc
select *from sanpham
select *from hoadonchitiet

