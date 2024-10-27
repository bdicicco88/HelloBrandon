SET ANSI_NULLS ON;
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

--Check if Table is Already Created
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Drivers]') AND type in (N'U'))
BEGIN
	-- Table does not exsits so lets Create it!
	-- Create Drivers Table
	CREATE TABLE Drivers (
		DriverID INT PRIMARY KEY IDENTITY(1,1),           -- Unique identifier for each driver
		FirstName NVARCHAR(50) NOT NULL,                  -- Driver's first name
		LastName NVARCHAR(50) NOT NULL,                   -- Driver's last name
		Team NVARCHAR(100) NOT NULL,                      -- Driver's team name
		Country NVARCHAR(50) NOT NULL,                    -- Driver'scountry
		Active BIT DEFAULT 1                              -- Driver status: active or inactive
	);
END;

-- Insert Some Test Data
INSERT INTO dbo.Drivers 
	(FirstName, LastName, Team, Country, Active)
VALUES 
	('Lewis', 'Hamilton', 'Mercedes', 'United Kingdom', 1),
	('Max', 'Verstappen', 'Red Bull Racing', 'Netherlands', 1),
	('Charles', 'Leclerc', 'Ferrari', 'Monaco', 1),
	('Fernando', 'Alonso', 'Aston Martin', 'Spain', 1),
	('Sebastian', 'Vettel', 'Aston Martin', 'Germany', 0);

-- Select the Results
SELECT * FROM dbo.Drivers;

/*
Purpose: Create Table Example
Author: bdicicco
*/
