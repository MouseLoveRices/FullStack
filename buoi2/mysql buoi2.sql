create database BUOI2;
use buoi2;
alter database buoi2
character set utf8mb4
collate utf8mb4_unicode_ci;
create table khachhang(
makh char(4) primary key,
hoten varchar(40),
diachi varchar(50),
sodt varchar(20),
ngsinh date,
ngdk date,
doanhso decimal(15,3)
);

create table nhanvien(
manv char(4) primary key,
hoten varchar(40),
ngvl date,
sodt varchar(40)
);
create table sanpham(
masp char(4) primary key,
tensp varchar(40),
dvt varchar(20),
nuocsx varchar(40),
gia decimal(15,2)
);
create table hoadon(
sohd int primary key,
nghd date,
makh char(4),
manv char(4),
trigia decimal(15,2)	
);
create table cthd(
sohd int,
masp char(4),
sl int,
primary key(sohd,masp)
);

alter table hoadon add constraint FR_HOADON_MAKH foreign key (makh) references khachhang(makh);
alter table hoadon add constraint FR_HOADON_MANV foreign key (manv) references nhanvien(manv);
alter table cthd add constraint FR_CTHD_SOHD foreign key (sohd) references hoadon(sohd);
alter table cthd add constraint FR_CTHD_MASP foreign key (masp) references sanpham(masp);


insert into khachhang(makh,hoten,diachi,sodt,ngsinh,ngdk,doanhso) values ('KH01','Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM','08823451','1960/10/22','2006/07/22','13060000');
insert into khachhang values ('KH02', 'Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM', '0908256478' ,'1974/4/3', '2006-07-30', '280.000');
insert into khachhang values('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980/06/12', '2006-08-05', '3860000');
insert into khachhang value('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965/03/09', '2006-10-02', '250000');
insert into khachhang values('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950/03/10', '2006-10-28', '21000');
insert into khachhang values('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981/12/31', '2006-11-24', '915000');
insert into khachhang values('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971/04/06', '2006-12-01', '12500');
insert into khachhang values('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971/01/10', '2006-12-13', '365000');
insert into khachhang values('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979/09/03', '2007-01-14', '70000');
insert into khachhang values('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983/05/02', '2007-01-16', '67500');


insert into nhanvien values('NV01','Nguyen Nhu Nhut', '2006-4-13', '0927345678');
insert into nhanvien values('NV02','Le Thi Phi Yen','2006-4-21','0987567390');
insert into nhanvien values('NV03','Nguyen Van B', '2006/4/27','0997047382');
insert into nhanvien values('NV04','Ngo Thanh Tuan', '2006/6/24','0913758498');
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh', '2006/7/20','0918590387');

insert into SanPham values ('BC01','But chi','cay','Singapore',3000);
insert into SanPham values ('BC02','But chi','cay','Singapore',5000);
insert into SanPham values ('BC03','But chi','cay','Viet Nam',3500);
insert into SanPham values ('BC04','But chi','hop','Viet Nam',30000);
insert into SanPham values ('BB01','But bi','cay','Viet Nam',5000);
insert into SanPham values ('BB02','But bi','cay','Trung Quoc',7000);
insert into SanPham values ('BB03','But bi','hop','Thai Lan',100000);
insert into SanPham values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500);
insert into SanPham values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500);
insert into SanPham values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000);
insert into SanPham values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500);
insert into SanPham values ('TV05','Tap 100 trang','chuc','Viet Nam',23000);
insert into SanPham values ('TV06','Tap 200 trang','chuc','Viet Nam',53000);
insert into SanPham values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000);
insert into SanPham values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000);
insert into SanPham values ('ST02','So tay loai 1','quyen','Viet Nam',55000);
insert into SanPham values ('ST03','So tay loai 2','quyen','Viet Nam',51000);
insert into SanPham values ('ST04','So tay','quyen','Thai Lan',55000);
insert into SanPham values ('ST05','So tay mong','quyen','Thai Lan',20000);
insert into SanPham values ('ST06','Phan viet bang','hop','Viet Nam',5000);
insert into SanPham values ('ST07','Phan khong bui','hop','Viet Nam',7000);
insert into SanPham values ('ST08','Bong bang','cai','Viet Nam',1000);
insert into SanPham values ('ST09','But long','cay','Viet Nam',5000);
insert into SanPham values ('ST10','But long','cay','Trung Quoc',7000);

