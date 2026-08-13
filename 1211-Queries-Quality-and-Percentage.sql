-- Write your PostgreSQL query statement below
SELECT 
    query_name,
    ROUND(SUM(rating*1.0/position)/COUNT(rating),2) AS quality,
    ROUND(COUNT(CASE WHEN rating in (1,2) THEN rating END)*100.0/COUNT(rating),2) AS poor_query_percentage
FROM Queries q
GROUP BY query_name
