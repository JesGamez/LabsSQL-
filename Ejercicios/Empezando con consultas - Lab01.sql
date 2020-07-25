--1.-Visualizar todos los registros de la tabla productos:
SELECT *
FROM Production.Product
GO
--2.-Ver la estructura de la tabla productos

SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Production.Product')
GO

--3.-Cuantos productos no pertenece a una subcategoria
SELECT *
FROM Production.Product
WHERE ProductSubcategoryID IS NULL
GO

--4.-Ver listado de Subcategoria de productos

SELECT
pro.name AS PRODUCTO,
sub.name AS SUBCATEGORIA
FROM
Production.Product pro
INNER JOIN
Production.ProductSubcategory sub
ON pro.ProductSubcategoryID = sub.ProductSubcategoryID
GO

--5.-Visualizar listado de subcategoria con sus respectiva categoria

SELECT
sub.ProductSubcategoryID,
cat.Name,
sub.Name,
sub.rowguid,
sub.ModifiedDate
FROM Production.ProductSubcategory AS sub
INNER JOIN Production.ProductCategory AS cat
ON cat.ProductCategoryID = sub.ProductCategoryID
GO

--6.-Visualizar cantidad de productos por cada subcategoria
SELECT 
DISTINCT COUNT(pro.ProductID) as Producto, 
sub.name AS Subcategoria
FROM Production.Product pro
INNER JOIN Production.ProductSubcategory sub
ON pro.ProductSubcategoryID = sub.ProductSubcategoryID
GROUP BY sub.Name
GO


--7.-ver precio promedio por cada categoria de producto

SELECT pc.name AS Categoria,
AVG(pp.ListPrice) AS Promedio 
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.name
GO



--8.-Ver cantidad de productos por categoria

SELECT Cat.Name AS Categoria,
COUNT(Pro.ProductID) AS CANTIDAD
FROM Production.Product Pro
INNER JOIN Production.ProductSubcategory Sub
on Sub.ProductSubcategoryID = Pro.ProductSubcategoryID
INNER JOIN Production.ProductCategory Cat
on Cat.ProductCategoryID = Sub.ProductCategoryID
GROUP BY Cat.Name
GO


--9.-ver cantidad de productos sólo de la categoría components

SELECT
CAT.Name AS Categoria,
COUNT(PRO.ProductID) AS CANTIDAD
FROM Production.Product PRO
INNER JOIN Production.ProductSubcategory SUB
on SUB.ProductSubcategoryID = PRO.ProductSubcategoryID
INNER JOIN Production.ProductCategory CAT
on CAT.ProductCategoryID = SUB.ProductCategoryID
WHERE CAT.Name = 'Components'
GROUP BY CAT.Name
GO


--10.-Visualizar el total de ventas por cada categoría de producto
SELECT C.Name, 
SUM(SA.LineTotal * SA.UnitPrice) as TOTAL
FROM Production.Product P
INNER JOIN Sales.SalesOrderDetail SA 
on P.ProductID = SA.ProductID
INNER JOIN Production.ProductSubcategory S 
on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C 
on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name
GO



--11.- Ver la cantidad total de empleados
SELECT COUNT(*)AS EMPLEADOS FROM HumanResources.Employee
GO


--12.-Ver la cantidad total de empleados de acuerdo a su estado civil.

SELECT MaritalStatus,
COUNT(EST.BusinessEntityID) AS ESTADO_CIVIL
from HumanResources.Employee EST
GROUP BY MaritalStatus 
GO


--13.-Ver cantidad de empleados por género

SELECT * FROM HumanResources.Employee WHERE Gender = 'F' AND MaritalStatus='S' 
SELECT * FROM HumanResources.Employee WHERE Gender = 'M' AND MaritalStatus='M'
--****
SELECT
Gender,
COUNT(GEN.BusinessEntityID) AS Genero
from HumanResources.Employee GEN
GROUP BY Gender 
GO

--14.-Ver listado de Departamentos

select * FROM HumanResources.Department
GO

--15.-Ver cantidad de empleados por cada departamento

SELECT 
Department,
COUNT(*) AS empleados
FROM HumanResources.vEmployeeDepartment GROUP BY Department
GO

