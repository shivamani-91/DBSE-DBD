CREATE DATABASE IF NOT EXISTS medicare_db;
USE medicare_db;
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    consultation_fee DECIMAL(10,2) CHECK (consultation_fee > 0)
);
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
INSERT INTO Doctors VALUES
(1,'Dr. Rajesh','Cardiology',800),
(2,'Dr. Priya','Neurology',1000),
(3,'Dr. Arun','Orthopedics',700),
(4,'Dr. Kavya','Dermatology',600),
(5,'Dr. Ravi','Pediatrics',500),
(6,'Dr. Meena','Gynecology',900),
(7,'Dr. Suresh','ENT',650),
(8,'Dr. Lakshmi','Ophthalmology',750),
(9,'Dr. Naveen','General Medicine',550),
(10,'Dr. Swathi','Cardiology',850);
INSERT INTO Patients VALUES
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
INSERT INTO Appointments VALUES
(101,1,1,'2026-08-01'),
(102,2,2,'2026-08-02'),
(103,3,3,'2026-08-03'),
(104,4,4,'2026-08-04'),
(105,5,5,'2026-08-05'),
(106,6,6,'2026-08-06'),
(107,7,7,'2026-08-07'),
(108,8,8,'2026-08-08'),
(109,9,9,'2026-08-09'),
(110,10,10,'2026-08-10');
SELECT * FROM Doctors;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT
    p.patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id;
SELECT
    specialization,
    COUNT(*) AS Number_of_Doctors
FROM Doctors
GROUP BY specialization;
CREATE TABLE Doctor_History (
    history_id INT PRIMARY KEY,
    doctor_id INT,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    consultation_fee DECIMAL(10,2),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
START TRANSACTION;

INSERT INTO Doctors
VALUES
(11,'Dr. Harish','Oncology',1200);

INSERT INTO Doctor_History
(history_id,doctor_id,doctor_name,specialization,consultation_fee)
VALUES
(1,11,'Dr. Harish','Oncology',1200);

COMMIT;
CREATE INDEX idx_specialization
ON Doctors(specialization);
SELECT *
FROM Doctors
WHERE specialization='Cardiology';