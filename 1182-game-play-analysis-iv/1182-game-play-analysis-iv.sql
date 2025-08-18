# Write your MySQL query statement below
SELECT 
    ROUND(
        COUNT(DISTINCT CASE WHEN DATEDIFF(a.event_date, b.first_login) = 1 THEN a.player_id END) 
        / COUNT(DISTINCT b.player_id),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) b
ON a.player_id = b.player_id;
