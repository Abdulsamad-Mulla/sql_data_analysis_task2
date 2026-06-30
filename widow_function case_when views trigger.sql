SELECT * FROM intemployee;
SELECT * FROM department;

--1) CASE WHEN
SELECT emp_name, salary,
	CASE WHEN salary >= 80000 THEN 'Highest Salary'
	     WHEN salary > 50000 AND salary < 80000 THEN 'Medium Salary'
	ELSE 'Low Salary'
	END AS salarywise_divide
FROM intemployee;


--2) VIEWS
CREATE VIEW intemployee_department_view AS
	SELECT
		e.emp_id,
		d.deptname,
		e.salary
FROM intemployee e
JOIN department d
ON e.dept_id = d.dept_id;

SELECT * FROM intemployee_department_view;

SELECT * FROM intemployee_department_view
WHERE salary > 90000;


--3) TRIGGERS

--first upon create table.
CREATE TABLE employee_log (
    log_id SERIAL PRIMARY KEY,
    emp_id INT,
    action_time TIMESTAMP
);

--CREATE TRIGGER FUNCTION.
CREATE OR REPLACE FUNCTION log_employee_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO employee_log(emp_id, action_time)
    VALUES (NEW.emp_id, CURRENT_TIMESTAMP);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--CREATE TRIGGER
CREATE TRIGGER employee_insert_trigger
AFTER INSERT
ON intemployee
FOR EACH ROW
EXECUTE FUNCTION log_employee_insert();

INSERT INTO intemployee
VALUES
(20, 'John', 60000, '2025-06-24', 101);

SELECT * FROM employee_log;

