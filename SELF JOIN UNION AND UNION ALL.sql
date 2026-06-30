--SELF JOIN
DROP TABLE IF EXISTS emp;
CREATE TABLE emp (
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(50),
	manager_id BIGINT
);

INSERT INTO emp 
	VALUES
		(1,'Agni',3),
		(2,'Akash',4),
		(3,'Dharti',2),
		(4,'Vayu',3);
		
SELECT * FROM emp;

SELECT T1.emp_name AS employee_name, T2.emp_name AS manager_name
FROM emp AS T1
JOIN emp AS T2
ON T2.emp_id = T1.manager_id;

--UNION AND UNION ALL
CREATE TABLE custA (
	cust_name VARCHAR(30),
	cust_amount BIGINT	
);

INSERT INTO custA 
VALUES
	('Madan Mohan',2100 )