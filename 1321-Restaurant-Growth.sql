-- Write your PostgreSQL query statement below
WITH daily AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    c1.visited_on,
    SUM(c2.amount) AS amount,
    ROUND(SUM(c2.amount) / 7.0, 2) AS average_amount
FROM daily c1
JOIN daily c2
    ON c2.visited_on BETWEEN c1.visited_on - INTERVAL '6 days'
                         AND c1.visited_on
GROUP BY c1.visited_on
HAVING COUNT(*) = 7
ORDER BY c1.visited_on;