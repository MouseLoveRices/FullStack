create database buoi3;
use buoi3;
alter database buoi3
character set utf8mb4
collate utf8mb4_unicode_ci;

create table nhanvien(
honv varchar(15),
tenlot varchar(15),
tenv varchar(15),
manv varchar(9) primary key,
ngsinh datetime,
dchi varchar(30),
phai enum('Nam','Nữ') not null,
luong decimal(15,2),
ma_nql varchar(9),
phg int
);

create table dean(
tenda varchar(15),
mada int primary key,
ddiem_da varchar(15),
phong int
);

create table congviec(
mada int,
stt int,
ten_cong_viec varchar(50),
primary key(mada,stt)
);

create table phongban(
tenphg varchar(15),
maphg int primary key,
trphg varchar(9),
ng_nhanchuc datetime
);

create table phancong(
ma_nvien varchar(9),
mada int,
stt int,
thoigian decimal(15,2),
primary key (ma_nvien, mada, stt)
);

create table diadiem_phg(
maphg int,
diadiem varchar(15),
primary key(maphg, diadiem)
);

create table thannhan(
ma_nvien varchar(9),
tentn varchar(15),
phai enum('Nam','Nữ') not null,
ngsinh datetime,
quanhe varchar(15),
primary key (ma_nvien, tentn)
);

alter table nhanvien add constraint FR_NHANVIEN_MAPHG foreign key (phg) references phongban(maphg);
alter table nhanvien add constraint FR_NHANVIENC_MANQL foreign key (ma_nql) references nhanvien(manv);

alter table phongban add constraint FR_PHONGBAN_TRPG foreign key (trphg) references nhanvien(manv);

alter table dean add constraint FR_DEAN_PHONG foreign key (phong)  references phongban(maphg);

alter table diadiem_phg add constraint FR_DIADIEM_PHG foreign key (maphg) references phongban(maphg);

alter table thannhan add constraint FR_THANNHAN_MANVIEN foreign key (ma_nvien) references nhanvien(manv);

alter table phancong add constraint FR_PHANCONG_MANVIEN foreign key (ma_nvien) references nhanvien(manv);
alter table phancong add constraint FR_PHANCONG_MADA foreign key (mada) references congviec(mada);
CREATE INDEX idx_congviec_stt ON congviec(stt);
alter table phancong add constraint FR_PHANCONG_STT foreign key (stt) references congviec(stt);

alter table congviec add constraint FR_CONGVIEC_MADA foreign key (mada) references dean(mada);



-- 1. Tìm các nhân viên làm việc ở phòng số 4
select *
from nhanvien 
where phg=4;
-- 2. Tìm các nhân viên có mức lương trên 30000
select *
from nhanvien 
where luong>30000;
-- 3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5
select * 
from nhanvien
where (luong>25000 and phg =4 ) or (luong>30000 and phg=5);
-- 4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
select honv, tenlot, tenv, dchi
from nhanvien 
where dchi like '%Tp HCM%';
-- 5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select honv, tenlot, tenv
from nhanvien 
where honv like 'N%';
-- 6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien
select honv, tenlot, tenv, ngsinh, dchi
from nhanvien 
where honv='Đinh' and tenlot='Bá' and tenv='Tiên';
-- 7. Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
select honv, tenlot, tenv, ngsinh
from nhanvien
where year(ngsinh) between 1960 and 1965;
-- 8. Cho biết các nhân viên và năm sinh của nhân viên
select honv, tenlot, tenv,year(ngsinh)
from nhanvien;
-- 9. Cho biết các nhân viên và tuổi của nhân viên
select honv, tenlot, tenv, round(datediff(curdate(), ngsinh)/365,0) as days
from nhanvien;
-- 10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
select tenphg, diadiem
from phongban p, diadiem_phg d
where p.maphg=d.maphg;
-- 11. Tìm tên những người trưởng phòng của từng phòng ban
SELECT honv, tenlot, tenv,p.tenphg
FROM phongban p, nhanvien n
where p.trphg=n.manv;
-- 12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu".
select honv, tenlot, tenv, dchi
from nhanvien n, phongban p
where p.maphg=n.phg and tenphg='Nghiên cứu';
-- 13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
select ddiem_da, tenda, tenphg, honv,tenlot, tenv, ng_nhanchuc
from diadiem_phg d, phongban p, dean de, nhanvien n
where d.maphg=p.maphg and de.phong=p.maphg and n.manv=p.trphg and ddiem_da='Hà Nội';
-- 14. Tìm tên những nữ nhân viên và tên người thân của họ
select honv, tenlot, tenv, n.phai, tentn
from nhanvien n, thannhan t
where n.manv=t.ma_nvien and n.phai='Nữ';
-- 15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select n1.honv,n1.tenlot,n1.tenv, n2.honv,n2.tenlot,n2.tenv
from nhanvien n1
left join nhanvien n2 on n2.manv=n1.ma_nql;

