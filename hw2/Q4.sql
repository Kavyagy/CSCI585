-- Local MySQL database

-- number of scans, number of tests, number of employees who self-reported symptoms, number of positive cases

SELECT COUNT(*) AS NumberOfScans FROM Scan WHERE ScanDate BETWEEN '2023-10-01' AND '2023-10-04';
SELECT COUNT(*) AS NumberOfTests FROM Test WHERE TestDate BETWEEN '2023-10-01' AND '2023-10-04';
SELECT COUNT(DISTINCT EmployeeID) AS SelfReportedEmployees FROM Symptom WHERE DateReported BETWEEN '2023-10-01' AND '2023-10-04';
SELECT COUNT(*)  AS NumberOfPositiveCases FROM Test WHERE TestDate BETWEEN '2023-10-01' AND '2023-10-04' AND TestResult = 'positive';