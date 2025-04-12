CREATE DATABASE My_Healthcare;
-- Create Patients table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    State VARCHAR(50)
);

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Speciality VARCHAR(100),
    State VARCHAR(50)
);

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

SELECT * FROM Patient
WHERE State IN ('Fct Abuja', 'Plateau');

SELECT Gender, COUNT(*) AS TOTAL FROM Patient
GROUP BY Gender;

SELECT DISTINCT d.Name AS doctor_name, d.Speciality, d.State AS doctor_state
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
JOIN Patient p ON a.PatientID = p.PatientID
WHERE a.Status = 'confirmed';