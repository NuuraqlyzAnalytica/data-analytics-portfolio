/*
Maven Analytics — Restaurant Order Analysis Challenge
Platform: Databricks SQL

BUSINESS OBJECTIVE
The purpose of this analysis is to help a restaurant better understand
its menu performance and customer ordering behavior.

The findings can help the restaurant evaluate its menu offerings,
understand pricing and ordering patterns, and identify opportunities
to improve menu performance and business operations.

*/


--View the menu_items table and write a query to find the number of items on the menu

SELECT COUNT(*) AS total_menu_items
FROM workspace.restaurant_db.menu_items ;

--===============================================================================

-- What is the minimum and maximum price on the menu?

---- Basic Method

--Minimum Price?
SELECT item_name, price
FROM workspace.restaurant_db.menu_items
ORDER BY price ASC
LIMIT 1;

--Maximum Price?
SELECT item_name, price
FROM workspace.restaurant_db.menu_items
ORDER BY price DESC
Limit 1;

--Advance Method

With price_details AS (
    SELECT 
        MAX(price) AS max_price,
        MIN(price) AS min_price
    FROM workspace.restaurant_db.menu_items

)
SELECT --select the min and max price from the price_details table
    m.item_name,
    m.price
  FROM workspace.restaurant_db.menu_items AS m
  CROSS JOIN price_details AS pd
  WHERE m.price = pd.max_price
  OR m.price = pd.min_price;

--======================================================================================

--How many dishes are there in each category, and what is the average price for each category?

SELECT category,
COUNT(*) AS num_of_dishes, ROUND(AVG(price), 2) AS average_price
FROM workspace.restaurant_db.menu_items
GROUP BY category;
