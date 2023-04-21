
SELECT day_of_week, COUNT(*) AS num_rides
FROM uber_trips
WHERE Pickup_Datetime BETWEEN '2009-01-01 00:00:00' AND '2015-07-01 00:00:00'
GROUP BY day_of_week
ORDER BY num_rides DESC
