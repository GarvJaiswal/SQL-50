-- Write your PostgreSQL query statement below
;WITH CTE AS(
SELECT 
    customer_id,
    order_date,
    customer_pref_delivery_date,
    ROW_NUMBER()  OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS orderRn
FROM Delivery
)
SELECT 
    ROUND(COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN customer_id END)*100.00
    /COUNT(1),2) AS immediate_percentage
FROM CTE
WHERE orderRn = 1 