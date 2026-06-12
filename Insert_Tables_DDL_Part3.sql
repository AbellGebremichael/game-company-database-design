-- Drop tables for multiple runs
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE Manager CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Console CASCADE CONSTRAINTS;
DROP TABLE Game CASCADE CONSTRAINTS;
DROP TABLE Console_has_Games CASCADE CONSTRAINTS;
DROP TABLE Employee_works_on_Console CASCADE CONSTRAINTS;
DROP TABLE Employee_works_on_Games CASCADE CONSTRAINTS;
DROP SEQUENCE department_seq;


-- Create Department table
CREATE TABLE Department(
Department_id NUMBER(6) NOT NULL,
Name VARCHAR2(45) NOT NULL,
Location VARCHAR2(45) NOT NULL,
Phone_Number VARCHAR2(10) NOT NULL,
CONSTRAINT department_department_id_pk PRIMARY KEY (Department_id));


-- Create Manager table
CREATE TABLE Manager (
Manager_id NUMBER(6) NOT NULL,
First_Name VARCHAR2(45) NOT NULL,
Last_Name VARCHAR2(45) NOT NULL,
Email VARCHAR2(45) NOT NULL,
Phone_Number VARCHAR2(10) NOT NULL,
Department_id NUMBER(6) NOT NULL,
CONSTRAINT manager_manager_id_pk PRIMARY KEY (Manager_id),
CONSTRAINT manager_department_id_fk FOREIGN KEY (Department_id) REFERENCES
department(Department_id));


-- Create Employee table
CREATE TABLE Employee (
Employee_id NUMBER(6) NOT NULL,
First_Name VARCHAR2(45) NOT NULL,
Last_Name VARCHAR2(45) NOT NULL,
Email VARCHAR2(45) NOT NULL,
Phone_Number VARCHAR2(10) NOT NULL,
Manager_id NUMBER(6) NOT NULL,
Department_id NUMBER(6) NOT NULL,
CONSTRAINT employee_employee_id_pk PRIMARY KEY (Employee_id),
CONSTRAINT employee_manager_id_fk FOREIGN KEY (Manager_id) REFERENCES 
manager(Manager_id),
CONSTRAINT employee_department_id_fk FOREIGN KEY (Department_id) REFERENCES
department(Department_id));


-- Create Console table
CREATE TABLE Console (
Console_id NUMBER(6) NOT NULL,
Name VARCHAR2(45) NOT NULL,
Release_Date DATE NOT NULL,
Price Decimal(6,2) NOT NULL,
Num_of_Controllers NUMBER(2) NOT NULL,
CONSTRAINT console_console_id_pk PRIMARY KEY (Console_id));


-- Create Game table
CREATE TABLE Game (
Game_id NUMBER(6) NOT NULL,
Name VARCHAR2(45) NOT NULL,
Genre VARCHAR2(30) NOT NULL,
Release_Date DATE NOT NULL,
Price DECIMAL(6,2) NOT NULL,
CONSTRAINT game_game_id_pk PRIMARY KEY (Game_id));


-- Create Console_has_Games table
CREATE TABLE Console_has_Games (
Console_Console_id NUMBER(6) NOT NULL,
Game_Game_id NUMBER(6) NOT NULL,
CONSTRAINT console_has_games_id_pk PRIMARY KEY (Console_Console_id, Game_Game_id),
CONSTRAINT console_has_games_console_id_fk FOREIGN KEY (Console_Console_id) REFERENCES 
console(Console_id),
CONSTRAINT console_has_games_game_id_fk FOREIGN KEY (Game_Game_id) REFERENCES 
game(game_id));


-- Create Employee_works_on_Console table
CREATE TABLE Employee_works_on_Console (
Employee_Employee_id NUMBER(6) NOT NULL,
Console_Console_id NUMBER(6) NOT NULL,
Start_Date TIMESTAMP NOT NULL,
End_Date TIMESTAMP NOT NULL,
CONSTRAINT employee_works_on_console_id_pk PRIMARY KEY (Employee_Employee_id, Console_Console_id),
CONSTRAINT employee_works_on_console_employee_id_fk FOREIGN KEY (Employee_Employee_id) REFERENCES 
employee(employee_id),
CONSTRAINT employee_works_on_console_console_id_fk FOREIGN KEY (Console_Console_id) REFERENCES 
console(Console_id));


