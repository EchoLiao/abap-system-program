USE XSBOOK
SET NOCOUNT ON
DECLARE @startdate smalldatetime
SET @startdate=getdate()
SELECT ����֤��,����,datepart(yyyy, @startdate)-datepart(yyyy, ����ʱ��)AS ����
	FROM XS
GO