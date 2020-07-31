1) Write a query that allows you to inspect the schema of the naep table.
2) Write a query that returns the first 50 records of the naep table.

3) Write a query that returns summary statistics for avg_math_4_score by state. Make sure to sort the results alphabetically by state name.

4) Write a query that alters the previous query so that it returns only the summary statistics for avg_math_4_score by state with differences in max and min values that are greater than 30.

5) Write a query that returns a field called bottom_10_states. This field should list the states in the bottom 10 for avg_math_4_score in the year 2000.

6) Write a query that calculates the average avg_math_4_score, rounded to the nearest two decimal places, over all states in the year 2000.

7) Write a query that returns a field called below_average_states_y2000. This field should list all states with an avg_math_4_score less than the average over all states in the year 2000.

8) Write a query that returns a field called scores_missing_y2000 that lists any states with missing values in the avg_math_4_score column of the naep table for the year 2000.

9) Write a query that returns, for the year 2000, the state, avg_math_4_score, and total_expenditure from the naep table, joined using the LEFT OUTER JOIN clause with the finance table. Use id as the key and order the output by total_expenditure from greatest to least. Make sure to round avg_math_4_score to the nearest two decimal places, and then filter out NULL values in avg_math_4_scores in order to see any correlation more clearly.