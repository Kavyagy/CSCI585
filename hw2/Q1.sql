-- Local MySQL database

-- CREATE DATABASE HW2;
-- USE HW2;

-- Create Employee table
CREATE TABLE Employee (
                          ID INT PRIMARY KEY,
                          Name VARCHAR(255),
                          OfficeNumber INT,
                          FloorNumber INT CHECK (FloorNumber BETWEEN 1 AND 10), -- Check for valid floor numbers
                          PhoneNumber VARCHAR(12),
                          EmailAddress VARCHAR(255)
);

-- Create Meeting table
CREATE TABLE Meeting (
                         MeetingID INT PRIMARY KEY,
                         EmployeeID INT,
                         RoomNumber INT,
                         FloorNumber INT,
                         StartTime INT CHECK (StartTime >= 8 AND StartTime <= 18),
                         FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Create Notification table
CREATE TABLE Notification (
                              NotificationID INT PRIMARY KEY,
                              EmployeeID INT,
                              NotificationDate DATE,
                              NotificationType VARCHAR(20) CHECK (NotificationType IN ('mandatory', 'optional')),
                              FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Create Symptom table
CREATE TABLE Symptom (
                         ID INT PRIMARY KEY,
                         EmployeeID INT,
                         DateReported DATE,
                         SymptomID INT CHECK (SymptomID BETWEEN 1 AND 5),
                         FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Create Scan table
CREATE TABLE Scan (
                      ScanID INT PRIMARY KEY,
                      ScanDate DATE,
                      ScanTime INT CHECK (ScanTime BETWEEN 0 AND 23), -- Representing hours (0-23)
                      EmployeeID INT,
                      Temperature DECIMAL(5, 2),
                      FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Create Test table
CREATE TABLE Test (
                      TestID INT PRIMARY KEY,
                      Location VARCHAR(255),
                      TestDate DATE,
                      TestTime INT CHECK (TestTime BETWEEN 0 AND 23), -- Representing hours (0-23)
                      EmployeeID INT,
                      TestResult VARCHAR(10) CHECK (TestResult IN ('positive', 'negative')),
                      FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Create Case table
CREATE TABLE CaseTable (
                      CaseID INT PRIMARY KEY,
                      EmployeeID INT,
                      Date DATE,
                      Resolution VARCHAR(20) CHECK (Resolution IN ('back to work', 'left the company', 'deceased')),
                      FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Create HealthStatus table
CREATE TABLE HealthStatus (
                              ID INT PRIMARY KEY,
                              EmployeeID INT,
                              Date DATE,
                              Status VARCHAR(20) CHECK (Status IN ('sick', 'hospitalized', 'well')),
                              FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

-- Insert employees
INSERT INTO Employee (ID, Name, OfficeNumber, FloorNumber, PhoneNumber, EmailAddress)
VALUES
    (1, 'Kate Foster', 111, 3, '12345678923', 'kate.fostere@gmail.com'),
    (2, 'Jane Smith', 222, 5, '0987654321', 'jane.smith@yahoo.com'),
    (3, 'Bob Marley', 333, 8, '9876543561', 'bob.marley@yahoo.com'),
    (4, 'Prince Harry', 444, 7, '1983528191', 'prince.harry@gmail.com');

-- Insert symptom reports
INSERT INTO Symptom (ID, EmployeeID, DateReported, SymptomID)
VALUES
    (1, 1, '2023-10-01', 1),
    (2, 2, '2023-10-02', 2),
    (3, 1, '2023-10-03', 3),
    (4, 3, '2023-10-03', 4),
    (5, 2, '2023-10-04', 5);

-- Insert scan records
INSERT INTO Scan (ScanID, ScanDate, ScanTime, EmployeeID, Temperature)
VALUES
    (1, '2023-10-01', 8, 1, 96.5),
    (2, '2023-10-02', 10, 2, 100.7),
    (3, '2023-10-03', 14, 1, 101.0),
    (4, '2023-10-03', 16, 3, 99.2),
    (5, '2023-10-04', 9, 2, 102.8);

-- Insert test records
INSERT INTO Test (TestID, Location, TestDate, TestTime, EmployeeID, TestResult)
VALUES
    (1, 'Company', '2023-10-01', 9, 1, 'negative'),
    (2, 'Hospital', '2023-10-02', 11, 2, 'positive'),
    (3, 'Clinic', '2023-10-03', 15, 1, 'positive'),
    (4, 'Clinic', '2023-10-03', 15, 4, 'negative'),
    (5, 'Hospital', '2023-10-03', 17, 3, 'negative'),
    (6, 'Company', '2023-10-04', 10, 2, 'positive');

-- Insert case records
INSERT INTO CaseTable (CaseID, EmployeeID, Date, Resolution)
VALUES
    (1, 1, '2023-10-01', 'back to work'),
    (2, 2, '2023-10-02', 'left the company'),
    (3, 1, '2023-10-03', 'back to work'),
    (4, 3, '2023-10-03', 'deceased'),
    (5, 2, '2023-10-04', 'back to work');

-- Insert health status records
INSERT INTO HealthStatus (ID, EmployeeID, Date, Status)
VALUES
    (1, 1, '2023-10-01', 'sick'),
    (2, 2, '2023-10-02', 'hospitalized'),
    (3, 1, '2023-10-03', 'well'),
    (4, 3, '2023-10-03', 'sick'),
    (5, 2, '2023-10-04', 'well');


-- Insert notifications for employees
INSERT INTO Notification (NotificationID, EmployeeID, NotificationDate, NotificationType)
VALUES
    (1, 1, '2023-10-01', 'mandatory'),
    (2, 2, '2023-10-02', 'mandatory'),
    (3, 3, '2023-10-03', 'mandatory'),
    (4, 4, '2023-10-03', 'mandatory'),
    (5, 2, '2023-10-04', 'mandatory'),
    (6, 1, '2023-10-05', 'optional'),
    (7, 2, '2023-10-06', 'optional'),
    (8, 3, '2023-10-07', 'optional'),
    (9, 4, '2023-10-08', 'optional');

-- SHOW TABLES;

