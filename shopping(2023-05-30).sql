CREATE TABLE tbl_iolist (
    
     ioSEQ	NUMBER	PRIMARY KEY,
    ioDate	VARCHAR2(10),
	ioTime	VARCHAR2(10),
    ioBuId	VARCHAR2(10)	NOT NULL,
	ioPCode	VARCHAR2(13)	NOT NULL,   
    ioQuan	NUMBER	,
	ioPrice	NUMBER		
      
);

DROP TABLE tbl_iolist;


SELECT pcode, pname, pitem, piprice, poprice
FROM tbl_product
ORDER BY pcode;

SELECT IOSEQ, IODATE, IOTIME, IOBUID, IOPCODE, IOQUAN, IOPRICE
FROM tbl_iolist;


CREATE SEQUENCE seq_iolist
START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_iolist(IOSEQ, IODATE, IOTIME, IOBUID, IOPCODE, IOQUAN, IOPRICE)
VALUES(seq_iolist.NEXTVAL,'2023-05-26','18:00:00','0000000001', '8802222', 3, 10000);

INSERT INTO tbl_buyer(IOSEQ, IODATE, IOTIME, IOBUID, IOPCODE, IOQUAN, IOPRICE)
VALUES

COMMIT;

SELECT * FROM tbl_iolist
WHERE iodate BETWEEN '2023-05-01' AND '2023-05-28'; 


SELECT ioseq, iobuid, butel, pcode, ioquan 
FROM tbl_iolist , tbl_buyer , tbl_product;

 SELECT substr(max(buid),9) 
 FROM tbl_buyer 
 WHERE  substr(buid,0,8) = 1 ;






























INSERT INTO tbl_memo (m_seq, m_Writer, m_date, m_subject, m_content)
VALUES (2,'홍길동','2023-05-26','수업내용','은행 계정계 대하여 배웠다');

COMMIT;


SELECT * FROM tbl_memo;

CREATE SEQUENCE seq_memo
START WITH 1 INCREMENT BY 1;


INSERT INTO tbl_memo(m_seq, m_writer, m_date, m_subject, m_content)
VALUES(seq_memo.NEXTVAL,'홍길동','2023-05-25','시험','시험어렵다');