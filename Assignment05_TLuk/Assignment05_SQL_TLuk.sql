--*************************************************************************--
-- Title: Assignment05
-- Author: Thomas Luk
-- Desc: This file demonstrates how to process data in a database
-- Change Log: When,Who,What
-- 2017-01-01
--**************************************************************************--
-- Step 1: Create the assignment database
Use Master;
go

If Exists(Select Name from SysDatabases Where Name = 'Assignment05DB_ThomasLuk')
 Begin 
  Alter Database [Assignment05DB_ThomasLuk] set Single_user With Rollback Immediate;
  Drop Database Assignment05DB_ThomasLuk;
 End
go

Create Database Assignment05DB_ThomasLuk;
go

Use Assignment05DB_ThomasLuk;
go

-- Create Tables (Module 01)-- 
Create Table Categories
([CategoryID] [int] IDENTITY(1,1) NOT NULL 
,[CategoryName] [nvarchar](100) NOT NULL
);
go

Create Table Products
([ProductID] [int] IDENTITY(1,1) NOT NULL 
,[ProductName] [nvarchar](100) NOT NULL 
,[CategoryID] [int] NULL  
,[UnitPrice] [money] NOT NULL
);
go

Create Table Inventories
([InventoryID] [int] IDENTITY(1,1) NOT NULL
,[InventoryDate] [Date] NOT NULL
,[ProductID] [int] NOT NULL
,[Count] [int] NOT NULL
);
go

-- Add Constraints (Module 02) -- 
Alter Table Categories 
 Add Constraint pkCategories 
  Primary Key (CategoryId);
go

Alter Table Categories 
 Add Constraint ukCategories 
  Unique (CategoryName);
go

Alter Table Products 
 Add Constraint pkProducts 
  Primary Key (ProductId);
go

Alter Table Products 
 Add Constraint ukProducts 
  Unique (ProductName);
go

Alter Table Products 
 Add Constraint fkProductsToCategories 
  Foreign Key (CategoryId) References Categories(CategoryId);
go

Alter Table Products 
 Add Constraint ckProductUnitPriceZeroOrHigher 
  Check (UnitPrice >= 0);
go

Alter Table Inventories 
 Add Constraint pkInventories 
  Primary Key (InventoryId);
go

Alter Table Inventories
 Add Constraint dfInventoryDate
  Default GetDate() For InventoryDate;
go

Alter Table Inventories
 Add Constraint fkInventoriesToProducts
  Foreign Key (ProductId) References Products(ProductId);
go

Alter Table Inventories 
 Add Constraint ckInventoryCountZeroOrHigher 
  Check ([Count] >= 0);
go


-- Show the Current data in the Categories, Products, and Inventories Tables
/*
Select * from Categories;
go
Select * from Products;
go
Select * from Inventories;
go
*/

-- Step 2: Add some starter data to the database
/* Add the following data to this database using inserts:
Category	Product	Price	Date		Count
Beverages	Chai	18.00	2017-01-01	61
Beverages	Chang	19.00	2017-01-01	17
Beverages	Chai	18.00	2017-02-01	13
Beverages	Chang	19.00	2017-02-01	12
Beverages	Chai	18.00	2017-03-02	18
Beverages	Chang	19.00	2017-03-02	12
*/

INSERT INTO dbo.Categories (CategoryName)
VALUES ('Beverages');
GO

INSERT INTO dbo.Products (ProductName, CategoryID, UnitPrice)
VALUES
('Chai', 1, 18.00),
('Chang', 1, 19.00);
GO

INSERT INTO dbo.Inventories (InventoryDate, ProductID, [Count])
VALUES
('2017-01-01', 1, 61),
('2017-01-01', 2, 17),
('2017-02-01', 1, 13),
('2017-02-01', 2, 12),
('2017-03-02', 1, 18),
('2017-03-02', 2, 12);
GO

-- Step 3: Create transactional stored procedures for each table using the proviced template:
Create Proc pInsCategories(@CategoryName nvarchar(100))
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Categories (CategoryName)
      Values (@CategoryName)
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pUpdCategories (@CategoryID int, @CategoryName nvarchar(100))
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
        Update Categories 
        Set CategoryName = CategoryName
        Where CategoryID = @CategoryID
    COMMIT TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pDelCategories (@CategoryID int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
        DELETE 
          FROM Categories
          WHERE CategoryID = @CategoryID
    COMMIT TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pInsProducts(@ProductName nvarchar(100), @CategoryID int, @UnitPrice float)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Products (ProductName, CategoryID, UnitPrice)
      Values (@ProductName, @CategoryID, @UnitPrice)
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pUpdProducts(@ProductID int, @ProductName nvarchar(100), @CategoryID int, @UnitPrice float)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Products 
        SET ProductName = @ProductName,
        CategoryID = @CategoryID,
        UnitPrice = @UnitPrice
      WHERE ProductID = @ProductID
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pDelProducts(@ProductID int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Products
      WHERE ProductID = @ProductID
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pInsInventories(@InventoryDate Date, @ProductID int, @Count int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      INSERT INTO Inventories (InventoryDate, ProductID, [Count])
      VALUES (@InventoryDate, @ProductID, @Count)
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pUpdInventories(@InventoryID int, @InventoryDate Date, @ProductID int, @Count int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Inventories 
        SET InventoryDate = @InventoryDate,
        ProductID = @ProductID,
        [Count] = @Count
      WHERE InventoryID = @InventoryID
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

Create Proc pDelInventories(@InventoryID int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Inventories
      WHERE InventoryID = @InventoryID
    Commit TRAN;
    SET @RC = +1;
    END TRY
    BEGIN CATCH
      IF (@@TRANCOUNT > 0)
        ROLLBACK TRANSACTION
      PRINT Error_Message()
      SET @RC  = -1
    END CATCH
    RETURN @RC;
  END
Go

-- Step 4: Create code to test each transactional stored procedure. 
Exec pInsCategories @CategoryName = 'Cookies';
Go

Exec pUpdCategories @CategoryID = 1, @CategoryName = 'Sweets';
Go

Exec pDelCategories @CategoryID = 2;
Go

Exec pInsProducts @ProductName = 'dog', @CategoryID = 1, @UnitPrice = 18.00;
Go

Exec pUpdProducts @ProductID = 1, @ProductName = 'cat', @CategoryID = 1, @UnitPrice = 18.00;
Go

Exec pDelProducts @ProductID = 3;
Go

pInsInventories @InventoryDate = '2017-01-01', @ProductID = 1, @Count = 20;
Go

pUpdInventories @InventoryID = 1, @InventoryDate = '2017-01-01', @ProductID = 1, @Count = 19;
Go

pDelInventories @InventoryID = 1;
Go

Select * from Categories;
go
Select * from Products;
go
Select * from Inventories;
go