drop table customer;

create table customer(
   id int,
   name varchar(255),
   age int
);

insert into customer values (1, 'Rachit', 21);
insert into customer values (2, 'Shobit', 23);
insert into customer values (2, 'Shobit', 23);
insert into Customer values (3, 'Isha', 22);
insert into customer values (4, 'Devi', 25);
insert into customer values (5, 'Akhil', 26);
insert into customer values (4, 'Devi', 25);
commit;

select * from customer;
id|name  |age|
--+------+---+
 1|Rachit| 21|
 2|Shobit| 23|
 2|Shobit| 23|
 3|Isha  | 22|
 4|Devi  | 25|
 5|Akhil | 26|
 4|Devi  | 25|
 
Solution1
=========
select distinct(id, name, age) from customer;

Solution2
=========
create temporary table tmp_customer(
	select id, name, age 
	from customer
	group by id
);
select * from tmp_customer;
id|name  |age|
--+------+---+
 1|Rachit| 21|
 2|Shobit| 23|
 3|Isha  | 22|
 4|Devi  | 25|
 5|Akhil | 26|


delete from customer;
select * from customer;
id|name|age|
--+----+---+

insert into customer(select * from tmp_customer);
select * from customer;
id|name  |age|
--+------+---+
 1|Rachit| 21|
 2|Shobit| 23|
 3|Isha  | 22|
 4|Devi  | 25|
 5|Akhil | 26|


