STATION
 ________________________
|Feild		|	Type	 |
|------------------------|
|ID		    |NUMBER   	 |
|CITY  		|VARCHAR2(21)|
|STATE 		|VARCHAR2(2) |
|LAT_N  	|NUMBER		 |
|LONG_W		|NUMBER		 |
 ------------------------

# Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE FROM STATION;

# Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY FROM STATION WHERE ID % 2=0 ORDER BY CITY;

# Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

# Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT * FROM (SELECT CITY, LENGTH(CITY) AS CITY_LENGTH 
FROM STATION ORDER BY CITY_LENGTH ASC, CITY ASC LIMIT 1 ) MIN_L
UNION
SELECT * FROM ( SELECT CITY, LENGTH(CITY) AS CITY_LENGTH
FROM STATION ORDER BY CITY_LENGTH DESC, CITY DESC LIMIT 1) MAX_L;

# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE UPPER(CITY) RLIKE '^[AEIOU]';

# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE UPPER(RIGHT(CITY,1)) IN ('A','E','I','O','U');

# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION 
WHERE UPPER(LEFT(CITY,1)) IN ('A','E','I','O','U') 
AND UPPER(RIGHT(CITY,1)) IN ('A','E','I','O','U');

# Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY  FROM STATION WHERE UPPER(LEFT(CITY,1)) NOT IN ('A','E','I','O','U') ;
 
# Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE UPPER(RIGHT(CITY,1)) NOT IN ('A','E','I','O','U');

# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE UPPER(LEFT(CITY,1)) NOT IN ('A','E','I','O','U')
OR UPPER(RIGHT(CITY,1)) NOT IN ('A','E','I','O','U');

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE UPPER(LEFT(CITY,1)) NOT IN ('A','E','I','O','U')
AND UPPER(RIGHT(CITY,1)) NOT IN ('A','E','I','O','U');
 
# Query the following two values from the STATION table:
# The sum of all values in LAT_N rounded to a scale of  decimal places.
# The sum of all values in LONG_W rounded to a scale of  decimal places.
SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W), 2) FROM STATION;

# Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
SELECT ROUND(SUM(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

# Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
SELECT ROUND(MAX(LAT_N),4) FROM STATION WHERE LAT_N < 137.2345;

# Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.
SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N < 137.2345 ORDER BY LAT_N DESC LIMIT 1;

# Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880. Round your answer to 4 decimal places.
SELECT ROUND(MIN(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7780;

# Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.
SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N > 38.7780 ORDER BY LAT_N LIMIT 1;