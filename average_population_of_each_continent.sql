-- Given the CITY and COUNTRY tables, 
-- query the names of all the continents (COUNTRY.Continent) and
-- their respective average city populations (CITY.Population) rounded down to the nearest integer.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT COUNTRY.CONTINENT , Floor(AVG(CITY.POPULATION))
FROM COUNTRY 
JOIN CITY
ON COUNTRY.CODE = CITY.COUNTRYCODE
GROUP BY COUNTRY.CONTINENT