-- You have two tables: employees with columns employee_id, department_id, salary, and departments with columns department_id and department_name. 
   -- Write a SQL query to display the department name along with the average salary of employees in each department

-- INIT database

CREATE TABLE Departments (
  department_id int PRIMARY KEY,
  name varchar(100)
);   

CREATE TABLE Employees (
  employee_id int,
  department_id int, 
  salary decimal(6,2),
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments(department_id, name) VALUES (1, 'Dep1');
INSERT INTO Departments(department_id, name) VALUES (2, 'Dep2');

INSERT INTO Employees(employee_id, department_id, salary) VALUES (1, 1, 1500);
INSERT INTO Employees(employee_id, department_id, salary) VALUES (2, 1, 2000);

INSERT INTO Employees(employee_id, department_id, salary) VALUES (3, 2, 100);
INSERT INTO Employees(employee_id, department_id, salary) VALUES (4, 2, 300);


SELECT d.name, ROUND(AVG(e.salary),2) as avg_salary FROM employees e, departments d  
WHERE d.department_id = e.department_id
GROUP BY e.department_id 