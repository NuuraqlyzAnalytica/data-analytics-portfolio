/* You are a junior data analyst working for an online retail company.
-Management wants to understand its customer base and identify customers who have not yet made a purchase. */

/*
Table 1: customers
Column	Description
id	Unique customer identifier (Primary Key)
firstName	Customer's first name
email	Customer's email address

Table 2: orders
Column	Description
id	Unique order identifier (Primary Key)
customerId	Customer who placed the order (Foreign Key)
orderDate	Date the order was placed
totalAmount	Total order value

The orders.customerId column references customers.id. */

SELECT
  c.id AS customer_id
  o.id AS order_id,
  c.firstName,
  c.email,
  o.orderDate,
  o.totalAmount    
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customerId;

--See text file order_analysis.txt
