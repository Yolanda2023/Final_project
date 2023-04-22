# IEOR 4501 group 9
we are group 9, yuchen wang, lingyuan kong

UNIs:[yw4050, lk2961]

# Description

This project aims to analyze the relationship between transportation and weather patterns in New York City using data from Uber and Yellow Taxi trips, as well as weather data. In Part 1, the data will be downloaded, cleaned, filtered, and sampled. In Part 2, the preprocessed data will be populated into a SQLite database with appropriate data types for each column. Part 3 involves crafting SQL queries to better understand the datasets, answering questions such as the popularity of taxi rides for each hour of the day and the 95th percentile of distance traveled during a specific time frame. In Part 4, visualizations will be created using matplotlib and other libraries to enhance our understanding of the data, including a heatmap of all hired trips over a map of the area and a scatter plot comparing tip amount versus distance for Yellow Taxi rides. Ultimately, this project aims to uncover insights into the relationship between transportation and weather in NYC that can be used to inform transportation policies and decisions.

# Part 1


### download
It uses the BeautifulSoup library to parse the HTML content of the website and extracts the links to the parquet files containing the data. The script then downloads the parquet files to a local directory using the requests library and the download_file() function. Finally, the script defines a directory to store the downloaded files and creates the directory if it does not exist. The purpose of this script is to make it easy to download and work with yellow taxi trip data from the TLC website.

### cleaning&filtering
In this code, we are defining a function read_zones_from_shapefile that reads a shapefile containing information about taxi zones in New York City and returns a GeoDataFrame with the required columns. 

### calculate distance
To calculate the distance between two points on Earth, the Haversine formula is used in the calculate_distance() function. The formula takes into account the Earth's radius and the differences in latitudes and longitudes of the two points in radians, and calculates the distance between them in kilometers. The function first converts the latitudes and longitudes from degrees to radians, and then applies the formula to calculate the distance between the two points.

###  process uber csv file
We are defining and testing functions that process Uber rides data from a CSV file. The process_uber_data function calculates the distance between pickup and dropoff locations using the calculate_distance function, filters the trips within a specific geographic coordinate box, drops rows with missing values, zero passenger count or fare amount, and zero distance.

### process yellow taxi file
The purpose of the code is to process and clean yellow taxi data from multiple years and concatenate them into a single DataFrame. The code renames columns to ensure consistency across all years and then drops rows with zero passenger count, no fare, unnecessary columns, trips outside defined latitude/longitude bounds, and trips with the same pickup and dropoff location. The necessary columns are selected, and any remaining rows with missing values are dropped. The cleaned data for each year is saved as a Parquet file, and all years are concatenated into a single DataFrame sorted by pickup datetime.

### process weather data
The code is aimed at processing weather data for the years 2009-2015. The CSV files for each year are read and filtered to keep only the required columns. The data is then concatenated and necessary transformations are applied. The 'HourlyPrecipitation' column is modified by dropping the 's' at the end of the column name and replacing 'T' with 0. The 'HourlyWindSpeed' column is also modified by dropping the 's' at the end of the column name and replacing 'T' with 0. The data is then converted to float and saved as a new CSV file. The function 'get_daily_weather_data' is then used to group the hourly weather data by day and calculate the mean precipitation and wind speed. The daily data is then concatenated into a new DataFrame, renamed and the index is reset. The final output is a pandas DataFrame containing the daily weather data for the years 2009-2015.

# Part 2
The code defines SQL schema strings for four tables: hourly_weather, daily_weather, taxi_trips, and uber_trips. Then, it writes the schema to a schema file and creates the tables in an SQLite database using the schema. Finally, it defines a function to write data from Pandas DataFrames to their respective tables in the database using a dictionary mapping table names to DataFrames. The function iterates over the items in the input dictionary, writes each DataFrame to its corresponding table using the to_sql() method, and prints a message indicating success or failure

# Part 3
There are six SQL queries provided in the code, which can be executed using the SQLite engine.

Query 1 returns the number of rides per hour of the day for yellow taxi trips between January 1, 2009 and July 1, 2015.

Query 2 returns the number of rides per day of the week for Uber trips between January 1, 2009 and July 1, 2015.

Query 3 calculates the 95th percentile for trip distance during July 2013, for both yellow taxis and Uber.

Query 4 returns the 10 dates with the highest number of rides and the mean distance traveled for both yellow taxi and Uber trips in the year 2009.

Query 5 returns the 10 dates with the highest average wind speed, along with the number of rides for both yellow taxi and Uber trips in the year 2014.

