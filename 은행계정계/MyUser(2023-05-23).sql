-- 여기는 MyUser SCREAM 화면
-- 여기는 MyUser 로 접속한 화면

SHOW TABLES;

DESCRIBE tbl_buyer;

/*
SELECR 명령
SQL 의 DML 명령중에 가장 많이 사용하는 명령
DB>TABLE 에 보관(저장)중인 데이터를 조회하는 명령

tbl_buyer 테이블에 저장된 데이터를 아무 조건 없이
모두 조회하여 보여달라
*/
SELECT * FROM tbl_buyer;

-- tbl_buyer 테이블에 저장된 데이터를 아무 조건 없이 보이되
-- buid, buname 칼럼 만 보여달라
-- 저장된 데이터 중에서 id와 이름 항목만 보고 싶다.
SELECT buid,biname FROM tbl_buyer;

SELECT biname, butel FROM tbl_buyer;

-- 테이블에 저장된 데이터 중에서 이름항목의 데이터가
-- 성춘향으로 되어있는 데이터들만 리스트로 보고싶다.
-- WHERE 절 : 조건을 부여할때
SELECT * FROM tbl_buyer
WHERE buname = '성춘향';

SELECT * FROM tbl_buyer
WHERE buname = '이몽룡';

-- 이름이 홍길동으로 되어 있는 데이터 리스트를 보고싶다
-- 데이터가 없다 이런경우 Result(결과) 과 Empty 인 상태
SELECT * FROM tbl_buyer
WHERE buname = '홍길동';

/*
buname 칼럼을 기준으로 조건 설정하였다.
       칼럼에 어떤 값을 조건으로 데이터를 조회 한것
    칼럼은 데이터가 추가할때 같은 이름의 데이터가 중복하여 저장할 수 있다.
       칼럼을 기준으로 조회한 데이터가 비록 현재는 1개만 보이더라도
        이 데이터는 0개 이상의 데이터가 조회할 것이다. 라는 것을 반드시 예상해야 한다
        
만약 이름 칼럼을 기준으로 하여 데이터를 업데이트 삭제를 수행할 경우
다수의(1개이상) 데이터에 변경(수정)이 이루어 질수 있다.
그러한 이유로 업데이트,델리트 를 수행할때는 절대 이름 칼럼을 기준으로 삼아서는 안된다.
*/

INSERT INTO tbl_buyer(buid,biname)
VALUES('0003','성춘향');

SELECT * FROM tbl_buyer;

SELECT * FROM tbl_buyer
WHERE biname = '성춘향';

SELECT * FROM tbl_buyer;
/*
아이디 칼럼을 기준으로 조회라기
       칼럼을 데이블를 크리에이트 할때 PK 성질을 설정 하였다.
       PK 로 설정한 칼럼은 유일성, NOT NULL 속성을 갖게 된다.
만약 이 칼럼에 있는 데이터를 또다시 추가하려고 하면 다음과 같은 오류가 발생한다.
ORA-00001: 무결성 제약 조건(C##MYUSER.SYS_C008319)에 위배됩니다
PK 칼럼에 0001 이라는 값을 갖는 데이터가 있는데 또다시 0001 이라는 데이터를
추가 하려고 했기 때문에 발생하는 오류
*/
SELECT * FROM tbl_buyer WHERE buid = '0001';

-- 무결성 제약 조건 오류
-- 중복데이터 추가 오류
INSERT INTO tbl_buyer(buid,biname)
VALUES('0001','임꺽정');

/*
ORA-01400: NULL을 ("C##MYUSER"."TBL_BUYER"."BUID") 안에 삽입할 수 없습니다
현재 인설트 명령어를 실행하면서 아이디에 해당하는 값을 지정(저장) 하지 않았다.

*/
INSERT INTO tbl_buyer(biname)
VALUES('임꺽정');
INSERT INTO tbl_buyer(buid)
VALUES('0004');

