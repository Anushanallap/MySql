/*UC1*/
mysql> create database Address_Book;
Query OK, 1 row affected (1.20 sec)

mysql> use  Address_Book;
Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| address_book       |
| information_schema |
| mysql              |
| payroll_service    |
| payroll_services   |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
9 rows in set (0.62 sec)
/*UC2*/
mysql> create table Address_Book(firstName varchar(255) , lastName varchar(255) , address varchar(255),city varchar(255), state varchar(255), zipcode int , phoneNumber int , email varchar(255));
Query OK, 0 rows affected (3.33 sec)
mysql> Desc Address_Book;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(255) | YES  |     | NULL    |       |
| lastName    | varchar(255) | YES  |     | NULL    |       |
| address     | varchar(255) | YES  |     | NULL    |       |
| city        | varchar(255) | YES  |     | NULL    |       |
| state       | varchar(255) | YES  |     | NULL    |       |
| zip         | int          | YES  |     | NULL    |       |
| phoneNumber | int          | YES  |     | NULL    |       |
| email       | varchar(255) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.29 sec)
/*UC3*/
