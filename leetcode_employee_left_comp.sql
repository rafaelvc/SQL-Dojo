-- https://leetcode.com/problems/employees-whose-manager-left-the-company/
select employee_id from employees as e
where e.manager_id is not null and e.salary < 30000
and e.manager_id not in (select employee_id from employees) 
order by employee_id