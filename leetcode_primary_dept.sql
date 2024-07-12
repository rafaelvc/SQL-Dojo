-- https://leetcode.com/problems/primary-department-for-each-employee/

select employee_id, department_id from employee e
where primary_flag = 'Y' OR (select count(employee_id) from employee where employee_id = e.employee_id) = 1