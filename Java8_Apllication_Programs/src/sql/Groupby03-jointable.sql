
drop table departments
create table departments(
	depart_id int auto_increment,
	depart_name varchar(255),
	primary key(depart_id)
);

drop table employees
create table employees(
   emp_id int auto_increment,
   emp_name varchar(255),  
   depart_id int,
   salary int,
   primary key(emp_id)
);

alter table employees
add foreign key(depart_id) references departments(depart_id);

insert into departments values(1, 'Engineering');
insert into departments values(2, 'HR');
insert into departments values(3, 'Management');
commit;

insert into employees values (10001, 'John',  2, 4000);
insert into employees values (10002, 'Anna', 1, 3500);
insert into employees values (10003, 'James', 1, 2500);
insert into employees values (10004, 'David', 2, 5000);
insert into employees values (10005, 'mark', 2, 3000);
insert into employees values (10006, 'Steve', 3, 5000);
insert into employees values (10007, 'Alice', 3, 4000);
commit;

select * from departments;
depart_id|depart_name|
---------+-----------+
        1|Engineering|
        2|HR         |
        3|Management |
        
select * from employees;
emp_id|emp_name|depart_id|salary|
------+--------+---------+------+
 10001|John    |        2|  4000|
 10002|Anna    |        1|  3500|
 10003|James   |        1|  2500|
 10004|David   |        2|  5000|
 10005|mark    |        2|  3000|
 10006|Steve   |        3|  5000|
 10007|Alice   |        3|  4000|
 
select *
from employees join departments
using(depart_id)
depart_id|emp_id|emp_name|salary|depart_name|
---------+------+--------+------+-----------+
        2| 10001|John    |  4000|HR         |
        1| 10002|Anna    |  3500|Engineering|
        1| 10003|James   |  2500|Engineering|
        2| 10004|David   |  5000|HR         |
        2| 10005|mark    |  3000|HR         |
        3| 10006|Steve   |  5000|Management |
        3| 10007|Alice   |  4000|Management |

GROUP BY
========
select depart_name, sum(salary)
from employees join departments
using(depart_id)
group by depart_name;
depart_name|sum(salary)|
-----------+-----------+
Engineering|       6000|
HR         |      12000|
Management |       9000|

GROUP BY WITH HAVING
====================
select depart_name, sum(salary)
from employees join departments
using(depart_id)
group by depart_name
having sum(salary) > 6000;
