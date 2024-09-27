create database kiemtra;
use kiemtra;
alter database kiemtra
character set utf8mb4
collate utf8mb4_unicode_ci;

create table nhapt(
manpt varchar(4) primary key,
tenpt varchar(20),
ngdk date,
soud int
);

create table nguoidung(
mand varchar(5) primary key,
tennd varchar(40),
ngdktv date,
gioitinh enum ('Nam', 'Nữ') not null,
ngsinh date
);

create table ungdung(
maud varchar(5) primary key,
tenud varchar(20),
manpt varchar(4),
ngph date,
dluong decimal(15,2),
loaiud char(15)
);

create table ghinhan(
maud varchar(5),
mand varchar(5),
danhgia int,
dangsd boolean,
primary key (maud, mand)
);

alter table ungdung add constraint FR_UNGDUNG_MANPT foreign key (manpt) references nhapt(manpt);
alter table ghinhan add constraint FR_GHINHAN_MAUD foreign key (maud) references ungdung(maud);
alter table ghinhan add constraint FR_GHINHAN_MAND foreign key (mand) references nguoidung(mand);

-- 3. Hiện thực ràng buộc toàn vẹn: dánh gía nguoi dùng là số nguyên 1-5
alter table ghinhan add constraint CH_DANHGIA check (danhgia>=1 and danhgia <=5);
-- 4. Hiện thực ràng buộc toàn vẹn: số lượng ứng dụng hiẹn có của nhà phát triển bằng tổng số lượng ứng dụng của nhà phát triển đó trên quan hệ ungdung
-- 5. Tìm tất cả các ứng dụng (maud,tenud) của Gameloft phát hành trong năm 2018 
select maud,tenud
from ungdung u
left join nhapt n on u.manpt=n.manpt
where n.tenpt = 'Gameloft' and year(ngph)=2018;

-- 6. Tìm người dùng (mand, tennd) dang khong sử dụng bất kì ứng dụng game nào (các ứng dụng loại khác vẫn dang sử dụng)
select mand,tennd
from nguoidung n
where n.mand not in (
					 select g.mand
                     from ghinhan g, ungdung u
                     where g.maud=u.maud 
                     and u.loaiud='Game' and g.dangsd=true)
and n.mand in (
			   select g.mand
			   from ghinhan g, ungdung u 
               where g.maud = u.maud
               and g.dangsd=true);                     

-- 7. Tìm ứng dụng phát hành năm 2017 có lượt đánh giá là 1 nhiều nhất
select u.maud, u.tenud
from ungdung u
join ghinhan g on u.maud = g.maud
where year(u.ngph) = 2017
group by u.maud
having sum(case when g.danhgia = 1 then 1 else 0 end) = (
    select max(sums.total)
    from (
        select sum(case when g.danhgia = 1 then 1 else 0 end) as total
        from ungdung u
        join ghinhan g on u.maud = g.maud
        where year(u.ngph) = 2017
        group by u.maud
    ) as sums
);   

-- fix
select maud,tenud
from ungdung
where maud in (
				select maud
                from ghinhan
                where danhgia = 1
                and maud in (select maud from ungdung where year(ngph)=2017)
                group by maud
				having count(*)>= all(
									  select count(*)
                                      from ghinhan
                                      where danhgia=1
                                      and maud in (select maud from ungdung where year(ngph)=2017)
                                      group by maud)
                                      );

                                    
-- 8.  Tìm người dùng đã đánh giá 5 cho tất cả các ứng dụng của Facebook
select n.mand, n.tennd
from nguoidung n
where exists (
			  select* 
              from ungdung u,nhapt p, ghinhan g
              where u.manpt=p.manpt 
              and u.maud=g.maud and g.mand=n.mand
              and p.tenpt='Facebook' and g.danhgia=5);
 -- fix
 select distinct mand
 from ghinhan r1
 where danhgia=5
 and not exists (
				 select *
                 from ungdung s
                 where manpt in (select manpt from nhapt where tenpt='Facebook')
                 and not exists (
								 select *
                                 from ghinhan r2
                                 where danhgia=5
                                 and r2.maud=s.maud
                                 and r1.mand=r2.mand));



SET FOREIGN_KEY_CHECKS=0;


SET FOREIGN_KEY_CHECKS=1;

-- Bang Nhapt
insert into nhapt values ('N001','Gameloft','2006-06-20','100');
insert into nhapt values ('N002','KetChapp','2010-07-18','20');
insert into nhapt values ('N003','Facebook','2006-02-27','20');

-- Bang nguoidung
insert into nguoidung values ('ND001','Huynh Cong Khanh','2009-06-17','Nam','1994-05-25');
insert into nguoidung values ('ND002','Nguyen Minh Dat','2010-06-19','Nam','1993-03-22');
insert into nguoidung values ('ND003','Ho Quy Han','2012-10-15','Nữ','1994-02-14');
 
 -- Bang ung dung 
 insert into ungdung values ('UD001','Messenger','N003','2007-02-01','6.5','Chat');
 insert into ungdung values ('UD002','Stack','N002','2017-06-02','42','Game');
 insert into ungdung values ('UD003','Asphalt 8','N001','2018-08-12','1700','Game');
 
 -- Bang ghi nhan
 insert into ghinhan values('UD001','ND001','5',true);
 insert into ghinhan values ('UD002','ND002','4',true);
 insert into ghinhan values ('UD003','ND003','4',true);

