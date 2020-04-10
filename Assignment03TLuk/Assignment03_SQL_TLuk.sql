/***********************************************************************************
Title: INFO 330 - Module03: Assignment 03
Desc: Select data based on requests
Dev: Thomas Luk
Changelog: When, Who, What
01/28/2020, Thomas Luk, Created Assignment03 SQL Script
***********************************************************************************/
use Northwind;

GO

/*
-- Data Request: 0301
-- Date: 1/1/2020
-- From: Jane Encharge CEO
-- Request: I want a list of customer companies and their contact people
-- Needed By: ASAP
*/


SELECT
    CompanyName,
    ContactName
FROM dbo.Customers;

/*
-- Data Request: 0302
-- Date: 1/2/2020
-- From: Jane Encharge CEO
-- Request: I want a list of customer companies and their contact people, but only the ones in US and Canada
-- Needed By: ASAP
*/

SELECT
    CompanyName,
    ContactName,
    Country
FROM dbo.Customers WHERE (Country = 'USA') OR (Country = 'Canada');

GO

/*
-- Data Request: 0303
-- Date: 1/2/2020
-- From: Jane Encharge CEO
-- Request: I want a list of products, their standard price and their categories. Order the results by Category Name 
-- and then Product Name, in alphabetical order
-- Needed By: ASAP
*/

SELECT 
    Categories.CategoryName,
    Products.ProductName,
    Format(Products.UnitPrice, 'C', 'en-US') AS 'Standard Price'  
From Products JOIN Categories 
ON Products.CategoryId = Categories.CategoryId;

GO

/*
-- Data Request: 0304
-- Date: 1/3/2020
-- From: Jane Encharge CEO
-- Request: I want a list of how many customers we have in the US
-- Needed By: ASAP
*/

SELECT 
    [Count] = Count(CustomerId),
    Country
 FROM dbo.Customers WHERE Country = 'USA' 
 GROUP BY Country;

Go

/*
-- Data Request: 0305
-- Date: 1/4/2020
-- From: Jane Encharge CEO
-- Request: I want a list of how many customers we have in the US and Canada, with subtotals for each
-- Needed By: ASAP
*/

SELECT 
    [Count] = Count(CustomerId),
    Country
 FROM dbo.Customers WHERE Country = 'USA' OR Country = 'Canada'
 GROUP BY Country;

Go