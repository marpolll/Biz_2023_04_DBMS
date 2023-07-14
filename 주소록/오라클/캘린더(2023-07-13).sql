select * from calendar;
select * from obj;
select * from title;

drop TABLE calendar;

create TABLE obj (

    c_id NUMBER PRIMARY KEY,
    events json
);

create TABLE title (
    title json
);

insert into obj(c_id, events) values(0001,'{ "title" : "물마시기", "start" : "2023-07-01", "end": "2023-07-03" }');
insert into obj(c_id, events) values(0002,'{ "title" : "책읽기", "start" : "2023-07-04", "end": "2023-07-06" }');
insert into obj(c_id, events) values(0003,'{ "title" : "런닝하기", "start" : "2023-07-07", "end": "2023-07-10" }');
insert into obj(c_id, events) values(0004,'{ "title" : "잠자기", "start" : "2023-07-11", "end": "2023-07-15" }');
insert into obj(c_id, events) values(0005,'{ "title" : "휴대폰하기", "start" : "2023-07-20", "end": "2023-07-25" }');

insert into calendar VALUES(0005,'{ "title" : "휴대폰하기", "start" : "2023-07-20", "end": "2023-07-25" }'); 



select c_id, json_extract(events, '$."title"')
 from calendar where json_extract(events, '$."title"') = '물마시기'; 


insert into title(title) values('{ "title" : "물마시기"}');

commit;



insert into employees(id, name, profile) values(0002, '김갑수', '[35, "man", "인사"]');
insert into employees(id, name, profile) values(0003, '신상일', json_object(
    'age', 28, 
    'gender', 'man', 
    '부서', '연구'
));



SELECT * FROM employees;

INSERT INTO calendar(content, start_date, end_date)
VALUES('물마시기', '20230714', '20230730');

INSERT INTO calendar(content, start_date, end_date)
VALUES('책읽기', '20230723', '20230725');

INSERT INTO calendar(content, start_date, end_date)
VALUES('책읽기', '20230723 000000', '20230725 240000');

DROP TABLE calendar;

commit;


DROP TABLE calendar;

select * from calendar;

create table calendar(
	id number primary key,
	groupId NUMBER,
	title varchar2(50),
	writer varchar2(50),
	content varchar2(1000),
	start1 date,
	end1 date,
	allDay number(1),
	textColor varchar(50),
	backgroundColor varchar2(50),
	borderColor varchar2(50)
);

create sequence cal_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 99999;
    
    INSERT INTO calendar values(cal_seq.nextval,'','할일title','test',
'내용-content',to_date('2021/05/01','YYYY/MM/DD'),
to_date('2021/05/03','YYYY/MM/DD'),1,'yellow','navy','navy');

SELECT id, title,
		TO_char(start1, 'YYYY-MM-DD"T"HH24:MI:SS') start1,
		TO_char(end1,
		'YYYY-MM-DD"T"HH24:MI:SS') end1,
		ALLDAY,
		TEXTCOLOR,
		BACKGROUNDCOLOR,
		BORDERCOLOR
		FROM CALENDAR;