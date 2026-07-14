-- Julia conducted a  days of learning SQL contest.
-- The start date of the contest was March 01, 2016 and the end date was March 15, 2016.
-- Write a query to print total number of unique hackers who made at least 1 
-- submission each day (starting on the first day of the contest), and 
-- find the hacker_id and name of the hacker who made maximum number of submissions each day.
-- If more than one such hacker has a maximum number of submissions, print the lowest hacker_id.
-- The query should print this information for each day of the contest, sorted by the date.

SELECT
    s.submission_date,
    (
        SELECT COUNT(*)
        FROM (
            SELECT hacker_id
            FROM Submissions s2
            WHERE s2.submission_date <= s.submission_date
            GROUP BY hacker_id
            HAVING COUNT(DISTINCT s2.submission_date) =
                   DATEDIFF(s.submission_date,'2016-03-01') + 1
        ) t
    ) AS total_hackers,
    h.hacker_id,
    h.name
FROM
(
    SELECT submission_date, hacker_id, COUNT(*) AS cnt
    FROM Submissions
    GROUP BY submission_date, hacker_id
) s
JOIN Hackers h
ON s.hacker_id = h.hacker_id
WHERE s.hacker_id =
(
    SELECT hacker_id
    FROM
    (
        SELECT hacker_id, COUNT(*) cnt
        FROM Submissions x
        WHERE x.submission_date = s.submission_date
        GROUP BY hacker_id
        ORDER BY cnt DESC, hacker_id ASC
        LIMIT 1
    ) y
)
ORDER BY s.submission_date;