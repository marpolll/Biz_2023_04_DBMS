-- 이 화면은 root 화면

/*
	MySQL 은 DataBase 라는 Schema 를 통하여 물리적인 DB 를 관리한다.
    Oracle 은 TableSpace 라는 물리적 저장소와 연결한 사용자를 통하여
		DB 을 관리한다.
	
    현업에서 가장 많이 사용하는 2가지의 DBMS 을 서로 비교하므로써
    데이터베이스에 대한 이론을 정리해보자
	
    Oracle 에서는 사용자가 Schema 가 되며
	MySQL 사용자는 DBMS, 물리적저장소 등에 접근하는 권한을 가진 사용자 개념이다.
*/
-- 프로젝트 시작을 하기 위하여 DataBase 을 생성
create database addrDB;
SHOW databases;

-- MySQL 에서는 사용자로 로그인한 후 
-- Schema(DataBase)에 접속하는 절차가 필요하다
USE addrDB;

-- addrDB 에 접속한 상태가 된다.
CREATE TABLE tbl_address (
    a_id	VARCHAR(5)		PRIMARY KEY,
    a_name	nVARCHAR(20)	NOT NULL,	
    a_tel	VARCHAR(15)	NOT NULL,	
    a_addr	nVARCHAR(125)	NOT NULL	
);

DESC tbl_address;

/*
	BIGINT type 의 PK 칼럼
		보통 기본 데이터로 PK 를 생성할수 없을 경우
		별도의 칼럼을 생성하고 그 칼럼에 일련번호 속성을 부여하여
        PK 로 만든다 이때 PK 의 값은 무한히 커질수 있으므로
        INT 형보다 상당히 큰 BIGINT type 으로 설정한다.
        
	AUTO_INCREMENT 속성
		MySQL 에서는 일련번호 칼럼에 대하여 자동값 증가 생성 속성이 있다.
        PK 칼럼에만 이 속성을 부여 할수 있고
        이 속성을 가진 PK 칼럼은 insert 가 수행될때
        자동으로 1씩 증가되는 일련번호를 생성하여 칼럼 데이터에 주입한다.
        
*/
CREATE TABLE tbl_addr_hobby (
	ah_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	ah_aid	VARCHAR(5)	NOT NULL,	
	ah_hbcode	VARCHAR(5)	NOT NULL	
);

INSERT tbl_addr_hobby (ah_aid, ah_hbcode)
VALUES('A0001','H0001');

SELECT COUNT(*) FROM tbl_address;
SELECT * FROM tbl_address
ORDER BY a_id;
DELETE FROM tbl_address
WHERE a_id = '';

CREATE TABLE tbl_hobby (
	hb_code	VARCHAR(5)		PRIMARY KEY,
	hb_name	VARCHAR(30)	NOT NULL,	
	hb_descrip	VARCHAR(400)		
);

-- 현재 시스템의 DataBase(Schema) 리스트 확인
SHOW databases;
-- 현재 DB(addrDB)에 생성된 Table 리스트 확인
SHOW tables;

-- Table 의 구조 확인
DESCRIBE tbl_address;
DESC tbl_address;

SELECT * FROM tbl_addr_hobby;
SELECT COUNT(*) FROM tbl_addr_hobby;

SELECT * FROM tbl_address;
SELECT COUNT(*) FROM tbl_address;

SELECT * FROM tbl_hobby;
SELECT COUNT(*) FROM tbl_hobby;

SELECT '주소록 Entity' AS 제목, COUNT(*) AS 개수 FROM tbl_address
UNION ALL
SELECT '취미 Entity', COUNT(*) FROM tbl_hobby
UNION ALL
SELECT '취미 Relation', COUNT(*) FROM tbl_addr_hobby;

commit;

CREATE TABLE calendar (
	id integer  AUTO_INCREMENT primary key,
	events JSON
);

insert into calendar(events) values('[{ "title" : "물마시기", "start" : "2023-07-01 00:00:00.000000", "end": "2023-07-15 00:00:00.000000" }]');
insert into calendar(events) values('"events" : { "title" : "책읽기", "start" : "2023-07-16 00:00:00", "end": "2023-07-28 00:00:00" }');
insert into calendar(events) values('["조깅하기", "2023-07-16 00:00:00", "2023-07-28 00:00:00"]');
insert into calendar(events) values('{ "title" : "책읽기"}');

CREATE TABLE 


SELECT * FROM calendar;


