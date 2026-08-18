-- Write your PostgreSQL query statement below
;WITH CTE AS(
    SELECT 
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn)
    FROM Queue
    ORDER BY turn
)
SELECT person_name
FROM CTE
WHERE sum <= 1000
ORDER BY turn DESC
LIMIT 1