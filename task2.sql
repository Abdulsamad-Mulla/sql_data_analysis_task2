SELECT * FROM intemployee;
SELECT * FROM department;


INSERT INTO intemployee
 VALUES
 	(18,'Deepak', 110000, '2024-07-19', 103),
	(19,'Sneha', 85000, '2025-05-12', 105);

--ROW NUMBER
SELECT
	emp_id,
	salary,
	dept_id,
	ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_num
FROM intemployee;

--DENSE RANK
SELECT
	emp_id,
	salary,
	dept_id,
	DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS Ranking_num
FROM intemployee;

--SUM()
SELECT
	emp_id,
	salary,
	dept_id,
	SUM(salary) OVER(PARTITION BY dept_id ORDER BY salary DESC) AS Ranking_num
FROM intemployee;

--AVG()
SELECT
	emp_id,
	salary,
	dept_id,
	ROUND(AVG(salary) OVER(PARTITION BY dept_id ORDER BY salary DESC),2) AS avg_total
FROM intemployee;

--MAX()
SELECT
	emp_id,
	salary,
	dept_id,
	MAX(salary) OVER(PARTITION BY dept_id ORDER BY salary DESC) AS max_salary
FROM intemployee;

--FIRST_VALUE
SELECT
	emp_id,
	salary,
	dept_id,
	FIRST_VALUE(salary) OVER(PARTITION BY dept_id ORDER BY salary DESC) AS first_num
FROM intemployee;

--LAST VALUE()
SELECT
	emp_name,
	salary,
	dept_id,
	LAST_VALUE(salary) OVER(PARTITION BY dept_id ORDER BY salary DESC) AS last_num
FROM intemployee;

--LEAD()
SELECT
    emp_name,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary
    ) AS next_salary
FROM intemployee;

--LAG()
SELECT
    emp_name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary
FROM intemployee;

--NTILE()
SELECT
    emp_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary DESC
    ) AS bucket
FROM intemployee;

--RANK()
SELECT
    emp_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS rank_num
FROM intemployee;




