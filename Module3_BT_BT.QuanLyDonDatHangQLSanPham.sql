CREATE DATABASE QuanLySanPham;
USE QuanLySanPham;
create table SanPham(
masp int primary key,
tensp nvarchar(50),
gia double
);
create table HoaDon(
mahd int primary key,
ngaylap date,
tongtien double,
makh int,
foreign key (makh) references KhachHang(makh)
);
create table ChiTietHoaDon(
id int primary key,
mahd int,
masp int,
soluong int,
giaban double,
foreign key (masp) references SanPham(masp),
foreign key (mahd) references HoaDon(mahd)
);
create table KhachHang(
makh int primary key,
tenkh nvarchar(50),
diachi nvarchar(50),
sdt int (10)
);
drop table hoadonchitiet;
drop  table hoadon;
drop table khachhang;
drop table sanpham;
insert into khachhang values (1,'Tuan', 'Cau Giay', 0912345678), (2,'Toan','Ha Noi',0987654321),(3,'Hoang','HaNoi2',0911111111);
insert into sanpham values (1,'Máy Giặt',500),(2,'TiVi',200),(3,'Tủ Lạnh',400);
insert into hoadon values (1, '2006-06-19',300,2),(2,'2006-06-20',500,3),(3,'2006-06-19',600,1);
insert into chitiethoadon values (1,1,3,4,400),(2,2,2,5,200),(3,3,1,3,500);
select * from sanpham,khachhang,hoadon,chitiethoadon ;
/*
6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 19/6/2006 và ngày 20/6/2006. (OK)
7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 6/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần). (XEMLAI)
8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 19/06/2007. (OK)
10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.(XEMLAI)
11. Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”.(OK)
12. Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm “Máy giặt” và “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
17. In ra danh sách các sản phẩm (MASP,TENSP) có giá >300 sản xuất bán được trong năm 2006.
18. Tìm số hóa đơn đã mua tất cả các sản phẩm có giá >200.
19. Tìm số hóa đơn trong năm 2006 đã mua tất cả các sản phẩm có giá <300.
21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
24. Tính doanh thu bán hàng trong năm 2006.
25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
27. In ra danh sách 3 khách hàng (MAKH, HOTEN) mua nhiều hàng nhất (tính theo số lượng).
28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
29. In ra danh sách các sản phẩm (MASP, TENSP) có tên bắt đầu bằng chữ M, có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
32. Tính tổng số sản phẩm giá <300.
33. Tính tổng số sản phẩm theo từng giá.
34. Tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm bắt đầu bằng chữ M.
35. Tính doanh thu bán hàng mỗi ngày.
36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
39. Tìm hóa đơn có mua 3 sản phẩm có giá <300 (3 sản phẩm khác nhau).
40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất?
42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
45. Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
*/
/*6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 19/6/2006 và ngày 20/6/2006.*/
-- Sẽ lấy giữa trong khoảng
select mahd,tongtien,ngaylap as 'Ngày In Hóa Đơn'  from HoaDon where ngaylap  between '2006-06-19' and '2006-06-20' ;
-- Lấy đúng ngày
select mahd,tongtien,ngaylap as 'Ngày In Hóa Đơn' from HoaDon where ngaylap= '2006-06-19' or ngaylap='2006-06-20';
/*7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 6/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).*/
select mahd,tongtien,ngaylap from HoaDon where ngaylap between '2006-06-19' and '2006-06-20' order by tongtien desc ;
select mahd,tongtien,ngaylap from HoaDon where ngaylap between '2006-06-19' and '2006-06-20' order by ngaylap asc ;
-- Hỏi lại đoạn này tại sao between giữa 1.6.2006 tới 31.6.2006 lại k được? 

/*8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 19/06/2007.*/
select khachhang.makh, khachhang.tenkh,HoaDon.ngaylap as 'Ngày Mua Hàng' from khachhang 
inner join HoaDon on khachhang.makh=HoaDon.makh where ngaylap= '2006-06-19';
/*10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.*/
select SanPham.masp, SanPham.tensp from quanlysanpham.sanpham 
inner join chitiethoadon on sanpham.masp= chitiethoadon.masp
inner join HoaDon on hoadon.mahd=chitiethoadon.mahd
inner join KhachHang on khachhang.makh=hoadon.makh
where (khachhang.tenkh like 'Hoang') and (ngaylap between '2006-06-01' and '2006-06-31');
-- Đoạn sau and đang k chạy được?
/*11. Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”*/
select hoadon.mahd,hoadon.ngaylap,hoadon.tongtien,hoadon.makh,sanpham.tensp as 'Sản Phẩm' from hoadon 
inner join chitiethoadon on hoadon.mahd=chitiethoadon.mahd
inner join sanpham on chitiethoadon.masp= sanpham.masp
where (sanpham.tensp like '%Máy giặt%') or (sanpham.tensp like '%Tủ lạnh%');
/*12. Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.*/
