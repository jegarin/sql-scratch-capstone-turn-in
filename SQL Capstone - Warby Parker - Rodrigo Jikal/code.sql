--Question 1
 SELECT *
 FROM survey
 LIMIT 10;
 
--Question 2
 SELECT question, COUNT (DISTINCT user_id)
 FROM survey
 GROUP BY question;
 
--Question 4
SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

--Question 5
SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS is_home_try_on, h.number_of_pairs, p.user_id IS NOT NULL AS is_purchase
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
ON h.user_id = q.user_id
LEFT JOIN purchase AS 'p'
ON p.user_id = h.user_id
LIMIT 10;

--Question 6
WITH funnel AS (
SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
ON h.user_id = q.user_id
LEFT JOIN purchase AS 'p'
ON p.user_id = h.user_id)

SELECT COUNT (*) AS 'num_quiz', SUM (is_home_try_on) AS 'num_home_try_on', SUM (is_purchase) AS 'num_purchase', 1.0 * SUM (is_home_try_on) / COUNT (user_id) AS 'quiz_to_home_try_on', 1.0 * SUM (is_purchase) / SUM (is_home_try_on) AS 'home_try_on_to_purchase'
FROM funnel;

--Question 7
WITH funnel AS (
SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
ON h.user_id = q.user_id
LEFT JOIN purchase AS 'p'
ON p.user_id = h.user_id)

SELECT number_of_pairs, COUNT (*) AS 'num_quiz', SUM (is_home_try_on) AS 'num_home_try_on', SUM (is_purchase) AS 'num_purchase', 1.0 * SUM (is_home_try_on) / COUNT (user_id) AS 'quiz_to_home_try_on', 1.0 * SUM (is_purchase) / SUM (is_home_try_on) AS 'home_try_on_to_purchase'
FROM funnel
WHERE number_of_pairs IS NOT NULL
GROUP BY 1
ORDER BY 1;


SELECT style, COUNT(*)
FROM quiz
GROUP BY 1;



SELECT product_id, COUNT(*)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;


