USE XSBOOK
SELECT X.借书证号,姓名,借书数量
	FROM XS X, view_select Y
	WHERE X.借书证号=Y.借书证号 and 借书数量 BETWEEN 2 AND 3
GO