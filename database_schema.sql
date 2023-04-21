
CREATE TABLE IF NOT EXISTS hourly_weather
(
    id INTEGER PRIMARY KEY,
    DATE DATE,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
)
;

CREATE TABLE IF NOT EXISTS daily_weather
(
    id INTEGER PRIMARY KEY,
    DATE DATE,
    DailyPrecipitation FLOAT,
    DailyWindSpeed FLOAT
)
;

CREATE TABLE IF NOT EXISTS taxi_trips
(
    id INTEGER PRIMARY KEY,
    Pickup_Datetime DATETIME,
    Tip_Amt FLOAT,
    Start_Lon FLOAT,
    Start_Lat FLOAT,
    End_Lon FLOAT,
    End_Lat FLOAT,
    Trip_Distance FLOAT
)
;

CREATE TABLE IF NOT EXISTS uber_trips
(
    id INTEGER PRIMARY KEY,
    Pickup_Datetime DATETIME,
    Start_Lon FLOAT,
    Start_Lat FLOAT,
    End_Lon FLOAT,
    End_Lat FLOAT,
    Trip_Distance FLOAT,
    day_of_week INTEGER,
    pickup_hour INTEGER
)
;

CREATE TABLE IF NOT EXISTS sun_time
(
    id INTEGER PRIMARY KEY,
    DATE DATE,
    Sunrise TIME,
    Sunset TIME
)
;
