-- Samantha interviews many candidates from different colleges
-- using coding challenges and contests. Write a query to print the contest_id,
-- hacker_id, name, and the sums of total_submissions, total_accepted_submissions,
-- total_views, and total_unique_views for each contest sorted by contest_id.
-- Exclude the contest from the result if all four sums are .
-- Note: A specific contest can be used to screen candidates at more than one college, 
-- but each college only holds  screening contest.

SELECT C.contest_id,C.hacker_id,C.name
,SUM(S.total_submissions)
,SUM(S.total_accepted_submissions)
,SUM(V.total_views)
,SUM(V.total_unique_views)
FROM Contests C
JOIN Colleges CO
ON C.contest_id = CO.contest_id
JOIN Challenges CH
ON CO.college_id = CH.college_id
LEFT JOIN (SELECT challenge_id,
           SUM(total_views) AS total_views,
           SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id) V
ON V.challenge_id = CH.challenge_id
LEFT JOIN (SELECT challenge_id,
           SUM(total_submissions) AS total_submissions,
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id) S
ON S.challenge_id = CH.challenge_id
GROUP BY C.contest_id,C.hacker_id,C.name
HAVING (SUM(S.total_submissions)
        +SUM(S.total_accepted_submissions)
        +SUM(V.total_views)
        +SUM(V.total_unique_views)) > 0
ORDER  BY C.contest_id ASC