-- Create Employee_works_on_Games table
CREATE TABLE Employee_works_on_Games (
Employee_Employee_id NUMBER(6) NOT NULL,
Game_Game_id NUMBER(6) NOT NULL,
Start_Date TIMESTAMP NOT NULL,
End_Date TIMESTAMP NOT NULL,
CONSTRAINT employee_works_on_games_id_pk PRIMARY KEY (Employee_Employee_id, Game_Game_id),
CONSTRAINT employee_works_on_games_employee_id_fk FOREIGN KEY (Employee_Employee_id) REFERENCES 
employee(employee_id),
CONSTRAINT employee_works_on_games_game_id_fk FOREIGN KEY (Game_Game_id) REFERENCES 
game(Game_id));


-- Sequence for Department table
CREATE SEQUENCE department_seq
START WITH 100
INCREMENT BY 20;

-- Insert data into Department
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Human Resources','BD12','7702218787');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Information Technology','BD10','7704626187');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Security','BD4','4708339090');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Marketing','BD6','6709558883');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Legal','BD5','8802150540');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Data Analytics','BD14','4709942435');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Accounting','BD9','6708342221');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Sales','BD7','8802313341');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Administrative','BD1','7705685310');
INSERT INTO DEPARTMENT(Department_id,Name,Location,Phone_Number)
    VALUES(department_seq.NEXTVAL,'Customer Service','BD20','7709190921');
    

-- Insert data into Console
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(1,'Playstation 4', '15-OCT-13', 399.99, 4);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(5,'Nintendo Switch', '24-MAR-17', 349.99, 8);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(10,'Xbox Five', '05-AUG-26', 499.99, 2);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(20,'Nintendo Pro', '11-JAN-24', 299.99, 4);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(35,'Playstation Omega', '27-DEC-25', 449.49, 2);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(60,'Atari', '30-MAY-86', 200.00, 1);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(80,'Nintendo Gameboy', '25-OCT-96', 149.49, 4);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(100,'PS Vita', '29-APR-09', 200.00, 4);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(120,'Xbox Lite', '15-MAY-10', 289.99, 4);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(145,'Google Stadia', '01-JAN-17', 310.00, 1);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(185,'Nintendo DS Lite', '27-JUN-04', 145.00, 8);
INSERT INTO CONSOLE(Console_id, Name, Release_Date, Price, Num_of_Controllers)
    VALUES(200,'Steam Deck', '07-DEC-22', 299.99, 1);
    

