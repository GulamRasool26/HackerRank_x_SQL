-- P(R) represents a pattern drawn by Julia in R rows. 
-- The following pattern represents P(5):
-- * 
-- * * 
-- * * * 
-- * * * * 
-- * * * * *
-- Write a query to print the pattern P(20).

WITH RECURSIVE NUM AS 
(
    SELECT 1 AS n
    
    UNION ALL
    
    SELECT n +1 
    FROM NUM
    WHERE n < 20
    
)
SELECT REPEAT(' *',n)
FROM NUM