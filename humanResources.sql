DESC jobs;

SELECT
    *
FROM
    jobs;

SELECT
    *
FROM
    job_history;

SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    countries;

SELECT
    *
FROM
    locations;

SELECT
    *
FROM
    departments;
--True/False -> True
SELECT
    last_name,
    job_id,
    salary AS sal
FROM
    employees;

--True/False -> False
SELECT
    *
FROM
    job_grades;

--Determine the structure of the DEPARTMENTS table
CREATE TABLE departments (
    department_id    NUMBER(4) NOT NULL,
    department_name  VARCHAR2(30) NOT NULL,
    manager_id       NUMBER(6),
    location_id      NUMBER(4)
);

--The HR department wants a query to display the last name, job ID, hire date, and
--employee ID for each employee, with the employee ID appearing first. Provide an 
--alias STARTDATE for the HIRE_DATE column.
SELECT
    employee_id,
    last_name,
    job_id,
    hire_date startdate
FROM
    employees;

--The HR department wants a query to display all unique job IDs from the EMPLOYEES table.
SELECT DISTINCT
    job_id
FROM
    employees;

--The HR department wants more descriptive column headings for its report on employees. Copy 
--the statement from lab_01_05.sql to a new SQL Worksheet. Name the column headings Emp #,
--Employee, Job, and Hire Date, respectively.
SELECT
    employee_id  AS "Emp#",
    last_name    AS "Employee",
    job_id       AS "Job",
    hire_date    AS "Hire Date"
FROM
    employees;

--The HR department has requested a report of all employees and their job IDs. Display the last 
--name concatenated with the job ID (separated by a comma and space) and name the column Employee
--and Title. 
SELECT
    concat(concat(last_name, ', '), job_id) AS "Employee and Title"
FROM
    employees;
--or
SELECT
    last_name
    || ', '
    || job_id AS "Employee and Title"
FROM
    employees;

--To familiarize yourself with the data in the EMPLOYEES table, create a query to display all the 
--data from that table. Separate each column output by a comma. Name the column title THE OUTPUT. 
SELECT
    employee_id
    || ','
    || first_name
    || ','
    || last_name
    || ','
    || email
    || ','
    || phone_number
    || ','
    || hire_date
    || ','
    || job_id
    || ','
    || salary
    || ','
    || commission_pct
    || ','
    || manager_id
    || ','
    || department_id AS the_output
FROM
    employees;

--Because of budget issues, the HR department needs a report that
--displays the last name and salary of employees who earn more than $12,000.    
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > 12000;

--Display the last name and department number for employee number 176. Run the query. 
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;

--The HR department needs to find high-salary and low-salary employees. Display the 
--last name and salary for any employee whose salary is not in the range of $5,000 
--to $12,000. Save your SQL statement as lab_02_03.sql. 
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;

--Create a report to display the last name, job ID, and hire date for employees with
--the last names of Matos and Taylor. Order the query in ascending order by the hire date
SELECT
    last_name,
    job_id,
    hire_date
FROM
    employees
WHERE
    last_name IN ( 'Matos', 'Taylor' )
ORDER BY
    hire_date ASC;

--Display the last name and department ID of all employees in departments 20 or 50 in ascending 
--alphabetical order by name. 
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name ASC;

--Display the last name and salary of employees who earn between $5,000 and $12,000, and are in 
--department 20 or 50. Label the columns Employee and Monthly Salary, respectively.
SELECT
    last_name  AS "Employee",
    salary     AS "Monthly Salary"
FROM
    employees
WHERE
    salary BETWEEN 5000 AND 12000
    AND department_id IN ( 20, 50 );

--The HR department needs a report that displays the last name and hire date for all employees 
--who were hired in 1994. 
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '%94';

--Create a report to display the last name and job title of all employees 
--who do not have a manager. 
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;   
    
