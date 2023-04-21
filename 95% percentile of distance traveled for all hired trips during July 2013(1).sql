
WITH all_trips AS (
    SELECT Trip_Distance FROM taxi_trips 
    WHERE Pickup_Datetime >= '2013-07-01 00:00:00' AND Pickup_Datetime < '2013-08-01 00:00:00'
    UNION ALL
    SELECT Trip_Distance FROM uber_trips
    WHERE Pickup_Datetime >= '2013-07-01 00:00:00' AND Pickup_Datetime < '2013-08-01 00:00:00'
),

ordered_trips AS (
    SELECT
        Trip_Distance,
        ROW_NUMBER() OVER (ORDER BY Trip_Distance) AS row_number,
        COUNT(*) OVER () AS total_rows
    FROM
        all_trips
)

SELECT Trip_Distance AS percentile_95
FROM ordered_trips
WHERE row_number = ROUND(0.95 * total_rows);
