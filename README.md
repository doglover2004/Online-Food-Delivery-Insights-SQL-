# Online-Food-Delivery-Insights-SQL-
This document explains a Data Analytics project using Food Delivery Orders data. It provides a set of tables, columns, and step-by-step tasks to perform data exploration and analysis using SQL.

## Dataset

Customers: CustomerID, Name

Restaurants: RestaurantID, Name, Cuisine

Orders: OrderID, CustomerID, RestaurantID, OrderDate, Amount

Ratings: RatingID, CustomerID, RestaurantID, Score


## 1. Data Exploration with SQL

Explore Customers, Restaurants, Orders, and Ratings tables.

Check for missing values and inconsistencies.


## 2. Restaurant Performance

Write queries to find top restaurants by total orders and revenue.

Use AVG() to calculate average restaurant ratings.


## 3. Customer Loyalty

Identify repeat customers who ordered multiple times.

Use SQL window functions (RANK(), DENSE_RANK()) to measure customer loyalty.

## 4. Order Trends

Find peak delivery times (hours/days with most orders).

Use GROUP BY and ORDER BY to summarize trends.