Query 6 returns the hourly number of rides, hourly precipitation, and hourly wind speed for yellow taxi and Uber trips between October 22, 2012 and November 5, 2012.

# Part 4


### problem 1
We are analyzing taxi and Uber trip data from New York City between 2009 and 2015, and writing Python code to read, clean, and transform the data using pandas and SQLite. We are also writing SQL queries to extract insights from the data, such as the number of rides per hour of the day and the number of rides per day of the week. Finally, we are creating visualizations using matplotlib to better understand the data and to communicate insights to stakeholders.

We chose the bar plot as it is an effective way to visualize the distribution of the number of rides per hour of the day over a period of several years. A bar plot is particularly useful when the data consists of distinct categories, in this case the 24 hours of the day. It allows us to easily compare the number of rides for each hour and to identify patterns or trends in the data. Additionally, the x-axis of a bar plot can be easily labeled with categorical data, which makes it ideal for visualizing the number of rides per hour of the day.

### Problem 2
The fetch_monthly_trip_distances function fetches monthly trip distances from the taxi_trips and uber_trips tables and returns them as a pandas DataFrame.

The plot_avg_trip_distance_with_ci function uses this DataFrame to plot the average trip distance per month with a confidence interval. It calculates the 90% confidence interval using the stats.norm.ppf function from the scipy.stats module. It then groups the data by month, calculates the mean and standard deviation of the trip distances for each month, and calculates the y-error using the previously calculated confidence interval. It creates a line chart using matplotlib with the x-axis as the months, y-axis as the average distance traveled, and a 90% confidence interval band.

I chose a line chart to show the trend of the average distance traveled over time, with the confidence interval band showing the range of plausible values. This is a good way to show the changes in the average distance traveled per month over the years, and the confidence interval band adds an extra layer of information about the uncertainty in the data.

### Problem 3
The code reads data from the taxi_trips and uber_trips tables in the SQLite database, combines the data into a single DataFrame, and plots the number of drop-offs by day of the week for each of the three major airports in New York City (LGA, JFK, and EWR).

The function airport_dropoffs_by_day() is used to plot the data as a bar plot using the seaborn library. We use this graph because it effectively visualizes the number of drop-offs by day of the week for each airport. The barplot allows for easy comparison of the number of drop-offs between airports on each day of the week. Additionally, using seaborn allows for a more aesthetically pleasing and customizable visualization. The x-axis labels are also modified to display the day of the week rather than the numerical value for improved readability.

### Problem 4
The code fetches start coordinates for both taxi trips and Uber trips from the database, and then creates a heatmap of the hired trip start locations using the folium library. In this case the density of hired trip start locations. By using different colors to represent different levels of density, a heatmap allows us to quickly and easily see where the most popular areas for hired trips are located. Additionally, folium is a great library for creating interactive maps in Python, which allows users to zoom in and out, and click on specific data points to see more information.

### Problem 5
 We are creating a scatter plot comparing tip amount versus distance for yellow taxi rides. We first query the taxi_trips table and store the result in a pandas dataframe. Then, we use a function to remove outliers from the data based on the trip distance and tip amount columns. Finally, we create a scatter plot using matplotlib to visualize the relationship between tip amount and distance for yellow taxi rides.

### Problem 6
The code is creating a scatter plot to compare the tip amount and hourly precipitation amount for yellow taxi rides. It first reads the Yellow Taxi data and Hourly Weather data from the database using pandas read_sql_table() function. Then, it converts the DATE column in the weather DataFrame to a pandas datetime object and merges the two DataFrames based on the nearest datetime using pandas merge_asof() function. Outliers are filtered based on reasonable ranges for tip amount and precipitation amount, and a scatter plot is created using matplotlib to visualize the relationship between the two variables.

# Extra credit
We are creating a table in the database called 'sun_time' that will contain information about sunrise and sunset times for each date. To create this table, we are reading in CSV files for the years 2009-2015 containing weather data, filtering the required columns, and concatenating the filtered dataframes together. We then clean the data by dropping rows with missing 'Sunrise' values, rounding floating-point numbers and converting them to integers, and converting the integers to zero-padded strings with 4 characters. We then convert the 'Sunrise' and 'Sunset' columns to time objects using the appropriate format.

Once the table is created, we join the taxi_trips table with the sun_time table using the date column and filter for daytime and nighttime trips based on the sunrise and sunset times. We then count the number of taxi trips during daylight and nighttime hours and create a bar chart to compare the two. This visualization helps us understand the distribution of taxi trips throughout the day and can inform decisions related to resource allocation and scheduling.



```python

```
