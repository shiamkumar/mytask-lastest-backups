drop table Employee;

create table Employee(
   employee_id int,
   employee_name Varchar(255),
   gender Varchar(20),
   salary int,
   department Varchar(20),
   primary key(employee_id)
);

insert into Employee values (1, 'Rachit', 'M', 50000, 'Engineering');
insert into Employee values (2, 'Shobit', 'M', 37000, 'HR');
insert into Employee values (3, 'Isha', 'F', 56000, 'Sales');
insert into Employee values (4, 'Devi', 'F', 43000, 'Management');
insert into Employee values (5, 'Akhil', 'M', 90000, 'Engineering');
commit;

select * from Employee;
employee_id|employee_name|gender|salary|department |
-----------+-------------+------+------+-----------+
          1|Rachit       |M     | 50000|Engineering|
          2|Shobit       |M     | 37000|HR         |
          3|Isha         |F     | 56000|Sales      |
          4|Devi         |F     | 43000|Management |
          5|Akhil        |M     | 90000|Engineering|

GRUOP BY
========
select department, sum(salary) as salary
from Employee
group by department;  

department |salary|
-----------+------+
Engineering|140000|
HR         | 37000|
Management | 43000|
Sales      | 56000|


GRUOP BY WITH HAVING
====================
select department, sum(salary) as salary
from Employee
group by department
having SUM(Salary) >= 50000; 

department |salary|
-----------+------+
Engineering|140000|
Sales      | 56000|
