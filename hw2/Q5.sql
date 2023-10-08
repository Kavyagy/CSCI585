-- Local MySQL database

-- The below SQL query uses the concept of table division to identify employees who have received all mandatory notifications.
-- It starts by combining each employee with every mandatory notification using a CROSS JOIN and then filters for only mandatory notifications.
-- Next, the EXCEPT operator will find employees who have not received at least one mandatory notification.
-- By subtracting these employees from the initial set, the query yields a list of employees who have successfully received all mandatory notifications.

SELECT e.ID, e.Name FROM Employee e CROSS JOIN Notification n
                    WHERE n.NotificationType = 'mandatory'
                    EXCEPT SELECT e.ID, e.Name FROM Employee e LEFT JOIN
                    Notification n ON e.ID = n.EmployeeID AND n.NotificationType = 'mandatory'
                    WHERE n.NotificationID IS NULL;