/*
테이블을 크리에이트 하면서 
아이디와 이름을 NOT NULL 로 설정하였다.
데이터를 추가할때(INSERT)할때 최소한 아이디 값과 이름 값을 필수로 
필요하다 라는 선언
이러한 설정을 '제약조건' 설정이라고 한다.
데이터를 추가할때 조금이라도 문제가 있는 데이터를 추가하여 
전체 데이터 베이스에 문제가 발생하는 것을 방지하는 목적이다
>>> '무결성 유지' 라고 한다.
*/

INSERT INTO tbl_buyer(buid,biname)
VALUES('0004','임꺽정');


/*
테이블 : Entity 를 물리적으로 구현한 상태
데이터를 보관 관리하는 기본적인 틀 이다.
DBMS 소프트웨어 마다 데이터를 저장하는 방법은 각각 고유한 기술적 부분이다.
이러한 부분을 DB 개발자, 사용자가 알 필요는 없다.
DBMS 에서는 개발자 사용자가 바라보는 모든데이터는 테이블(표) 형식이다.

테이블을 작성하기 앞서, 개념적, 논리적 모델링을 수행하는데 이 단계에서는 
테이블를 엔티티 라고 한다.

프로그래밍(java등)에서는 테이블을 객체, 객체 등으로 취급한다.
Java 의 데이터 클래스가 여기에 해당한다.

*/

SELECT * FROM tbl_buyer;

-- 매우 위험한 코드
-- 업데이트나 델리트를 수행할때는 PK가 아닌 칼럼을 기준으로 하지마라
-- 만약 PK 가 아닌 칼럼을 기준으로 할때는 매우 신중하게 수행을 해야한다
UPDATE tbl_buyer
SET butel = '010-333-3333'
WHERE biname = '성춘향';

/*
tbl_buyer 테이블에 성춘향 중에서 전화번호가 없는 데이터가 있다.
전화번호가 없는 성춘향 데이터의 전화번호를 010-333-3333 으로 변경하고자 한다.

1. 이름 칼럼에 데이터가 성춘향 인 리스트를 조회를 한다.
2. 전화번호가 없는(null) 데이터에 아이디 값을 확인한다. : 0003을 알수 있다.
3. 아이디을 기준으로 업데이트를 실시한다.

*/
SELECT * FROM tbl_buyer WHERE biname = '성춘향';

UPDATE tbl_buyer
SET butel = '010-333-3333'
WHERE buid = '0003';

/*
1. 전체 고객 데이터를 조회
2. 이몽룡의 주소가 현재 서울특별시 이다.
   그런데 이몽룡이 전북 익산으로 이사 했다.
3. 이몽룡의 주소를 서울에서 익산으로 변경 하고자 한다.
*/

SELECT * FROM tbl_buyer WHERE biname = '이몽룡';

UPDATE tbl_buyer
SET buaddr = '전북 익산'
WHERE buid = '0001';

SELECT * FROM tbl_buyer;

SELECT * FROM tbl_buyer;

-- PK 인 아이디 값이 0004 인 데이터 삭제하기
-- 불필요한 데이터 삭제하기
DELETE FROM tbl_buyer
WHERE buid = '0004';
/*
 데이터 추가
 칼럼목록 개수, 순서 >> 데이터 목록 개수, 순서 일치해야 한다.
 INSERT INTO 테이블(칼럼목록)
 VALUES(데이터 목록);

 데이터 조회
 SELECT * FROM 테이블;
 WHERE 칼럼 = '값'

데이터 수정
 UPDATE 테이블
 SET 칼럼 = '값'
 WHERE 칼럼 = '값';

데이터 삭제
DELETE FROM 테이블
WHERE 칼럼 = '값';
*/