--Display the last name, salary, and commission of all employees who earn commissions.
--Sort data in descending order of salary and commissions. Use the column's numeric 
--position in the ORDER BY clause.     
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    2 DESC,
    3 DESC;    
    
--They would like a report that displays the last name and salary of employees who earn 
--more than an amount that the user specifies after a prompt.
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > &user_value;

--Create a query that prompts the user for a manager ID and generates the employee ID, 
--last name, salary, and department for that manager's employees. The HR department wants 
--the ability to sort the report on a selected column.
SELECT
    employee_id,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    manager_id = &user_manager_id
ORDER BY
    &user_column ASC;

--Display all employee last names in which the third letter of the name is 'a'.
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '__a%';

--Display the last names of all employees who have both an "a" and an "e" in 
--their last name.
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    AND last_name LIKE '%e%';

--Display the last name, job, and salary for all employees whose jobs are either those 
--of a sales representative or of a stock clerk, and whose salaries are not equal to 
--$2,500, $3,500, or $7,000. 
SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id IN ( 'SA_REP', 'ST_CLERK' )
    AND salary NOT IN ( 2500, 3500, 7000 );   

--display the last name, salary, and commission for all employees whose commission is 20%.
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct = 0.2;    

--Write a query to display the system date. Label the column as Date. 
SELECT
    sysdate AS "Date"
FROM
    dual;

--Display the employee number, last name, salary, and salary increased by 15.5% (expressed 
--as a whole number) for each employee. Label the column New Salary.
SELECT
    employee_id,
    last_name,
    salary,
    round(salary * 1.155) AS "New Salary"
FROM
    employees;

--add a column that subtracts the old salary from the new salary. Label the column Increase.
SELECT
    employee_id,
    last_name,
    salary,
    round(salary * 1.155)          AS "New Salary",
    ( salary * 1.155 ) - salary    AS increase
FROM
    employees;

--Display the last name (with the first letter in uppercase and all the other letters in 
--lowercase) and the length of the last name for all employees whose name starts with the 
--letters "J," "A," or "M." Give each column an appropriate label. Sort the results by the 
--employees' last names. 
SELECT
    initcap(last_name)     AS "Name",
    length(last_name)      AS "Length"
FROM
    employees
WHERE
    last_name LIKE 'J%'
    OR last_name LIKE 'A%'
    OR last_name LIKE 'M%'
ORDER BY
    last_name ASC;

--Rewrite the query so that the user is prompted to enter a letter that the last name starts with. 
SELECT
    initcap(last_name)     AS "Name",
    length(last_name)      AS "Length"
FROM
    employees
WHERE
    last_name LIKE '&user_last_name%'
ORDER BY
    last_name ASC;

--The HR department wants to find the duration of employment for each employee. For each employee, 
--display the last name and calculate the number of months between today and the date on which the 
--employee was hired. Label the column as MONTHS_WORKED. Order your results by the number of months 
--employed. Round the number of months up to the closest whole number. 
SELECT
    last_name,
    ceil(months_between(sysdate, hire_date)) AS "MONTHS_WORKED"
FROM
    employees
ORDER BY
    months_worked;

--Create a query to display the last name and salary for all employees. Format the salary to be 15 
--characters long, left-padded with the $ symbol. Label the column as SALARY. 
SELECT
    last_name,
    lpad(salary, 15, '$') AS salary
FROM
    employees;

--Create a query that displays the first eight characters of the employees' last names 
--and indicates the amounts of their salaries with asterisks. Each asterisk signifies a 
--thousand dollars. Sort the data in descending order of salary. Label the column as EMPLOYEES 
--AND THEIR SALARIES.
SELECT
    substr(last_name, 1, 8)
    || rpad('*', salary / 1000, '*') AS "EMPLOYEES AND THEIR SALARIES"
FROM
    employees
ORDER BY
    salary DESC;

--Create a query to display the last name and the number of weeks employed for all 
--employees in department 90. Label the number of weeks column as TENURE. Truncate 
--the number of weeks value to o decimal places. Show the records in descending order
--of the employee's tenure. 
SELECT
    last_name,
    trunc((sysdate - hire_date) / 7) AS tenure
