SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @tableName NVARCHAR(255) = 'dbo.tableName';

-- See Table Size in MB
SELECT sum(alloc.total_pages/128)
FROM sys.allocation_units AS alloc
INNER JOIN sys.partitions AS part ON alloc.container_id = CASE WHEN alloc.type in(1,3) THEN part.hobt_id ELSE part.partition_id END
LEFT JOIN sys.indexes AS idx ON idx.object_id = part.object_id AND idx.index_id = part.index_id
WHERE part.object_id = object_id(@tableName)

/*
Purpose: Get Table size from Sys.Tables
Author: bdicicco
*/