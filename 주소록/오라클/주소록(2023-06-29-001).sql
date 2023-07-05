-- 여기는 addr USER 화면입니다

/*
    tbl_address table 에 대하여 다음 결과를 확인하는 SQL 을 작성
    1. Table 에 저장된 전체 데이터의 개수는 몇개인가?
    2. Table 에 저장된 전체 리스트를 전화번화 순으로 정렬하여 확인하기
    3. Table 에 저장된 전체 리스트를 이름 순으로 정렬하여 확인하기
    4. Table 에 저장된 전체 리스트 중에 성이 "김"으로 시작되는 리스트 확인하기
    5. Table 에 저장된 전체 리스트 중에서 전화번호의 국번(090-2222-1234 중에서 두번째 구역)
        이 3으로 시작되는 리스트의 개수는 몇개인가?
*/





SELECT COUNT(*) FROM  tbl_address;

-- 기본값인 ASC(오름차순) 는 생략가능
SELECT * FROM tbl_address
ORDER BY a_tel ASC;

-- 역순정렬(내림차순)
SELECT * FROM tbl_address
ORDER BY a_tel DESC;

--Table 구조 확인
-- ORDER BY 의 DESC 키워드와는 다른 키워드
DESCRIBE
-- 축약형
DESC tbl_address;

SELECT * FROM tbl_address
ORDER BY a_name;

-- 같은 id 가 있으면 그 그룹에서 이름순으로 정렬
SELECT * FROM tbl_address
ORDER BY a_id, a_name;

-- id 를 오름차순으로 검색하고
-- 같은 id 가 있으면 그 그룹에서 이름순(내림차순) 정렬
SELECT * FROM tbl_address
ORDER BY a_id, a_name DESC;

SELECT * FROM tbl_address
WHERE a_name LIKE '이%'; 

-- 중간 문자열 검색, 전화번호 중에서 3이 포함된 모든 전화번호
SELECT * FROM tbl_address
WHERE a_tel LIKE '%3%';

SELECT * FROM tbl_address
WHERE a_tel LIKE '090-3%';

SELECT COUNT(*) FROM tbl_address
WHERE a_tel LIKE '090-3%';

-- 이게 정답에 가깝다.
SELECT * FROM tbl_address
WHERE SUBSTR(a_tel,5,1) = '3'
ORDER BY a_tel;

SELECT * FROM tbl_address
WHERE a_tel LIKE '____3%'
ORDER BY a_tel;

SELECT COUNT(*) FROM tbl_address
WHERE SUBSTR(a_tel,5,1) = '3';

-- 전화번호 국번이 3으로 시작되는 전화 번호 중에서 id 가 가장 큰 데이터와
-- id 가 가장 작은 데이터를 찾으시오

SELECT MAX(a_id) AS 최대값, MIN(a_id) AS 최소값 FROM tbl_address
WHERE SUBSTR(a_tel,5,1) = '3';

SELECT * FROM tbl_address;

