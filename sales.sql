-- Table: Salesman
-- salesman_id  name        city        commission
-- -----------  ----------  ----------  ----------
-- 5001         James Hoog  New York    0.15
-- 5002         Nail Knite  Paris       0.13
-- 5005         Pit Alex    London      0.11
-- 5006         Mc Lyon     Paris       0.14
-- 5003         Lauson Hen  San Jose    0.12
-- 5007         Paul Adam   Rome        0.13
-- Table: Orders
-- ord_no      purch_amt   ord_date    customer_id  salesman_id
-- ----------  ----------  ----------  -----------  -----------
-- 70001       150.5       2012-10-05  3005         5002
-- 70009       270.65      2012-09-10  3001         5005
-- 70002       65.26       2012-10-05  3002         5001
-- 70004       110.5       2012-08-17  3009         5003
-- 70007       948.5       2012-09-10  3005         5002
-- 70005       2400.6      2012-07-27  3007         5001
-- 70008       5760        2012-09-10  3002         5001
-- 70010       1983.43     2012-10-10  3004         5006
-- 70003       2480.4      2012-10-10  3009         5003
-- 70012       250.45      2012-06-27  3008         5002
-- 70011       75.29       2012-08-17  3003         5007
-- 70013       3045.6      2012-04-25  3002         5001
-- Table: Customer
-- customer_id  cust_name       city        grade  salesman_id 
-- -----------  --------------  ----------  -----  -----------
-- 3002         Nick Rimando    New York    100    5001
-- 3007         Brad Davis      New York    200    5001
-- 3005         Graham Zusi     California  200    5002
-- 3008         Julian Green    London      300    5002
-- 3004         Fabian Johnson  Paris       300    5006
-- 3009         Geoff Cameron   Berlin      100    5003
-- 3003         Jozy Altidor    Moscow      200    5007
-- 3001         Brad Guzan      London             5005
-- 1. From the following tables, write a SQL query to find all the orders
-- issued by the salesman 'Paul Adam'. Return ord_no, purch_amt, ord_date,
-- customer_id and salesman_id. 
select
    *
from
    orders
where
    salesman_id = (
        select
            salesman_id
        from
            salesman
        where
            name = 'Paul Adams'
    );

-- 2. From the following tables write a SQL query to find all orders generated 
-- by London-based salespeople. Return ord_no, purch_amt, ord_date, customer_id,
-- salesman_id.
select
    *
from
    orders
where
    salesman_id = (
        select
            salesman_id
        from
            salesman
        where
            city = 'London'
    );

-- 3. From the following tables write a SQL query to find all orders generated 
-- by the salespeople who may work for customers whose id is 3007. Return ord_no, 
-- purch_amt, ord_date, customer_id, salesman_id.
select
    *
from
    orders
where
    salesman_id = (
        select
            salesman_id
        from
            orders
        where
            customer_id = 3007
    );

-- 4. From the following tables write a SQL query to find the order values greater 
-- than the average order value of 10th October 2012. Return ord_no, purch_amt, ord_date,
-- customer_id, salesman_id.
select
    *
from
    orders
where
    purch_amt > (
        select
            avg(purch_amt)
        from
            orders
        where
            ord_date = '2012-09-10'
    );

-- 5. From the following tables, write a SQL query to find all the orders generated
-- in New York city. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select
    *
from
    orders
where
    salesman_id = (
        select
            salesman_id
        from
            salesman
        where
            city = 'New York'
    );

-- 6. From the following tables write a SQL query to determine the commission of 
-- the salespeople in Paris. Return commission.
select
    commission
from
    salesman
where
    salesman_id = (
        select
            salesman_id
        from
            customer
        where
            city = 'Paris'
    );

-- 7. Write a query to display all the customers whose ID is 2001 below the 
-- salesperson ID of Mc Lyon.
select
    *
from
    customer
where
    customer_id = (
        select
            salesman_id - 2001
        from
            salesman
        where
            name = 'Mc Lyon'
    );

-- 8. From the following tables write a SQL query to count the number of 
-- customers with grades above the average in New York City. Return grade and count.
select
    count(grade),
    grade
from
    customer
group by
    grade
having
    grade > (
        select
            avg(grade)
        from
            customer
        where
            city = 'New York'
    );

-- 9. From the following tables, write a SQL query to find those salespeople who 
-- earned the maximum commission. Return ord_no, purch_amt, ord_date, and salesman_id.
select
    *
from
    orders
where
    salesman_id = (
        select
            salesman_id
        from
            salesman
        where
            commission = (
                select
                    max(commission)
                from
                    salesman
            )
    );

-- 10. From the following tables write SQL query to find the customers who placed 
-- orders on 17th August 2012. Return ord_no, purch_amt, ord_date, customer_id, 
-- salesman_id and cust_name.
select
    orders.*,
    customer.cust_name
from
    orders,
    customer
where
    orders.customer_id = customer.customer_id
    and orders.ord_date = '2012-08-17';

-- 11. From the following tables write a SQL query to find salespeople who had 
-- more than one customer. Return salesman_id and name.
SELECT
    salesman_id,
    name
FROM
    salesman a
WHERE
    1 < (
        SELECT
            COUNT(*)
        FROM
            customer
        WHERE
            salesman_id = a.salesman_id
    );

-- 12. From the following tables write a SQL query to find those orders, 
-- which are higher than the average amount of the orders. Return ord_no, 
-- purch_amt, ord_date, customer_id and salesman_id. 
select
    *
from
    orders
where
    purch_amt > (
        select
            avg(purch_amt)
        from
            orders
    );

-- 13. From the following tables write a SQL query to find those orders
-- that are equal or higher than the average amount of the orders. Return ord_no,
-- purch_amt, ord_date, customer_id and salesman_id. 
select
    *
from
    orders
where
    purch_amt >= (
        select
            avg(purch_amt)
        from
            orders
    );