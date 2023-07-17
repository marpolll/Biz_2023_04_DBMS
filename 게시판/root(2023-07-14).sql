-- root 로 접속한 화면

use bbsDB;

desc tbl_bbs;

-- tbl_bbs 테이블에 대표이미지를 저장하는 칼럼 생성추가
-- tbl_bbs 테이블에 b_image 칼럼을 추가하는데
-- 데이터 타입은 varchar(125) 로 하고
-- b_count 다음에 (b_update 앞에) 위치하도록 
-- ALTER TABLE 사용하여 새로운 칼럼을 추가하는 경우
-- 제약사항(NOT NULL등) 을 동시에 추가할수 없다. 
ALTER TABLE tbl_bbs
ADD b_image varchar(125)
after b_count;

-- table 을 Drop 하고 다시 같은 구조로 CREATE TABLE
truncate tbl_bbs;

-- FK 삭제
alter table tbl_bbs
drop constraint FK이름;

-- 닉네임 칼럼 삭제
alter table tbl_bbs
drop b_nickname;


INSERT INTO tbl_bbs(
b_pseq,
b_date,
b_time,
b_username,
b_subject,
b_content,
b_count,
b_image
) VALUES (
	1,1,1,1,1,1,1,1
);

select * from tbl_bbs;


create table tbl_images (
	i_seq	bigint		PRIMARY KEY	AUTO_INCREMENT,
	i_bseq	bigint	NOT NULL,
	i_originalname	varchar(125),			
	i_uploadname	varchar(255)			
);

insert into tbl_bbs(b_username)
values('marpol');

-- AUTO_INCREMENT 로 설정된 칼럼의 가장
-- 마지막 INSERT 된 데이터 가져오기
select LAST_INSERT_ID();	

insert into tbl_bbs(b_username)
values('marpol1'),
('marpol2'),
('marpol3'),
('marpol4'),
('marpol5');

select * from tbl_bbs;

select * from tbl_images;

truncate tbl_bbs;
truncate tbl_images;

commit;
