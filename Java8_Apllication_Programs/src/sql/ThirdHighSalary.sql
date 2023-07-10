
select * from Employee;
employee_id|name		 |gender|salary|department |
-----------+-------------+------+------+-----------+
          1|Rachit       |M     | 50000|Engineering|
          2|Shobit       |M     | 37000|HR         |
          3|Isha         |F     | 56000|Sales      |
          4|Devi         |F     | 43000|Management |
          5|Akhil        |M     | 90000|Engineering|

Query USING limit() (i,e)n-1,1
===============================
select name, salary from Employee order by salary desc limit 1,1;

name|		  salary|
-------------+------+
Isha         | 56000|

Query USING subquery with max()
===============================
select max(e1.salary) from Employee e1 where e1.salary < 
 (select max(e2.salary) from Employee e2 where e2.salary < 
  (select max(e3.salary) from Employee e3) 
);

name|		  salary|
-------------+------+
Rachit       | 50000|

Query USING subquery (i,e)n-1,1
===============================
select name, salary
from Employee e1
where 3-1 = (select COUNT(salary) from Employee e2
where e1.salary < e2.salary);

name|		  salary|
-------------+------+
Rachit       | 50000|
      
Query USING row_number()
=========================
select * from(
 	select name, salary, row_number() over(order by salary desc) as ranking 
 	from Employee) as alias_query
where ranking=2;

name|		  salary|ranking|
-------------+------+-------+
Isha         | 56000|      2|

Query USING rank()
====================
select * from(
select name, salary, rank() 
over(order by salary desc) as ranking from Employee) as alias_query
where ranking=3;

name|		  salary|ranking|
-------------+------+-------+
Rachit       | 50000|      3|


