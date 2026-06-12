-- Query 1
-- This query lists the employee ID, full name, and manager ID of employees who work in the same department as Evan Coleman
-- (Ordered by their employee_id ascending).

SELECT employee_id, first_name || ' ' || last_name AS "Employee Name", manager_id
FROM employee
WHERE department_id = (select department_id
                       from employee
                       where first_name = 'Evan' AND last_name = 'Coleman')
ORDER BY 1;


-- Query 2
-- This  query lists the console name, price, and number of controllers of consoles that have a higher price then all consoles with one controller
-- (Ordered by their price descending).


SELECT name, price, num_of_controllers
FROM console
WHERE price >ALL (select price
                  from console
                  where num_of_controllers = 1)
ORDER BY price desc;
