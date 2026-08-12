-- Write your PostgreSQL query statement below
;WITH CTE AS(
SELECT 
    s.user_id,
    COUNT(DISTINCT CASE WHEN c.action = 'confirmed' THEN c.time_stamp END)*1.0 AS confirmed,
    COUNT(DISTINCT c.time_stamp) AS total
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id
)
SELECT 
    user_id,
    CASE WHEN total=0 THEN 0.00 ELSE ROUND(confirmed/total,2) END AS confirmation_rate
FROM CTE
