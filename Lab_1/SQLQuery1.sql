SELECT * FROM Production.ProductInventory
-- �������� ��� ���� �� ������� Production.ProductInventory. 

SELECT ProductID, StartDate,EndDate FROM Production.ProductCostHistory
-- �������� ���� ProductID, StartDate,EndDate �� ������� Production.ProductCostHistory.

SELECT  ProductID, BusinessEntityID, AverageLeadTime, StandardPrice,LastReceiptCost FROM Purchasing.ProductVendor
WHERE LastReceiptCost IS NOT NULL
--�������� ���� ProductID, BusinessEntityID, AverageLeadTime, StandardPrice �� ������� Purchasing.ProductVendor, ��� �������, ������� ���� ������� ��� ��������� ������� (LastReceiptCost)

SELECT DISTINCT CITY FROM Person.[Address]
WHERE SpatialLocation IS NOT NULL
--�������� ���������� �������� ������� �� ������� Person.Address, � ������� �������� ������� � ������ (SpatialLocation). 


SELECT ProductID,[Name],Color FROM Production.Product
WHERE Name LIKE '%Chainring%'
--�������� ID (ProductID), �������� ([Name]) � ���� (Color) ������� �� ������� Production.Product, ���������� � �������� ����� 'Chainring'

SELECT StateProvinceID,[Name],TerritoryID FROM Person.StateProvince
WHERE Name IN ('Alaska', 'Alabama', 'Colorado', 'Georgia','Iowa')
--�������� ID (StateProvinceID) � �������� ([Name]) �������� ��� ������, � ����� ID ������, �� ���������� ������� ��� ������������� (TerritoryID) �� ������� Person.StateProvince.
--�������� ������ ������� �� ������ ('Alaska', 'Alabama', 'Colorado', 'Georgia','Iowa'), ��������� �������� IN. 


SELECT PersonType, NameStyle,FirstName, MiddleName, LastName, ISNULL (Title,'Dear') AS Title FROM Person.Person
--�������� ���� PersonType, NameStyle, Title, FirstName, MiddleName, LastName �� ������� Person.Person.
--����������� �������� ���� Title �������� �� 'Dear'. �������� ����� �������� ��� ���������. 

SELECT ProductID, [Name],COALESCE(Class,Color,'UNKNOWN') AS Meauserement  FROM Production.Product
--�������� ���� ProductID, [Name] �� ������� Production.Product � ����������� ������� COALESCE(). �������� ���� Meauserement , ���, 
--�����, ���� �������� � ���� Class ��������, �� �������� ���, � �����, �������� �������� � ���� Color. 
--���� � � ���� Color �������� ����������, �� ������� �������� 'UNKNOWN'.


SELECT DepartmentID,[GroupName],[Name] FROM HumanResources.Department
ORDER BY [Name]
--�������� ID ������������ (DepartmentID), �������� ������ ([GroupName]) � ��� ������������ ������� ������ ([Name]) 
--�� ������� HumanResources.Department � ������������� ������ ������� � ���������� ������� ���� ������������ ([Name]).

SELECT  NULLIF ([Name],'Advanced Bicycles') AS [Name]  FROM Purchasing.Vendor
--�������� �������� ����� ([Name]) �� ������� Purchasing.Vendor. ���� ����� ���������� 'Advanced Bicycles', �������� �������� ���� [Name] �� NULL. �������� ����� �������� ��� ���������