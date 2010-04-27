USE XSBOOK
SET NOCOUNT ON
DECLARE @startdate smalldatetime
SET @startdate=getdate()
SELECT 借书证号,姓名,datepart(yyyy, @startdate)-datepart(yyyy, 出生时间)AS 年龄
	FROM XS
GO