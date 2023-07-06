-- 여기는 todo 로 접근한 화면

USE todoDB;

CREATE TABLE tbl_todolist(
	to_seq BIGINT PRIMARY KEY auto_increment,
    to_sdate varchar(10) NOT NULL,
	to_stime varchar(10) NOT NULL,
    to_content varchar(400) NOT NULL,
    to_edate varchar(10),
    to_etime varchar(10)
);

USE tbl_todolist;

DESC tbl_todolist;

select * from tbl_todolist;