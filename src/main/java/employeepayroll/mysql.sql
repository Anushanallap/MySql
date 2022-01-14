/*uc1 */

mysql> create database payroll_services;
Query OK, 1 row affected (10.97 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| payroll_services   |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (2.17 sec)

mysql> use payroll_services;
Database changed

/*UC2*/
mysql> create table employee_payroll(ID int PRIMARY KEY AUTO_INCREMENT , name varchar(50), salary int , start_date DATE);
Query OK, 0 rows affected (24.45 sec)

mysql>
mysql>
mysql> desc employee_payroll -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '->' at line 1
mysql> desc employee_payroll
    -> ;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| ID         | int         | NO   | PRI | NULL    | auto_increment |
| name       | varchar(50) | YES  |     | NULL    |                |
| salary     | int         | YES  |     | NULL    |                |
| start_date | date        | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
4 rows in set (2.10 sec)

/*UC3*/
mysql> insert into employee_payroll values(1,"Anusha",150000,'2021-8-12');
Query OK, 1 row affected (2.69 sec)

mysql> insert into employee_payroll values(2,"sam",100000,'2021-8-14');
Query OK, 1 row affected (0.78 sec)

mysql> insert into employee_payroll values(3,"devi",10000,'2021-8-15');
Query OK, 1 row affected (0.93 sec)

mysql> select * from employee_payroll;
+----+--------+--------+------------+
| ID | name   | salary | start_date |
+----+--------+--------+------------+
|  1 | Anusha | 150000 | 2021-08-12 |
|  2 | sam    | 100000 | 2021-08-14 |
|  3 | devi   |  10000 | 2021-08-15 |
+----+--------+--------+------------+
3 rows in set (0.00 sec)

/*UC4*/
mysql> select * from employee_payroll;
+----+--------+--------+------------+
| ID | name   | salary | start_date |
+----+--------+--------+------------+
|  1 | Anusha | 150000 | 2021-08-12 |
|  2 | sam    | 100000 | 2021-08-14 |
|  3 | devi   |  10000 | 2021-08-15 |
+----+--------+--------+------------+
3 rows in set (0.00 sec)

mysql> insert into employee_payroll values(4,"ramu",20000,'2021-8-16');
Query OK, 1 row affected (0.59 sec)

mysql> select * from employee_payroll;
+----+--------+--------+------------+
| ID | name   | salary | start_date |
+----+--------+--------+------------+
|  1 | Anusha | 150000 | 2021-08-12 |
|  2 | sam    | 100000 | 2021-08-14 |
|  3 | devi   |  10000 | 2021-08-15 |
|  4 | ramu   |  20000 | 2021-08-16 |
+----+--------+--------+------------+
4 rows in set (0.00 sec)
/*UC5*/
mysql> select salary from employee_payroll where name = "Anusha";
+--------+
| salary |
+--------+
| 150000 |
+--------+
1 row in set (0.02 sec)

mysql> select salary from employee_payroll where name = "devi";
+--------+
| salary |
+--------+
|  10000 |
+--------+
1 row in set (0.00 sec)

mysql> select salary from employee_payroll where start_date BETWEEN CAST('2021-08-12' AS DATE)AND DATE(NOW());
+--------+
| salary |
+--------+
| 150000 |
| 100000 |
|  10000 |
|  20000 |
+--------+
4 rows in set (0.31 sec)

mysql> select salary from employee_payroll where start_date BETWEEN CAST('2021-08-12' AS DATE)AND DATE(2021-08-16);
Empty set, 1 warning (0.42 sec)

mysql> alter table employee_payroll ADD Gender varchar(10);
Query OK, 0 rows affected (11.97 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+--------+--------+------------+--------+
| ID | name   | salary | start_date | Gender |
+----+--------+--------+------------+--------+
|  1 | Anusha | 150000 | 2021-08-12 | NULL   |
|  2 | sam    | 100000 | 2021-08-14 | NULL   |
|  3 | devi   |  10000 | 2021-08-15 | NULL   |
|  4 | ramu   |  20000 | 2021-08-16 | NULL   |
+----+--------+--------+------------+--------+
4 rows in set (0.00 sec)
/*UC6*/
mysql> update employe_payroll set Gender = 'F' where name = "Anusha" or name = "devi" or name = "sam" name = "ramu";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name = "ramu"' at line 1
mysql> update employe_payroll set Gender = 'M' where name = "ramu";
ERROR 1146 (42S02): Table 'payroll_services.employe_payroll' doesn't exist
mysql> update employee_payroll set Gender = 'M' where name = "ramu";
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+--------+--------+------------+--------+
| ID | name   | salary | start_date | Gender |
+----+--------+--------+------------+--------+
|  1 | Anusha | 150000 | 2021-08-12 | F      |
|  2 | sam    | 100000 | 2021-08-14 | F      |
|  3 | devi   |  10000 | 2021-08-15 | F      |
|  4 | ramu   |  20000 | 2021-08-16 | M      |
+----+--------+--------+------------+--------+
4 rows in set (0.00 sec)
/*UC7*/
mysql> select SUM(salary) from employee_payroll where Gender = 'M' group by Gender;
+-------------+
| SUM(salary) |
+-------------+
|       20000 |
+-------------+
1 row in set (0.06 sec)

mysql> select AVG(salary) from employee_payroll group by Gender;
+-------------+
| AVG(salary) |
+-------------+
|  86666.6667 |
|  20000.0000 |
+-------------+
2 rows in set (0.97 sec)

mysql> select MAX(salary) from employee_payroll group by Gender;
+-------------+
| MAX(salary) |
+-------------+
|      150000 |
|       20000 |
+-------------+
2 rows in set (0.09 sec)

mysql> select MIN(salary) from employee_payroll group by Gender;
+-------------+
| MIN(salary) |
+-------------+
|       10000 |
|       20000 |
+-------------+
2 rows in set (0.00 sec)

mysql> select COUNT(name) from employee_payroll group by Gender;
+-------------+
| COUNT(name) |
+-------------+
|           3 |
|           1 |
+-------------+
2 rows in set (0.03 sec)
/*UC8*/
mysql> alter table employee_payroll add address varchar(50) default 'Telangana';
Query OK, 0 rows affected (3.52 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add phonenumber int;
Query OK, 0 rows affected (1.46 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add department varchar(50) NOT NULL;
Query OK, 0 rows affected (1.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+--------+--------+------------+--------+-----------+-------------+------------+
| ID | name   | salary | start_date | Gender | address   | phonenumber | department |
+----+--------+--------+------------+--------+-----------+-------------+------------+
|  1 | Anusha | 150000 | 2021-08-12 | F      | Telangana |        NULL |            |
|  2 | sam    | 100000 | 2021-08-14 | F      | Telangana |        NULL |            |
|  3 | devi   |  10000 | 2021-08-15 | F      | Telangana |        NULL |            |
|  4 | ramu   |  20000 | 2021-08-16 | M      | Telangana |        NULL |            |
+----+--------+--------+------------+--------+-----------+-------------+------------+
4 rows in set (0.00 sec)
/*UC9*/
mysql> alter table employee_payroll add column deductions int;
Query OK, 0 rows affected (0.79 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll rename column salary to basic_pay;
Query OK, 0 rows affected (1.40 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column Taxable_Pay int;
Query OK, 0 rows affected (0.75 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column Income_Tax int;
Query OK, 0 rows affected (1.39 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add column Net_Pay int;
Query OK, 0 rows affected (1.68 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+--------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
| ID | name   | basic_pay | start_date | Gender | address   | phonenumber | department | deductions | Taxable_Pay | Income_Tax | Net_Pay |
+----+--------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
|  1 | Anusha |    150000 | 2021-08-12 | F      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  2 | sam    |    100000 | 2021-08-14 | F      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  3 | devi   |     10000 | 2021-08-15 | F      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  4 | ramu   |     20000 | 2021-08-16 | M      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
+----+--------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
4 rows in set (0.00 sec)
/*UC10*/
mysql> Insert Into employee_payroll Values(4,'Terissa',20000,'2021-10-22','F','Chennai',9,'Marketing',2000,1000,200,18000);
ERROR 1062 (23000): Duplicate entry '4' for key 'employee_payroll.PRIMARY'
mysql> Query OK, 1 row affected (0.00 sec)Insert Into employee_payroll Values(4,'Terissa',20000,'2021-10-22','F','Chennai',9,'Marketing',2000,1000,200,18000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 1 row affected (0.00 sec)Insert Into employee_payroll Values(4,'Teriss' at line 1
mysql> Insert Into employee_payroll Values(4,'Terissa',20000,'2021-10-22','F','Andhra',786594256,'Marketing',3000,1000,500,11000);
ERROR 1062 (23000): Duplicate entry '4' for key 'employee_payroll.PRIMARY'
mysql> Insert Into employee_payroll Values(5,'Terissa',20000,'2021-10-22','F','Chennai',9,'Marketing',2000,1000,200,18000);
Query OK, 1 row affected (0.41 sec)

mysql> select * from employee_payroll;
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
| ID | name    | basic_pay | start_date | Gender | address   | phonenumber | department | deductions | Taxable_Pay | Income_Tax | Net_Pay |
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
|  1 | Anusha  |    150000 | 2021-08-12 | F      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  2 | sam     |    100000 | 2021-08-14 | F      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  3 | devi    |     10000 | 2021-08-15 | F      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  4 | ramu    |     20000 | 2021-08-16 | M      | Telangana |        NULL |            |       NULL |        NULL |       NULL |    NULL |
|  5 | Terissa |     20000 | 2021-10-22 | F      | Chennai   |           9 | Marketing  |       2000 |        1000 |        200 |   18000 |
+----+---------+-----------+------------+--------+-----------+-------------+------------+------------+-------------+------------+---------+
5 rows in set (0.00 sec)
