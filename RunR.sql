--Enable external scripts
--EXEC sp_configure 'external scripts enabled', 1
--RECONFIGURE WITH OVERRIDE
--Launchpad
--EXEC sp_configure 'external scripts enabled'
use WideWorldImporters
EXECUTE sp_execute_external_script
@language =N'R',
@script = N'OutputDataSet <- InputDataSet;
OutputDataSet <- data.frame(sum(OutputDataSet$Orders));',
@input_data_1 = N'Select p.FullName, count(o.OrderId) as Orders
 from Sales.Orders as o 
join Application.People as p on o.SalespersonPersonId = p.PersonId
 group by p.fullname'
 WITH RESULT SETS (([total] int));

--Exec sp_configure 'external scripts enabled', 1; 
--Reconfigure;