--Insert data into Game 
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(10, 'Marvel Rivals', 'Third Person Shooter', '06-NOV-24', 10.00);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(20, 'Super Mario Odyssey', 'Platformer', '27-OCT-17', 59.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(30, 'Shovel Knight', 'Platformer', '26-JUN-14', 39.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(40, 'Call of Duty: Modern Warfare 3', 'First Person Shooter', '08-NOV-11', 59.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(50, 'Devil May Cry 6', 'Action', '18-AUG-25', 49.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(60, 'Pokemon Red', 'RPG', '27-FEB-96', 20.00);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(70, 'Mario Kart DS', 'Racing', '14-NOV-08', 29.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(80, 'Halo Reach', 'First Person Shooter', '14-SEP-10', 49.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(90, 'E.T. the Extra-Terrestrial', 'Adventure', '25-DEC-82', 15.00);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(100, 'Trails Beyond the Horizon', 'RPG', '15-JAN-26', 59.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(110, 'Little Big Planet', 'Platformer', '27-OCT-10', 19.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(120, 'Uncharted 4: A Thief End', 'Adventure', '10-MAY-16', 39.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(130, 'Forza Horizon 4', 'Racing', '02-OCT-18', 59.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(140, 'Legend of Zelda: Tears of the Kingdom ', 'Adventure', '12-MAY-23', 39.99);
INSERT INTO GAME(Game_id, Name, Genre, Release_Date, Price)
    VALUES(150, 'God of War', 'Third Person Shooter', '20-APR-18', 49.99);

--INSERT MANAGER VALUES
INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES(10, 'PETER', 'JONES', 'PJONES@GMAIL.COM', '4042348484', 100);
INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (11, 'Aaron',  'Peters', 'apeters@company.com', '7705554001', 120); 
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
     VALUES (12, 'Natalie','Crawford','ncrawford@company.com', '7705554002', 140);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (13, 'Derek',  'Holloway', 'dholloway@company.com', '7705554003', 160);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (14, 'Monica', 'Fletcher','mfletcher@company.com', '7705554004', 180);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (15, 'Caleb',  'Whitmore','cwhitmore@company.com',  '7705554005', 200);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (16, 'Vanessa','Ortiz', 'vortiz@company.com', '7705554006', 220);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (17, 'Trevor', 'Daniels', 'tdaniels@company.com','7705554007', 240);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (18, 'Hannah', 'Klein', 'hklein@company.com',  '7705554008', 260);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (19, 'Marcus', 'Reynolds','mreynolds@company.com', '7705554009', 280);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (20, 'Sofia',  'Delgado', 'sdelgado@company.com', '7705554010', 280);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
     VALUES (21, 'Ethan',  'McBride', 'emcbride@company.com','7705554011', 260);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (22, 'Priya',  'Shah', 'pshah@company.com',  '7705554012', 240);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (23, 'Logan',  'Turner', 'lturner@company.com',  '7705554013', 220);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (24, 'Alicia', 'Romero', 'aromero@company.com', '7705554014', 200);
 INSERT INTO MANAGER(MANAGER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,DEPARTMENT_ID)
    VALUES (25, 'Brandon','Hughes','bhughes@company.com',  '7705554015', 180);
    
    --INSERT EMPLOYEE VALUES
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(101, 'Jacob','Morris','jmorris@company.com','6785555001', 25, 160);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(102, 'Emily','Nguyen','enguyen@company.com','6785555002', 24, 180);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(103, 'Anthony','Brooks','abrooks@company.com','6785555003', 23, 120);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(104, 'Samantha','Price','sprice@company.com','6785555004', 22, 160);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(105, 'Daniel','Ramirez','dramirez@company.com','6785555005', 21, 200);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
   VALUES(106, 'Lauren','Mitchell','lmitchell@company.com','6785555006', 20, 140);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES  (107, 'Kevin', 'OConnor','koconnor@company.com','6785555007',19, 280);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES (108, 'Aisha', 'Khan','akhan@company.com','6785555008', 18, 220);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES (109, 'Brian', 'Thompson','bthompson@company.com','6785555009', 17, 260);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES (110, 'Isabella','Flores','iflores@company.com','6785555010', 16, 240);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES (111, 'Marcus','Ellis','mellis@company.com','6785555011', 12, 200);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES (112, 'Nina','Patel','npatel@company.com','6785555012', 11, 180);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES (113, 'Tyler','Bennett','tbennett@company.com','6785555013', 12, 160);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(114, 'Rosa','Martinez','rmartinez@company.com','6785555014', 12, 140);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,first_name,last_name,email,phone_number,manager_id,DEPARTMENT_ID)
    VALUES(115, 'Evan','Coleman','ecoleman@company.com','6785555015', 18, 120);
    
-- INSERT INTO CONSOLE_HAS_GAMES
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(1,40);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(1,120);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES (1,150);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES (5,20);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(5,140);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(5,70);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(10,40);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(10,80);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(20,30);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(20,50);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(35,110);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(35,150);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(60,90);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(80,60);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(80,70);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(100,110);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(100,120);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(120,80);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(120,130);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(185,70);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(185,60);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(200,100);
INSERT INTO console_has_games(console_console_id,game_game_id)
    VALUES(200,30);

--INSERT INTO EMPLOYEE_WORKS_ON_CONSOLE
INSERT INTO employee_works_on_console(employee_employee_id,console_console_id, START_DATE,end_date)
   VALUES (101, 1,   TIMESTAMP '2023-01-10 09:00:00', TIMESTAMP '2023-06-30 17:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (102, 5,   TIMESTAMP '2022-03-15 08:30:00', TIMESTAMP '2022-12-20 16:30:00');
INSERT INTO Employee_works_on_Console
    VALUES (103, 10,  TIMESTAMP '2024-02-01 10:00:00', TIMESTAMP '2024-08-15 18:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (104, 20,  TIMESTAMP '2023-05-05 09:00:00', TIMESTAMP '2023-11-30 17:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (105, 35,  TIMESTAMP '2024-01-12 08:00:00', TIMESTAMP '2024-07-01 16:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (106, 60,  TIMESTAMP '2021-06-01 09:30:00', TIMESTAMP '2021-12-10 17:30:00');
INSERT INTO Employee_works_on_Console
    VALUES (107, 80,  TIMESTAMP '2020-02-20 10:00:00', TIMESTAMP '2020-09-15 18:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (108, 100, TIMESTAMP '2022-09-01 08:45:00', TIMESTAMP '2023-02-28 17:15:00');
INSERT INTO Employee_works_on_Console
    VALUES (109, 120, TIMESTAMP '2023-04-10 09:00:00', TIMESTAMP '2023-10-20 17:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (110, 145, TIMESTAMP '2021-11-01 10:30:00', TIMESTAMP '2022-05-30 18:30:00');
INSERT INTO Employee_works_on_Console
    VALUES (111, 185, TIMESTAMP '2020-01-05 08:00:00', TIMESTAMP '2020-06-25 16:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (112, 200, TIMESTAMP '2023-08-01 09:15:00', TIMESTAMP '2024-01-15 17:15:00');
INSERT INTO Employee_works_on_Console
    VALUES (113, 1,   TIMESTAMP '2024-03-01 10:00:00', TIMESTAMP '2024-09-30 18:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (114, 5,   TIMESTAMP '2022-01-10 09:00:00', TIMESTAMP '2022-07-20 17:00:00');
INSERT INTO Employee_works_on_Console
    VALUES (115, 10,  TIMESTAMP '2025-02-01 08:30:00', TIMESTAMP '2025-08-01 16:30:00');


-- Insert data into Employee_works_on_Games
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (101, 10,   TIMESTAMP '2023-01-10 08:00:00', TIMESTAMP '2024-06-30 17:00:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (102, 30,   TIMESTAMP '2012-03-10 09:00:00', TIMESTAMP '2014-06-01 15:00:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (103, 50,   TIMESTAMP '2024-11-07 10:30:00', TIMESTAMP '2025-06-30 17:00:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (104, 10,   TIMESTAMP '2023-01-15 09:45:00', TIMESTAMP '2024-06-30 18:15:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (105, 90,   TIMESTAMP '2001-12-22 08:15:00', TIMESTAMP '2002-11-05 16:30:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (106, 60,   TIMESTAMP '1995-02-18 09:00:00', TIMESTAMP '1996-02-18 17:45:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (107, 100,   TIMESTAMP '2025-06-25 09:15:00', TIMESTAMP '2026-01-02 18:15:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (108, 150,   TIMESTAMP '2017-11-10 08:30:00', TIMESTAMP '2018-03-04 17:30:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (109, 80,   TIMESTAMP '2010-05-07 08:30:00', TIMESTAMP '2010-09-08 17:30:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (110, 110,   TIMESTAMP '2010-04-16 10:15:00', TIMESTAMP '2010-10-20 16:45:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (111, 130,   TIMESTAMP '2017-12-31 07:30:00', TIMESTAMP '2018-09-30 15:45:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (112, 20,   TIMESTAMP '2016-04-12 09:30:00', TIMESTAMP '2017-08-09 17:15:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (113, 40,   TIMESTAMP '2011-03-03 09:00:00', TIMESTAMP '2011-04-24 16:30:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (114, 120,   TIMESTAMP '2015-08-16 10:00:00', TIMESTAMP '2015-12-31 17:45:00');
INSERT INTO Employee_works_on_Games(employee_employee_id, game_game_id, Start_Date, End_Date)
    VALUES (115, 70,   TIMESTAMP '2008-03-01 08:45:00', TIMESTAMP '2008-10-22 16:15:00');


commit;