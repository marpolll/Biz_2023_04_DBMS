 -- 여기는 root 화면
 
 /*
	mySQL 프로젝트 시작
    1. database 생성
    2. 사용자 등록
		DB 서버가 Application 서버와 같은 동일한 운영체제에
        있을때는 사용자 등록이 선택사항이다.
        root 사용자가 등록되어 있는데
        root 사용자는 기본적으로 localhost 에서만 접근이 된다.
        
        만약 네트워크를 통해서 DB 서버에 접근 하거나
        특별히 보안이 요구되는 경우가 아니면
        root 사용자를 일반 DB 사용자로 사용하는 경우가
        많다
 */
 
 CREATE DATABASE todoDB;
 
 USE todoDB;
 SHOW databases;
 
 -- 사용자 등록
 -- 사용자 등록을 할때 접근 할수 있는 범위를 설정해야 한다.
 -- 로컬에서만 접근할수 있는 todo 생성
CREATE USER 'todo'@'localhost'
identified BY '12341234';

-- 로컬 네트워크(192.168.4.1 ~ 192.168.4.254) 에서
-- 현재 System 의 MySQL 에 접속할수 있는 사용자 생성
CREATE USER 'todo'@'192.168.4.%'
identified BY '88888888'; 
 
-- 모든 곳에서 접근할 수 있는 사용자 생성
-- 보안상 가장 위험한 사용자 생성
/*
 무결성 파괴
 만약 이 사용자가 자신의 id 와 비번을 소홀히 하여
 누군가에게 노출된다면, 이 id 와 비번을 통하여
 DB 에 접근하고 DBMS 데이터를 모두 파calendarcalendar괴 할수 있다.
*/
CREATE USER 'todo'@'%'
identified BY '88888888';  
 
-- 현재 등록된 사용자는 MySQl Server 에 접속 할수 있도록
-- 권한을 가지고 있지만 그 외의 나머지 역활은 수행할수 없다.
-- DB 생성, Table 생성등을 수행하려면
-- 권한을 부여해야 한다.
-- GRANT DBA TO user;    오라클에서

-- 아래는 mySQL 에서
-- ALL privileges : DBA 권한
-- *.* : 모든 Database 에 대하여 모든 역활 수행
GRANT ALL privileges ON *.* TO 'todo'@'localhost';

-- 네트워크를 통하여 접근한 todo 사용자에게
-- todoDB 에 대하여 모든 권한을 부여하기
GRANT ALL privileges ON todoDB.* TO 'todo'@'192.168.4.%';

-- todoDB Database 의 tbl_todolist Table 만
-- 접근하는 권한 부여
GRANT ALL privileges ON todoDB.tbl_todolist TO 'todo'@'192.168.4.%';

GRANT CREATE, SELECT, INSERT, UPDATE, DELETE ON todoDB.* TO 'todo'@'192.168.4.%';

DROP USER 'todo'@'localhost';
FLUSH privileges;

 
commit;

DROP TABLE calendar;

CREATE TABLE calendar (
	id integer  AUTO_INCREMENT primary key,
	events JSON
);

insert into calendar(title) values('"책읽기"');
insert into calendar(events) values('"events" : { "title" : "책읽기", "start" : "2023-07-16 00:00:00", "end": "2023-07-28 00:00:00" }');
insert into calendar(events) values('["조깅하기", "2023-07-16 00:00:00", "2023-07-28 00:00:00"]');
insert into calendar(events) values('{ "title" : "책읽기"}');
insert into calendar(id, events) values(2, '["책읽기", "2023-07-16", "2023-07-28"]');

SELECT * FROM calendar;
 
 CREATE DATABASE scoreDB;
 
 use scoreDB;
 
 
 CREATE USER 'korea'@'localhost'
identified BY '!Biz8080';
 
 
 GRANT ALL privileges ON iolistDB.* TO 'korea'@'localhost';
 
 
 drop table tbl_product;
 
 CREATE TABLE tbl_iolist (
	io_seq bigint      PRIMARY KEY AUTO_INCREMENT,
	io_date varchar(10) NOT NULL,        
	io_time varchar(10) NOT NULL,        
	io_pcode    varchar(5)  NOT NULL,        
	io_dcode    varchar(4)  NOT NULL,        
	io_inout    varchar(1)  NOT NULL,        
	io_qty  bigint  NOT NULL,        
	io_iprice   bigint,
	io_oprice   bigint
);

