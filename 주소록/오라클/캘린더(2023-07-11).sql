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