--**********************************************************************************************--
-- Title: Final Project - Milestone 02
-- Author: Thomas Luk
-- Date: 2019-03-01
-- Desc: This file demonstrates how to design and create; 
--       tables, constraints, views, stored procedures, and permissions
--***********************************************************************************************--

Begin Try
	Use Master;
	If Exists(Select Name From SysDatabases Where Name = 'PatientAppointmentsDB_ThomasLuk')
	 Begin 
	  Alter Database [PatientAppointmentsDB_ThomasLuk] set Single_user With Rollback Immediate;
	  Drop Database PatientAppointmentsDB_ThomasLuk;
	 End
	Create Database PatientAppointmentsDB_ThomasLuk;
End Try
Begin Catch
	Print Error_Number();
End Catch
Go
Use PatientAppointmentsDB_ThomasLuk;

GO

CREATE TABLE Clinics (
	ClinicID INT IDENTITY PRIMARY KEY,
    ClinicName NVARCHAR(100) NOT NULL UNIQUE,
    ClinicPhoneNumber NVARCHAR(100) NOT NULL CHECK (ClinicPhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    ClinicAddress NVARCHAR(100) NOT NULL,
    ClinicCity NVARCHAR(100) NOT NULL,
    ClinicState NVARCHAR(2) NOT NULL,
    ClinicZipCode NVARCHAR(10) NOT NULL CHECK (ClinicZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]')
);

GO

CREATE View vClinics 
    AS
        SELECT
            ClinicID,
            ClinicName,
            ClinicPhoneNumber,
            ClinicAddress,
            ClinicCity,
            ClinicState,
            ClinicZipCode
        FROM Clinics;
GO

Create Proc pInsClinics(
    @ClinicName NVARCHAR(100),
    @ClinicPhoneNumber NVARCHAR(100),
    @ClinicAddress NVARCHAR(100),
    @ClinicCity NVARCHAR(100),
    @ClinicState NVARCHAR(2),
    @ClinicZipCode NVARCHAR(10)
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Clinics (
		    ClinicName,
        ClinicPhoneNumber,
        ClinicAddress,
        ClinicCity,
        ClinicState,
        ClinicZipCode
	  )
    Values (
		    @ClinicName,
        @ClinicPhoneNumber,
        @ClinicAddress,
        @ClinicCity,
        @ClinicState,
        @ClinicZipCode
	  )
    PRINT @@IDENTITY
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

Create Proc pUpdClinics(
    @ClinicID INT,
	@ClinicName NVARCHAR(100),
    @ClinicPhoneNumber NVARCHAR(100),
    @ClinicAddress NVARCHAR(100),
    @ClinicCity NVARCHAR(100),
    @ClinicState NVARCHAR(2),
    @ClinicZipCode NVARCHAR(10)
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Clinics
	  	SET 
		    ClinicName = @ClinicName,
            ClinicPhoneNumber = @ClinicPhoneNumber,
            ClinicAddress = @ClinicAddress,
            ClinicCity = @ClinicCity,
            ClinicState = @ClinicState,
            ClinicZipCode = @ClinicZipCode
		WHERE ClinicID = @ClinicID
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

Create Proc pDelClinics(
    @ClinicID int
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Clinics
      WHERE ClinicID = @ClinicID
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

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY,
    PatientFirstName NVARCHAR(100) NOT NULL,
    PatientLastName NVARCHAR(100) NOT NULL,
    PatientPhoneNumber NVARCHAR(100) NOT NULL CHECK (PatientPhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    PatientAddress NVARCHAR(100) NOT NULL,
    PatientCity NVARCHAR(100) NOT NULL,
    PatientState NVARCHAR(2) NOT NULL,
    PatientZipCode NVARCHAR(10) NOT NULL CHECK (PatientZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]')
);

GO

CREATE VIEW vPatients
    AS
        SELECT 
            PatientID,
            PatientFirstName,
            PatientLastName,
            PatientPhoneNumber,
            PatientAddress,
            PatientCity,
            PatientState,
            PatientZipCode
        FROM Patients;

GO

Create Proc pInsPatients(
    @PatientFirstName NVARCHAR(100),
    @PatientLastName NVARCHAR(100),
    @PatientPhoneNumber NVARCHAR(100),
    @PatientAddress NVARCHAR(100),
    @PatientCity NVARCHAR(100),
    @PatientState NVARCHAR(2),
    @PatientZipCode NVARCHAR(10)
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Patients (
        PatientFirstName,
        PatientLastName,
        PatientPhoneNumber,
        PatientAddress,
        PatientCity,
        PatientState,
        PatientZipCode
	  )
    Values (
        @PatientFirstName,
        @PatientLastName,
        @PatientPhoneNumber,
        @PatientAddress,
        @PatientCity,
        @PatientState,
        @PatientZipCode
	  )
      PRINT @@IDENTITY
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
GO

Create Proc pUpdPatients(
    @PatientID INT,
    @PatientFirstName NVARCHAR(100),
    @PatientLastName NVARCHAR(100),
    @PatientPhoneNumber NVARCHAR(100),
    @PatientAddress NVARCHAR(100),
    @PatientCity NVARCHAR(100),
    @PatientState NVARCHAR(2),
    @PatientZipCode NVARCHAR(10)
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Patients
	  	SET 
            PatientFirstName = @PatientFirstName,
            PatientLastName = @PatientLastName,
            PatientPhoneNumber = @PatientPhoneNumber,
            PatientAddress = @PatientAddress,
            PatientCity = @PatientCity,
            PatientState = @PatientState,
            PatientZipCode = @PatientZipCode
		WHERE PatientID = @PatientID
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
GO

Create Proc pDelPatients(
    @PatientID INT
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Patients
      WHERE PatientID = @PatientID
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
GO

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY,
    DoctorFirstName NVARCHAR(100) NOT NULL,
    DoctorLastName NVARCHAR(100) NOT NULL,
    DoctorPhoneNumber NVARCHAR(100) NOT NULL CHECK (DoctorPhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    DoctorAddress NVARCHAR(100) NOT NULL,
    DoctorCity NVARCHAR(100) NOT NULL,
    DoctorState NVARCHAR(2) NOT NULL,
    DoctorZipCode NVARCHAR(10) NOT NULL CHECK (DoctorZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]')
);

GO

CREATE VIEW vDoctors
    AS
        SELECT 
            DoctorID,
            DoctorFirstName,
            DoctorLastName,
            DoctorPhoneNumber,
            DoctorAddress,
            DoctorCity,
            DoctorState,
            DoctorZipCode
        FROM Doctors;

GO

Create Proc pInsDoctors(
    @DoctorFirstName NVARCHAR(100),
    @DoctorLastName NVARCHAR(100),
    @DoctorPhoneNumber NVARCHAR(100),
    @DoctorAddress NVARCHAR(100),
    @DoctorCity NVARCHAR(100),
    @DoctorState NVARCHAR(2),
    @DoctorZipCode NVARCHAR(10)
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Doctors (
        DoctorFirstName,
        DoctorLastName,
        DoctorPhoneNumber,
        DoctorAddress,
        DoctorCity,
        DoctorState,
        DoctorZipCode
	  )
    Values (
        @DoctorFirstName,
        @DoctorLastName,
        @DoctorPhoneNumber,
        @DoctorAddress,
        @DoctorCity,
        @DoctorState,
        @DoctorZipCode
	  )
      PRINT @@IDENTITY
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
GO

Create Proc pUpdDoctors(
    @DoctorID INT,
    @DoctorFirstName NVARCHAR(100),
    @DoctorLastName NVARCHAR(100),
    @DoctorPhoneNumber NVARCHAR(100),
    @DoctorAddress NVARCHAR(100),
    @DoctorCity NVARCHAR(100),
    @DoctorState NVARCHAR(2),
    @DoctorZipCode NVARCHAR(10)
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Doctors
	  	SET 
            DoctorFirstName = @DoctorFirstName,
            DoctorLastName = @DoctorLastName,
            DoctorPhoneNumber = @DoctorPhoneNumber,
            DoctorAddress = @DoctorAddress,
            DoctorCity = @DoctorCity,
            DoctorState = @DoctorState,
            DoctorZipCode = @DoctorZipCode
		WHERE DoctorID = @DoctorID
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
GO

Create Proc pDelDoctors(
    @DoctorID INT
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Doctors
      WHERE DoctorID = @DoctorID
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
GO

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY,
    AppointmentDateTime	DATETIME NOT NULL,
    AppointmentPatientID INT NOT NULL FOREIGN KEY REFERENCES Patients,
    AppointmentDoctorID	INT NOT NULL FOREIGN KEY REFERENCES Doctors,
    AppointmentClinicID	INT NOT NULL FOREIGN KEY REFERENCES Clinics
);

GO

CREATE VIEW vAppointments
AS
    SELECT 
        AppointmentID,
        AppointmentDateTime,
        AppointmentPatientID,
        AppointmentDoctorID,
        AppointmentClinicID
    FROM Appointments;
GO

Create Proc pInsAppointments(
    @AppointmentDateTime DATETIME,
    @AppointmentPatientID INT,
    @AppointmentDoctorID INT,
    @AppointmentClinicID INT
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Insert Into Appointments (
        AppointmentDateTime,
        AppointmentPatientID,
        AppointmentDoctorID,
        AppointmentClinicID
	  )
    Values (
        @AppointmentDateTime,
        @AppointmentPatientID,
        @AppointmentDoctorID,
        @AppointmentClinicID
	  )
    PRINT @@IDENTITY
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
GO

Create Proc pUpdAppointments(
    @AppointmentID INT,
    @AppointmentDateTime DATETIME,
    @AppointmentPatientID INT,
    @AppointmentDoctorID INT,
    @AppointmentClinicID INT
	)
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      Update Appointments
	  	SET 
            AppointmentDateTime = @AppointmentDateTime,
            AppointmentPatientID = @AppointmentPatientID,
            AppointmentDoctorID = @AppointmentDoctorID,
            AppointmentClinicID = @AppointmentClinicID
		WHERE AppointmentID = @AppointmentID
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
GO

Create Proc pDelAppointments(
    @AppointmentID INT
    )
AS
  BEGIN
    DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRANSACTION
      DELETE FROM Appointments
      WHERE AppointmentID = @AppointmentID
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
GO

CREATE VIEW vAppointmentsByPatientsDoctorsAndClinics
AS
    SELECT 
        a.AppointmentID,
        AppointmentDate = CONVERT(TIME, a.AppointmentDateTime),
        AppointmentTime = CONVERT(DATE, a.AppointmentDateTime),
        p.PatientID,
        PatientName = p.PatientFirstName + ' ' + p.PatientLastName,
        p.PatientPhoneNumber,
        p.PatientAddress,
        p.PatientCity,
        p.PatientState,
        p.PatientZipCode,
        d.DoctorID,
        DoctorName = d.DoctorFirstName + ' ' + d.DoctorLastName,
        d.DoctorPhoneNumber,
        d.DoctorAddress,
        d.DoctorCity,
        d.DoctorState,
        d.DoctorZipCode,
        c.ClinicID,
        c.ClinicName,
        c.ClinicPhoneNumber,
        c.ClinicAddress,
        c.ClinicCity,
        c.ClinicState,
        c.ClinicZipCode
    FROM Appointments AS a 
    JOIN Patients AS p
    ON p.PatientID = a.AppointmentPatientID
    JOIN Doctors AS d 
    ON d.DoctorID = a.AppointmentDoctorID
    JOIN Clinics AS c 
    ON c.ClinicID = a.AppointmentClinicID
GO

DENY SELECT, INSERT, UPDATE, DELETE ON Clinics TO Public;
GRANT SELECT ON vClinics TO Public;
GRANT EXEC ON pInsClinics TO Public;
GRANT EXEC ON pUpdClinics TO Public;
GRANT EXEC ON pDelClinics TO Public;

DENY SELECT, INSERT, UPDATE, DELETE ON Doctors TO Public;
GRANT SELECT ON vDoctors TO Public;
GRANT EXEC ON pInsDoctors TO Public;
GRANT EXEC ON pUpdDoctors TO Public;
GRANT EXEC ON pDelDoctors TO Public;

DENY SELECT, INSERT, UPDATE, DELETE ON Patients TO Public;
GRANT SELECT ON vPatients TO Public;
GRANT EXEC ON pInsPatients TO Public;
GRANT EXEC ON pUpdPatients TO Public;
GRANT EXEC ON pDelPatients TO Public;

DENY SELECT, INSERT, UPDATE, DELETE ON Appointments TO Public;
GRANT SELECT ON vAppointments TO Public;
GRANT EXEC ON pInsAppointments TO Public;
GRANT EXEC ON pUpdAppointments TO Public;
GRANT EXEC ON pDelAppointments TO Public;

GRANT SELECT ON vAppointmentsByPatientsDoctorsAndClinics TO Public;

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pInsClinics 
                @ClinicName = 'Harborview Medical Center',
                @ClinicPhoneNumber = '206-601-1234',
                @ClinicAddress = '123 Main Street',
                @ClinicCity = 'Seattle',
                @ClinicState = 'WA',
                @ClinicZipCode = '98105';
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pInsClinics')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pInsPatients 
                @PatientFirstName = 'Thomas',
                @PatientLastName = 'Luk',
                @PatientPhoneNumber = '206-601-1324',
                @PatientAddress = '123 Mainy Street',
                @PatientCity = 'Seattle',
                @PatientState = 'WA',
                @PatientZipCode = '98105';
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pInsPatients')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pInsDoctors 
                @DoctorFirstName = 'Lewis',
                @DoctorLastName = 'Hamilton',
                @DoctorPhoneNumber = '206-601-1235',
                @DoctorAddress = '123 Not-Main Street',
                @DoctorCity = 'Seattle',
                @DoctorState = 'WA',
                @DoctorZipCode = '98105';
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pInsDoctors')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pInsAppointments
                @AppointmentDateTime = '01/01/98 23:59:59.995',
                @AppointmentPatientID = 1,
                @AppointmentDoctorID = 1,
                @AppointmentClinicID = 1
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pInsAppointments')
    END CATCH;
END

GO

SELECT * FROM vAppointments;
SELECT * FROM vClinics;
SELECT * FROM vDoctors;
SELECT * FROM vPatients;

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pUpdDoctors 
                @DoctorID = 1,
                @DoctorFirstName = 'Max',
                @DoctorLastName = 'Verstappen',
                @DoctorPhoneNumber = '206-601-1235',
                @DoctorAddress = '123 Not-Main Street',
                @DoctorCity = 'Seattle',
                @DoctorState = 'WA',
                @DoctorZipCode = '98105';
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pUpdDoctors')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pUpdPatients
                @PatientID = 1,
                @PatientFirstName = 'Charles',
                @PatientLastName = 'LeClerc',
                @PatientPhoneNumber = '206-601-1324',
                @PatientAddress = '123 Mainy Street',
                @PatientCity = 'Seattle',
                @PatientState = 'WA',
                @PatientZipCode = '98105';
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pUpdPatients')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            EXEC pUpdClinics
                @ClinicID = 1,
                @ClinicName = 'UW Medical Center',
                @ClinicPhoneNumber = '206-601-1234',
                @ClinicAddress = '123 Main Street',
                @ClinicCity = 'Seattle',
                @ClinicState = 'WA',
                @ClinicZipCode = '98105';
      COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pUpdClinics')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
          EXEC pUpdAppointments
                @AppointmentID = 1,
                @AppointmentDateTime = '01/01/20 23:59:59.995',
                @AppointmentPatientID = 1,
                @AppointmentDoctorID = 1,
                @AppointmentClinicID = 1
      COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pUpdAppointments')
    END CATCH;
END

GO

SELECT * FROM vAppointmentsByPatientsDoctorsAndClinics;

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
          EXEC pDelAppointments
           @AppointmentID = 1
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pDelAppointments')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
          EXEC pDelPatients
            @PatientID = 1
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pDelAppointments')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
          EXEC pDelClinics
           @ClinicID = 1
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pDelAppointments')
    END CATCH;
END

GO

BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
          EXEC pDelDoctors
           @DoctorID = 1
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        PRINT ('Something went wrong with pDelAppointments')
    END CATCH;
END

GO

SELECT * FROM vAppointmentsByPatientsDoctorsAndClinics;

GO