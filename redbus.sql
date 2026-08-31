CREATE database REDBUS_TICKETS;
USE REDBUS_TICKETS;

CREATE TABLE LIST_buses(
BUS_no varchar(10) PRIMARY KEY,
BUS_name varchar(50),
Source VARCHAR(50),
Destination VARCHAR(50) NOT NULL,
Fare INT,
Date DATE,
Time TIME
);

CREATE TABLE bus_status (
    Bus_no VARCHAR(10),
    Available_seats INT,
    Booked_seats INT
);

CREATE TABLE passengers (
    Passenger_id VARCHAR(10) PRIMARY KEY,
    P_Name VARCHAR(20) NOT NULL,
    Bus_no VARCHAR(10),
    Gender VARCHAR(10),
    Age INT,
    Status VARCHAR(20)
);
INSERT INTO List_buses (Bus_no, Bus_name, Source, Destination, Fare, Date, Time) VALUES
('UP301', 'Zing bus', 'Pari Chauk', 'Prayagraj', 1010, '2022-08-21', '21:30:00'),
('HR302', 'Cargo', 'Sector 62', 'Chandigarh', 1020, '2022-08-23', '22:44:00'),
('UP101', 'Blue world', 'Pari Chauk', 'Lucknow', 1240, '2022-09-24', '08:05:00'),
('HR303', 'Maheshwaram', 'ISBT', 'Ambala', 1010, '2022-09-25', '07:22:00'),
('UP505', 'Goluxury', 'ISBT', 'Kanpur', 2250, '2022-09-27', '19:38:00'),
('DL701', 'Vaishnavi', 'ISBT', 'Chandigarh', 1550, '2022-09-28', '23:55:00'),
('DL306', 'Shatabdi', 'ISBT', 'Dehradun', 1007, '2022-09-29', '20:45:00'),
('UP501', 'Safar', 'Pari Chauk', 'Varansi', 1080, '2022-09-30', '08:35:00');

INSERT INTO bus_status (Bus_no, Available_seats, Booked_seats) VALUES
('UP301', 35, 25),
('HR302', 41, 24),
('UP101', 10, 51),
('HR303', 14, 48),
('UP505', 1, 59),
('DL701', 8, 46),
('DL306', 17, 45),
('UP501', 50, 0);


INSERT INTO passengers (Passenger_id, P_Name, Bus_no, Gender, Age, Status) VALUES
('SCS012', 'Arjun', 'UP301', 'M', 17, 'Confirm'),
('SCS013', 'Anamika', 'HR302', 'F', 15, 'Confirm'),
('SCS016', 'Divya', 'UP101', 'F', 65, 'Waiting'), 
('SCS014', 'Diya', 'HR303', 'F', 19, 'Confirm'),
('SCS015', 'Abhishek', 'UP505', 'M', 57, 'Confirm'),
('SCS090', 'Shiva', 'DL701', 'M', 16, 'Waiting'),
('SCS071', 'Rahul', 'DL306', 'M', 21, 'Confirm'),
('SCS043', 'Rupam', 'UP501', 'F', 22, 'Confirm'),
('SCS017', 'Hina', 'UP301', 'F', 23, 'Waiting'),
('SCS022', 'Alam', 'HR302', 'M', 21, 'Waiting'),
('SCS056', 'Satya', 'UP101', 'M', 23, 'Confirm');
select * from passengers;

SELECT * FROM passengers WHERE Gender = 'M';
SELECT * FROM passengers WHERE P_Name IS NULL;
SELECT * FROM passengers WHERE Gender = 'F' AND Age > 18;
SELECT * FROM List_buses WHERE Source IN ('ISBT', 'Pari Chauk');
ALTER TABLE passengers ADD blood_grp VARCHAR(7);
select * from passengers;
ALTER TABLE passengers DROP COLUMN	blood_grp;
select * from passengers;

CREATE TABLE new_passengers AS SELECT * FROM passengers;
select * from new_passengers;

ALTER TABLE new_passengers MODIFY Gender enum('M','F','others');

ALTER TABLE new_passengers RENAME COLUMN bus_no TO bus_Number;
select * FROM new_passengers;

DELETE FROM new_passengers WHERE Age > 50;
select * FROM new_passengers;

UPDATE new_passengers SET Age = 17 WHERE P_Name = 'Shiva';
select * FROM new_passengers;


SELECT Source, COUNT(*) AS Number_of_Buses 
FROM List_buses 
GROUP BY Source;

SELECT Source, COUNT(*) AS Number_of_Buses FROM List_buses GROUP BY Source ORDER BY Number_of_Buses ASC;

SELECT * FROM List_buses ORDER BY Fare ASC LIMIT 4;

SELECT * FROM passengers WHERE P_Name LIKE 'D%';

SELECT * FROM passengers WHERE P_Name LIKE '%m' ORDER BY P_Name ASC LIMIT 1;

SELECT AVG(Age) AS Average_Age FROM passengers WHERE Gender IN ('M', 'male');

SELECT P_Name FROM passengers WHERE Status = 'Confirm' ORDER BY Age DESC LIMIT 1;

SELECT p.* FROM passengers p JOIN List_buses b ON p.Bus_no = b.Bus_no WHERE p.Gender = 'F' AND p.Status = 'Confirm' AND b.Source = 'Pari Chauk';

SELECT CONCAT(Age, ' - ', Gender) AS passenger_detail FROM passengers;

UPDATE List_buses SET Fare = CASE WHEN Source = 'Pari Chauk' THEN Fare + 50 WHEN Source = 'ISBT' THEN Fare + 75 ELSE Fare END;
select * from List_buses