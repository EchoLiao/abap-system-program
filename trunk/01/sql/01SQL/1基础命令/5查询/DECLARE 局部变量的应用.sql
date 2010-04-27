USE XSBOOK
DECLARE @sex bit /*声明局部变量 */
SET @sex=0  /* 赋值局部变量 */
SELECT 借书证号,姓名
	FROM XS
	WHERE 性别=@sex
GO