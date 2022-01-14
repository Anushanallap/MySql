/*UC1*/
mysql> create database AddressBookSystem;
Query OK, 1 row affected (0.38 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| address_book       |
| addressbook        |
| addressbooksystem  |
| information_schema |
| mysql              |
| payroll_service    |
| payroll_services   |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
11 rows in set (0.19 sec)
/*UC2*/
mysql> create table AddressBookSystem(firstName varchar(255) , lastName varchar(255) , address varchar(255),city varchar(255), state varchar(255), zip int , phoneNumber int , email varchar(255));
Query OK, 0 rows affected (2.65 sec)

mysql> desc AddressBookSystem
    -> ;
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
8 rows in set (0.18 sec)
/*UC3*/
mysql> INSERT INTO AddressBookSystem values("Anusha","nallapu","Rotary nagar","Khammam","Telangana",507001,965281431,"anusha@gmail.com");
Query OK, 1 row affected (0.27 sec)
mysql> select * from AddressBookSystem;
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
| firstName | lastName | address      | city    | state     | zip    | phoneNumber | email            |
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
| Anusha    | nallapu  | Rotary nagar | Khammam | Telangana | 507001 |   965281431 | anusha@gmail.com |
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
1 row in set (0.03 sec)
mysql> INSERT INTO AddressBookSystem values("sam","vinukonta","SR nagar","badhrachalam","Telangana",507002,965789641,"sam@gmail.com");
Query OK, 1 row affected (0.19 sec)

mysql> select * from AddressBookSystem;
+-----------+-----------+--------------+--------------+-----------+--------+-------------+------------------+
| firstName | lastName  | address      | city         | state     | zip    | phoneNumber | email            |
+-----------+-----------+--------------+--------------+-----------+--------+-------------+------------------+
| Anusha    | nallapu   | Rotary nagar | Khammam      | Telangana | 507001 |   965281431 | anusha@gmail.com |
| sam       | vinukonta | SR nagar     | badhrachalam | Telangana | 507002 |   965789641 | sam@gmail.com    |
+-----------+-----------+--------------+--------------+-----------+--------+-------------+------------------+
2 rows in set (0.00 sec)
/*UC4*/
mysql> UPDATE AddressBookSystem SET city = 'khammam' WHERE firstname = 'Anusha';
Query OK, 1 row affected (0.24 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from AddressBookSystem;
+-----------+-----------+--------------+--------------+-----------+--------+-------------+------------------+
| firstName | lastName  | address      | city         | state     | zip    | phoneNumber | email            |
+-----------+-----------+--------------+--------------+-----------+--------+-------------+------------------+
| Anusha    | nallapu   | Rotary nagar | khammam      | Telangana | 507001 |   965281431 | anusha@gmail.com |
| sam       | vinukonta | SR nagar     | badhrachalam | Telangana | 507002 |   965789641 | sam@gmail.com    |
+-----------+-----------+--------------+--------------+-----------+--------+-------------+------------------+
2 rows in set (0.02 sec)
/*UC5*/
mysql> DELETE FROM AddressBookSystem WHERE firstName = "sam";
Query OK, 1 row affected (0.14 sec)

mysql> select * from AddressBookSystem;
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
| firstName | lastName | address      | city    | state     | zip    | phoneNumber | email            |
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
| Anusha    | nallapu  | Rotary nagar | khammam | Telangana | 507001 |   965281431 | anusha@gmail.com |
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
1 row in set (0.00 sec)
/*UC6*/
mysql> select * from AddressBookSystem where state = 'Telangana';
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
| firstName | lastName | address      | city    | state     | zip    | phoneNumber | email            |
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
| Anusha    | nallapu  | Rotary nagar | khammam | Telangana | 507001 |   965281431 | anusha@gmail.com |
+-----------+----------+--------------+---------+-----------+--------+-------------+------------------+
1 row in set (0.00 sec)
/*UC7*/
mysql> select COUNT(firstName) from Address_Book where city = "khammam" ;
+------------------+
| COUNT(firstName) |
+------------------+
|                0 |
+------------------+
1 row in set (0.36 sec)
/*UC8*/
mysql> SELECT firstName, lastName,city FROM AddressBookSystem order by firstName;
+-----------+----------+---------+
| firstName | lastName | city    |
+-----------+----------+---------+
| Anusha    | nallapu  | khammam |
+-----------+----------+---------+
1 row in set (0.04 sec)
/*UC9*/
mysql> alter table AddressBookSystem add Department_Type varchar(250) not null after address;
Query OK, 0 rows affected (8.77 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from AddressBookSystem ;
+-----------+----------+--------------+-----------------+---------+-----------+--------+-------------+------------------+
| firstName | lastName | address      | Department_Type | city    | state     | zip    | phoneNumber | email            |
+-----------+----------+--------------+-----------------+---------+-----------+--------+-------------+------------------+
| Anusha    | nallapu  | Rotary nagar |                 | khammam | Telangana | 507001 |   965281431 | anusha@gmail.com |
+-----------+----------+--------------+-----------------+---------+-----------+--------+-------------+------------------+
1 row in set (0.00 sec)

mysql> update Address_Book SET Department_Type = "Marketing dept" WHERE firstName = "Anusha";
ERROR 1054 (42S22): Unknown column 'Department_Type' in 'field list'
mysql> update AddressBookSystem SET Department_Type = "Marketing dept" WHERE firstName = "Anusha";
Query OK, 1 row affected (0.41 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update AddressBookSystem SET Department_Type = "sales dept" WHERE firstName = "sam";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from AddressBookSystem ;
+-----------+----------+--------------+-----------------+---------+-----------+--------+-------------+------------------+
| firstName | lastName | address      | Department_Type | city    | state     | zip    | phoneNumber | email            |
+-----------+----------+--------------+-----------------+---------+-----------+--------+-------------+------------------+
| Anusha    | nallapu  | Rotary nagar | Marketing dept  | khammam | Telangana | 507001 |   965281431 | anusha@gmail.com |
+-----------+----------+--------------+-----------------+---------+-----------+--------+-------------+------------------+
1 row in set (0.00 sec)
/*UC10*/
mysql> select COUNT(firstName) from AddressBookSystem where Department_Type = "Marketing dept";
+------------------+
| COUNT(firstName) |
+------------------+
|                1 |
+------------------+
1 row in set (0.02 sec)

/*UC11*/
