-- Query 1
-- Shows the manager ID, department_ID (what department(s) they are in), and Manager type of each manager ordered by their manager_id
SELECT manager_id AS "Manager ID", department_id AS "Department ID", 'Employee Manager' AS "Manager Type"
FROM employee
UNION
SELECT manager_id, department_id, 'Department Manager'
FROM manager
ORDER BY 1;


-- Query 2
-- Shows the ID and Name of game(s) that no listed employees have worked on

Select game_id AS "Game ID", name AS "Game Name"
FROM game
MINUS
SELECT ewg.game_game_id, g.name
FROM employee_works_on_games ewg JOIN game g
ON ewg.game_game_id = g.game_id
ORDER BY 1;