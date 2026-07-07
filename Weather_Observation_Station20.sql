-- A median is defined as a number separating the higher half of 
-- a data set from the lower half. Query the median of the 
-- Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

SELECT ROUND(AVG(LAT_N), 4)
FROM (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS total_rows
    FROM STATION
) AS t
WHERE rn IN (
    FLOOR((total_rows + 1) / 2),
    FLOOR((total_rows + 2) / 2)
);