USE [TempGen]; --Change your database before run
GO
/*
=============================================================================
    Script Name  : AddAuditFieldsToAllTables.sql
    Description  : 
        This script loops through every base table in the specified database
        and adds the following standard audit columns if they do not already exist:
            - CreatedBy   (varchar(50), NULL)
            - CreatedOn   (datetime, NULL)
            - CreatedIP   (varchar(50), NULL)
            - ModifiedBy  (varchar(50), NULL)
            - ModifiedOn  (datetime, NULL)
            - ModifiedIP  (varchar(50), NULL)

    Usage        :
        1. Change 'YourDB' in the USE statement to your target database name.
        2. Run the entire script in SQL Server Management Studio as a privileged user.
        3. The script will iterate through all base tables and execute an ALTER TABLE
           command to add any missing audit columns.

    Notes        :
        - Always backup your database before running schema-changing scripts.
        - This script does not check for the existence of these columns; 
          to make it idempotent, add column-existence checks before the ALTER commands.
        - For large databases, execution time may vary.
        - Run as a database owner (dbo) or equivalent privileges.

    Last Updated : [10-30-2025]
    Author       : [Taise Lawrence/Cochiken]

=============================================================================
*/

DECLARE @TableName NVARCHAR(128)
DECLARE @TableSchema NVARCHAR(128)
DECLARE @SQL NVARCHAR(MAX)

DECLARE cur CURSOR FOR
  SELECT TABLE_SCHEMA, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_TYPE = 'BASE TABLE'

OPEN cur
FETCH NEXT FROM cur INTO @TableSchema, @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'ALTER TABLE [' + @TableSchema + '].[' + @TableName + '] ' +
        'ADD ' +
        '[CreatedBy] VARCHAR(50) NULL, ' +
        '[CreatedOn] DATETIME NULL, ' +
        '[CreatedIP] VARCHAR(50) NULL, ' +
        '[ModifiedBy] VARCHAR(50) NULL, ' +
        '[ModifiedOn] DATETIME NULL, ' +
        '[ModifiedIP] VARCHAR(50) NULL'
    -- You might want to check if the column already exists before adding

    EXEC sp_executesql @SQL

    FETCH NEXT FROM cur INTO @TableSchema, @TableName
END

CLOSE cur
DEALLOCATE cur
GO


--USE YourDB
--GO

--SELECT TABLE_NAME 
--FROM YourDB.INFORMATION_SCHEMA.TABLES 
--WHERE TABLE_TYPE = 'BASE TABLE'

----loop to add these fields to all tables
--ALTER TABLE [dbo].TemplateItem

--	ADD  
--	 [CreatedBy] [varchar](50) NULL,
--	 [CreatedOn] [datetime] NULL,
--	 [CreatedIP] [varchar](50) NULL,
--	 [ModifiedBy] [varchar](50) NULL,
--	 [ModifiedOn] [datetime] NULL,
--	 [ModifiedIP] [varchar](50) NULL;