insert into HoaDon values (1001,'2006/07/23','KH01','NV01',320000);
insert into HoaDon values (1002,'2006/08/12','KH01','NV02',840000);
insert into HoaDon values (1003,'2006/08/23','KH02','NV01',100000);
insert into HoaDon values (1004,'2006/09/01','KH02','NV01',180000);
insert into HoaDon values (1005,'2006/10/20','KH01','NV02',3800000);
insert into HoaDon values (1006,'2006/10/16','KH01','NV03',2430000);
insert into HoaDon values (1007,'2006/10/28','KH03','NV03',510000);
insert into HoaDon values (1008,'2006/10/28','KH01','NV03',440000); 
insert into HoaDon values (1009,'2006/10/28','KH03','NV04',200000);
insert into HoaDon values (1010,'2006/11/01','KH01','NV01',5200000);
insert into HoaDon values (1011,'2006/11/04','KH04','NV03',250000);
insert into HoaDon values (1012,'2006/11/30','KH05','NV03',21000);
insert into HoaDon values (1013,'2006/12/12','KH06','NV01',5000);
insert into HoaDon values (1014,'2006/12/31','KH03','NV02',3150000);
insert into HoaDon values (1015,'2007/01/01','KH06','NV01',910000);
insert into HoaDon values (1016,'2007/01/01','KH07','NV02',12500);
insert into HoaDon values (1017,'2007/01/02','KH08','NV03',35000);
insert into HoaDon values (1018,'2007/01/13','KH08','NV03',330000);
insert into HoaDon values (1019,'2007/01/13','KH01','NV03',30000);
insert into HoaDon values (1020,'2007/01/14','KH09','NV04',70000);
insert into HoaDon values (1021,'2007/01/16','KH10','NV03',67500);
insert into HoaDon values (1022,'2007/01/16',Null,'NV03',7000);
insert into HoaDon values (1023,'2007/01/17',Null,'NV01',330000);

insert into CTHD values (1001,'TV02',10);
insert into CTHD values (1001,'ST01',5);
insert into CTHD values (1001,'BC01',5);
insert into CTHD values (1001,'BC02',10);
insert into CTHD values (1001,'ST08',10);
insert into CTHD values (1002,'BC04',20);
insert into CTHD values (1002,'BB01',20);
insert into CTHD values (1002,'BB02',20);
insert into CTHD values (1003,'BB03',10);
insert into CTHD values (1004,'TV01',20);
insert into CTHD values (1004,'TV02',10);
insert into CTHD values (1004,'TV03',10);
insert into CTHD values (1004,'TV04',10);
insert into CTHD values (1005,'TV05',50);
insert into CTHD values (1005,'TV06',50);
insert into CTHD values (1006,'TV07',20);
insert into CTHD values (1006,'ST01',30);
insert into CTHD values (1006,'ST02',10);
insert into CTHD values (1007,'ST03',10);
insert into CTHD values (1008,'ST04',8);
insert into CTHD values (1009,'ST05',10);
insert into CTHD values (1010,'TV07',50);
insert into CTHD values (1010,'ST07',50);
insert into CTHD values (1010,'ST08',100);
insert into CTHD values (1010,'ST04',50);
insert into CTHD values (1010,'TV03',100);
insert into CTHD values (1011,'ST06',50);
insert into CTHD values (1012,'ST07',3);
insert into CTHD values (1013,'ST08',5);
insert into CTHD values (1014,'BC02',80);
insert into CTHD values (1014,'BB02',100);
insert into CTHD values (1014,'BC04',60);
insert into CTHD values (1014,'BB01',50);
insert into CTHD values (1015,'BB02',30);
insert into CTHD values (1015,'BB03',7);
insert into CTHD values (1016,'TV01',5);
insert into CTHD values (1017,'TV02',1);
insert into CTHD values (1017,'TV03',1);
insert into CTHD values (1017,'TV04',5);
insert into CTHD values (1018,'ST04',6);
insert into CTHD values (1019,'ST05',1);
insert into CTHD values (1019,'ST06',2);
insert into CTHD values (1020,'ST07',10);
insert into CTHD values (1021,'ST08',5);
insert into CTHD values (1021,'TV01',7);
insert into CTHD values (1021,'TV02',10);
insert into CTHD values (1022,'ST07',1);
insert into CTHD values (1023,'ST04',6);

