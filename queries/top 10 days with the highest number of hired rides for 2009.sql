
SELECT 
  DATE(Pickup_Datetime) AS date, 
  COUNT(*) AS number, 
  AVG(Trip_Distance) AS mean_distance
FROM (
  SELECT Pickup_Datetime, Trip_Distance FROM taxi_trips WHERE STRFTIME('%Y', Pickup_Datetime) = '2009'
  UNION ALL
  SELECT Pickup_Datetime, Trip_Distance FROM uber_trips WHERE STRFTIME('%Y', Pickup_Datetime) = '2009'
) AS all_hired_rides
GROUP BY date
ORDER BY number DESC
LIMIT 10;

