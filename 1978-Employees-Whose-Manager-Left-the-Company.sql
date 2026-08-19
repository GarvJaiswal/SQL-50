-- Write your PostgreSQL query statement below
SELECT e.employee_id
FROM Employees e
left join Employees b 
on e.manager_id = b.employee_id
WHERE e.salary < 30000 AND b.employee_id is  null
AND e.manager_id is not null
ORDER BY e.employee_id;