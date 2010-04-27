USE XSBOOK	
update XS	
SET 	出生时间= '1988-11-11'
WHERE 借书证号 = '10000001'
go	
	
update book
set 价格 = 63
WHERE ISBN = '3-333-77722-5'
GO

UPDATE JY
SET 借书时间 = '2008-10-29'
WHERE 索书号 = '1000000003'
go