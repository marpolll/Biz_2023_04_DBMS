 -- 여기는 root 화면
 
 /*
	mySQL 프로젝트 시작
    1. database 생성
    2. 사용자 등록
		DB 서버가 Application 서버와 같은 동일한 운영체제에
        있을때는 사용자 등록이 선택사항이다.
        root 사용자가 등록되어 있는데
        root 사용자는 기본적으로 localhost 에서만 접근이 된다.
        
        만약 네트워크를 통해서 DB 서버에 접근 하거나
        특별히 보안이 요구되는 경우가 아니면
        root 사용자를 일반 DB 사용자로 사용하는 경우가
        많다
 */
 
 CREATE DATABASE todoDB;
 
 USE todoDB;
 SHOW databases;
 
 -- 사용자 등록
 -- 사용자 등록을 할때 접근 할수 있는 범위를 설정해야 한다.
 -- 로컬에서만 접근할수 있는 todo 생성
CREATE USER 'todo'@'localhost'
identified BY '12341234';

-- 로컬 네트워크(192.168.4.1 ~ 192.168.4.254) 에서
-- 현재 System 의 MySQL 에 접속할수 있는 사용자 생성
CREATE USER 'todo'@'192.168.4.%'
identified BY '88888888'; 
 
-- 모든 곳에서 접근할 수 있는 사용자 생성
-- 보안상 가장 위험한 사용자 생성
/*
 무결성 파괴
 만약 이 사용자가 자신의 id 와 비번을 소홀히 하여
 누군가에게 노출된다면, 이 id 와 비번을 통하여
 DB 에 접근하고 DBMS 데이터를 모두 파괴 할수 있다.
*/
CREATE USER 'todo'@'%'
identified BY '88888888';  
 
-- 현재 등록된 사용자는 MySQl Server 에 접속 할수 있도록
-- 권한을 가지고 있지만 그 외의 나머지 역활은 수행할수 없다.
-- DB 생성, Table 생성등을 수행하려면
-- 권한을 부여해야 한다.
-- GRANT DBA TO user;    오라클에서

-- 아래는 mySQL 에서
-- ALL privileges : DBA 권한
-- *.* : 모든 Database 에 대하여 모든 역활 수행
GRANT ALL privileges ON *.* TO 'todo'@'localhost';

-- 네트워크를 통하여 접근한 todo 사용자에게
-- todoDB 에 대하여 모든 권한을 부여하기
GRANT ALL privileges ON todoDB.* TO 'todo'@'192.168.4.%';

-- todoDB Database 의 tbl_todolist Table 만
-- 접근하는 권한 부여
GRANT ALL privileges ON todoDB.tbl_todolist TO 'todo'@'192.168.4.%';



 
 
 
 
 
 
 
 
 
 
 
 
 