-- 16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
select concat(n1.honv," ",n1.tenlot," ",n1.tenv) as 'Nhan Vien', concat(n2.honv," ",n2.tenlot," ",n2.tenv) as 'Truong Phong',concat(n3.honv," ",n3.tenlot," ",n3.tenv) as 'Quan Ly'
from nhanvien n1, nhanvien n2, nhanvien n3, phongban p
WHERE n1.phg = p.maphg
  AND p.trphg = n2.manv
  AND n1.ma_nql = n3.manv;

-- 17. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X" và nhân viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
select n1.honv, n1.tenlot, n1.tenv, tenda
from nhanvien n1, nhanvien n2, phongban p, dean d
where p.maphg=d.phong and tenda='Sản phẩm X'  and n2.ma_nql=005;
-- 18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.
select tenda
from phancong p, nhanvien n, dean d
where p.ma_nvien=n.manv and d.mada=p.mada and concat(honv," ",tenlot," ",tenv) = "Đinh Bá Tiến";

-- 19. Cho biết số lượng đề án của công ty
select count(*)
from dean;
-- 20. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
select count(*)
from phongban p left join dean d on p.maphg=d.phong 
where tenphg="Nghiên Cứu";
-- 21. Cho biết lương trung bình của các nữ nhân viên
select avg(luong)
from nhanvien 
where phai ='Nữ';
-- 22. Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'
select count(*)
from nhanvien n, thannhan t
where n.manv=t.ma_nvien and concat(honv,' ',tenlot,' ',tenv)='Đinh Bá Tiến';
-- 23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
select tenda, group_concat(concat(honv,' ', tenlot,' ',tenv) separator ', ') as "Nhan vien tham gia", sum(thoigian) as "Tong thoi gian"
from dean d
left join phancong p on d.mada=p.mada
left join nhanvien n on n.manv=p.ma_nvien
group by tenda ;

-- 24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
select mada, group_concat(concat(honv,' ',tenlot,' ',tenv) separator ', '), count(manv)
from phancong p
left join nhanvien n on p.ma_nvien=n.manv
group by mada;
-- 25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
select concat(honv,' ',tenlot,' ',tenv), count(ma_nvien)
from nhanvien n
left join thannhan t on n.manv=t.ma_nvien
group by manv;

-- 26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
select concat(honv,' ',tenlot,' ', tenv), count(mada)
from nhanvien n
left join phancong p on n.manv=p.ma_nvien
group by manv;
-- 27. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
select concat(n1.honv,' ',n1.tenlot,' ',n1.tenv), count(n2.manv)
from nhanvien n1
left join nhanvien n2 ON n1.ma_nql = n2.manv
group by n1.ma_nql, n1.honv,n1.tenlot,n1.tenv ;
-- 28. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
select tenphg, avg(luong)
from  phongban p
left join nhanvien n on p.maphg=n.phg
group by tenphg;
-- 29. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select tenphg, count(manv), avg(luong)
from phongban p
left join nhanvien n on p.maphg=n.phg
group by tenphg
having avg(luong)>30000;
-- 30. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
select tenphg, count(mada)
from phongban p
left join dean d on p.maphg=d.phong
group by tenphg;
-- 31. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì
select tenphg, concat(honv,' ',tenlot,' ',tenv), count(mada)
from phongban p
left join nhanvien n on p.trphg=n.manv
left join dean d on p.maphg=d.phong
group by tenphg, honv,tenlot,tenv;
-- 32. Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.
select tenphg, count(mada), avg(luong)
from phongban p
left join dean d on p.maphg=d.phong
left join nhanvien n on p.maphg=phg
group by tenphg
having avg(luong)>40000;
-- nen group by bang maphg

