create database carDB;

USE carDB;

truncate tbl_car;

commit;

CREATE TABLE tbl_car (    
		c_no	bigint		PRIMARY KEY	AUTO_INCREMENT,
		c_title	varchar(5),			
		c_ddate	varchar(15),			
		c_dtime	varchar(15),			
		c_ddis	varchar(10),			
		c_edate	varchar(15),			
		c_etime	varchar(15),			
		c_edis	varchar(10),			
		c_place	varchar(50),			
		c_cost	varchar(10)			
);

INSERT into tbl_car(c_title, c_ddate, c_dtime, c_ddis, c_edate,
c_etime, c_edis, c_place, c_cost)
values('출근','2023-07-14','07:29:00','180,000','2023-07-14','08:10:00', '180,022', '학원', '0');
commit;
select * from tbl_car;
select * from tbl_bbs;
select * from tbl_images;
desc tbl_bbs;
use cardb;

use bbsdb;


UPDATE tbl_car
SET c_title = '퇴근',
c_ddate = '',
c_place = '집'
WHERE c_no = '1';


delete from tbl_car WHERE c_no = 6; 

insert into tbl_bbs(b_username)
values('marpol');

-- AUTO_INCREMENT 로 설정된 칼럼의 가장
-- 마지막 INSERT 된 데이터 가져오기
select LAST_INSERT_ID();	

