--*************************************************************************--
-- Title: INFO 330 - Module04: Assignment 04
-- Author: Thomas Luk
-- Desc: Select data based on requests
-- Change Log: When,Who,What
-- 02/04/2020, Thomas Luk, Created Assignment04 SQL Script
--**************************************************************************--
Use Master;
go

If Exists(Select Name from SysDatabases Where Name = 'Assignment04DB_ThomasLuk')
 Begin 
  Alter Database [Assignment04DB_ThomasLuk] set Single_user With Rollback Immediate;
  Drop Database Assignment04DB_ThomasLuk;
 End
go

Create Database Assignment04DB_ThomasLuk;
go

Use Assignment04DB_ThomasLuk;
go

-- Add Your Code Below ---------------------------------------------------------------------

-- Data Request: 0301
-- Request: I want a list of customer companies and their contact people
/*
  -- Columns
  c.CompanyName
  c.ContactName

  -- Tables
  Northwind.dbo.Customers
*/

Create View vCustomerContacts
AS  
    SELECT
    CompanyName,
    ContactName
    From Northwind.dbo.Customers;

Go

Select * from vCustomerContacts;

GO

-- Data Request: 0302
-- Request: I want a list of customer companies and their contact people, but only the ones in US and Canada
/*
  -- Columns
  c.CompanyName
  c.ContactName
  c.Country

  -- Tables
  Northwind.dbo.Customers
*/

Create View vUSAandCanadaCustomerContacts
AS  
    SELECT
    CompanyName,
    ContactName,
    Country
    From Northwind.dbo.Customers WHERE Country = 'USA' OR Country = 'Canada';

Go

Select * from vUSAandCanadaCustomerContacts;

Go
  
-- Data Request: 0303
-- Request: I want a list of products, their standard price and their categories. 
-- Order the results by Category Name and then Product Name, in alphabetical order.
/*
  -- Columns 
  c.CategoryName
  p.ProductName
  p.UnitPrice

  -- Tables
  Northwind.dbo.Products 
  Northwind.dbo.Categories

  -- Connections
  ???
*/
--Select * FROM Northwind.dbo.Categories

Create View vProductPricesByCategories
AS
SELECT TOP 1000000000
  c.CategoryName,
  p.ProductName,
  [StandardPrice] = Format(p.UnitPrice, 'C', 'en-US')
  FROM Northwind.dbo.Categories AS c JOIN Northwind.dbo.Products AS p
  ON c.CategoryID = p.CategoryID
ORDER BY c.CategoryName, p.ProductName ASC; 
GO

Select * from vProductPricesByCategories;

Go

-- Data Request: 0323
-- Request: I want a list of products, their standard price and their categories. 
-- Order the results by Category Name and then Product Name, in alphabetical order but only for the seafood category
/*
  -- Columns 
  c.CategoryName
  p.ProductName
  p.UnitPrice

  -- Tables
  Northwind.dbo.Products 
  Northwind.dbo.Categories

  -- Connections
  ???
*/

Create Function fProductPricesByCategories(@Category varchar(100))
Returns Table
AS
  Return(
    Select TOP 1000000000
    c.CategoryName,
    p.ProductName,
    [StandardPrice] = Format(p.UnitPrice, 'C', 'en-US')
    FROM Northwind.dbo.Categories AS c JOIN Northwind.dbo.Products AS p
    ON c.CategoryID = p.CategoryID
    WHERE c.CategoryName = @Category
    ORDER BY c.CategoryName, p.ProductName ASC
  );

Go

Select * from dbo.fProductPricesByCategories('seafood');

Go

-- Data Request: 0317
-- Request: I want a list of how many orders our customers have placed each year
/*
  -- Columns
  c.CompanyName
  od.OrderID
  o.OrderDate

  -- Tables
  Northwind.dbo.Customers
  Northwind.dbo.Orders

  -- Connections
  ???

  -- Functions
  Year()
  Count() 
*/

--Select * from Northwind.dbo.Customers 

CREATE View vCustomerOrderCounts
AS 
SELECT TOP 100000000000
  CompanyName,
  [NumberofOrders] = Count(OrderID),
  [Order Year] = Year(o.OrderDate)
	From Northwind.dbo.Customers as c
	Join Northwind.dbo.Orders as o
	 On c.CustomerID = o.CustomerID
	Group By
    CompanyName,
    Year(o.OrderDate)
  Order by CompanyName asc;

Go

Select * from vCustomerOrderCounts

Go

-- Data Request: 0318
-- Request: I want a list of total order dollars our customers have placed each year
/*
  -- Columns
  c.CompanyName
  od.OrderID
  od.Quantity
  od.UnitPrice
  o.OrderDate

  -- Tables
  Northwind.dbo.Customers
  Northwind.dbo.Orders
  Northwind.dbo.[Order Details]

  -- Connections
  ???

  -- Functions
  Year()
  Count() 
  Sum()
  Format()
*/

--Select * from Northwind.dbo.[Order Details]
CREATE View vCustomerOrderDollars
AS 
SELECT TOP 100000000000
  CompanyName,
  [Total Orders] = Format(SUM(UnitPrice * Quantity), 'C', 'en-US'), 
  [Order Year] = Year(o.OrderDate)
	From Northwind.dbo.Customers as c
	Join Northwind.dbo.Orders as o
	 On c.CustomerID = o.CustomerID
  Join Northwind.dbo.[Order Details] as od 
  On od.OrderID = o.OrderID
	Group By
    CompanyName,
    Year(o.OrderDate)
  Order by CompanyName asc;

Go

Select * from vCustomerOrderDollars;

Go