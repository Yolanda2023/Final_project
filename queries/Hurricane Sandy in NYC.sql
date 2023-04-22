
WITH all_hired_rides AS (
    SELECT 
       Pickup_Datetime FROM taxi_trips
    WHERE 
       date(Pickup_Datetime) BETWEEN '2012-10-22' AND '2012-11-05'
    UNION ALL
    SELECT 
       Pickup_Datetime FROM uber_trips
    WHERE 
       date(Pickup_Datetime) BETWEEN '2012-10-22' AND '2012-11-05')

    SELECT
       strftime('%Y-%m-%d %H:00:00', hourly_weather.DATE) AS date_hour,
       COUNT(all_hired_rides.Pickup_Datetime) AS num_trips,
       COALESCE(SUM(HourlyPrecipitation), 0) AS HourlyPrecipitation,
       COALESCE(AVG(HourlyWindSpeed), 0) AS HourlyWindSpeed
    FROM
       hourly_weather
    LEFT JOIN 
       all_hired_rides
    ON 
       DATE(all_hired_rides.Pickup_Datetime) = DATE(hourly_weather.DATE)
    AND 
       strftime('%H', all_hired_rides.Pickup_Datetime) = strftime('%H', hourly_weather.DATE)
    WHERE
       hourly_weather.DATE BETWEEN '2012-10-22' AND '2012-11-05'
    GROUP BY
       date_hour
    ORDER BY
       date_hour ASC

