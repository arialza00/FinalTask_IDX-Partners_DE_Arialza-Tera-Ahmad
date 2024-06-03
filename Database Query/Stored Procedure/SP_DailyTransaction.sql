use dwh1; 
CREATE PROCEDURE DailyTransaction @start_date date, @end_date date AS
WITH date_cte  AS 
(SELECT FORMAT(TransactionDate, 'yyyy-MM-dd') AS date, TransactionID
FROM FactTransaction)
SELECT d.date, COUNT(*) AS TotalTransaction, SUM(f.Amount) AS TotalAmount FROM date_cte d
JOIN FactTransaction f on d.TransactionID = f.TransactionID
WHERE d.date BETWEEN @start_date AND @end_date
GROUP BY d.date;

EXEC DailyTransaction @start_date='2024-01-18', @end_date='2024-01-20';