FROM
    employees
WHERE
    department_id = 90
ORDER BY
    tenure DESC;

--1. Group functions work across many rows to produce one result per group. <- false
--2. Group functions include nulls in calculations. <- false
--3. The WHERE clause restricts rows before inclusion in a group calculation. <-false 

--Find the highest, lowest, sum, and average salary of all employees. Label the columns 
--as Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest 
--whole number.
SELECT
    round(MAX(salary))        AS "Maximum",
    round(MIN(salary))        AS "Minimum",
    round(SUM(salary))        AS "Sum",
    round(AVG(salary))        "Average"
FROM
    employees;

--Modify the previous query to display the minimum, maximum, sum, and average salary for
--each job type.
SELECT
    job_id,
    round(MAX(salary))        AS "Maximum",
    round(MIN(salary))        AS "Minimum",
    round(SUM(salary))        AS "Sum",
    round(AVG(salary))        "Average"
FROM
    employees
GROUP BY
    job_id;

--Write a query to display the number of people with the same job.
SELECT
    job_id,
    COUNT(*)
FROM
    employees
GROUP BY
    job_id;

--Generalize the query so that the user in the HR department is prompted for a job title.
SELECT
    job_id,
    COUNT(*)
FROM
    employees
WHERE
    job_id = '&user_job_id'
GROUP BY
    job_id;

--Determine the number of managers without listing them. Label the column as Number of 
--Managers.
SELECT
    COUNT(manager_id) AS "Number of Managers"
FROM
    employees;

--Find the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT
    ( MAX(salary) - MIN(salary) ) AS difference
FROM
    employees;

--Display the manager number and the salary of the lowest-paid employee for that manager. 
--Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is 
--$6,000 or less. Sort the output in descending order of salary. 
SELECT
    manager_id,
    MIN(salary)
FROM
    employees
WHERE
    manager_id IS NOT NULL
GROUP BY
    manager_id
HAVING
    MIN(salary) > 6000
ORDER BY
    MIN(salary) DESC;

--Create a query to display the total number of employees and, of that total, the number
--of employees hired in 2003, 2004, 2005, and 2006. Create appropriate column headings. 
SELECT
    COUNT(*)     AS total,
    COUNT(
        CASE
            WHEN hire_date LIKE '%03' THEN
                1
        END
    )            AS "2003",
    COUNT(
        CASE
            WHEN hire_date LIKE '%04' THEN
                1
        END
    )            AS "2004",
    COUNT(
        CASE
            WHEN hire_date LIKE '%05' THEN
                1
        END
    )            AS "2005",
    COUNT(
        CASE
            WHEN hire_date LIKE '%06' THEN
                1
        END
    )            AS "2006"
FROM
    employees;

--Display the job, the salary for that job based on department number, and the total salary for
--that job, for departments 20, 50, 80, and 90, giving each column an appropriate heading. 
SELECT
    job_id,
    MAX(
        CASE
            WHEN department_id = 20 THEN
                salary
        END
    )  AS "Dept 20",
    MAX(
        CASE
            WHEN department_id = 50 THEN
                salary
        END
    )  AS "Dept 50",
    MAX(
        CASE
            WHEN department_id = 80 THEN
                salary
        END
    )  AS "Dept 80",
    MAX(
        CASE
            WHEN department_id = 90 THEN
                salary
        END
    )  AS "Dept 90",
    MAX(salary)
FROM
    employees
GROUP BY
    job_id;

-- produce the addresses of all the departments. Use the LOCATIONS and COUNTRIES tables. 
--Show the location ID, street address, city, state or province, and country in the output. 
--Use a NATURAL JOIN to produce the results. 
SELECT
    location_id,
    street_address,
    city,
    state_province,
    country_name
FROM
         countries
    NATURAL JOIN locations;

