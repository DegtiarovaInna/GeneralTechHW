use tasks;
-- Повысить зарплаты для отдела sales на 20%, для finance 15%,
--  для shipping 10%, для marketing 25%, для Human Resources 20% и для IT 35%. 
--  Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 


select *,  case
                when  department = 'sales' then salary+salary*0.2
                when department = 'finance' then salary+salary*0.15
                when department = 'shipping' then salary+salary*0.1
                when department = 'marketing' then salary+salary*0.25
                when department = 'Human Resources' then salary+salary*0.2
                when department = 'IT' then salary+salary*0.35
                end as new_salary
from employees

-- Создать поле new_salary типа numeric(7, 2).

-- Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, 
-- для shipping 10%, для marketing 25%, для Human Resources 20% и для IT 35%.

alter table employees
add column new_salary numeric(7, 2);
set sql_safe_updates = 0;
update employees
set new_salary = case
                when  department = 'sales' then salary+salary*0.2
                when department = 'finance' then salary+salary*0.15
                when department = 'shipping' then salary+salary*0.1
                when department = 'marketing' then salary+salary*0.25
                when department = 'Human Resources' then salary+salary*0.2
                when department = 'IT' then salary+salary*0.35
                end;
                
                
-- Вывести из таблицы employees firstname как name, lastname как surname и salary как total_salary.

select first_name as name, last_name as surname, salary as total_salary
from employees;

-- Вывести новое поле commission (через AS), которое будет null, если зарплата сотрудника меньше 3000, 
-- будет 10, если зарплата меньше 6000,
--  будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.

select *, case
          when salary < 3000 then NULL
          when salary <6000 then 10
          when salary <9000 then 15
          when salary >=9000 then 20
          end as commission
from employees;

-- Создать новое поле commission и соответственно заполнить.
alter table employees
add column commission int;

update employees
set commission = case 
		 when salary < 3000 then NULL
          when salary <6000 then 10
          when salary <9000 then 15
          when salary >=9000 then 20
          end;
          
-- Создать поле finalsalary и заполнить формулой salary + salary * commission / 100. 
-- Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary. 
alter table employees
add column finalsalary numeric(7, 2);
update employees
set finalsalary = coalesce(salary + salary * commission / 100, salary);



-- Удалить из таблицы сотрудников, у которых commission меньше 15.

delete from employees
where commission <15;