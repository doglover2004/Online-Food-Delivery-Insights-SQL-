use dummy
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
);
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(100),
    Cuisine VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    Score INT CHECK (Score BETWEEN 1 AND 5),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
INSERT INTO Customers VALUES
(1, 'krishna', 'krishna@email.com'),
(2, 'kumar', 'kumar@email.com'),
(3, 'swara', 'swara@email.com');
INSERT INTO Restaurants VALUES
(1, 'A2B', 'north Indian'),
(2, 'Dominos', 'swarma'),
(3, 'KFC', ' chicken');
INSERT INTO Orders VALUES
(101, 1, 1, '2025-09-15', 250.00),
(102, 2, 2, '2025-09-16', 499.00),
(103, 1, 3, '2025-09-17', 300.00),
(104, 3, 2, '2025-09-18', 700.00);
INSERT INTO Ratings VALUES
(1, 1, 1, 5),
(2, 2, 2, 4),
(3, 1, 3, 3),
(4, 3, 2, 5);

select * from Customers
select * from Orders
select * from Ratings
select * from Restaurants
SELECT 
    R.RestaurantID,
    R.Name AS RestaurantName,
    COUNT(O.OrderID) AS TotalOrders
FROM Restaurants R
JOIN Orders O ON R.RestaurantID = O.RestaurantID
GROUP BY R.RestaurantID, R.Name
ORDER BY TotalOrders DESC;
SELECT 
    R.RestaurantID,
    R.Name AS RestaurantName,
    SUM(O.Amount) AS TotalRevenue
FROM Restaurants R
JOIN Orders O ON R.RestaurantID = O.RestaurantID
GROUP BY R.RestaurantID, R.Name
ORDER BY TotalRevenue DESC;
SELECT 
    R.RestaurantID,
    R.Name AS RestaurantName,
    ROUND(AVG(RT.Score),2) AS AverageScore
FROM Restaurants R
JOIN Ratings RT ON R.RestaurantID = RT.RestaurantID
GROUP BY R.RestaurantID, R.Name
ORDER BY AverageScore DESC;
select RestaurantID,AVG(Score) as Averageratting from Ratings group by RestaurantID;
SELECT  C.CustomerID, C.CustomerName AS Customer_Name, COUNT(O.OrderID) AS Total_Orders FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(O.OrderID) > 1
ORDER BY Total_Orders DESC;
select CustomerID ,count(OrderID) as  TotalOrders, rank() over (Order by count(OrderID) desc ) as loyaltyRank from Orders group by CustomerID
select CustomerID ,count(OrderID) as  TotalOrders,Dense_rank() over (Order by count(OrderID) desc ) as loyaltyRank from Orders group by CustomerID
