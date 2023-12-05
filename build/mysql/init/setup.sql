ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'l3v3lup';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