-- 33. Cho biết số đề án diễn ra tại từng địa điểm
select ddiem_da, count(mada)
from dean
group by ddiem_da;

-- 34. Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.
select tenda, count(ten_cong_viec)
from dean d
left join congviec c on d.mada=c.mada
group by tenda;
-- nen group by mada

-- 35. Với mỗi công việc trong đề án có mã đề án là 30, cho biết số lượng nhân viên được phân công.
select mada, count(ma_nvien) as "so luong nvien"
from phancong p
group by mada
having mada=30;

select mada, count(*)
from phancong
where mada=30
group by stt;
-- 36. Với mỗi công việc trong đề án có mã đề án là 'Dao Tao', cho biết số lượng nhân viên được phân công.
select mada, stt, count(*)
from phancong
where mada = (select mada from dean where tenda = 'Đào tạo')
group by mada, stt;

-- 37. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là 'Đinh' hoặc có người trưởng phòng chủ trì đề án với họ (HONV) là 'Đinh'.
select mada
from phancong
where ma_nvien in (select manv from nhanvien where honv like 'Đinh')
union
select mada
from dean d, phongban p
where d.phong=p.maphg
and trphg in (select manv from nhanvien where honv like 'Đinh');
-- 38. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
select concat(honv,' ',tenlot,' ',tenv), count(ma_nvien)
from thannhan t
left join nhanvien n on t.ma_nvien=n.manv
group by manv
having count(ma_nvien)>2;

-- 39. Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào.
select concat(honv,' ',tenlot,' ',tenv)
from nhanvien n
where manv not in(
				  select ma_nvien
                  from thannhan
                  group by ma_nvien
                  having count(ma_nvien)>=1);

-- 40. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
select concat(honv,' ',tenlot,' ',tenv)
from nhanvien n
left join phongban p on n.manv=p.trphg
where trphg  in (
				select ma_nvien 
                from thannhan
                group by ma_nvien
                having count(ma_nvien) >=1);

-- 41. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
select honv
from nhanvien n 
left join phongban p on n.manv=p.trphg
where trphg not in (
				select ma_nvien
                from thannhan 
                group by ma_nvien
                having count(ma_nvien) >=1);
-- 42. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu"
select concat(HONV,' ', TENLOT,' ', TENV)
from nhanvien
where luong > (
				select avg(luong)
                from phongban p
                left join nhanvien n on p.maphg=n.phg
                group by tenphg
                having tenphg='Nghiên cứu');
-- 43. Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
select phg, count(phg)
from nhanvien
group by phg

select tenphg, concat(n.honv,' ',n.tenlot,' ',n.tenv), count(phg)
from nhanvien n
right join phongban p on p.trphg=n.manv
group by phg
-- 44. Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
select p.mada
from dean d
left join phancong p on d.mada=p.mada 
where p.mada not in (
						select mada
                        from phancong
                        where ma_nvien=009);                        
			
-- 45. Cho biết danh sách các công việc (tên công việc) trong đề án 'Sản phẩm X' mà nhân viên có mã là 009 chưa làm.
select ten_cong_viec
from congviec c
left join phancong p on c.mada=p.mada and c.stt=p.stt
where c.mada not in (
						select mada
                        from phancong);
-- 46. Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ
-- trực thuộc lại không tọa lạc ở thành phố 'TP HCM' .
select concat(honv,' ',tenlot,' ', tenv), dchi
from nhanvien n
left join dean d on n.phg=d.phong
where ddiem_da='TP HCM';
-- 47. Tổng quát câu 16, tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó.


-- dis-activate khoa ngoai de insert dữ liệu
SET FOREIGN_KEY_CHECKS=0;

-- kích hoạt lại khi insert xong
SET FOREIGN_KEY_CHECKS=1;

