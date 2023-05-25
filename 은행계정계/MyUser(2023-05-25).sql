-- 여기는 myuser 로 접속한 화면

SELECT * FROM tbl_acc
WHERE acbuid = '0001'
ORDER BY acbalance DESC;


INSERT INTO tbl_acc( acnum, acdate, acbuid, acbalance)
VALUES('2023052402', '2', '0003', '25000');

COMMIT;

-- 0001 0003 고객 계좌정보 조회
SELECT * FROM tbl_acc
WHERE acbuid = '0001' OR acbuid = '0003';

-- IN 키워드도 사용 할수 있다.
SELECT * FROM tbl_acc
WHERE acbuid IN ('0001','0003');

DROP TABLE tbl_buyer;

CREATE TABLE tbl_buyer (

    buId	VARCHAR2(5)	NOT NULL	PRIMARY KEY,
    buName	nVARCHAR2(20)	NOT NULL,	
    buTel	VARCHAR2(20),		
    buAddr	nVARCHAR2(125),	
    buBirth	VARCHAR2(10),		
    buJob	nVARCHAR2(20)		

);










CREATE TABLE tbl_accList (
        aioSEQ	NUMBER		PRIMARY KEY,
    acNum	VARCHAR2(20)	NOT NULL,	
    aioDate	VARCHAR2(10)	NOT NULL,	
    aioTime	VARCHAR2(10)	NOT NULL,	
    aioDiv	VARCHAR2(1)	NOT NULL,	
    aioInput	NUMBER	DEFAULT 0,	
    aiooutput	NUMBER	DEFAULT 0,	
    aioREM	VARCHAR2(30)		
);
		
DESC tbl_accList;

/*
 
 DBMS 테이블의 일련번호 문제
 테이블에 pk를 임의의 일련번호로 설정했을 경우
 데이터를 인설트 할때마다 새로운 일련번호를 생성하여 값을 추가해야 한다.
 
 DBMS 엔진에 따라 인설트 할때 자동으로 일련번호를 생성하는 기능이 있는데
 오라클에는 없다(11 이하 버전), 오라클도 12이상에서는 자동생성하는 기능이 있는데,
 다른 DBMS 에 비하여 상당히 불편하다.
 
 오라클에서는 일련번호를 자동으로 생성해주는 도구를 만들어야 한다.

*/

DROP SEQUENCE seq_accList;

CREATE SEQUENCE seq_accList
START WITH 1 INCREMENT BY 1;

SELECT seq_accList.NEXTVAL FROM DUAL;

INSERT INTO tbl_accList(aioseq, acnum, aiodate, aiotime, aiodiv, aioinput, aiooutput)
VALUES(seq_accList.NEXTVAL, '2023052501','2023-05-25','10:10:00','1','10000','0');

INSERT INTO tbl_acc(acbalance)
VALUES('10000');


SELECT * FROM tbl_accList;


INSERT INTO tbl_acc(acnum, acdiv, acbuid, acbalance)
  VALUES('2023052403','3','0003','40000');



COMMIT;


SELECT * FROM tbl_acc , tbl_acclist
WHERE acnum = acbalance, aioinput, aiooutput;


SELECT acnum, aioinput, aiooutput 
FROM tbl_acc , tbl_acclist
WHERE acnum = acnum;


SELECT acnum, acbuid, buname, butel 
FROM tbl_acc , tbl_buyer
WHERE acbuid = buid;

SELECT *
FROM tbl_acc
INNER JOIN tbl_acclist ON tbl_acc.acnum = tbl_accList.acnum;



SELECT *
FROM tbl_acclist;

DELETE FROM tbl_accList;

COMMIT;

SELECT *
FROM tbl_acc;



