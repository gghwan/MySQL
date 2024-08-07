SELECT user() ;

CREATE USER 'jimin'@'%' IDENTIFIED BY '1234';

DROP USER 'jimin'@'%';

DESC mysql.user;

SELECT * FROM mysql.user;

GRANT SELECT ON mycompany.* TO 'jimin'@'%';
FLUSH PRIVILEGES;


GRANT ALL PRIVILEGES ON mycompany.Patient TO 'jimin'@'%';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON mycompany.* TO 'jimin'@'%';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'jimin'@'%';

REVOKE ALL PRIVILEGES ON mycompany.* FROM 'jimin'@'%';
FLUSH PRIVILEGES;


