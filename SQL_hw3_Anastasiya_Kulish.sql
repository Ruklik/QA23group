-- SQL HomeWork 3. Joins
 -- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
 
 select employees.employee_name, salary.monthly_salary
from employees 
join employee_salary 
on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
;

 -- 2. Вывести всех работников у которых ЗП
 -- меньше 2000.
 select employees.employee_name, salary.monthly_salary 
from employees 
join employee_salary 
on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
where salary.monthly_salary<2000
;

 -- 3. Вывести все зарплатные позиции,
 -- но работник по ним не назначен.
 -- (ЗП есть, но не понятно кто её получает.)

 select salary.monthly_salary
from  salary
join employee_salary
on employee_salary.salary_id = salary.id
full join employees
on employee_salary.employee_id = employees.id 
where employees.employee_name is null
;


 -- 4. Вывести все зарплатные позиции  меньше 2000
 -- но работник по ним не назначен.
 -- (ЗП есть, но не понятно кто её получает.)

select salary.monthly_salary
from  salary
join employee_salary
on employee_salary.salary_id = salary.id
full join employees
on employee_salary.employee_id = employees.id 
where employees.employee_name is null
and salary.monthly_salary < 2000
;

 -- 5. Найти всех работников кому не начислена ЗП.

select employees.id, employee_name
from  employees
left join employee_salary
on employee_salary.employee_id = employees.id
full join salary
on employee_salary.salary_id = salary.id 
where employee_salary.salary_id is null;

 -- 6. Вывести всех работников с названиями
 -- их должности.
select employees.id, employees.employee_name, roles.role_name 
from employees
join roles_employee 
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
;

 -- 7. Вывести имена и должность только 
 -- Java разработчиков.

select employees.employee_name, roles.role_name
from employees
join roles_employee 
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
where roles.role_name like'%Java developer%'
;

 -- 8. Вывести имена и должность только 
 -- Python разработчиков.
select employees.employee_name, roles.role_name 
from employees
join roles_employee 
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
where roles.role_name like'%Python developer%';

 -- 9. Вывести имена и должность всех
 -- QA инженеров.

select employees.employee_name, roles.role_name 
from employees
join roles_employee 
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
where roles.role_name like'%QA engineer%';

 -- 10. Вывести имена и должность ручных 
 -- QA инженеров.

select employees.employee_name, roles.role_name 
from employees
join roles_employee 
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
where roles.role_name like'%Manual QA%';


 -- 11. Вывести имена и должность 
 -- автоматизаторов QA

select employees.employee_name, roles.role_name 
from employees
join roles_employee 
on roles_employee.employee_id = employees.id
join roles 
on roles.id = roles_employee.role_id
where roles.role_name like'%Automation QA%';


 -- 12. Вывести имена и зарплаты 
 -- Junior специалистов

select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Junior%')
;

 -- 13. Вывести имена и зарплаты 
 -- Middle специалистов

select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Middle%');

 -- 14. Вывести имена и зарплаты 
 -- Senior специалистов

select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Senior%');

 -- 15. Вывести зарплаты Java разработчиков

select salary.monthly_salary 
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Java%');


 -- 16. Вывести зарплаты Python разработчиков

select salary.monthly_salary 
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Python%');

 --  17. Вывести имена и зарплаты 
 -- Junior Python разработчиков

select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Junior Python%');

 -- 18. Вывести имена и зарплаты
 -- Middle JS разработчиков

select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Middle JavaScript%');

 -- 19. Вывести имена и зарплаты 
 -- Senior Java разработчиков

select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id =salary.id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like'%Senior Java%');

 -- 20. Вывести зарплаты Junior QA инженеров

select salary.monthly_salary 
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like '%Junior QA%');

 -- 21. Вывести среднюю зарплату 
 -- всех Junior специалистов

select AVG(salary.monthly_salary) as avg_salary
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like '%Junior%');

 -- 22. Вывести сумму зарплат JS разработчиков

select SUM(salary.monthly_salary) as sum_salary
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like '%Java Script%');

 -- 23. Вывести минимальную ЗП QA инженеров

select MIN(salary.monthly_salary) as min_salary
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like '%QA%');

 -- 24. Вывести максимальную ЗП QA инженеров

select MAX(salary.monthly_salary) as max_salary
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like '%QA%');

 -- 25. Вывести количество QA инженеров

select COUNT(roles_employee.role_id) as count_QA
from roles_employee
where role_id in
(select id 
from roles where role_name like '%QA%');
                
 -- 26. Вывести количество Middle специалистов.

select COUNT(roles_employee.role_id) as count_middle
from roles_employee
where role_id in
(select id 
from roles where role_name like '%Middle%');

 -- 27. Вывести количество разработчиков

select COUNT(roles_employee.role_id) as count_dev
from roles_employee
where role_id in
(select id 
from roles where role_name like '%developer%');

 -- 28. Вывести фонд (сумму) зарплаты разработчиков.

select SUM(salary.monthly_salary) as sum_salary_dev
from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id
join roles_employee on roles_employee.employee_id = employees.id
where roles_employee.role_id in ( 
select id from roles
where role_name like '%developer%');

 -- 29. Вывести имена, должности и ЗП всех 
 -- специалистов по возрастанию

select e.employee_name, r.role_name, salary.monthly_salary
from employees e 
join employee_salary es 
on es.employee_id = e.id 
join salary 
on salary.id = es.salary_id 
join roles_employee re 
on re.employee_id = e.id
join roles r 
on r.id = re.role_id 
order by salary.monthly_salary


 -- 30. Вывести имена, должности и ЗП всех 
 -- cпециалистов по возрастанию у специалистов 
 -- у которых ЗП от 1700 до 2300

select e.employee_name, r.role_name, salary.monthly_salary
from employees e 
join employee_salary es 
on es.employee_id = e.id 
join salary 
on salary.id = es.salary_id 
join roles_employee re 
on re.employee_id = e.id
join roles r 
on r.id = re.role_id 
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary;


 -- 31. Вывести имена, должности и ЗП всех 
 -- специалистов по возрастанию у специалистов
 -- у которых ЗП меньше 2300

select e.employee_name, r.role_name, salary.monthly_salary
from employees e 
join employee_salary es 
on es.employee_id = e.id 
join salary 
on salary.id = es.salary_id 
join roles_employee re 
on re.employee_id = e.id
join roles r 
on r.id = re.role_id 
where salary.monthly_salary<2300
order by salary.monthly_salary;

 -- 32. Вывести имена, должности и ЗП всех
 -- специалистов по возрастанию у специалистов
 -- у которых ЗП равна 1100, 1500, 2000

select e.employee_name, r.role_name, salary.monthly_salary
from employees e 
join employee_salary es 
on es.employee_id = e.id 
join salary 
on salary.id = es.salary_id 
join roles_employee re 
on re.employee_id = e.id
join roles r 
on r.id = re.role_id 
where salary.monthly_salary IN (1100,1500,2000)
order by salary.monthly_salary