alter table sanpham add ghichu varchar(20);
alter table khachhang add loaikh tinyint;

alter table sanpham modify ghichu varchar(100);

alter table sanpham drop ghichu;

alter table khachhang modify loaikh enum('Vang lai','Thuong xuyen','Vip');

alter table sanpham modify dvt enum('cay','hop','cai','quyen','chuc') not null;

select *
from sanpham where gia>500;

alter table cthd add constraint CHECK_SoLuong check (sl>0);
alter table khachhang add constraint CHECK_Ngay check (ngdk>ngsinh);
alter table hoadon add constraint CHECK_NgayMua check (nghd>=ngdk);

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select sohd, trigia
from hoadon
where month(nghd)=1 and year(nghd)=2007
order by nghd asc, trigia desc;
-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select k.makh, hoten
from khachhang k, hoadon h
where k.makh=h.makh 
and nghd ='2007/1/1';
-- Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
(select sohd
from cthd 
where masp='BB01')
intersect
(select sohd
from cthd
where masp='BB02')

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
(select masp,tensp
from sanpham
where nuocsx='Trung Quoc')
union
( select s.masp,tensp
from sanpham s, hoadon h, cthd c
where s.masp=c.masp and h.sohd=c.sohd 
and nghd='2007/1/1' )
-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select masp,tensp
from sanpham
where masp not in (
	select masp
    from cthd
)
-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select *
from sanpham 
where masp not in (select masp from cthd where sohd in(select sohd from hoadon where year(nghd)=2006))
-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
select *
from sanpham
where nuocsx='Trung Quoc'
and masp not in (select masp from cthd where sohd in(select sohd from hoadon where year(nghd)=2006))

-- cho biet khach hang nao co so luot mua hang >=3
select makh, count(sohd)
from hoadon
group by makh
having count(*)>=3

-- in ra khach hang co so luot mua hang nhieu nhat
select makh, count(sohd), sum(trigia),avg(trigia),min(trigia), max(trigia)
from hoadon
group by makh
having count(*)>=all(select count(*)
					 from hoadon
                     group by makh)
                       
-- in ra khach hang co so luot mua hang it nhat
select makh, count(sohd), sum(trigia),avg(trigia),min(trigia), max(trigia)
from hoadon
group by makh
having count(*) <= all (select count(*)
						from hoadon
                        group by makh)
                        
-- top 3 khach hang xin nhat nam 2006
select makh, sum(trigia)
from hoadon
where year(nghd)=2006
group by makh
order by sum(trigia)
limit 3

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
select * 
from hoadon
where not exists (
					select *
                    from sanpham
                    where nuocsx='Singapore'
                    and not exists (select * 
									from cthd
                                    where cthd.masp=sanpham.masp
                                    and cthd.sohd=hoadon.sohd)
				)
-- 19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.



-- so sanh cost khi tim thong tin
explain 
analyze
select makh
from khachhang
where diachi like '%Tran Hung Dao%'


-- danh chi muc cho hoten de tim kiem it ton cost hon
create index idx_hoten on khachhang(hoten)

explain 
analyze
select makh
from khachhang
where hoten='Tran Ngoc Han'

explain 
analyze
select makh
from khachhang
where doanhso='280000'

explain
analyze 
select makh
from khackhang
where makh='KH01'



-- 20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select sohd
from hoadon
where makh is null

-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select count(distinct masp) 
from cthd c, hoadon h
where c.sohd = h.sohd
and year(nghd)=2006
-- 22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select max(trigia), min(trigia)
from hoadon
-- 23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(trigia)
from hoadon
where year(nghd)=2006
-- 24. Tính doanh thu bán hàng trong năm 2006.
select sum(trigia)
from hoadon
where year(nghd)=2006
-- 25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select sohd
from hoadon
where year(nghd)=2006
and trigia=(
			select max(trigia)
            from hoadon
            where year(nghd)=2006)
            
