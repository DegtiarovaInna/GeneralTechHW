create database homeworks;
use homeworks;
create table staff(
id int primary key auto_increment,
first_name varchar(64) not null,
last_name varchar(100) not null,
position varchar(100),
age int check(age between 0 and 110),
has_child char(1) default 'N',
user_name varchar (50) unique
);

insert into staff (first_name, last_name, position, age, has_child, user_name)
values('John', 'Smith', 'Developer', 35, 'Y', 'JoSmith'),
('Bob', 'Brown', 'DeveloperBE', 25, 'N', 'BB'),
('Alex', 'Jameson', 'DeveloperFE', 20, 'N', 'AlJ'),
('Fill', 'Black', 'Manager', 18, 'Y', 'FillB'),
('Pieter', 'Lee', 'Manager', 40, 'Y', 'PLee');


drop table staff;
drop database homeworks;

create database tasks;
use tasks;

select *
from staff
where age between 21 and 39;


select distinct firstname
from staff;


select firstname, lastname, age
from staff
where id in (3,7,10);


select *
from staff
where firstname like 'A%' and lastname like '%s';




