SET ANSI_NULLS ON;
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- Declare Variables
DECLARE 
	@LoopCount INT = 1,
	@TargetLoopCount INT = 10;
	
-- Create While Loop
WHILE @LoopCount <= @TargetLoopCount
BEGIN
	-- Simple Select Query Here but can do SPROCs/Updates...etc
	SELECT 'While Loop Count: '+ CAST(@LoopCount AS NVARCHAR);

	--Update Counter
	SELECT @LoopCount +=1;

END -- Main While Loop END


/*
Purpose: Simple While Loop Pattern
Author: bdicicco
*/