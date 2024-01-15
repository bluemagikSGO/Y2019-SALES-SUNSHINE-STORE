-- DOING THE NECESSARY CLEANING FOR APRIL

SELECT TOP (1000) [Order_ID]
      ,[Product]
      ,[Quantity_Ordered]
      ,[Price_Each]
      ,[Order_Date]
      ,[Purchase_Address]
  FROM [Sale_2019].[dbo].[Sales_April_2019]
-- CHECK FOR VALUES THAT ARE NULL IN THE TABLE
  SELECT *
FROM [dbo].[Sales_April_2019]
WHERE Product IS NULL;
-- DELETE THE NULL VALUES IN THE TABLE FOR MORE CLARITY WHEN DOING ANALYSIS
DELETE FROM [dbo].[Sales_April_2019]
WHERE Product IS NULL;
-- CHECK THE TABLE AGAIN

SELECT * FROM [dbo].[Sales_April_2019]

-- FROM THE ADDRESS CREATE A STATE COLUMN
BEGIN TRANSACTION 
ALTER TABLE [dbo].[Sales_April_2019]
ADD State NVARCHAR(50); 

UPDATE [dbo].[Sales_April_2019]
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM [dbo].[Sales_April_2019];

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;

SELECT * FROM [dbo].[Sales_April_2019];

-- FROM THE ADDRESS COLUMN, CREATE A CITY COLUMN

BEGIN TRANSACTION
ALTER TABLE [dbo].[Sales_April_2019]
ADD City NVARCHAR(50);
SELECT * FROM [dbo].[Sales_April_2019];

SELECT
	Purchase_Address,
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) AS City
	FROM [dbo].[Sales_April_2019] 

UPDATE [dbo].[Sales_April_2019]
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM [dbo].[Sales_April_2019] 


COMMIT TRANSACTION
SELECT * FROM [dbo].[Sales_April_2019]

-- CREATE A TOTAL SALES COLUMN

ALTER TABLE [dbo].[Sales_April_2019]
ADD Total_Sales FLOAT(50);

SELECT * FROM [dbo].[Sales_April_2019]
BEGIN TRANSACTION
UPDATE [dbo].[Sales_April_2019]
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 2)
COMMIT TRANSACTION

SELECT * FROM [dbo].[Sales_April_2019]

-- ROUND UP THE PRICE EACH COLUMN

BEGIN TRANSACTION

UPDATE [dbo].[Sales_April_2019]
SET Price_Each = ROUND(Price_Each, 4);

COMMIT TRANSACTION

SELECT *
FROM [dbo].[Sales_April_2019]
WHERE City = 'urchase Address'



DELETE FROM [dbo].[Sales_April_2019]
WHERE Purchase_Address IN ( 
SELECT Purchase_Address
FROM [dbo].[Sales_April_2019]
WHERE City = 'urchase Address')


SELECT DISTINCT City
FROM [dbo].[Sales_April_2019];

SELECT * FROM Sales_April_2019


--- AUGUST CLEANING

SELECT * FROM [dbo].[Sales_August_2019]

-- CHECK FOR NULL VALUES

SELECT * FROM [dbo].[Sales_August_2019]
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE AUGUST TABLE
DELETE FROM [dbo].[Sales_August_2019]
WHERE Order_ID IS NULL

SELECT * FROM [dbo].[Sales_August_2019]
WHERE Order_ID IS NULL

SELECT * FROM Sales_August_2019

-- POPULATE THE TOTAL SALES COLUMN
BEGIN TRANSACTION

UPDATE Sales_August_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

COMMIT TRANSACTION 

SELECT * FROM Sales_August_2019


-- CREATE A CITY COLUMN FOR AUGUST

BEGIN TRANSACTION
ALTER TABLE [dbo].[Sales_August_2019]
ADD City NVARCHAR(50);
SELECT * FROM Sales_August_2019

SELECT
	Purchase_Address,
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) AS City
	FROM Sales_August_2019 

UPDATE Sales_August_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_August_2019

	SELECT * FROM Sales_August_2019

	COMMIT TRANSACTION

	-- ROUND UP THE PRICE EACH COLUMN

UPDATE Sales_August_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT DISTINCT City
FROM [dbo].[Sales_August_2019];





--- START THE DECEMBER CLEANING

SELECT * FROM Sales_December_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_December_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_December_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_December_2019]
ADD Total_Sales FLOAT(50);

BEGIN TRANSACTION

UPDATE Sales_December_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

COMMIT TRANSACTION 

SELECT * FROM Sales_December_2019

UPDATE Sales_December_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_December_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_December_2019]
ADD City NVARCHAR(50);

UPDATE Sales_December_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_December_2019


