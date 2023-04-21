
WITH all_hired_rides AS (
SELECT Pickup_Datetime FROM taxi_trips
WHERE strftime ('%Y', Pickup_Datetime)='2014'
UNION ALL
SELECT Pickup_Datetime FROM uber_trips
WHERE strftime ('%Y', Pickup_Datetime)='2014')

SELECT date(all_hired_rides.Pickup_Datetime) AS date, COUNT(*) AS number_of_rides, daily_weather.DailyWindSpeed AS avg_wind_speed
FROM all_hired_rides
JOIN daily_weather ON date(all_hired_rides.Pickup_Datetime) = daily_weather.DATE
GROUP BY date
ORDER BY avg_wind_speed DESC
LIMIT 10;
