-- Julia asked her students to create some coding challenges. 
-- Write a query to print the hacker_id, name, and the total 
-- number of challenges created by each student. Sort your 
-- results by the total number of challenges in descending order.
-- If more than one student created the same number of challenges,
-- then sort the result by hacker_id. If more than one student created
-- the same number of challenges and the count is less than the maximum number of challenges created,
-- then exclude those students from the result.

SELECT H.hacker_id,
       H.name,
       COUNT(C.challenge_id) AS num
FROM Hackers H
JOIN Challenges C
ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING num = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) x
)
OR num IN (
        SELECT cnt
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) y
        GROUP BY cnt
        HAVING COUNT(*) = 1
)
ORDER BY num DESC,
         H.hacker_id ASC