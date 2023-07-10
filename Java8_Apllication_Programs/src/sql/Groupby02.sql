drop table emp;

create table emp(
   emp_id int,
   emp_name Varchar(255),  
   department_id int,
   salary int,
   primary key(emp_id)
);

insert into emp values (1001, 'John',  2, 4000);
insert into emp values (1002, 'Anna', 1, 3500);
insert into emp values (1003, 'James', 1, 2500);
insert into emp values (1004, 'David', 2, 5000);
insert into emp values (1005, 'mark', 2, 3000);
insert into emp values (1006, 'Steve', 3, 5000);
insert into emp values (1007, 'Alice', 3, 4000);
commit;

select * from emp;
emp_id|emp_name|department_id|salary|
------+--------+-------------+------+
  1001|John    |            2|  4000|
  1002|Anna    |            1|  3500|
  1003|James   |            1|  2500|
  1004|David   |            2|  5000|
  1005|mark    |            2|  3000|
  1006|Steve   |            3|  5000|
  1007|Alice   |            3|  4000|
 
GRUOP BY
========
select department_id, avg(salary)
from emp
group by department_id;

department_id|avg(salary)|
-------------+-----------+
            1|  3000.0000|
            2|  4000.0000|
            3|  4500.0000|

GRUOP BY WITH HAVING
====================
select department_id, avg(salary)
from emp
group by department_id
having avg(salary) > 3000;

department_id|avg(salary)|
-------------+-----------+
            2|  4000.0000|
            3|  4500.0000|
            
            