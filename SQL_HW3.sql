-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employees e
join employees_salary es on e.id = es.employees_id
join salary s on s.id = es.salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employees e
join employees_salary es on e.id = es.employees_id
join salary s on s.id = es.salary_id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employees e
right join employees_salary es on e.id = es.employees_id
right join salary s on s.id = es.salary_id
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employees e
right join employees_salary es on e.id = es.employees_id
right join salary s on s.id = es.salary_id
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary from employees e
left join employees_salary es on e.id = es.employees_id
left join salary s on s.id = es.salary_id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees e
join roles_employees re on e.id = re.employees_id
join roles r on r.id = re.roles_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees e
join roles_employees re on e.id = re.employees_id
join roles r on r.id = re.roles_id
where role_name like '%Java developer%';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees e
join roles_employees re on e.id = re.employees_id
join roles r on r.id = re.roles_id
where role_name like '%Python developer%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees e
join roles_employees re on e.id = re.employees_id
join roles r on r.id = re.roles_id
where role_name like '%QA engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from employees e
join roles_employees re on e.id = re.employees_id
join roles r on r.id = re.roles_id
where role_name like '%Manual QA engineer%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees e
join roles_employees re on e.id = re.employees_id
join roles r on r.id = re.roles_id
where role_name like '%Automation QA engineer%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary, role_name from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary, role_name from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary, role_name from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков

select role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%Java developer%';

-- 16. Вывести зарплаты Python разработчиков

select role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%Python developer%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary, role_name from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like 'Junior Python developer';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary, role_name from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like 'Middle JavaScript developer';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary, role_name from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like 'Senior Java developer';

-- 20. Вывести зарплаты Junior QA инженеров

select role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like 'Junior%QA engineer';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select AVG(monthly_salary) as avg_junior_sal from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select SUM(monthly_salary) as sum_sal_jsdev from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%JavaScript developer%';

-- 23. Вывести минимальную ЗП QA инженеров

select MIN(monthly_salary) as min_qa_sal from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%QA engineer%';

-- 24. Вывести максимальную ЗП QA инженеров

select MAX(monthly_salary) as max_qa_sal from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%QA engineer%';

-- 25. Вывести количество QA инженеров

select COUNT(role_name) as count_qa_role from roles
where role_name like '%QA engineer';

-- 26. Вывести количество Middle специалистов.

select COUNT(role_name) as count_middle_role from roles
where role_name like '%Middle%';

-- Вывести количество Middle специалистов разделенных по роли
-- select role_name, COUNT(role_name) as count_role from roles
-- where role_name like '%Middle%'
-- group by role_name;

-- 27. Вывести количество разработчиков

select COUNT(role_name) as count_dev_role from roles
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select SUM(monthly_salary) as sum_sal_dev from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
order by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where monthly_salary < 2300
order by monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from roles r
join roles_employees re on r.id = re.roles_id
join employees e on e.id = re.employees_id
join employees_salary es on es.employees_id = re.employees_id
join salary s on s.id = es.salary_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;