-- bbsDB DataBase 생성하기

create database bbsDB;

USE bbsDB;

-- bbsdb 에 포함된 Table 리스트 확인하기
SHOW tables;

DESC tbl_bbs;

drop table tbl_user;

create table tbl_user(
	username	varchar(125)		PRIMARY KEY,
	nickname	varchar(125),		
	tel	varchar(20)		
);

select COUNT(*) from tbl_bbs;

commit;

insert INTO tbl_user(username, nickname, tel)
value('callor@callor.com', '내멋으로', '010-1111-1111');

-- EQ JOIN
-- 두 Table 이 완전한 참조무결성 관계에 있을때만
-- 정상적인 데이터가 나타난다.
-- tbl_bbs 데이터에 b_username 칼럼의 데이터가
-- marpol@marpol.com 으로 되어 있는데
-- 이 데이터가 tbl_user 테이블에 있으면 정상적으로
-- 출력되고, 그렇지 않으면 데이터가 누락되는 현상
SELECT B.b_seq, B.b_pseq, B.b_date,
		B.b_time, B.b_username, U.nickname,
		B.b_subject, B.b_content, B.b_count, B.b_update  
		FROM tbl_bbs B, tbl_user U
		WHERE B.b_username = U.username
		LIMIT 10;

-- tbl_bbs 테이블과 tbl_user 테이블이 완전 참조 무결성
-- 관계인지 검증하는 SQL
-- left join 은 참조무결성과 관계없이 join 결과를
-- 정상적으로 확인 가능하다
-- 이때 N:1 의 관계에서 NULL 인 데이터가 있으면
-- 테이블간에 참조무결성 관계가 성립되지 않는다.
-- 이 테이블간에는 FK 설정이 불가능하다.
select *
from tbl_bbs
	left join tbl_user U
     ON b.b_username = U.username
     WHERE U.nickname IS NULL;
     
delete from tbl_user WHERE username = 'marpol@marpol.com';     
     
select * from tbl_bbs;     
