-- You did such a great job helping Julia with her last coding contest challenge that she wants you
-- to work on this one, too!
-- The total score of a hacker is the sum of their maximum scores for all of the challenges. 
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the
-- descending score. If more than one hacker achieved the same total score, then sort the result
-- by ascending hacker_id. Exclude all hackers with a total score of  from your result.

SELECT H.hacker_id, H.name,SUM(S.maxm) AS total
FROM Hackers H
JOIN (SELECT hacker_id,challenge_id, MAX(score) as maxm
FROM Submissions 
GROUP BY hacker_id,challenge_id) S
ON H.hacker_id = S.hacker_id
GROUP BY h.Hacker_id, H.name
HAVING total != 0
ORDER BY  total DESC,
H.hacker_id ASC