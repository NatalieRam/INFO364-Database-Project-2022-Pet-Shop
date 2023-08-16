SELECT *
FROM Animal_tb
ORDER BY AnimalName DESC; 

SELECT *
FROM Customer_tb; 

SELECT *
FROM SalesItem_tb
WHERE ItemName = 'RedBarn Bully Bites';

SELECT COUNT(AnimalID)
FROM Animal_tb; 

SELECT COUNT(AnimalID), AnimalName
FROM Animal_tb
GROUP BY AnimalName; 

SELECT AVG(ItemPrice)
FROM SalesItem_tb; 

SELECT EmployeeName
FROM Employee_tb
GROUP BY EmployeeName;

SELECT OrderID
FROM AnimalOrder_tb
ORDER BY OrderID ASC, Employee_ID DESC; 

SELECT MIN(ItemPrice) AS SmallestPrice
FROM SalesItem_tb; 

SELECT COUNT(AnimalID), AnimalType
FROM Animal_tb
GROUP BY AnimalType
HAVING COUNT(AnimalID) < 10 ;

SELECT * FROM AnimalOrder_tb
ORDER BY OrderID ASC;



SELECT Animal_tb.AnimalID, Customer_tb.CustomerName
FROM Animal_tb
INNER JOIN  Customer_tb ON Animal_tb.Customer_ID = Customer_tb.Customer_ID;

SELECT Employee_tb.EmployeeName, AnimalOrder_tb.OrderID
FROM Employee_tb
LEFT JOIN AnimalOrder_tb
ON Employee_tb.AnimalID=AnimalOrder_tb.AnimalID
ORDER BY Employee_tb.EmployeeName; 

SELECT MerchandiseOrder_tb.MerchandiseCost, Sale_tb.SalePrice
FROM MerchandiseOrder_tb
INNER JOIN Sale_tb ON MerchandiseOrder_tb.SalePrice = Sale_tb.SalePrice;

SELECT SalesItem_tb.ItemID, Inventory_tb.ProductLeft
FROM SalesItem.tb
RIGHT JOIN  Inventory_tb
ON SalesItem_tb.ProductLeft = Inventory_tb.ProductLeft
ORDER BY SalesItem_tb.ItemProductLeft;

SELECT AnimalOrder_tb.AnimalCost, Customer_tb.CustomerName
FROM AnimalOrder_tb
RIGHT JOIN Customer_tb
ON Animal_tb.CustomerOrder = Customer_tb.CustomerOrder
ORDER BY AnimalOrder_tb.AnimalCost; 

SELECT Sale_tb.SaleStatus, SalesItem_tb.ItemName
FROM Sale_tb
LEFT JOIN SalesItem_tb
ON Sale_tb.SaleName=SalesItem_tb.SaleName
ORDER BY Sale_tb.SaleStatus; 

SELECT SalesItem_tb.SalePrice, Customer_tb.CustomerName
FROM SalesItem_tb
INNER JOIN Customer_tb ON SalesItem_tb.CustomerPrice = Customer_tb.CustomerPrice; 

SELECT Animal_tb.AnimalDescription, Employee_tb.EmployeeName
FROM Animal_tb
INNER JOIN Employee_tb ON Animal_tb.EmployeeDescription = Employee_tb.EmployeeDescription;

SELECT Inventory_tb.ItemdDescription, Customer_tb.CustomerAddress
FROM Inventory_tb
INNER JOIN Customer_tb ON Inventory_tb.CustomerDescription = Customer_tb.CustomerDescription;

SELECT Employee_tb.EmployeeContact, Sale_tb.SaleStatus
FROM Employee.tb
INNER JOIN Sale_tb ON Sale_tb.SaleContact = Employee_tb.SaleContact; 


