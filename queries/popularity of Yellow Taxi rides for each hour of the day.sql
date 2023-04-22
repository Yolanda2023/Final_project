
SELECT strftime('%H', Pickup_Datetime) AS hour_of_day, COUNT(*) AS num_rides
FROM taxi_trips
WHERE Pickup_Datetime BETWEEN '2009-01-01 00:00:00' AND '2015-07-01 00:00:00'
GROUP BY hour_of_day
ORDER BY num_rides DESC
