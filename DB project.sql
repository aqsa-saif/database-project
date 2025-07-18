CREATE DATABASE shoppingsystem;
USE shoppingsystem;
CREATE TABLE customers (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200),
    Contact VARCHAR(20)
);
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
#Data insret
INSERT INTO Customers (Name, Email, Address, Contact) VALUES
('John Doe', 'john@example.com', '123 Main St', '1234567890'),
('Alice Smith', 'alice@example.com', '456 Elm St', '9876543210'),
('Michael Brown', 'michael@example.com', '789 Oak St', '1122334455');
INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Accessories');
INSERT INTO Products (ProductName, Price, CategoryID) VALUES
('Laptop', 1200.00, 1),
('Headphones', 150.00, 2),
('Webcam', 100.00, 2);
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-05-10', 1350.00),
(2, '2024-06-01', 100.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),  
(1, 2, 1),  
(2, 3, 1);
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2024-05-10', 1350.00, 'Credit Card'),
(2, '2024-06-01', 100.00, 'Cash on Delivery');
SHOW TABLES;
#applying quries
SELECT OrderID, OrderDate, TotalAmount
FROM Orders
WHERE CustomerID = 1;
SELECT Orders.OrderID, Customers.Name, Orders.OrderDate, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
SELECT ProductName, Price, CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;
