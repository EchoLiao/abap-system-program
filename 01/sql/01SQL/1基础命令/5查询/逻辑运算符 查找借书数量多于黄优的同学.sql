USE XSBOOK
SELECT X.借书证号,姓名,借书数量
	FROM XS X, view_select Y
	WHERE X.借书证号=Y.借书证号 and 借书数量>
		(SELECT 借书数量
			FROM XS U,view_select W
			WHERE U.借书证号=W.借书证号 and U.姓名='黄优'
          	)
GO