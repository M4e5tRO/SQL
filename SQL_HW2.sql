-- 1) Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

-- 2) Наполнить таблицу employee 70 строками.

alter table employees alter column employee_name type varchar(80);

insert into employees (employee_name)
values ('Aaron'), ('Abraham'), ('Adam'), ('Adrian'), ('Aidan'), ('Aaliyah'), ('Abigail'), ('Adelina'), ('Agatha'), ('Alexa'),
('Benjamin'), ('Bernard'), ('Blake'), ('Brandon'), ('Brian'), ('Bailey'), ('Barbara'), ('Beatrice'), ('Belinda'), ('Brianna'),
('Cameron'), ('Carl'), ('Carlos'), ('Charles'), ('Christopher'), ('Caroline'), ('Catherine'), ('Cecilia'), ('Celia'), ('Chloe'),
('Gabriel'), ('Gavin'), ('Geoffrey'), ('George'), ('Gerld'), ('Gloria'), ('Gabriella'), ('Gabrielle'), ('Gladys'), ('Grace'),
('Jack'), ('Jackson'), ('Jacob'), ('Jaden'), ('Jake'), ('Jacqueline'), ('Jada'), ('Jane'), ('Jasmine'), ('Jenna'), ('Malcolm'),
('Martin'), ('Mason'), ('Matthew'), ('Michael'), ('Mia'), ('Michelle'), ('Mildred'), ('Molly'), ('Monica'), ('Samuel'), ('Sean'),
('Sebastian'), ('Seth'), ('Simon'), ('Stephanie'), ('Susan'), ('Sybil'), ('Sydney'), ('Sylvia');

select * from employees;

-- 3) Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary (
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

-- 4) Наполнить таблицу salary 15 строками:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500

insert into salary (monthly_salary)
values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800), (1900), (2000), (2100), (2200), (2300), (2400);

select * from salary;

-- 5) Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employees_salary (
	id serial primary key,
	employees_id int not null unique,
	salary_id int not null
);

select * from employees_salary;

-- 6) Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employees_salary (employees_id, salary_id)
values (71, 1), (72, 2), (73, 3), (74, 4), (75, 5), (76, 6), (77, 7), (78, 8), (79, 9), (80, 10), (11, 11), (12, 12), (13, 13), 
(14, 14), (15, 15), (16, 1), (17, 2), (18, 3), (19, 4), (20, 5), (31, 6), (32, 7), (33, 8), (34, 9), (35, 10), (36, 11),(37, 12),
(38, 13), (39, 14), (40, 15), (51, 1), (52, 2), (53, 3), (54, 4), (55, 5), (56, 6), (57, 7), (58, 8), (59, 9), (60, 10);

select * from employees_salary;

-- 7) Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique

create table roles (
id serial primary key,
role_name int not null unique
);

select * from roles;

--8) Поменять тип столба role_name с int на varchar(30)

alter table roles alter column role_name type varchar(30);

select * from roles;

--9) Наполнить таблицу roles 20 строками:

insert into roles (role_name)
values ('Junior Python developer'), ('Middle Python developer'), ('Senior Python developer'), ('Junior Java developer'),
('Middle Java developer'), ('Senior Java developer'), ('Junior JavaScript developer'), ('Middle JavaScript developer'),
('Senior JavaScript developer'), ('Junior Manual QA engineer'), ('Middle Manual QA engineer'), ('Senior Manual QA engineer'),
('Project Manager'), ('Designer'), ('HR'), ('CEO'), ('Sales manager'), ('Junior Automation QA engineer'),
('Middle Automation QA engineer'), ('Senior Automation QA engineer');

select * from roles;

-- 10) Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employees (
	id serial primary key,
	employees_id int not null unique,
	roles_id int not null,
	foreign key (employees_id)
		references employees(id),
	foreign key (roles_id)
		references roles(id)
);

select * from roles_employees;

-- 11) Наполнить таблицу roles_employee 40 строками:

insert into roles_employees (employees_id, roles_id)
values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (51, 11), (52, 12),
(53, 13), (54, 14), (55, 15), (56, 16), (57, 17), (58, 18), (59, 19), (60, 20), (21, 1), (22, 2), (23, 3),
(24, 4), (25, 5), (26, 6), (27, 7), (28, 8), (29, 9), (30, 10), (31, 11), (32, 12), (33, 13), (34, 14), (35, 15),
(36, 16), (37, 17), (38, 18), (39, 19), (40, 20);

select * from roles_employees;