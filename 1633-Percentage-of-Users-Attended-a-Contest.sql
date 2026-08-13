-- Write your PostgreSQL query statement below
SELECT
    r.contest_id,
    ROUND(COUNT(r.user_id)*100.0/(SELECT COUNT(user_id) FROM Users u),2) percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC,r.contest_id ASC

