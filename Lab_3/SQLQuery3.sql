--  Показать номера телефонов (PhoneNumber) и поля PersonType, FirstName, LastName из таблиц Person.Person, Person.PersonPhone 
SELECT PhoneNumber,PersonType, FirstName, LastName
FROM Person.Person AS P1
INNER JOIN Person.PersonPhone AS P2
ON P1.BusinessEntityID=P2.BusinessEntityID;

-- Показать список продуктов (поле Name) в котором указано, есть ли у продукта название модели или нет, 
--из таблиц Production.ProductionModel, Production.Product, используя LEFTOUTER JOIN. 
SELECT P1.Name, P2.Name
FROM Production.Product AS P1
LEFT OUTER JOIN Production.ProductModel AS P2
ON P1.ProductModelID=P2.ProductModelID;

-- Показать список ID людей (поле BusinessEntityId), в котором указано, работает ли человек в магазине или нет, 
--из таблиц Sales.Store, Person.BusinessEntity, используя RIGHT OUTER JOIN. 
SELECT Name, B.BusinessEntityID
FROM Sales.Store AS S
RIGHT OUTER JOIN Person.BusinessEntity AS B
ON S.BusinessEntityID=B.BusinessEntityID;

--Показать список продуктов (ProductID), которые содержатся на нескольких складах (LocationID), 
--из таблицы Production.ProductInventory, используя SELF JOIN. 
SELECT DISTINCT P1.ProductID, P1.LocationID
FROM Production.ProductInventory AS P1
INNER JOIN Production.ProductInventory AS P2
ON P1.ProductID=P2.ProductID
AND P1.LocationID<>P2.LocationID
ORDER BY P1.ProductID;

-- Показать список складов (LocationID), на которых содержатся несколько продуктов (ProductID), 
--из таблицы Production.ProductInventory, используя SELF JOIN. 
SELECT DISTINCT P1.ProductID, P1.LocationID
FROM Production.ProductInventory AS P1
INNER JOIN Production.ProductInventory AS P2
ON P1.LocationID=P2.LocationID
AND P1.ProductID<>P2.ProductID
ORDER BY P1.LocationID;

--Показать список продуктов из таблицы Production.Product 
--с таким же цветом как у продукта ML Road Frame-W - Yellow, 38, используя SELF JOIN. 
SELECT DISTINCT P1.Name, P1.Color
FROM Production.Product AS P1
INNER JOIN Production.Product AS P2
ON P1.Color=P2.Color
AND P2.Name='ML Road Frame-W - Yellow, 38';

--Показать комбинированный список таблиц Person.AddressType, Person.ContactType по 
--полям ID, Name, ModifiedDate, используя UNION. 
SELECT AddressTypeID, Name, ModifiedDate
FROM Person.AddressType
UNION SELECT ContactTypeID, Name, ModifiedDate
FROM Person.ContactType

-- Показать список ID, которые содержатся в таблице Sales.Store (поле BusinessEntityID), 
--но не содержатся в таблице Sales.Customer (поле CustomerID) 
SELECT BusinessEntityID
FROM Sales.Store
EXCEPT SELECT CustomerID
FROM Sales.Customer