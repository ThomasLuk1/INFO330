--**********************************************************************************************--
-- Title: Assigment06 - Midterm
-- Author: Thomas Luk
-- Desc: This file demonstrates how to design and create; 
--       tables, constraints, views, stored procedures, and permissions
-- Change Log: When,Who,What
-- 2019-02-17,YourNameHere,Created File
--***********************************************************************************************--
Begin Try
	Use Master;
	If Exists(Select Name From SysDatabases Where Name = 'Assignment06DB_ThomasLuk')
	 Begin 
	  Alter Database [Assignment06DB_ThomasLuk] set Single_user With Rollback Immediate;
	  Drop Database Assignment06DB_ThomasLuk;
	 End
	Create Database Assignment06DB_ThomasLuk;
End Try
Begin Catch
	Print Error_Number();
End Catch
go
Use Assignment06DB_ThomasLuk;

-- Create Tables (Module 01)-- 
-- Add Constraints (Module 02) -- 
GO

CREATE TABLE Students(
	StudentID INT PRIMARY KEY NOT NULL,
 	StudentNumber NVARCHAR(100) NOT NULL UNIQUE,
 	StudentFirstName NVARCHAR(100) NOT NULL, 
 	StudentLastName NVARCHAR(100) NOT NULL,
 	StudentEmail NVARCHAR(100) NOT NULL UNIQUE,
 	StudentPhone NVARCHAR(100) NULL,
 	StudentAddress1 NVARCHAR(100) NOT NULL,
 	StudentAddress2 NVARCHAR(100) NULL,
 	StudentCity NVARCHAR(100) NOT NULL,
 	StudentStateCode NVARCHAR(100) NOT NULL,
 	StudentZipCode NVARCHAR(100) NOT NULL, 
	CONSTRAINT StudentChecks CHECK (StudentPhone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
	AND (StudentZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]' OR StudentZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
);

GO

CREATE TABLE Courses(
	CourseID INT PRIMARY KEY NOT NULL,
 	CourseName NVARCHAR(100) NOT NULL UNIQUE,
 	CourseStartDate DATE NULL,
 	CourseEndDate DATE NULL,
 	CourseStartTime TIME NULL,
 	CourseEndTime TIME NULL,
 	CourseWeekDays NVARCHAR(100) NULL,
 	CourseCurrentPrice MONEY NULL,
	CONSTRAINT CoursesChecks CHECK (CourseEndDate > CourseStartDate AND CourseEndTime > CourseStartTime)
);

GO

CREATE FUNCTION checkStartDate(@CourseID INT, @EnrollmentDateTime DATETIME) 
RETURNS VARCHAR(5)
AS 
BEGIN
	IF EXISTS (SELECT CourseStartDate FROM Courses WHERE CourseID = @CourseID AND @EnrollmentDateTime < CourseStartDate)
		Return 'true'
	RETURN 'false'
END

Go

CREATE TABLE Enrollments(
	EnrollmentID INT PRIMARY KEY NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
	CourseID INT FOREIGN KEY REFERENCES Courses(CourseID) NOT NULL,
	EnrollmentDateTime DATETIME NOT NULL DEFAULT GETDATE(),
	EnrollmentPrice	MONEY NOT NULL,
	CONSTRAINT EnrollmentsChecks CHECK (dbo.checkStartDate(CourseID, EnrollmentDateTime) = 'true')
	
);

GO

-- Add Views (Module 03 and 04) -- 
CREATE VIEW vStudents
	AS 
		SELECT 
			StudentID,
			StudentNumber,
 			StudentFirstName,
 			StudentLastName,
 			StudentEmail,
 			StudentPhone,
 			StudentAddress1,
 			StudentAddress2,
 			StudentCity,
 			StudentStateCode,
 			StudentZipCode
		FROM Students
GO

CREATE VIEW vCourses
	AS 
		SELECT 
			CourseID,
			CourseName,
			CourseStartDate,
			CourseEndDate,
			CourseStartTime,
			CourseEndTime,
			CourseWeekDays,
			CourseCurrentPrice

		FROM Courses
GO

CREATE VIEW vEnrollments
	AS 
		SELECT 
				EnrollmentID,
				StudentID,
				CourseID,
				EnrollmentDateTime,
				EnrollmentPrice
		FROM Enrollments
GO

CREATE VIEW vAll
	AS 
		SELECT 
				e.EnrollmentID,
				e.StudentID,
				e.CourseID,
				e.EnrollmentDateTime,
				e.EnrollmentPrice,
				s.StudentNumber,
 				s.StudentFirstName,
 				s.StudentLastName,
 				s.StudentEmail,
 				s.StudentPhone,
 				s.StudentAddress1,
 				s.StudentAddress2,
 				s.StudentCity,
 				s.StudentStateCode,
 				s.StudentZipCode,
				c.CourseName,
				c.CourseStartDate,
				c.CourseEndDate,
				c.CourseStartTime,
				c.CourseEndTime,
				c.CourseWeekDays,
				c.CourseCurrentPrice
		FROM Enrollments AS e 
		JOIN Students AS s
		ON e.StudentID = s.StudentID
		JOIN Courses AS c
		ON e.CourseID = c.CourseID
GO

-- Add Stored Procedures (Module 04 and 05) --
Create Proc pInsStudents(
	@StudentID INT, 
	@StudentNumber NVARCHAR(100),
 	@StudentFirstName NVARCHAR(100), 
 	@StudentLastName NVARCHAR(100),
 	@StudentEmail NVARCHAR(100),
 	@StudentPhone NVARCHAR(100),
 	@StudentAddress1 NVARCHAR(100),
 	@StudentAddress2 NVARCHAR(100),
 	@StudentCity NVARCHAR(100),
 	@StudentStateCode NVARCHAR(100),
 	@StudentZipCode NVARCHAR(100)
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Students (
		StudentID,
		StudentNumber,
 		StudentFirstName,
 		StudentLastName,
 		StudentEmail,
		StudentPhone,
 		StudentAddress1,
 		StudentAddress2,
		StudentCity,
 		StudentStateCode,
 		StudentZipCode
	  )
    Values (
		@StudentID,
		@StudentNumber,
		@StudentFirstName, 
		@StudentLastName,
		@StudentEmail,
		@StudentPhone,
		@StudentAddress1,
		@StudentAddress2,
		@StudentCity,
		@StudentStateCode,
		@StudentZipCode 
	  )
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

Create Proc pUpdStudents(
	@StudentID INT, 
	@StudentNumber NVARCHAR(100),
 	@StudentFirstName NVARCHAR(100), 
 	@StudentLastName NVARCHAR(100),
 	@StudentEmail NVARCHAR(100),
 	@StudentPhone NVARCHAR(100),
 	@StudentAddress1 NVARCHAR(100),
 	@StudentAddress2 NVARCHAR(100),
 	@StudentCity NVARCHAR(100),
 	@StudentStateCode NVARCHAR(100),
 	@StudentZipCode NVARCHAR(100)
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Students
	  	SET 
		StudentNumber = @StudentNumber,
 		StudentFirstName = @StudentFirstName,
 		StudentLastName = @StudentLastName,
 		StudentEmail = @StudentEmail,
		StudentPhone = @StudentPhone,
 		StudentAddress1 = @StudentAddress1,
 		StudentAddress2 = @StudentAddress2,
		StudentCity = @StudentCity,
 		StudentStateCode = @StudentStateCode,
 		StudentZipCode = @StudentZipCode
		WHERE StudentID = @StudentID
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

Create Proc pDelStudents(@StudentID int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Students
      WHERE StudentID = @StudentID
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

Create Proc pInsEnrollments(
	@EnrollmentID INT,
	@StudentID INT,
	@CourseID INT,
	@EnrollmentDateTime DATETIME,
	@EnrollmentPrice MONEY
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Enrollments (
		EnrollmentID,
		StudentID,
		CourseID,
		EnrollmentDateTime,
		EnrollmentPrice
	  )
    Values (
		@EnrollmentID,
		@StudentID,
		@CourseID,
		@EnrollmentDateTime,
		@EnrollmentPrice
	  )
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

Create Proc pUpdEnrollments(
	@EnrollmentID INT,
	@StudentID INT,
	@CourseID INT,
	@EnrollmentDateTime DATETIME,
	@EnrollmentPrice MONEY
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Enrollments
	  	SET 
			StudentID = @StudentID,
			CourseID = @CourseID,
			EnrollmentDateTime = @EnrollmentDateTime,
			EnrollmentPrice = @EnrollmentPrice
		WHERE EnrollmentID = @EnrollmentID
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

Create Proc pDelEnrollments(@EnrollmentID int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Enrollments
      WHERE EnrollmentID = @EnrollmentID
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

Create Proc pInsCourses(
	@CourseID INT,
 	@CourseName NVARCHAR(100),
 	@CourseStartDate DATE,
 	@CourseEndDate DATE,
 	@CourseStartTime TIME,
 	@CourseEndTime TIME,
 	@CourseWeekDays NVARCHAR(100),
 	@CourseCurrentPrice MONEY
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Courses (
		CourseID,
 		CourseName,
 		CourseStartDate,
 		CourseEndDate,
 		CourseStartTime,
 		CourseEndTime,
 		CourseWeekDays,
 		CourseCurrentPrice
	  )
    Values (
		@CourseID,
 		@CourseName,
 		@CourseStartDate,
 		@CourseEndDate,
 		@CourseStartTime,
 		@CourseEndTime,
 		@CourseWeekDays,
 		@CourseCurrentPrice
	  )
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

Create Proc pUpdCourses(
	@CourseID INT,
 	@CourseName NVARCHAR(100),
 	@CourseStartDate DATE,
 	@CourseEndDate DATE,
 	@CourseStartTime TIME,
 	@CourseEndTime TIME,
 	@CourseWeekDays NVARCHAR(100),
 	@CourseCurrentPrice MONEY
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Courses
	  	SET 
 			CourseName = @CourseName,
 			CourseStartDate = @CourseStartDate,
 			CourseEndDate = @CourseEndDate,
 			CourseStartTime = @CourseStartTime,
 			CourseEndTime = @CourseEndTime,
 			CourseWeekDays = @CourseWeekDays,
 			CourseCurrentPrice = @CourseCurrentPrice
		WHERE CourseID = @CourseID
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

Create Proc pDelCourses(@CourseID int)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Courses
      WHERE CourseID = @CourseID
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

-- Set Permissions (Module 06) --
DENY SELECT, INSERT, UPDATE, DELETE ON Enrollments TO Public;
DENY SELECT, INSERT, UPDATE, DELETE ON Students TO Public;
DENY SELECT, INSERT, UPDATE, DELETE ON Courses TO Public;
GRANT SELECT ON vEnrollments TO Public;
GRANT SELECT ON vStudents TO Public;
GRANT SELECT ON vCourses TO Public;
GRANT SELECT ON vAll TO Public;
GRANT EXEC ON pInsEnrollments TO Public;
GRANT EXEC ON pUpdEnrollments TO Public;
GRANT EXEC ON pDelEnrollments TO Public;
GRANT EXEC ON pInsStudents TO Public;
GRANT EXEC ON pUpdStudents TO Public;
GRANT EXEC ON pDelStudents TO Public;
GRANT EXEC ON pInsCourses TO Public;
GRANT EXEC ON pUpdCourses TO Public;
GRANT EXEC ON pDelCourses TO Public;

--< Test Views and Sprocs >-- 

EXEC pInsCourses
	@CourseID = 1,
 	@CourseName  = 'SQL1 - Winter 2017',
 	@CourseStartDate = '1/10/2017 ',
 	@CourseEndDate = '1/24/2017 ',
 	@CourseStartTime = '6PM',
 	@CourseEndTime = '8:50PM',
 	@CourseWeekDays = 'T',
 	@CourseCurrentPrice = '399';
GO

EXEC pInsStudents
	@StudentID = 1, 
	@StudentNumber = 'B-Smith-071',
 	@StudentFirstName = 'Bob', 
 	@StudentLastName = 'Smith',
 	@StudentEmail = 'Bsmith@HipMail.com',
 	@StudentPhone =  '206-111-2222',
 	@StudentAddress1 = '123 Main St.',
 	@StudentAddress2 = 'APT 28',
 	@StudentCity = 'Seattle',
 	@StudentStateCode = 'WA',
 	@StudentZipCode = '98105';
GO

EXEC pInsEnrollments
	@EnrollmentID = 1,
	@StudentID = 1,
	@CourseID = 1,
	@EnrollmentDateTime = '1/3/17',
	@EnrollmentPrice = '399';
GO


EXEC pUpdCourses
	@CourseID = 1,
 	@CourseName  = 'SQL1 - Winter 2017',
 	@CourseStartDate = '1/10/2017 ',
 	@CourseEndDate = '1/24/2017 ',
 	@CourseStartTime = '6PM',
 	@CourseEndTime = '8:50PM',
 	@CourseWeekDays = 'Th',
 	@CourseCurrentPrice = '399';
GO

EXEC pUpdStudents 
	@StudentID = 1, 
	@StudentNumber = 'B-Smith-071',
 	@StudentFirstName = 'Bob', 
 	@StudentLastName = 'Smith',
 	@StudentEmail = 'Bsmith@HipMail.com',
 	@StudentPhone =  '206-111-2222',
 	@StudentAddress1 = '123 Main St.',
 	@StudentAddress2 = 'APT 46',
 	@StudentCity = 'Seattle',
 	@StudentStateCode = 'WA',
 	@StudentZipCode = '98105';
GO

EXEC pUpdEnrollments
	@EnrollmentID = 1,
	@StudentID = 1,
	@CourseID = 1,
	@EnrollmentDateTime = '1/4/17',
	@EnrollmentPrice = '399';
GO

EXEC pDelEnrollments @EnrollmentID = 1;
GO

EXEC pDelCourses @CourseID = 1;
GO

EXEC pDelStudents @StudentID = 1;
GO

EXEC pInsCourses
	@CourseID = 1,
 	@CourseName  = 'SQL1 - Winter 2017',
 	@CourseStartDate = '1/10/2017 ',
 	@CourseEndDate = '1/24/2017 ',
 	@CourseStartTime = '6PM',
 	@CourseEndTime = '8:50PM',
 	@CourseWeekDays = 'T',
 	@CourseCurrentPrice = '399';
GO

EXEC pInsStudents
	@StudentID = 1, 
	@StudentNumber = 'B-Smith-071',
 	@StudentFirstName = 'Bob', 
 	@StudentLastName = 'Smith',
 	@StudentEmail = 'Bsmith@HipMail.com',
 	@StudentPhone =  '206-111-2222',
 	@StudentAddress1 = '123 Main St.',
 	@StudentAddress2 = 'APT 28',
 	@StudentCity = 'Seattle',
 	@StudentStateCode = 'WA',
 	@StudentZipCode = '98001';
GO

EXEC pInsEnrollments
	@EnrollmentID = 1,
	@StudentID = 1,
	@CourseID = 1,
	@EnrollmentDateTime = '1/3/17',
	@EnrollmentPrice = '399';
GO

EXEC pInsStudents
	@StudentID = 2, 
	@StudentNumber = 'S-Jones-003',
 	@StudentFirstName = 'Sue', 
 	@StudentLastName = 'Jones',
 	@StudentEmail = 'SueJones@YaYou.com',
 	@StudentPhone =  '206-231-4231',
 	@StudentAddress1 = '333 1st Ave.',
 	@StudentAddress2 = 'APT 28',
 	@StudentCity = 'Seattle',
 	@StudentStateCode = 'WA',
 	@StudentZipCode = '98001';
GO

EXEC pInsEnrollments
	@EnrollmentID = 2,
	@StudentID = 2,
	@CourseID = 1,
	@EnrollmentDateTime = '12/14/16',
	@EnrollmentPrice = '349';
GO

EXEC pInsCourses
	@CourseID = 2,
 	@CourseName  = 'SQL2 - Winter 2017',
 	@CourseStartDate = '1/31/2017 ',
 	@CourseEndDate = '2/14/2017 ',
 	@CourseStartTime = '6PM',
 	@CourseEndTime = '8:50PM',
 	@CourseWeekDays = 'T',
 	@CourseCurrentPrice = '399';
GO


EXEC pInsEnrollments
	@EnrollmentID = 3,
	@StudentID = 2,
	@CourseID = 2,
	@EnrollmentDateTime = '12/14/16',
	@EnrollmentPrice = '349';
GO

EXEC pInsEnrollments
	@EnrollmentID = 4,
	@StudentID = 1,
	@CourseID = 2,
	@EnrollmentDateTime = '1/12/2017',
	@EnrollmentPrice = '349';
GO


SELECT * FROM vStudents;
SELECT * FROM vEnrollments;
SELECT * FROM vCourses;
SELECT * FROM vAll;

--{ IMPORTANT }--
-- To get full credit, your script must run without having to highlight individual statements!!!  
/**************************************************************************************************/