ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';

DROP TABLE Customer_tb; 
DROP TABLE Employee_tb; 
DROP TABLE Animal_tb; 
DROP TABLE AnimalOrder_tb;  
DROP TABLE MerchandiseOrder; 
DROP TABLE Sale_tb; 
DROP TABLE SalesItem_tb; 
DROP TABLE Inventory_tb; 

CREATE TABLE Customer_tb
(
    CustomerID NUMBER (11,0),
    CustomerName VARCHAR(25),
    CustomerAddress VARCHAR(25),
    CustomerPhone NUMBER (11,0),
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID)
); 

CREATE TABLE Animal_tb
( 
    AnimalID NUMBER (11,0), 
    AnimalName VARCHAR(25), 
    AnimalType VARCHAR(25),
    AnimalCost NUMBER(11,0),
CONSTRAINT Animal_PK PRIMARY KEY (AnimalID)
); 

CREATE TABLE Employee_tb
(
    Employee_ID NUMBER(11,0), 
    EmployeeName VARCHAR(25), 
    EmployeeContact NUMBER(11,0), 
    EmployeeAddress VARCHAR(25), 
    DateHired DATE,
    DateReleased DATE,
CONSTRAINT Employee_PK PRIMARY KEY (Employee_ID)
); 

CREATE TABLE SalesItem_tb
(
    ItemID NUMBER(11,0), 
    ItemDescription VARCHAR(25), 
    ItemName VARCHAR(25), 
    ItemPrice NUMBER(11,0),
CONSTRAINT Item_PK PRIMARY KEY(ItemID)
); 

CREATE TABLE Sale_tb
(
    SaleID NUMBER(11,0), 
    SaleStatus VARCHAR(25), 
    Employee_ID NUMBER(11,0), 
    CustomerID NUMBER(11,0), 
    SalePrice NUMBER(11,0), 
CONSTRAINT Sale_PK PRIMARY KEY (SaleID), 
CONSTRAINT Customer_FK FOREIGN KEY (CustomerID) REFERENCES Customer_tb (CustomerID)
); 
 

CREATE TABLE Inventory_tb
( 
    StockID NUMBER(11,0),
    ItemID NUMBER(11,0),
    AnimalID NUMBER(11,0),
    ProductLeft VARCHAR(25),
CONSTRAINT Inventory_PK PRIMARY KEY(StockID),
CONSTRAINT Item_FK FOREIGN KEY(ItemID) REFERENCES SaleItem_tb(ItemID),
CONSTRAINT Animal_FK FOREIGN KEY(AnimalName) REFERENCES Animal_tb(AnimalName)
);

CREATE TABLE MerchandiseOrder_tb
(
    SupplierID NUMBER(11,0), 
    SupplierContact NUMBER(11,0), 
    OrderDate DATE,
    ReceiveDate DATE, 
    StockID NUMBER(11,0),
    MerchandiseCost NUMBER(11,0),
    ShippingCost NUMBER(11,0),
CONSTRAINT Supplier_PK PRIMARY KEY (SupplierID),
CONSTRAINT Stock_FK FOREIGN KEY (StockID) REFERENCES Inventory_tb(StockID)
); 

CREATE TABLE AnimalOrder_tb
( 
   OrderID NUMBER(11,0),
   Order_Date DATE, 
   Receive_Date DATE,  
   Price NUMBER(11,0),
   ShippingCost NUMBER(11,0), 
   SupplierID NUMBER(11,0), 
   Employee_ID NUMBER(11,0),
   TotalAmount NUMBER(11,0),
CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Employee_FK FOREIGN KEY (Employee_ID) REFERENCES Employee_tb(Employee_ID),
CONSTRAINT Supplier_FK FOREIGN KEY (SupplierID) REFERENCES MerchandiseOrder_tb(SupplierID)
); 


INSERT INTO Customer_tb (CustomerID, CustomerName, CustomerAddress, CustomerPhone)
VALUES (90, '1355 S. Himes Blvd','Nicole Roberts', 7576514355); 

INSERT INTO Customer_tb (CustomerID, CustomerName, CustomerAddress, CustomerPhone)
VALUES (122, '1764 S. Himes Blvd','Emma Dewey', 7572414396); 

INSERT INTO Employee_tb(Employee_ID, EmployeeName, EmployeeContact, EmployeeAddress, DateHired, DateReleased)
VALUES (82,'Lauren Johnson', 7578662018, '1281 S. Himes Blvd',('14-05-2015' , '11-08-2025'));

INSERT INTO Employee_tb(Employee_ID, EmployeeName, EmployeeContact, EmployeeAddress, DateHired, DateReleased)
VALUES (80,'John Steel', 7574369187, '1321 S. Himes Blvd', '03-14-2012', '01-11-2022');

INSERT INTO Animal_tb(AnimalID, AnimalName, AnimalType, AnimalCost)
VALUES (042018, 'Noah', 'JackRussell Mix', 50.00); 

INSERT INTO Animal_tb(AnimalID, AnimalName, AnimalType, AnimalCost)
VALUES (042019, 'Ginger', 'Chihuahua Mix', 30.00); 

INSERT INTO Animal_tb(AnimalID, AnimalName, AnimalType, AnimalCost)
VALUES (042020, 'Willy', 'German Sheperd Mix', 20.00); 

INSERT INTO AnimalOrder_tb (OrderID, Order_Date, Receive_Date, Price, ShippingCost, Employee_ID)
VALUES (11249, '04-18-2022', '04-22-2022', 10.25, 4.99, 80); 

INSERT INTO AnimalOrder_tb (OrderID, Order_Date, Receive_Date, Price, ShippingCost, Employee_ID)
VALUES (10248, '05-18-2022', '05-22-2022', 3.46, 4.99, 82); 

INSERT INTO MerchandiseOrder_tb (SupplierID, SupplierContact, OrderDate, ReceiveDate, StockID, MerchandiseCost, ShippingCost)
VALUES (8176942, 7578882019, '03-31-2022', '04-03-2022', 4805283045, 200, 5.99);

INSERT INTO Sale_tb(SaleID, SaleStatus, Employee_ID, CustomerID, SalePrice)
VALUES (148760, 'Sold', 80, 90, 10.25); 

INSERT INTO Sale_tb(SaleID, SaleStatus, Employee_ID, CustomerID, SalePrice)
VALUES (158864, 'Sold', 82, 122, 3.25); 

INSERT INTO SalesItem_tb (ItemID, ItemDescription, ItemName, ItemPrice)
VALUES (148760, 'Treats', 'RedBarn Bully Bites', 10.25); 

INSERT INTO SalesItem_tb (ItemID, ItemDescription, ItemName, ItemPrice)
VALUES (158864, 'Treats', 'Milk-Bone Dog Biscuits', 3.46); 

INSERT INTO Inventory_tb (StockID, ItemID, AnimalID, ProductLeft)
VALUES (4805283045, 148760, 042019, 'In Stock'); 

INSERT INTO Inventory_tb (StockID, ItemID, AnimalID, ProductLeft)
VALUES (4873789914, 158864, 042018, 'In Stock'); 