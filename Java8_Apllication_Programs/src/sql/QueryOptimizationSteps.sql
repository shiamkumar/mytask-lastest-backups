
Advantages of query optimization
=================================
1)The output is provided faster
2)A larger number of queries can be executed in less time
3)Reduces time and space complexity


10 Tips to Improve SQL Query Performance
=========================================
1)Do not use * in select Statment
2)Use Exists instead of Sub Query
3)Use Proper join instead of subqueries
4)Use “Where” instead of “Having” a clause
5)Apply index on necessary columns
6)For user-defined stored procedures avoid prefixes like “sp_”
7)Apply UNION ALL instead of UNION if possible
8)Avoid Negative search
9)Avoid query in a loop
10)Apply valid datatype on the column


1)Do Not Use * In Select Statment
=================================
SELECT * FROM Department; - - - Bad Parctice
SELECT Id, Name, Description FROM Department; - - - Good Practice

2)Use Exists Instead Of Sub Query
=================================
SELECT Id, Name FROM Employee WHERE DeptId In (
	SELECT Id FROM Department WHERE Name like ‘%Management%’
); - - - Bad Practice

SELECT Id, Name FROM Employee WHERE DeptId Exist (
	SELECT Id FROM Department WHERE Name like ‘%Management%’
); - - - Good Practice

3)Use Proper Join Instead Of Subqueries
=======================================
SELECT Id, Name FROM Employee WHERE DeptId in (
	SELECT Id FROM Department WHERE Name like ‘%Management%’
); - - Bad Practice

SELECT Emp.Id, Emp.Name,Dept.DeptName 
FROM Employee Emp RIGHT JOIN Department Dept on Emp.DeptId = Dept.Id
WHERE Dept.DeptName like ‘%Management%’; - - - Good Practice

4)Use “Where” instead of “Having” a clause
============================================
SELECT Emp.Id, Emp.Name,Dept.DeptName,Emp.Salary
FROM Employee Emp RIGHT JOIN Department Dept on Emp.DeptId = Dept.Id
GROUP BY dept.DeptName
HAVING Emp.Salary >= 20000; - - - Bad Practice

SELECT Emp.Id, Emp.Name,Dept.DeptName,Emp.Salary
FROM Employee Emp RIGHT JOIN Department Dept on Emp.DeptId = Dept.Id
WHERE Emp.Salary >= 20000; - - Good Practice

5)Apply index on necessary columns
===================================
use index for right columns 

6)For user-defined stored procedures avoid prefixes like “sp_”
===============================================================
don't use prefixes while using stored producre

7)Apply UNION ALL instead of UNION if possible
===============================================
create table names_old (
id int,
name varchar(255)
);

insert into names_old values(1, 'Ramesh');
insert into names_old values(2, 'Mahesh');
insert into names_old values(3, 'Sita');
insert into names_old values(4, 'Nita');
insert into names_old values(5, 'Naresh');
commit;
select * from names_old;

create table names_new (
id int,
name varchar(255)
);

insert into names_new values(1, 'Sita');
insert into names_new values(2, 'Gita');
insert into names_new values(3, 'Ramesh');
commit;
select * from names_new;

SELECT name FROM names_old
UNION
SELECT name FROM names_new; - - - Bad Practice

SELECT name FROM names_old
UNION ALL
SELECT name FROM names_new; - - Good Practice

8)Avoid Negative search
========================
Negative searches decrease the query execution speed that’s why we need to avoid that.

9)Avoid query in a loop
========================
For(Int i = 0;i <= 5; i++) {
	INSER INTO Table1(Id,Value) Values( i , ‘Value’ + i );
} - - - Bad Practice

INSERT INTO Table1(Id, Value) 
Values(1,Value1),(2,Value2),(2,Value3),(4,Value4),(5,Value5) - - - Good Practice

10)Apply valid datatype on the column
======================================




