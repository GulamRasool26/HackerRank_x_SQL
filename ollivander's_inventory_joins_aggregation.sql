-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to
-- buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and 
-- power of the wands that Rons interested in, sorted in order of descending power. If more than one 
-- wand has same power, sort the result in order of descending age.
-- Wands: The id is the id of the wand, code is the code of the wand,
-- coins_needed is the total number of gold galleons needed to buy the wand,
-- and power denotes the quality of the wand (the higher the power, the better the wand is).
-- Wands_Property: The code is the code of the wand, age is the age of the wand, and 
-- is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0,
-- it means that the wand is not evil. The mapping between code and age is one-one, meaning
-- that if there are two pairs,  and , then  and .

SELECT W.id, WP.age, W.coins_needed,W.power
FROM Wands W
JOIN Wands_Property WP
ON W.code = WP.code
WHERE 
 WP.is_evil = 0 
 AND (WP.age,W.power,W.coins_needed )
 IN (SELECT WP.age, W.power ,MIN(W.coins_needed) as coins
FROM Wands W
JOIN Wands_Property WP
ON W.code = WP.code
WHERE
 WP.is_evil = 0
 Group by WP.age,W.power)
 ORDER BY W.power DESC
 , WP.age DESC