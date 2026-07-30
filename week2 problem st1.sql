CREATE DATABASE IF NOT EXISTS skytrack_db;
USE skytrack_db;
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10) UNIQUE NOT NULL,
    source VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    departure_date DATE NOT NULL,
    ticket_price DECIMAL(10,2) CHECK (ticket_price > 0)
);
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);
INSERT INTO Flights VALUES
(1,'AI101','Hyderabad','Delhi','2026-08-10',5500),
(2,'AI102','Delhi','Mumbai','2026-08-11',4500),
(3,'AI103','Chennai','Bangalore','2026-08-12',3000),
(4,'AI104','Mumbai','Goa','2026-08-13',3500),
(5,'AI105','Delhi','Kolkata','2026-08-14',5000),
(6,'AI106','Hyderabad','Chennai','2026-08-15',2500),
(7,'AI107','Goa','Delhi','2026-08-16',4800),
(8,'AI108','Bangalore','Mumbai','2026-08-17',4200),
(9,'AI109','Kolkata','Hyderabad','2026-08-18',5100),
(10,'AI110','Delhi','Pune','2026-08-19',3800);
INSERT INTO Passengers VALUES
(1,'Rahul Sharma','rahul@gmail.com'),
(2,'Priya Reddy','priya@gmail.com'),
(3,'Arjun Kumar','arjun@gmail.com'),
(4,'Sneha Patel','sneha@gmail.com'),
(5,'Ravi Verma','ravi@gmail.com'),
(6,'Anjali Singh','anjali@gmail.com'),
(7,'Kiran Rao','kiran@gmail.com'),
(8,'Neha Gupta','neha@gmail.com'),
(9,'Vikram Das','vikram@gmail.com'),
(10,'Meera Joshi','meera@gmail.com');
INSERT INTO Bookings VALUES
(101,1,1,'2026-08-01'),
(102,2,2,'2026-08-01'),
(103,3,3,'2026-08-02'),
(104,4,4,'2026-08-02'),
(105,5,5,'2026-08-03'),
(106,6,6,'2026-08-03'),
(107,7,7,'2026-08-04'),
(108,8,8,'2026-08-04'),
(109,9,9,'2026-08-05'),
(110,10,10,'2026-08-05');
SELECT * FROM Flights;
SELECT * FROM Passengers;
SELECT * FROM Bookings;
SELECT
    p.passenger_name,
    f.flight_number,
    f.source,
    f.destination
FROM Passengers p
INNER JOIN Bookings b
ON p.passenger_id = b.passenger_id
INNER JOIN Flights f
ON b.flight_id = f.flight_id;
SELECT
    destination,
    COUNT(*) AS Total_Flights
FROM Flights
GROUP BY destination;	
CREATE TABLE Flight_History (
    history_id INT PRIMARY KEY,
    flight_id INT,
    flight_number VARCHAR(10),
    source VARCHAR(50),
    destination VARCHAR(50),
    departure_date DATE,
    ticket_price DECIMAL(10,2),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
START TRANSACTION;

INSERT INTO Flights
VALUES
(11,'AI111','Pune','Delhi','2026-08-20',4500);

INSERT INTO Flight_History
(history_id,flight_id,flight_number,source,destination,departure_date,ticket_price)
VALUES
(1,11,'AI111','Pune','Delhi','2026-08-20',4500);

COMMIT;
CREATE INDEX idx_flight_number
ON Flights(flight_number);
SELECT *
FROM Flights
WHERE flight_number='AI105';