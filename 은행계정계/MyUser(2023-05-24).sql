-- 여기는 myuser(C##myuser) 로 접속한 화면

-- 아이디 0001 인 고객의 계좌정보를
-- 잔액이 큰컷 부터 순서대로 보여준다.
-- DESC(내림차순)  
-- ASC(오름차순)인데 이거는 기본값이라서 굳이 안써도 된다.
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



-- 잔액이 10000 20000 사이인것 조회
SELECT * FROM tbl_acc
WHERE acbalance >= 10000 AND acbalance <= 20000;

-- BETWEEN 사용하여 사이 조회 가능
SELECT * FROM tbl_acc
WHERE acbalance BETWEEN 10000 AND 20000;

-- 0001 0003 반대인 경우
-- 0001도 아니고 0003도 아닌 값의 조회
SELECT * FROM tbl_acc
WHERE NOT acbuid IN ('0001','0003');

SELECT * FROM tbl_acc;
WHERE NOT acbuid != '0001 AND acbuid <> 0003';


-- SQL 에는 기본적으로 여러 기능을 수행하는 함수들이 내장되어 있다.
-- substr(실행,시작,개수) : 일렬의 문자열을 시작 위치부터 개수만을 잘라내기
-- max(칼럼) : 전체 리스트(조건에 맞는 데이터)중에서 가장 큰 값을 찾기
-- min(칼럼) :  가장 작은 값 찾기


SELECT *
FROM tbl_acc
WHERE substr(acNum,0,8) = '20230524';

SELECT max(acNum)
FROM tbl_acc
WHERE substr(acNum,0,8) = '20230524';

SELECT substr(max(acNum),9) 
FROM tbl_acc
WHERE substr(acNum,0,8) = '20230524';


