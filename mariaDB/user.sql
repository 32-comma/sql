/*
'사용자이름' : 새로 생성할 사용자명
'호스트' : 접속을 허용할 호스트 ('%'는 모든 IP 허용, 'localhost'는 로컬에서만 허용)
'비밀번호' : 사용자 비밀번호
*/
CREATE USER '사용자이름'@'호스트' IDENTIFIED BY '비밀번호';


/*
기존 사용자를 확인
*/
SELECT user, host FROM mysql.user WHERE user = 'root';

/*
사용자가 있다면 삭제 후 다시 생성
*/
DROP USER 'root'@'localhost';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'your_password';

/*
GRANT ALL PRIVILEGES → 모든 권한을 부여 (CRUD, DB 생성/삭제, 사용자 관리 등 포함)
ON *.* → 모든 데이터베이스와 모든 테이블에 대해 적용 (database_name.table_name 대신 *.* 사용)
TO 'root'@'localhost' → 로컬에서 접근하는 root 사용자에게 권한 부여
WITH GRANT OPTION → 해당 사용자가 다른 사용자에게도 권한을 부여할 수 있도록 허용
WITH GRANT OPTION을 사용하면 root 사용자가 다른 사용자에게도 GRANT 명령을 실행할 수 있으므로 보안적으로 신중해야 합니다.
*/

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
/*
MySQL에서는 GRANT, REVOKE 등의 명령이 실행될 때 내부적으로 메모리에만 저장됩니다. 따라서, FLUSH PRIVILEGES;를 실행하면 메모리에 반영된 권한 정보를 디스크에 저장하여 즉시 적용됩니다.

🔄 언제 사용해야 할까?
GRANT, REVOKE 실행 후 즉시 적용하려면 사용
mysql.user 테이블을 직접 수정한 경우 (UPDATE mysql.user SET ...)
신규 사용자를 추가했으나 권한이 적용되지 않을 때
*/
FLUSH PRIVILEGES;
