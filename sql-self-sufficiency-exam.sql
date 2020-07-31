-- 1) Write a query that allows you to inspect the schema of the naep table.
SELECT *
FROM information_schema.columns
WHERE table_name = 'naep';


-- 2) Write a query that returns the first 50 records of the naep table.
SELECT *
FROM naep
LIMIT 50;


-- 3) Write a query that returns summary statistics for avg_math_4_score by state. Make sure to sort the results alphabetically by state name.
SELECT state,
       COUNT(avg_math_4_score) as count,
	   ROUND(AVG(avg_math_4_score), 3) AS avg_score,
       MIN(avg_math_4_score) AS min_score,
       MAX(avg_math_4_score) AS max_score
FROM naep
GROUP BY state
ORDER BY state;	


-- 4) Write a query that alters the previous query so that it returns only the summary statistics for avg_math_4_score by state with differences in max and min values that are greater than 30.
SELECT state,
	   COUNT(avg_math_4_score) as count,
	   ROUND(AVG(avg_math_4_score), 3) AS avg_score,
       MIN(avg_math_4_score) AS min_score,
       MAX(avg_math_4_score) AS max_score
FROM naep
GROUP BY state
HAVING (MAX(avg_math_4_score) - MIN(avg_math_4_score)) > 30
ORDER BY state;

-- 5) Write a query that returns a field called bottom_10_states. This field should list the states in the bottom 10 for avg_math_4_score in the year 2000.
SELECT state as bottom_10_states
FROM naep
WHERE year = 2000
ORDER BY avg_math_4_score
LIMIT 10;

-- 6) Write a query that calculates the average avg_math_4_score, rounded to the nearest two decimal places, over all states in the year 2000.
SELECT ROUND(AVG(avg_math_4_score), 2) AS avg_all_states_y2000
FROM naep
WHERE year = 2000;

-- 7) Write a query that returns a field called below_average_states_y2000. This field should list all states with an avg_math_4_score less than the average over all states in the year 2000.
SELECT state AS below_average_states_y2000
FROM naep
WHERE (avg_math_4_score < (SELECT AVG(avg_math_4_score) AS avg_all_states_y2000
						   FROM naep
						   WHERE year = 2000)) 
	  AND 
	  (year = 2000)
ORDER BY state;

-- 8) Write a query that returns a field called scores_missing_y2000 that lists any states with missing values in the avg_math_4_score column of the naep table for the year 2000.
SELECT state AS scores_missing_y2000
FROM naep
WHERE year = 2000 AND avg_math_4_score IS NULL
ORDER BY state;

-- 9) Write a query that returns, for the year 2000, the state, avg_math_4_score, and total_expenditure from the naep table, joined using the LEFT OUTER JOIN clause with the finance table. Use id as the key and order the output by total_expenditure from greatest to least. Make sure to round avg_math_4_score to the nearest two decimal places, and then filter out NULL values in avg_math_4_scores in order to see any correlation more clearly.
SELECT n.state,
	   ROUND(n.avg_math_4_score, 2) AS avg_math_4_scores,
	   f.total_expenditure
FROM naep AS n
LEFT OUTER JOIN finance as f
ON n.id = f.id
WHERE n.year = 2000 AND n.avg_math_4_score IS NOT NULL
ORDER BY f.total_expenditure DESC;
