-- Query 1
-- This query inner joins the employee and manager table to show which manager manages which employee(s) along with their employee and manager id's
-- (Ordered by manager id from manager table).

SELECT m.manager_id AS "Manager_id" , e.employee_id AS "Employee ID", m.first_name || ' ' || m.last_name || ' manages ' || e.first_name || ' ' || e.last_name AS "Manager Employee List"
FROM employee e INNER JOIN manager m ON e.manager_id = m.manager_id
ORDER BY m.manager_id;


-- Query 2
-- This query full outer joins the employee and department table to show which employees work in which departments (accounting for orphans caused by null values 
-- along with where those departments are located at.
-- It also shows the employee and department phone numbers (Ordered by department name using department table).

SELECT (CASE WHEN e.first_name IS NULL  AND e.last_name IS NULL THEN 'No listed Employee'
             ELSE e.first_name || ' ' || e.last_name END)
      || ' works in the ' || 
       (CASE WHEN d.department_id IS NULL THEN 'Unlisted'
             ELSE d.name  END) 
      || ' department which is located in ' || d.location AS "Employee Department" 
      , e.phone_number AS "Employee Phone Number", d.phone_number AS "Department Phone Number"
FROM employee e FULL OUTER JOIN department d ON e.department_id = d.department_id
ORDER BY d.name;