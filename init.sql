CREATE DATABASE IF NOT EXISTS fse_virtual;
CREATE DATABASE IF NOT EXISTS fse_virutal_test;
CREATE USER 'fse_user'@'%' identified by 'twinktwerk';
GRANT ALL PRIVILEGES on fse_virtual.* to 'fse_user'@'%';
GRANT ALL PRIVILEGES on fse_virtual_test.* to 'fse_user'@'%';
FLUSH_PRIVILEGES;
USE dev;
