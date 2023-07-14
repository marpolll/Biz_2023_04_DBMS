create database carDB;

USE carDB;

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

c_no,
c_title,
c_ddate,
c_dtime,
c_ddis,
c_edate,
c_etime,
c_edis,
c_place,
c_cost

