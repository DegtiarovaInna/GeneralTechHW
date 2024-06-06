 -- 1. Создать таблицу employees;
-- employeeid целое число первичный ключ автоинкремент;
-- fname строка не null,
-- lastname строка не null,
-- email строка не null,
-- phone строка не null
-- 2. Добавить поле salary numeric(9, 2),
-- 3. Изменить тип salary на integer 
-- 4. Переименовать поле fname на first_name
-- 5. Удалить поле phone
-- 6. Добавить поле department строка не null 
-- 7. Заполнить таблицу (7 строк)

create database homework;
use homework;
create table emploees(
employeeid int primary key auto_increment,
fname varchar(40) not null,
lastname varchar (60) not null,
email varchar (60) not null,
phone varchar (20) not null
);

alter table emploees
add column salary numeric(9, 2);

alter table emploees
modify column salary int; 

alter table emploees
change column fname first_name varchar(40) not null;

alter table emploees
drop column phone;

alter table emploees
add column department varchar (20) not null;


insert into emploees(first_name, lastname, email, salary, department)
values('Inna', 'De', 'innade@gmail.com', 7000, 'Software Development'),
('Anna', 'Ka', 'annakae@gmail.com', 6000, 'Software Development'),
('Jana', 'Po', 'janapoe@gmail.de', 5000, 'Information Security'),
('Alex', 'Cher', 'alex@mail.de', 5500, 'Information Security'),
('Dmytro', 'Ivanov', 'dmitrox@mail.ua', 6000, 'Project Management '),
('Sergey', 'Polyn', 'serg543@gmail.ua', 5000, 'Data and Analytics '),
('Eugen', 'Prys', 'evgen12@gmail.ua', 10000, 'Project Management');








