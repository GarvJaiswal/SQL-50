-- Write your PostgreSQL query statement below
;WITH CTE AS(
SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1
)
SELECT  
    MAX(num) num
FROM CTE