CREATE TABLE tbl_memo (

        m_seq	NUMBER		PRIMARY KEY,
    m_writer	nVARCHAR2(20)	NOT NULL,	
    m_date	VARCHAR2(10),		
    m_subject	nVARCHAR2(20),		
    m_content	nVARCHAR2(400)		
);

INSERT INTO tbl_memo (m_seq, m_Writer, m_date, m_subject, m_content)
VALUES (2,'홍길동','2023-05-26','수업내용','은행 계정계 대하여 배웠다');

COMMIT;


SELECT * FROM tbl_memo;

CREATE SEQUENCE seq_memo
START WITH 1 INCREMENT BY 1;


INSERT INTO tbl_memo(m_seq, m_writer, m_date, m_subject, m_content)
VALUES(seq_memo.NEXTVAL,'홍길동','2023-05-25','시험','시험어렵다');

SELECT * FROM tbl_memo;