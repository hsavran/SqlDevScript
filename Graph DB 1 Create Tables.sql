use Graphs
DROP TABLE IF EXISTS Graphs.dbo.Products
DROP TABLE IF EXISTS Graphs.dbo.AlikeProduct
DROP TABLE IF EXISTS Graphs.dbo.Users
DROP TABLE IF EXISTS Graphs.dbo.Wished
CREATE TABLE Users(
UserId int PRIMARY KEY identity(1,1),
Name varchar(100) not null
) as NODE

CREATE TABLE Products (
ProductId int PRIMARY KEY Identity(1,1),
Brand varchar(50) not null,
ProductName varchar(200) not null, 
InStock bit not null,
InvoicePrice money not null,
RetailPrice money not null,
Active bit not null,
Rating tinyint not null Default 0
) AS NODE

CREATE TABLE AlikeProduct (
CreatedDt datetime default GetDate()
) AS EDGE
CREATE UNIQUE NONCLUSTERED INDEX Ix_Alike on AlikeProduct($From_Id, $To_Id)

CREATE TABLE Wished (
  CreatedDt datetime not null
) as EDGE

CREATE UNIQUE NONCLUSTERED INDEX Ix_Wished on Wished ($From_id, $To_id)