CREATE TABLE tbl_dept (
	d_code  varchar(4)      PRIMARY KEY,
	d_name  varchar(125)    NOT NULL,    
	d_ceo   varchar(50) NOT NULL,    
	d_tel   varchar(20) NOT NULL,    
	d_address   varchar(125)    
);

CREATE TABLE tbl_product (
	p_code  varchar(5)      PRIMARY KEY,
	p_name  varchar(50) NOT NULL,    
	p_iprice    bigint,      
	p_oprice    bigint     
);

insert into tbl_user2 values( 'hong', '홍길동', '010-1111-1111');
insert into tbl_user2 values( 'lee', '이몽룡', '010-2222-2222');
insert into tbl_user2 values( 'leem', '임꺽정', '010-3333-3333');
insert into tbl_user values( '0002', '우', 1000, 3000);
insert into tbl_user values( '0003', '우우리', 1500, 3000);
 
 SELECT * FROM tbl_user
WHERE nickname = '이몽룡';

DELETE FROM tbl_user
WHERE username = 'hong';


UPDATE tbl_user
SET tel = '010-1111-5555'
WHERE username ='hong';

SELECT * FROM tbl_user
ORDER BY username, nickname DESC;

SELECT * FROM tbl_user
WHERE nickname LIKE '%길%'; 
 
 CREATE TABLE tbl_user2 (
	username varchar(125) primary key,
    nickname varchar(125) NOT null,
    tel varchar(20)
);
 
select *
from tbl_iolist
    left join tbl_dept
     ON io_dcode = d_code
     WHERE d_name IS NULL;

select *
from tbl_iolist
    left join tbl_product
     ON io_pcode = p_code
     WHERE p_name IS NULL;
 
 ALTER TABLE tbl_iolist 
ADD CONSTRAINT f_dept
FOREIGN KEY (io_dcode)
REFERENCES tbl_dept(d_code);

ALTER TABLE tbl_iolist 
ADD CONSTRAINT f_product
FOREIGN KEY (io_pcode)
REFERENCES tbl_dept(p_code);

SELECT * FROM tbl_iolist
WHERE io_date BETWEEN ‘2023-03-01’ AND ‘2023-03-31’;

SELECT *
FROM tbl_iolist
WHERE io_inout = 1
  AND io_qty >= 60
  AND io_qty < 70;
  
  DESC tbl_product;
  
  CREATE VIEW view_iolist
AS (
SELECT io_seq, io_date, io_time, io_dcode AS 거래처코드, d_name AS 거래처명, 
	 io_pcode AS 상품코드, p_name AS 상품명, io_inout, io_qty,
	 io_iprice AS 매입단가, io_oprice AS 매출단가
    FROM tbl_iolist
        LEFT JOIN tbl_dept
            ON io_dcode = d_code
        LEFT JOIN tbl_product
            ON io_pcode = p_code
);

drop view view_iolist;


SELECT p_code AS 상품코드, p_name AS 상품명, sum(p_code) AS 레코드수
FROM tbl_product
GROUP BY p_code, p_name;

SELECT io_inout AS 구분, p_code AS 상품코드, p_name AS 상품명, SUM(io_inout*io_qty) AS 수량합계
FROM tbl_iolist, tbl_product
WHERE io_inout = 1
GROUP BY io_inout, p_code, p_name;

SELECT
    io_inout AS 구분,
    tbl_iolist.p_code AS 상품코드,
    tbl_product.p_name AS 상품명,
    SUM(tbl_iolist.io_qty) AS 수량합계
FROM
    tbl_iolist
JOIN
    tbl_product ON tbl_iolist.p_code = tbl_product.p_code
WHERE
    io_inout = 1
GROUP BY
    io_inout, tbl_iolist.p_code, tbl_product.p_name;

SELECT
SUM(io_qty * io_iprice) AS 매입합계
FROM tbl_iolist
WHERE io_inout;


io_inout AS 거래구분, io_iprice AS 매입합계, io_oprice AS 매출합계
