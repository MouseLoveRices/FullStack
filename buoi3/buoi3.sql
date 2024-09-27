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