SELECT * FROM Sales_December_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
BEGIN TRANSACTION 
ALTER TABLE [dbo].[Sales_December_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_December_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_December_2019;

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;

SELECT * FROM Sales_December_2019;


-- START JANUARY CLEANING

SELECT * FROM Sales_January_2019


-- CHECK FOR NULL VALUES

SELECT * FROM Sales_January_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_January_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_January_2019]
ADD Total_Sales FLOAT(50);


UPDATE Sales_January_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_January_2019

UPDATE Sales_January_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_January_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_January_2019]
ADD City NVARCHAR(50);

UPDATE Sales_January_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_January_2019


SELECT * FROM Sales_January_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 
ALTER TABLE [dbo].[Sales_January_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_January_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_January_2019



SELECT * FROM Sales_December_2019;





-- START THE JULY CLEANING 

SELECT * FROM Sales_July_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_July_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_July_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_July_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_July_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_July_2019

UPDATE Sales_July_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_July_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_July_2019]
ADD City NVARCHAR(50);

UPDATE Sales_July_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_July_2019


SELECT * FROM Sales_July_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_July_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_July_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_July_2019




--- START JUNE CLEANING

SELECT * FROM Sales_June_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_June_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_June_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_June_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_June_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_June_2019

UPDATE Sales_June_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_June_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_June_2019]
ADD City NVARCHAR(50);

UPDATE Sales_June_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_June_2019


SELECT * FROM Sales_June_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_June_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_June_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_June_2019




-- START THE MARCH CLEANING

SELECT * FROM Sales_March_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_March_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_March_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_March_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_March_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_March_2019

UPDATE Sales_March_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_March_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_March_2019]
ADD City NVARCHAR(50);

UPDATE Sales_March_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_March_2019


SELECT * FROM Sales_March_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_March_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_March_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_March_2019




--START THE MAY CLEANING


SELECT * FROM Sales_May_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_May_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_May_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_May_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_May_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_May_2019

UPDATE Sales_May_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_May_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_May_2019]
ADD City NVARCHAR(50);

UPDATE Sales_May_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_May_2019


SELECT * FROM Sales_May_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_May_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_May_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_May_2019





-- START THE NOVEMBER CLEANING


SELECT * FROM Sales_November_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_November_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_November_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_November_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_November_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_November_2019

UPDATE Sales_November_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_November_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_November_2019]
ADD City NVARCHAR(50);

UPDATE Sales_November_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_November_2019


SELECT * FROM Sales_November_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_November_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_November_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_November_2019






-- START THE OCTOBER CLEANING

SELECT * FROM Sales_October_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_October_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_October_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_October_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_October_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_October_2019

UPDATE Sales_October_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_October_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_October_2019]
ADD City NVARCHAR(50);

UPDATE Sales_October_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM [dbo].[Sales_October_2019]


SELECT * FROM Sales_October_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_October_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_October_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_October_2019




--- START THE SEPTEMBER CLEANING


SELECT * FROM Sales_September_2019

-- CHECK FOR NULL VALUES

SELECT * FROM Sales_September_2019
WHERE Order_ID IS NULL

-- DELETE THE NULL VALUES IN THE DECEMBER TABLE
DELETE FROM Sales_September_2019
WHERE Order_ID IS NULL

-- POPULATE THE TOTAL SALES COLUMN
ALTER TABLE [dbo].[Sales_September_2019]
ADD Total_Sales FLOAT(50);



UPDATE Sales_September_2019
SET Total_Sales = ROUND(CEILING(Price_Each * Quantity_Ordered), 4)

 

SELECT * FROM Sales_September_2019

UPDATE Sales_September_2019
SET Price_Each = ROUND(Price_Each, 4);


SELECT * FROM Sales_September_2019

-- CREATE A CITY COLUMN

ALTER TABLE [dbo].[Sales_September_2019]
ADD City NVARCHAR(50);

UPDATE Sales_September_2019
SET City = 
	SUBSTRING(
	Purchase_Address,
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address)))+2,
	LEN(Purchase_Address) -
	LEN(LEFT(Purchase_Address, CHARINDEX(',', Purchase_Address))) -
	LEN(RIGHT(Purchase_Address, CHARINDEX(',', REVERSE(Purchase_Address)))
	)-1) 
	FROM Sales_September_2019


SELECT * FROM Sales_September_2019

-- FROM THE ADDRESS CREATE A STATE COLUMN
 

ALTER TABLE [dbo].[Sales_September_2019]
ADD State NVARCHAR(50); 

UPDATE Sales_September_2019
SET State = SUBSTRING(Purchase_Address, LEN(Purchase_Address) - 7, 2);

SELECT * FROM Sales_September_2019

