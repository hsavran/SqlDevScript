use WideWorldImporters
ALTER DATABASE SCOPED CONFIGURATION CLEAR PROCEDURE_CACHE;
GO
DROP TABLE IF EXISTS WideWorldImporters.dbo.Summaries
CREATE TABLE Summaries (
	Id int PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 200000),
	Summary nvarchar(max),
	DriverId as CAST(JSON_VALUE(Summary,'$.Events[1].DriverID') as int) PERSISTED,
	INDEX [test] NONCLUSTERED (DriverId)
)
WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY)

ALTER TABLE Summaries ADD CONSTRAINT [Are you JSON] 
CHECK(ISJSON(Summary)=1)

INSERT INTO Summaries
SELECT InvoiceId, ReturnedDeliveryData FROM Sales.Invoices

select * from Summaries where Id = 50

SELECT * FROM Summaries WHERE 
JSON_VALUE(Summary, '$.Events[1].DriverID') = '2'

SELECT * FROM Summaries WHERE 
JSON_VALUE(Summary, '$.Events[1].DriverID') = 2

--SELECT * FROM Summaries where driverid = '2'
SELECT * FROM Summaries where driverid = 2
--sp_spaceused Summaries



