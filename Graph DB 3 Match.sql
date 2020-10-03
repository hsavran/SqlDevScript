use Graphs
 --Find Alike products
SELECT p1.Brand, p1.ProductName, p1.RetailPrice, p2.Brand as AlikeBrand, p2.ProductName as AlikeProduct, p2.RetailPrice as AlikePrice
FROM Products as p1, AlikeProduct as ap, Products p2
WHERE MATCH(p1-(ap)->p2)
AND p1.ProductId = 1

--Find Anna's wishlist and alike products	
select u1.Name, w1.CreatedDt as WishedDt, p1.ProductName as WishedProduct,p2.ProductName as AlikeProduct
FROM Users as u1, Wished w1, Products p1, AlikeProduct a1, Products as p2	 
WHERE MATCH(u1-(w1)->p1<-(a1)-p2)	
--WHERE MATCH(u1-(w1)->p1 AND p1<-(a1)-p2)
AND u1.UserId = 1 



/*select * from sys.all_objects where name = 'Products'
select * from sys.columns where object_id = 779149821
select * from Products
*/