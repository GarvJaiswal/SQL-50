-- Write your PostgreSQL query statement below
;WITH CTE AS(
    SELECT 
        p.product_id,
        SUM(CASE WHEN u.product_id IS NULL THEN 0.0 ELSE p.price*u.units END)*1.0 AS Total,
        SUM(u.units) totalUnits
    FROM Prices p
    LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date between p.start_date and p.end_date
    GROUP BY p.product_id
)
SELECT 
    product_id,
    CASE WHEN Total=0 THEN 0 ELSE ROUND(Total/totalUnits*1.0,2) END AS average_price
FROM CTE