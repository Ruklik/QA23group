-- Таблица employees
-- Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees (
id serial primary key,
employee_name varchar (50) not null
);

-- Наполнить таблицу employee 70 строками.
insert into employees (id, employee_name)
values (default, 'Serhii');


--===============================================================
-- Таблица salary
-- Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary (
id serial primary key,
monthly_salary int not null
);

-- Наполнить таблицу salary 

insert into salary (id, monthly_salary)
values (default, 2500);

--================================================================

-- Таблица employee_salary
-- Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id Int not null
);

-- Наполнить таблицу salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (id, employee_id, salary_id)
values (default,80,10);

-- select * from employee_salary;

--============================================================================
-- Tаблица roles
-- Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique


create table roles (
id serial primary key,
role_name int not null unique
);

-- Поменять тип столба role_name с int на varchar(30)

ALTER TABLE roles ALTER COLUMN role_name type varchar(30);

-- Наполнить таблицу role 20 строками:

insert into roles (id, role_name)
values (default,'Senior Automation QA engineer');

-- select * from roles;
--==================================================================================

-- Таблица roles_employee
-- Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id Int not null,
foreign key (employee_id) references employees (id),
foreign key (role_id) references roles (id)
);

-- Наполнить таблицу salary 40 строками:

insert into roles_employee (id,employee_id,role_id)
values (default,60,20);


-- select * from roles_employee;


--==========================================

-- UPDATE employees SET employee_name = 'Emily' WHERE id=2

-- select * from salary
-- order by id;