-- Write a query to print all prime numbers less than or equal to 1000.
-- Print your result on a single line, and use the ampersand (&) character
-- as your separator (instead of a space).
-- For example, the output for all prime numbers <10 would be:
-- 2&3&5&7

WITH RECURSIVE NUM AS
(
    SELECT 2 as n
    UNION ALL
    
    SELECT n+1
    FROM NUM
    WHERE n<1000
)
SELECT GROUP_CONCAT(n SEPARATOR '&')
FROM NUM n1
WHERE NOT EXISTS 
(
    SELECT 1
    FROM NUM n2
    WHERE n2.n < n1.n
    AND n2.n > 1
    AND MOD(n1.n,n2.n) = 0 
)