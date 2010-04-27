USE XSBOOK
DECLARE @var1 nvarchar(30)
SELECT @var1='刘丰'
SELECT @var1 AS 'NAME' /* 打印var1的值,标题为NAME */

SELECT @var1= /* 用SELECT 语句赋值 */
	(SELECT 姓名
	FROM XS
	WHERE 借书证号='10000001')
SELECT @var1 AS 'NAME' /* 打印var1的值,标题为NAME */
