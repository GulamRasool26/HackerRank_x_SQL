-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. 
-- List the rows such that X1 ≤ Y1.

SELECT DISTINCT F1.X,F1.Y
FROM Functions F1
JOIN Functions F2
ON F1.X = F2.Y
AND F1.Y = F2.X
WHERE
(
    F1.X < F1.Y
)
OR
(
    F1.X = F1.Y
    AND (SELECT COUNT(*) FROM Functions
          WHERE X = F1.X AND Y = F1.Y) > 1
)
ORDER BY F1.X ASC