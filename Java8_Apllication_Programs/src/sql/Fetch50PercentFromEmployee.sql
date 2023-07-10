select * from Employee 
where employee_id <= ( select count(employee_id)/2 from Employee);