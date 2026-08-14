
WITH CTE AS (
    SELECT 
        player_id,
        event_date,
        LEAD(event_date) OVER (
            PARTITION BY player_id 
            ORDER BY event_date
        ) AS lead_event_date,
        MIN(event_date) OVER (
            PARTITION BY player_id
        ) AS first_event_date
    FROM Activity
    GROUP BY player_id, event_date
)
SELECT ROUND(
    COUNT(DISTINCT player_id)*1.0 /
    (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2
) AS fraction
FROM CTE
WHERE event_date = first_event_date
  AND event_date + 1 = lead_event_date;