-- 계좌정보
CREATE TABLE tbl_acc (
	acNum	VARCHAR2(10)    PRIMARY KEY,
    acDate	VARCHAR2(1)	    NOT NULL,	
    acBuId	VARCHAR2(5)	    NOT NULL,	
    acBalance	NUMBER	    DEFAULT 0	
);

-- 각 고객의 계좌정보 생성하기
INSERT INTO tbl_acc(acNum,acDate,acBuId,acBalance)
VALUES('2023052301', 1 , '0003' , 10000);

INSERT INTO tbl_acc(acNum,acDate,acBuId,acBalance)
VALUES('2023052302', 2 , '0001' , 50000);

INSERT INTO tbl_acc(acNum,acDate,acBuId,acBalance)
VALUES('2023052303', 3 , '0002' , 10000);

SELECT * FROM tbl_acc;

/*
계좌정보를 조회 했는데 
고객정보가 고객 아이디 뿐이여서 고객에 대한 이름,전화번호 등을 알수가 없다.
고객정보와 계좌정보를 연동하여 함께 볼수 있다면 좋겠다. 

TABLE JOIN
2개이상의 테이블을 서로 연계하여 하나의 리스트로 보기

acc 와 buyer 테이블을 연계하여 하나의 리스트로 보여라
이떄 acc 의 아이디와 바이어의 아이디 칼럼의 데이터를 비교하여
같은 데이터는 한 라인에 보여라
*/
SELECT * FROM tbl_acc , tbl_buyer
WHERE acbuid = buid;

-- 조인을 하되 4개의 칼럼만 화면에 나타나도록 하고 싶다.
SELECT acnum, acbuid, biname, butel 
FROM tbl_acc , tbl_buyer
WHERE acbuid = buid;

SELECT * FROM tbl_buyer;

-- SELECT 조회를 할때 *를 사용하지 않고 칼럼을 나열하는법
-- 이름순으로 정렬하고 이름이 같으면 전화번호 순으로 정렬하라
SELECT buid,biname,butel,buaddr,bubirth,bujob
FROM tbl_buyer
ORDER BY biname, butel;

-- 아이디순 으로 정렬하라
SELECT buid,biname,butel,buaddr,bubirth,bujob
FROM tbl_buyer
ORDER BY buid;

INSERT INTO tbl_buyer(buid, biname, butel)
VALUES ('0004','임꺽정','010-444-4444');

/* 
SQL 와 java 코드에서 DB 를 서로 연동하여 처이하는 경우 발생하는 문제
 에서 데이터를 인설트 업데이트 델리트 를 수행하는 경우
 추가,수정,삭제된 정보는 아직 stroge 에 반영되지 않고, 메모리에 잠시
 보관(저장)된 상태이다
 이 상태일때 java에서 SELECT 를 수행하려면 인 업 델리트 한 데이터가
 아닌 이전 상태의 데이터가 조회된다.
 간혹 이 상황에서 
 
 그러니까 COMMIT 해주면 연결이 되어 java 프로젝트에서
 조회할수 있다.
*/
COMMIT;

INSERT INTO tbl_buyer(buid, biname)
VALUES ('0005','장길산');

SELECT * FROM tbl_buyer;

-- 커밋이 되기 전의 데이터를 취소하는 명령
-- 내가 잘못 지워서 롤백 할수 있지만 다른사람들이 해놓은것들도 다 롤백 될수있다.
-- 은행 컨트랙션 안에서 커밋과 롤백이 이루어진다.
ROLLBACK;

-- PK 칼럼을 기준으로 조건을 설정하여 조회하기
--                    조회를 하면 데이터가 없거나 1개만 조회한다.
SELECT buid,biname,butel,buaddr,bubirth,bujob
FROM tbl_buyer
WHERE buid = '0001';

INSERT INTO tbl_buyer(buid, biname, butel)
VALUES ('0001','이','010-1111');

UPDATE tbl_buyer
SET biname = '',
    butel = '',
    buaddr = ''.
    bubirth = '',
    bujob = '',
WHERE buid


