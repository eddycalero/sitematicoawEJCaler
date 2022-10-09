
USE AdventureWorks2019
GO

CREATE OR ALTER PROC US_Ejercisio1(
       @ID INT,
       @NAME VARCHAR,
	   @ROWID UNIQUEIDENTIFIER,
	   @MODIFIEDDATE2 DATE
)  
AS
BEGIN
SET IDENTITY_INSERT Production.ProductCategory  on;
 INSERT INTO Production.ProductCategory(ProductCategoryID,Name,rowguid,ModifiedDate)
 VALUES
 (
     @ID,@NAME,@ROWID,@MODIFIEDDATE2
 )
END
SET IDENTITY_INSERT Production.ProductCategory  off;
GO


EXEC US_Ejercisio1 7,'eddy','D4796EDC-C2F4-4BA7-A98B-DD78C4479FF0','2022/03/12'
GO

select NEWID()

DECLARE @myid uniqueidentifier = NEWID(); 

SELECT CONVERT(char(255), @myid) AS 'char';

SELECT * FROM Production.ProductCategory
GO


CREATE OR ALTER  FUNCTION EJERCISIO2()
RETURNS TABLE
AS
RETURN
(
SELECT D.LoginID,D.JobTitle,D.BirthDate,D.HireDate, DATEPART(YEAR,GETDATE())- DATEPART(YEAR,D.BirthDate) AS AGE, DATEPART(YEAR,GETDATE())- DATEPART(YEAR,D.HireDate) AS ANTIGUEDAD FROM  HumanResources.Employee AS D
);


SELECT * FROM EJERCISIO2()
GO

use AdventureWorks2019
go

CREATE LOGIN Vendedore WITH PASSWORD = 'eddy'
GO

CREATE USER EJCalero FOR LOGIN Vendedore WITH DEFAULT_SCHEMA = Sales;
GO

CREATE ROLE db_Vendedore AUTHORIZATION [EJCalero]
GO
GRANT SELECT ON SCHEMA::Sales TO db_Vendedore
GO
GRANT INSERT ON SCHEMA::Sales TO db_Vendedore
GO
GRANT UPDATE ON SCHEMA::Sales TO db_Vendedore
GO
GRANT DELETE ON SCHEMA::Sales TO db_Vendedore
GO
GRANT SELECT ON Production.ProductCategory  TO db_Vendedore
GO
GRANT SELECT ON Production.Product  TO db_Vendedore
GO

ALTER ROLE db_Vendedore ADD MEMBER EJCalero
GO




