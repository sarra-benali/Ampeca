DROP DATABASE IF EXISTS ampeca;
CREATE DATABASE ampeca ; 
USE ampeca
CREATE TABLE user (id int NOT NULL AUTO_INCREMENT ,username varchar (200)  COLLATE utf8mb4_unicode_ci NOT NULL,last_login datetime ,email varchar(50)  COLLATE utf8mb4_unicode_ci NOT NULL, password varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,PRIMARY KEY (id),UNIQUE KEY email (email)) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE  songs (id int AUTO_INCREMENT , src varchar(1000) , Name varchar(50) , ArtisteName varchar(50)  , Cover varchar(1000) , PRIMARY KEY(id)) ; 
CREATE TABLE  playlist(id int , songs JSON ,name varchar(50), PRIMARY KEY (id) );
 




-- ///   mysql -u root -p <server/DataBase/Schema.sql;   ///
