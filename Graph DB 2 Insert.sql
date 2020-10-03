use Graphs
INSERT INTO Products (Brand, ProductName, InStock, InvoicePrice, RetailPrice, Active, Rating) VALUES 
('Amazon','Kindle Fire 7',1,30,49,1,4),
('Amazon','Kindle Fire HD 8',1,50,79,1,5),
('Amazon','Kindle Fire 7 Kids',1,55,99,1,4),
('Amazon','Kindle PaperWhite',1,87,120,1,4),
('Amazon','Kindle Fire HD 10',1,99,149,1,5),
('Amazon','Kindle Fire HD 8 Kids',1,87,129,1,5),
('Apple','iPad 2',1,90,140,1,3),
('Apple','iPad Mini',1,80,130,1,4),('Apple','ipad 3',1,130,190,1,4)

INSERT INTO Users (Name) 
VALUES ('Anna'),('John'),('Bob'),('Bob'),('Bridgette'),('George'),('Steve'),('Joe'),
('Thomas'),('Katie'),('Alec'),('Avery')
--SELECT * FROM Products
--{"type":"node","schema":"dbo","table":"Products","id":0}
--Product x is like Product y
INSERT INTO AlikeProduct VALUES(	
	(SELECT $node_id FROM Products WHERE ProductId = 1),
	(SELECT $node_id FROM Products WHERE ProductId = 2), GetDate()	),
(
	(SELECT $node_id FROM Products WHERE ProductId = 2),
	(SELECT $node_id FROM Products WHERE ProductId = 6), GetDate()	),
(
	(SELECT $node_id FROM Products WHERE ProductId = 7),
	(SELECT $node_id FROM Products WHERE ProductId = 8), GetDate()	),
(
	(SELECT $node_id FROM Products WHERE ProductId = 7),
	(SELECT $node_id FROM Products WHERE ProductId = 9), GetDate()	
);
-- User x wishes to have Product y on date z
INSERT INTO Wished VALUES(
	(SELECT $node_id FROM Users WHERE UserId = 1),
	(SELECT $node_id FROM Products WHERE ProductId = 9), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 1),
	(SELECT $node_id FROM Products WHERE ProductId = 2), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 2),
	(SELECT $node_id FROM Products WHERE ProductId = 8), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 3),
	(SELECT $node_id FROM Products WHERE ProductId = 7), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 4),
	(SELECT $node_id FROM Products WHERE ProductId = 6), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 5),
	(SELECT $node_id FROM Products WHERE ProductId = 5), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 6),
	(SELECT $node_id FROM Products WHERE ProductId = 4), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 7),
	(SELECT $node_id FROM Products WHERE ProductId = 3), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 8),
	(SELECT $node_id FROM Products WHERE ProductId = 2), GetDate()	),
(
	(SELECT $node_id FROM Users WHERE UserId = 9),
	(SELECT $node_id FROM Products WHERE ProductId = 1), GetDate()
);