--Display the last name, department number, and department name for all the employees. 
SELECT
    last_name,
    department_id,
    department_name
FROM
         employees
    NATURAL JOIN departments;

--Display the last name, job, department number, and the department name for all employees 
--who work in Toronto. 
SELECT
    e.last_name,
    e.job_id,
    e.department_id,
    d.department_name
FROM
         employees e
    JOIN departments  d ON ( e.department_id = d.department_id )
    JOIN locations    l ON ( d.location_id = l.location_id )
WHERE
    lower(l.city) = 'toronto';
    
--Display employees' last name and employee number along with their manager's last name and 
--manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.    
SELECT
    e.last_name      AS "Employee",
    e.employee_id    AS "Emp#",
    m.last_name      AS "Manager",
    m.employee_id    AS "Mgr#"
FROM
         employees e
    JOIN employees m ON ( e.manager_id = m.employee_id );

--Modify the previous query to display all employees including King, who has no manager. Order 
--the results by the employee number.
SELECT
    e.last_name      AS "Employee",
    e.employee_id    AS "Emp#",
    m.last_name      AS "Manager",
    m.employee_id    AS "Mgr#"
FROM
    employees  e
    LEFT JOIN employees  m ON ( e.manager_id = m.employee_id );

--Displays employee last names, department numbers, and all the employees who work in the same 
--department as a given employee. 
SELECT
    e.department_id,
    e.last_name    employee,
    c.last_name    colleague
FROM
         employees e
    JOIN employees c ON ( e.department_id = c.department_id )
WHERE
    e.employee_id <> c.employee_id;

--Display the name and hire date of any employee hired after employee Davies.
SELECT
    e.last_name,
    e.hire_date
FROM
         employees e
    JOIN employees davies ON ( davies.last_name = 'Davies' )
WHERE
    davies.hire_date < e.hire_date;

--Find the names and hire dates for all employees who were hired before their managers, along 
--with their managers’ names and hire dates.
SELECT
    e.last_name,
    e.hire_date,
    m.last_name,
    m.hire_date
FROM
         employees e
    JOIN employees m ON ( e.manager_id = m.employee_id )
WHERE
    e.hire_date < m.hire_date;
    
--Create a table
CREATE TABLE dummytable (
    dummyid    NUMBER PRIMARY KEY,
    dummyname  VARCHAR(25) UNIQUE,
    dummyage   NUMBER NOT NULL CHECK ( dummyage > 20 )
);

--Insert into a table
INSERT INTO dummytable VALUES (
    1,
    'dummy',
    33
);

INSERT INTO dummytable VALUES (
    2,
    'dummn',
    25
);

INSERT INTO dummytable (
    dummyid,
    dummyname,
    dummyage
) VALUES (
    3,
    'dom',
    28
);

INSERT INTO dummytable VALUES (
    4,
    'du',
    24
);
   
--Update a row.
UPDATE dummytable
SET
    dummyname = 'dumm'
WHERE
    dummyid = 2;

UPDATE dummytable
SET
    dummyname = 'John'
WHERE
    dummyname LIKE '_o%';

--Alter a table.
ALTER TABLE dummytable ADD email VARCHAR(25);

ALTER TABLE dummytable DROP COLUMN dummyage;   

--Showcase the rows of a table.
SELECT
    *
FROM
    dummytable;

--Delete a row.   
DELETE FROM dummytable
WHERE
    dummyid = 2;  
   
--Drop a table.
DROP TABLE dummytable;
   
--Describe a table.   
DESCRIBE employees;

--Apply commit.
COMMIT;

--Empty the entire dummyTable.   
TRUNCATE TABLE dummytable;

--Create the DEPT table based on the following table instance chart.
CREATE TABLE dept (
    id    NUMBER(7) PRIMARY KEY,
    name  VARCHAR(25) NOT NULL
);