-- BANG NHANVIEN
insert into nhanvien values('Đinh','Bá','Tiên','009','1960-02-11','119 Cống Quỳnh, Tp HCM','Nam','30000','005','5');
insert into nhanvien values('Nguyễn','Thanh','Tùng','005','1962-08-20','222 Nguyễn Văn Cừ, Tp HCM','Nam','40000','006','5');
insert into nhanvien values('Bùi','Ngọc','Hằng','007','1954-03-11','332 Nguyễn Thái Học, Tp HCM','Nam','25000','001','4');
insert into nhanvien values('Lê','Quỳnh','Như','001','1967-02-01','291 Hồ Văn Huê, Tp HCM','Nữ','43000','006','4');
insert into nhanvien values('Nguyễn','Mạnh','Hùng','004','1967-03-04','95 Bà Rịa, Vũng Tàu','Nam','38000','005','5');
insert into nhanvien values('Trần','Thanh','Tâm','003','1957-05-04','34 Mai Thị Lự, Tp HCM','Nam','25000','005','5');
insert into nhanvien values('Trần','Hồng','Quang','008','1967-09-01','80 Lê Hồng Phong, Tp HCM','Nam','25000','001','4');
insert into nhanvien values('Phạm','Văn','Vinh','006','1965-01-01','45 Trưng Vương, Hà Nội','Nữ','55000','','1');

-- BANG PHONG BAN
insert into phongban values('Nghiên cứu','5','005','1978-05-22');
insert into phongban values('Điều hành','4','008','1985-01-01');
insert into phongban values('Quản lý','1','006','1971-06-19');

-- BANG THANNHAN
insert into thannhan values('005','Trinh','Nữ','1976-04-05','Con gái');
insert into thannhan values('005','Khang','Nam','1973-10-25','Con trai');
insert into thannhan values('005','Phương','Nữ','1948-05-03','Vợ chồng');
insert into thannhan values('001','Minh','Nam','1932-02-29','Vợ chồng');
insert into thannhan values('009','Tiến','Nam','1978-01-01','Con trai');
insert into thannhan values('009','Châu','Nữ','1978-12-30','Con gái');
insert into thannhan values('009','Phương','Nữ','1957-05-05','Vợ chồng');

-- BANG DEAN
insert into dean values('Sản phẩm X','1','Vũng Tàu','5');
insert into dean values('Sản phẩm Y','2','Nha Trang','5');
insert into dean values('Sản phẩm Z','3','TP HCM','5');
insert into dean values('Tin học hoá','10','Hà Nội','4');
insert into dean values('Cáp quang','20','TP HCM','1');
insert into dean values('Đào tạo','30','Hà Nội','4');

-- BANG DIADIEM_PHG
insert into DIADIEM_PHG values ('1','TP HCM');
insert into DIADIEM_PHG values ('4','Hà Nội');
insert into DIADIEM_PHG values ('5','TAU');
insert into DIADIEM_PHG values ('5','NHA TRANG');
insert into DIADIEM_PHG values ('5','TP HCM');


-- PHAN CONG
insert into PHANCONG values ('009','1','1','32');
insert into PHANCONG values ('009','2','2','8');
insert into PHANCONG values ('004','3','1','40');
insert into PHANCONG values ('003','1','2','20.0');
insert into PHANCONG values ('003','2','1','20.0');
insert into PHANCONG values ('008','10','1','35');
insert into PHANCONG values ('008','30','2','5');
insert into PHANCONG values ('001','30','1','20');
insert into PHANCONG values ('001','20','1','15');
insert into PHANCONG values ('006','20','1','30');
insert into PHANCONG values ('005','3','1','10');
insert into PHANCONG values ('005','10','2','10');
insert into PHANCONG values ('005','20','1','10');
insert into PHANCONG values ('007','30','2','30');
insert into PHANCONG values ('007','10','2','10');


-- CONG VIEC
insert into CONGVIEC values ('1','1','Thiết kế sản phẩm X');
insert into CONGVIEC values ('1','2','Thử nghiệm sản phẩm X');
insert into CONGVIEC values ('2','1','Sản xuất sản phẩm Y');
insert into CONGVIEC values ('2','2','Quảng cáo sản phẩm Y');
insert into CONGVIEC values ('3','1','Khuyến mãi sản phẩm Z');
insert into CONGVIEC values ('10','1','Tin học hoá phòng nhân sự');
insert into CONGVIEC values ('10','2','Tin học hoá phòng kinh doanh');
insert into CONGVIEC values ('20','1','Lắp đặt cáp quang');
insert into CONGVIEC values ('30 ','1','Đào tạo nhân viên Marketing');
insert into CONGVIEC values ('30 ','2','Đào tạo chuyên viên thiết kế');





