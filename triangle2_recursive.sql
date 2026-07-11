-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

-- * * * * * 
-- * * * * 
-- * * * 
-- * * 
-- *
-- Write a query to print the pattern P(20).

with RECURSIVE NUM AS
(
    SELECT 20 as n
    union all
    
    SELECT n - 1
    FROM NUM 
    WHERE n > 1
)SELECT REPEAT("* ",n)
FROM NUM