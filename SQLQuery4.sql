-- 1)Показать ФИО самого пожилого сотрудника (Таблицы HumanResources.Employee и Person.Person)
SELECT p2.FirstName
,p2.MiddleName
,p2.LastName
FROM HumanResources.Employee AS p1
INNER JOIN Person.Person AS p2
ON p2.BusinessEntityID = p1.BusinessEntityID
WHERE p1.BirthDate = (SELECT MIN(BirthDate)
FROM HumanResources.Employee)

--Определить штат (StateProvinceName) в котором проживает максимальнок число сотрудников (Представление Sales.vSalesPerson)
SELECT COUNT (StateProvinceName) AS MaxCount
,StateProvinceName
FROM Sales.vSalesPerson
GROUP BY StateProvinceName
HAVING COUNT(StateProvinceName) >= ALL
    (SELECT COUNT(StateProvinceName)
    FROM Sales.vSalesPerson
    GROUP BY StateProvinceName)

--Показать товар, для которого существует более 2 цветов в подкатегории (Таблица Production.Product)
SELECT p1.[Name]
,p1.Color
,p1.ProductSubcategoryID
FROM Production.Product AS p1
WHERE p1.Color IS NOT NULL AND
  (SELECT COUNT(DISTINCT p2.Color)
    FROM Production.Product AS p2
    WHERE p1.ProductSubcategoryID = p2.ProductSubcategoryID
    AND P2.Color IS NOT NULL
    GROUP BY p2.ProductSubcategoryID) > 2
ORDER BY ProductSubcategoryID;

--Показать товары, цены которых равны максимальной цене товара из тойже подкатегории (Таблица Production.Product)
SELECT DISTINCT p1.ListPrice
,p1.ProductSubcategoryID
,p1.[Name]
FROM Production.Product AS p1
WHERE P1.ListPrice =
    (SELECT MAX (ListPrice)
    FROM Production.Product AS p2
    WHERE p2.ProductSubcategoryID = P1.ProductSubcategoryID)

--Показать товары, цена которых больше средней цены  в любой модели продуктов (Таблица Production.Product)
SELECT [Name]
,ListPrice
,ProductModelID
FROM Production.Product
WHERE ListPrice > ANY
      ( SELECT AVG(ListPrice)
      FROM Production.Product
      WHERE ListPrice > 0
      AND ProductModelID IS NOT NULL
      GROUP BY ProductModelID )
EXCEPT SELECT [Name]
,ListPrice
,ProductModelID
FROM Production.Product
WHERE ProductModelID IS NOT NULL
AND ListPrice > ANY 
    (SELECT AVG(ListPrice)
    FROM Production.Product
    WHERE ListPrice > 0
    AND ProductModelID IS NOT NULL
    GROUP BY ProductModelID)
ORDER BY ProductModelID DESC