-- View 1
-- View shows the employee id and full name along with the console id and console name of console(s) they have worked on

CREATE OR REPLACE VIEW console_designers (Employee_ID,First_Name,Last_Name,Console_ID,Console_Name) AS
SELECT e.employee_id, e.first_name, e.last_name, c.console_id, c.name 
FROM employee e JOIN employee_works_on_console ewc 
ON e.employee_id = ewc.employee_employee_id
JOIN console c ON ewc.console_console_id = c.console_id
ORDER BY 1;

SELECT *
FROM console_designers;

-- Shows the employee ID, full name,  and console worked on of employees who have a employee ID whose first two digits are 10.
SELECT Employee_ID AS "Employee ID",first_name || ' ' || last_name AS "Full Name", console_name AS "Console Name"
FROM console_designers
WHERE employee_id LIKE '10%';


-- View 2
-- View shows the console's name, price, and number of controllers while showing the game's name, genre, and price of the games on each specific console

CREATE OR REPLACE VIEW console_games (Console_Name, Console_price, Num_Of_Controllers, Game_Name, Game_Genre, Game_price) AS
SELECT c.name, c.price, c.num_of_controllers, g.name, g.genre, g.price
FROM console c JOIN console_has_games chg
ON c.console_id = chg.console_console_id
JOIN game g ON chg.game_game_id = g.game_id
WHERE c.num_of_controllers > 2
ORDER BY 1;

SELECT *
FROM console_games;

-- Shows the console names of consoles with a total game price over $80
SELECT console_name AS "Console Name", SUM(game_price) AS "Total Game Cost"
FROM console_games
GROUP BY console_name
HAVING SUM(game_price) > 80;


-- Index
-- Index for game price and name
DROP INDEX game_name_price_idx;

CREATE INDEX game_name_price_idx
ON game (name, price);





