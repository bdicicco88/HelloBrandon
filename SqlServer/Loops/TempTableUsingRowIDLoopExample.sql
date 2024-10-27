SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;


-- Create Temp Table
IF OBJECT_ID(N'tempdb..#EmployeeList') IS NULL
BEGIN
CREATE TABLE #EmployeeList
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    MemberID BIGINT,
  	MemberName  NVARCHAR(255)
)WITH (DATA_COMPRESSION=PAGE);

END

-- Add Records 
INSERT INTO #EmployeeList (memberID, MemberName)
VALUES 
    (10001, 'Peter Gibbons'),
    (10001, 'Michael Bolton'),
    (10003, 'Samir Nagheenanajar'),
    (10004, 'Milton Waddams');

-- Setup Variables
DECLARE 
	@memberID BIGINT, 
	@memberName NVARCHAR(255);
	@CurrID INT = 1,
	@RowCnt INT = 1;

SELECT @RowCnt = COUNT(0)
FROM #EmployeeList;

IF @RowCnt >= 1
BEGIN
	WHILE @CurrID <= @RowCnt
	BEGIN
		SELECT @Category = Category , @ConfigSettingName = ConfigSettingName, @SettingValue = SettingValue
		FROM #EmployeeList
		WHERE id = @CurrID;
		
		SELECT @memberName + ' has a case of the Mondays';
		
		SELECT @CurrID = @CurrID + 1;
	END;
END;

-- Loop Through Table and Delete when Processed
WHILE EXISTS (SELECT 1 FROM #EmployeeList)
    BEGIN
        SELECT TOP 1 @memberID=MemberID, @memberName=MemberName
        FROM #EmployeeList;

		
          
        -- Delete From Table
        DELETE FROM #EmployeeList
        WHERE MemberID = @memberID
        AND memberName = @memberName;
    END;

-- Clean Up Temp Table;
DROP TABLE #EmployeeList;

/*
Purpose: Simple Loop Pattern Using Temp Table, Loops through and deletes rows when processing
Author: bdicicco
*/

