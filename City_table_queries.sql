CITY
 ________________________
|Feild		    |	Type	      |
|------------------------|
|ID		       |NUMBER   	  |
|NAME  		   |VARCHAR2(17)|
|COUNTRYCODE|VARCHAR2(3) |
|DISTRICT  	|VARCHAR2(20)|
|POPULATION	|NUMBER		    |
 ------------------------

# Finding all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT * FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';

# Finding the names for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME FROM CITY WHERE POPULATION>120000 AND COUNTRYCODE='USA';

# Attributes for every row in the CITY table
SELECT * FROM CITY;

# Finding all columns for a city in CITY with the ID 1661.
SELECT * FROM CITY WHERE ID='1661';

# Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT * FROM CITY WHERE COUNTRYCODE='JPN';

# Finding the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT DISTINCT NAME FROM CITY WHERE COUNTRYCODE='JPN';

# Query the total population of all cities in CITY where District is California.
SELECT SUM(POPULATION) FROM CITY WHERE UPPER(DISTRICT) = 'CALIFORNIA';

# Query the average population of all cities in CITY where District is California.
SELECT AVG(POPULATION) FROM CITY WHERE UPPER(DISTRICT) = 'CALIFORNIA';

# Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(AVG(POPULATION)) FROM CITY;

# Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = 'JPN'

# Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;


