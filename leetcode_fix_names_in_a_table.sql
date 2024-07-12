-- https://leetcode.com/problems/fix-names-in-a-table/

-- Select A.unique_id, B.name 
-- From EmployeeUNI A 
-- Right Join Employees B on  
-- .id = B.id

Select A.unique_id, B.name 
From Employees B 
Left Join EmployeeUNI A on  
A.id = B.id

-- Select A.unique_id, B.name 
-- From Employees B 
-- Join EmployeeUNI A on  
-- A.id = B.id
-- Order by A.unique_id

-- Select A.unique_id, B.name 
-- From Employees B, EmployeeUNI A
-- Where A.id = B.id
-- Order by A.unique_id
--
-- Select A.unique_id, B.name 
-- From Employees B 
-- Cross Join EmployeeUNI A 