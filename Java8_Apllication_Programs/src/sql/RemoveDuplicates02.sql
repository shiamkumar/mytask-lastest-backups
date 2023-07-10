
--Find out the duplicate records
select
  emp_id, emp_name, count(*)
from
	employee
group by 
    emp_id, emp_name
having
    count(*)>1;
    
--delete query for duplicate records
delete from employee where (emp_id, emp_name) in (
	select
  		emp_id, emp_name, count(*)
	from
		employee
	group by 
    	emp_id, emp_name
	having
    	count(*)>1
);