-- Local MySQL database

INSERT INTO Employee (ID, Name, OfficeNumber, FloorNumber, PhoneNumber, EmailAddress)
VALUES
    (5, 'Kiara Deap', 801, 8, '1975645318', 'kiara.deap@gmail.com'),
    (6, 'Amit Shah', 802, 8, '3425617859', 'amit.shah@yahoo.com'),
    (7, 'Ravi Kumar', 803, 8, '7685674538', 'ravi.kumar@yahoo.com'),
    (8, 'Jin Yen', 404, 3, '8765347281', 'jin.yen@gmail.com');

INSERT INTO HealthStatus (ID, EmployeeID, Date, Status)
VALUES
    (6, 5, '2023-10-03', 'sick'),
    (7, 6, '2023-10-02', 'sick'),
    (8, 6, '2023-10-03', 'sick'),
    (9, 7, '2023-10-03', 'well'),
    (10, 8, '2023-10-04', 'hospitalized');


--  a query to output the 'sickest' floor.
SELECT emp.FloorNumber, COUNT(*) AS SickCount
FROM Employee emp
         INNER JOIN HealthStatus hos ON emp.ID = hos.EmployeeID
WHERE hos.Status = 'sick'
GROUP BY emp.FloorNumber
ORDER BY SickCount DESC
LIMIT 1;