-- 26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select makh
from hoadon
where year(nghd)=2006
group by makh
having sum(trigia)>=all(select sum(trigia) from hoadon where year(nghd)=2006 group by makh)
-- 27. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
select makh, hoten
from khachhang
order by doanhso desc
limit 3
-- 28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select masp,tensp
from sanpham sp join (select distinct gia from sanpham order by gia desc limit 3) tmp
where sp.gia=tmp.gia

-- mo ta
	gia
    10
    20
    30
    sanpham
    masp tensp  gia
    01		but1 10
    02		but2 20
    03		but3 30
    04		but4 40
    05		but5 30
    06		but6 50
-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
select masp, tensp
from sanpham sp join (select distinct gia from sanpham order by gia desc limit 3) tmp
where sp.gia=tmp.gia and sp.nuocsx='Thai Lan'
-- 30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select masp, tensp
from sanpham sp join (select distinct gia from sanpham where nuocsx='Trung Quoc' order by gia desc limit 3) tmp
where sp.gia=tmp.gia
and nuocsx='Trung Quoc'

-- 32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select nuocsx, count(*)
from sanpham
where nuocsx='Trung Quoc'
group by nuocsx
-- 33. Tính tổng số sản phẩm của từng nước sản xuất.
select nuocsx, count(*)
from sanpham
group by nuocsx;

-- 34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select nuocsx, max(gia), min(gia), avg(gia)
from sanpham
group by nuocsx;
-- 35. Tính doanh thu bán hàng mỗi ngày
select nghd, sum(trigia)
from hoadon
group by nghd;
-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select nghd, sum(trigia)
from hoadon
where month(nghd)=10 and year(nghd)=2006
group by nghd;
-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(nghd), sum(trigia)
from hoadon
where year(nghd)=2006
group by month(nghd);

-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD, COUNT(DISTINCT MASP) AS so_san_pham_khac_nhau
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4;

-- 39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select sohd
from sanpham s, cthd c
where s.masp=c.masp and nuocsx='Viet Nam'
group by sohd
having count(distinct s.masp)=3;
-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
-- cach 1
select makh,count(*)
from hoadon
group by makh
having count(*)>=all(
					 select count(*)
                     from hoadon
                     group by makh);
-- cach 2
select makh,count(*)
from hoadon
group by makh
having count(*)= (
				  select count(*)
                  from hoadon
                  group by makh
                  order by count(*) desc
                  limit 1) ;
                  
-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select month(nghd), count(*), sum(trigia)
from hoadon
where year(nghd)=2006
group by month(nghd)
having sum(trigia)>=all(
						select sum(trigia)
                        from hoadon
                        where year(nghd)=2006
                        group by month(nghd));
	
-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select c.masp, tensp
from cthd c, hoadon h, sanpham s
where c.sohd=h.sohd and s.masp=c.masp
and year(nghd)=2006
group by masp 
having sum(sl)<=all(
					select sum(sl)
                    from cthd c, hoadon h
                    where c.sohd=h.sohd
                    and year(nghd)=2006
                    group by masp);
-- 43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
-- cach 1
select nuocsx, masp,tensp
from sanpham
where (nuocsx,gia) in (select nuocsx,max(gia) from sanpham group by nuocsx);

-- cach 2
select nuocsx, masp, tensp
from sanpham s1
where gia=(select max(gia) from sanpham s2 where s2.nuocsx=s1.nuocsx);

-- cach 3
select s.nuocsx, masp, tensp
from sanpham s, (select nuocsx, max(gia) as 'maxGia' from sanpham group by nuocsx) tmp
where s.nuocsx=tmp.nuocsx and gia=tmp.maxGia;


-- 44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select nuocsx, count(distinct gia)
from sanpham
group by nuocsx
having count(distinct gia)>=3;

-- 45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
-- (select k1.makh from khachhang k1 join (select*from khachhang order by doanhso desc limit 10) k2 where k1.makh=k2.makh) chon ra khach hang trong top 10 doanh thu
select makh, count(*)
from hoadon
where makh in (select k1.makh from khachhang k1 join (select*from khachhang order by doanhso desc limit 10) k2 where k1.makh=k2.makh)
group by makh
having count(*)>= all(
					  select count(*)
                      from hoadon
                      where makh in (select k1.makh from khachhang k1 join (select*from khachhang order by doanhso desc limit 10) k2 where k1.makh=k2.makh)
                      group by makh)