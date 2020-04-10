/***********************************************************************************
Title: INFO 330 - Module02: Assignment 02
Desc: Creates a database to hold information on various products
Dev: Thomas Luk
Changelog: When, Who, What
01/18/2020, Thomas Luk, Created Assignment02 SQL Script
***********************************************************************************/

use master;
GO
if Exists(Select Name From sysdatabases Where name = 'Assignment02DB_TLuk')
BEGIN
    Drop Database Assignment02DB_TLuk
END

Create Database Assignment02DB_TLuk
Go
Use Assignment02DB_TLuk
Go

CREATE TABLE dbo.Customers (
    CustomerID int Primary Key, 
    CustomerFirstName varchar(100),
    CustomerLastName varchar(100)
);

GO

CREATE View dbo.vCustomers AS
SELECT
    CustomerID,
    CustomerFirstName,
    CustomerLastName
FROM dbo.Customers;

GO

CREATE TABLE dbo.Products (
    ProductID int Primary Key,
    ProductName varchar(200) NOT NULL,
    ProductCategory varchar(200),
    ProductSubCategory varchar(200)
);

GO

CREATE View dbo.vProducts AS
SELECT
    ProductID,
    ProductName,
    ProductCategory,
    ProductSubCategory
From dbo.Products;

GO

CREATE TABLE dbo.Orders (
    OrderID int Primary Key, 
    OrderPrice varchar(100) NOT NULL,
    OrderQty int NOT NULL,
    OrderDate varchar(100) NOT NULL CHECK (OrderDate LIKE '[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]')
);

Go

Create View dbo.vOrders AS
SELECT
    OrderID,
    OrderPrice,
    OrderQty,
    OrderDate
FROM dbo.Orders;

GO

CREATE TABLE dbo.CustomerProductOrders (
    CustomerID int Primary Key Foreign Key,
    ProductID int Primary Key Foreign Key,
    OrderID int Primary Key Foreign Key
);

GO

Create View dbo.vCustomerProductOrders AS
SELECT
    CustomerID,
    ProductID, 
    OrderID
FROM dbo.CustomerProductOrders;

GO