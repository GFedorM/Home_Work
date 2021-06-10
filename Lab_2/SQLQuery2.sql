-- Найти минимальную цену товара (ListPrice) из таблицы Production.Product 
SELECT MIN(ListPrice) AS [Min] 
FROM Production.Product; 

-- Найти средний вес (Weight) из таблицы Production.Product, не учитывать пустые значения 
SELECT AVG(Weight) as AverageWeight 
FROM Production.Product 
WHERE Weight IS NOT NULL; 

-- Для каждого пола найти суммарное количество часов отпуска из таблицы 
--(поставить фильтр: работник был принят до 2008 года) HumanResources.Employee, не учитывать пустые значения 
SELECT Gender, SUM(VacationHours) as SummaryHours 
FROM HumanResources.Employee 
WHERE Gender IS NOT NULL AND BirthDate IS NOT NULL AND HireDate < '2008-01-01' 
GROUP BY Gender 

-- Вывести пол, где среднее количество часов выходных больше 50 из HumanResources.Employee 
SELECT Gender, AVG(VacationHours) as AverageHoliday 
FROM HumanResources.Employee 
GROUP BY Gender 
HAVING AVG(VacationHours) > 50 

-- Вывести BusinessEntityID, LastReceiptDate и сумму по StandardPrice для BusinessEntityID с 
--разными LastReceiptDate, предусмотреть вывод общей суммы для всех StandardPrice у различных 
--BusinessEntityID из таблицы Purchasing.ProductVendor. (Использовать ROOLUP) 
SELECT BusinessEntityID, LastReceiptDate, SUM(StandardPrice) as SummaryPrice 
FROM Purchasing.ProductVendor 
GROUP BY ROLLUP(BusinessEntityID, LastReceiptDate);