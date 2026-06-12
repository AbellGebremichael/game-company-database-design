-- Query 8
-- This query counts the number of employees in each department (grouped by each deparrtment ID)
-- ordered from the highest number of employees to lowest.

SELECT department_id AS "Department ID", Count(employee_id)  AS "Number of Employees"
FROM employee
GROUP BY department_id
ORDER BY 2 desc;


-- Query 9
-- This query finds the total sum of games in a specific genre along with the number of games ordered by the sum highest to lowest.

SELECT genre AS "Genre", SUM(price) AS "Total Genre Price", COUNT(game_id) AS "Number of games in Genre"
FROM game
GROUP BY genre
HAVING SUM(price) > 80.00
ORDER BY 2 desc;