--Populate the DEPT table with data from the DEPARTMENTS table. Include only columns that 
--you need.
INSERT INTO dept
    ( SELECT
        department_id,
        department_name
    FROM
        departments
    );

--Create the EMP table based on the following table instance chart. 
CREATE TABLE emp (
    id          NUMBER(7),
    last_name   VARCHAR(25),
    first_name  VARCHAR2(25),
    dept_id     NUMBER(7),
    FOREIGN KEY ( dept_id )
        REFERENCES dept ( id )
);

--Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table. Include only the EMPLOYEE_ID, FIRST_NAME,
--LAST_NAME, SALARY, and DEPARTMENT_ID columns.
CREATE TABLE employees2
    AS
        SELECT
            employee_id,
            first_name,
            last_name,
            salary,
            department_id
        FROM
            employees;
  
--Create a view from employees table.
CREATE VIEW empview AS
    SELECT
        employee_id,
        last_name,
        salary
    FROM
        employees
    WHERE
        department_id = 80;

SELECT
    *
FROM
    empview;

--Describe a view.
DESCRIBE empview;

--Modify a view.
CREATE OR REPLACE VIEW empview AS
    SELECT
        employee_id,
        first_name
        || ' '
        || last_name AS fullname,
        salary,
        department_id
    FROM
        employees
    WHERE
        department_id = 50;

--Drop a view.
DROP VIEW empview;

--Create a sequence.
CREATE SEQUENCE dept_seq INCREMENT BY 10 START WITH 120 MAXVALUE 9999 NOCACHE NOCYCLE;

--Insert a value into table with a sequence.
INSERT
INTO dept VALUES (
    dept_seq.NEXTVAL,
    'dummyValu'
);

--view the current value in the dept_seq.
SELECT
    dept_seq.CURRVAL
FROM
    dual;

--Modify a sequence.
ALTER SEQUENCE dept_seq INCREMENT BY 20 MAXVALUE 9999 NOCACHE NOCYCLE;

--Create an index.
CREATE INDEX last_name_ix ON
    dept (
        name
    );

--Drop an index.
DROP INDEX last_name_ix;

--Create a synonym.
CREATE SYNONYM val FOR empview;

--Drop a synonym.
DROP SYNONYM val;

--Create a view called EMPLOYEES_VU based on the employee numbers, employee last
--names, and department numbers from the EMPLOYEES table. Name heading for the 
--employee name to be EMPLOYEE
CREATE VIEW employee_vu AS
    SELECT
        employee_id,
        last_name employeed,
        department_id
    FROM
        employees;

SELECT
    *
FROM
    employee_vu;

--Display all employee names and department numbers from the employee_vu.
SELECT
    employeed,
    department_id
FROM
    employee_vu; 

--Create a view named DEPT50 that contains the employee numbers, employee last names, and 
--department numbers for all employees in department 50. They have requested that you label 
--the view columns EMPNO, EMPLOYEE, and DEPTNO. 
CREATE VIEW dept50 AS
    SELECT
        employee_id    empno,
        last_name      employee,
        department_id  deptno
    FROM
        employees
    WHERE
        department_id = 50
WITH CHECK OPTION CONSTRAINT emp_dept_50;

--Attempt to violate the constraint.
UPDATE dept50
SET
    deptno = 80
WHERE
    employee = 'Matos';

--sequence should start at 200 and have a maximum value of 1000. Have your sequence increment
--by 10. Name the sequence DEPT_ID_SEQ. 
CREATE SEQUENCE dept_id_seq START WITH 200 INCREMENT BY 10 MAXVALUE 1000;

--write a script to insert two rows with sequence in the DEPT table.
INSERT INTO dept VALUES (
    dept_id_seq.NEXTVAL,
    'Education'
);

--Create a nonunique index on the NAME column in the DEPT table.
CREATE INDEX dept_name_idx ON
    dept (
        name
    ); 

--Create a synonym for your EMPLOYEES table. Call it EMP.
CREATE SYNONYM emp FOR employees;