-- You are given a table, Projects, containing three columns:
-- Task_ID, Start_Date and End_Date. It is guaranteed that 
-- the difference between the End_Date and the Start_Date is equal 
-- to 1 day for each row in the table.
-- If the End_Date of the tasks are consecutive, then they are part 
-- of the same project. Samantha is interested in finding the total 
-- number of different projects completed and the total number of days it took to
-- complete each project.
-- Write a query to output the start and end dates of projects listed by the number
-- of days it took to complete the project in ascending order. If there is more than
-- one project that have the same number of completion days, then order by the start 
-- date of the project.

SELECT
    P1.Start_Date,
    MIN(P2.End_Date)
FROM Projects P1
JOIN Projects P2
ON P1.Start_Date < P2.End_Date
WHERE P1.Start_Date NOT IN (
    SELECT End_Date FROM Projects
)
AND P2.End_Date NOT IN (
    SELECT Start_Date FROM Projects
)
GROUP BY P1.Start_Date
ORDER BY DATEDIFF(MIN(P2.End_Date), P1.Start_Date),
         P1.Start_Date;