-- Local MySQL database

INSERT INTO Symptom (ID, EmployeeID, DateReported, SymptomID)
VALUES
    (6, 2, '2023-10-02', 2),
    (7, 3, '2023-10-02', 2),
    (8, 4, '2023-10-03', 2),
    (9, 4, '2023-10-03', 2);

-- a query to output the most-self-reported symptom.
SELECT SymptomID, COUNT(*) AS SymptomCount
FROM Symptom
GROUP BY SymptomID
ORDER BY SymptomCount DESC
LIMIT 1;
