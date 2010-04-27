/* 游标变量的使用步骤: 定义游标--->给游标变量赋值--->打开游标--->利用游标读取行(记录)--->使用结束后关闭游标
 * --->删除游标的引用 */
USE XSBOOK
DECLARE @CursorVar CURSOR 
SET @CursorVar = CURSOR SCROLL DYNAMIC /* 给游标变量赋值 */
FOR
	SELECT 借书证号,姓名
	FROM XS
	--WHERE 借书证号 '20%'
	WHERE 借书证号 LIKE '20%'
OPEN @CursorVar 
FETCH NEXT FROM @CursorVar 
WHILE @@FETCH_STATUS=0
	BEGIN 
		FETCH NEXT FROM @CursorVar /* 通过游标读取行 */
	END
CLOSE @CursorVar
DEALLOCATE @CursorVar