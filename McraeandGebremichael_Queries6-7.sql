-- Query 1
-- This query lists the name, console price (with $ sign), aand listed release date (reformatted) of all consoles.

SELECT name AS "Console Name", TO_CHAR(price, '$99,999.00')AS "Console Price", TO_CHAR(release_date, 'fmDay, Month ddth, YYYY') AS "Listed Release Date"
FROM console
ORDER BY price;

-- Query 2
-- This query lists all game's names and their genre with each genre shortned.

SELECT name, (CASE genre WHEN 'First Person Shooter' THEN 'FPS'
                         WHEN 'Third Person Shooter' THEN 'TPS'
                         WHEN 'Platformer' THEN 'PLAT'
                         WHEN 'RPG' THEN 'RP'
                         WHEN 'Adventure' THEN 'ADV'
                         WHEN 'Action' THEN 'ACT'
                         WHEN 'Racing' THEN 'RAC' END)AS "Genre"
FROM game
ORDER BY genre;