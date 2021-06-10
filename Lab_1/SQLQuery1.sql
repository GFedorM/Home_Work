SELECT * FROM Production.ProductInventory
-- Показать все поля из таблицы Production.ProductInventory. 

SELECT ProductID, StartDate,EndDate FROM Production.ProductCostHistory
-- Показать поля ProductID, StartDate,EndDate из таблицы Production.ProductCostHistory.

SELECT  ProductID, BusinessEntityID, AverageLeadTime, StandardPrice,LastReceiptCost FROM Purchasing.ProductVendor
WHERE LastReceiptCost IS NOT NULL
--Показать поля ProductID, BusinessEntityID, AverageLeadTime, StandardPrice из таблицы Purchasing.ProductVendor, для товаров, имеющих цену продажи при последней покупке (LastReceiptCost)

SELECT DISTINCT CITY FROM Person.[Address]
WHERE SpatialLocation IS NOT NULL
--Показать уникальные названия городов из таблицы Person.Address, у которых известна долгота и широта (SpatialLocation). 


SELECT ProductID,[Name],Color FROM Production.Product
WHERE Name LIKE '%Chainring%'
--Показать ID (ProductID), название ([Name]) и цвет (Color) товаров из таблицы Production.Product, содержащих в названии слово 'Chainring'

SELECT StateProvinceID,[Name],TerritoryID FROM Person.StateProvince
WHERE Name IN ('Alaska', 'Alabama', 'Colorado', 'Georgia','Iowa')
--Показать ID (StateProvinceID) и название ([Name]) регионов или штатов, а также ID страны, на территории которой они располагаются (TerritoryID) из таблицы Person.StateProvince.
--Показать только регионы из списка ('Alaska', 'Alabama', 'Colorado', 'Georgia','Iowa'), используя оператор IN. 


SELECT PersonType, NameStyle,FirstName, MiddleName, LastName, ISNULL (Title,'Dear') AS Title FROM Person.Person
--Показать поля PersonType, NameStyle, Title, FirstName, MiddleName, LastName из таблицы Person.Person.
--Неизвестные значения поля Title заменить на 'Dear'. Названия полей оставить без изменений. 

SELECT ProductID, [Name],COALESCE(Class,Color,'UNKNOWN') AS Meauserement  FROM Production.Product
--Показать поля ProductID, [Name] из таблицы Production.Product с применением функции COALESCE(). Показать поле Meauserement , так, 
--чтобы, если значение в поле Class известно, то показать его, а иначе, показать значение в поле Color. 
--Если и в поле Color значение неизвестно, то вывести значение 'UNKNOWN'.


SELECT DepartmentID,[GroupName],[Name] FROM HumanResources.Department
ORDER BY [Name]
--Показать ID департамента (DepartmentID), название отдела ([GroupName]) и вид деятельности данного отдела ([Name]) 
--из таблицы HumanResources.Department и отсортировать строки таблицы в алфавитном порядке вида деятельности ([Name]).

SELECT  NULLIF ([Name],'Advanced Bicycles') AS [Name]  FROM Purchasing.Vendor
--Показать название фирмы ([Name]) из таблицы Purchasing.Vendor. Если фирма называется 'Advanced Bicycles', заменить значение поля [Name] на NULL. Названия полей оставить без изменений