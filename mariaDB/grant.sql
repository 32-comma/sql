/* dev계정 권한 추가하기전에  확인 */
SHOW GRANTS FOR 'dev'@'localhost';


/* root계정에서 실행 */
GRANT ALL PRIVILEGES ON blog.* TO 'dev'@'localhost';
FLUSH PRIVILEGES;

/* dev계정 권환 재확인 */
SHOW GRANTS FOR 'dev'@'localhost';

