USE XSBOOK
DECLARE @var1 nvarchar(30)
SELECT @var1='����'
SELECT @var1 AS 'NAME' /* ��ӡvar1��ֵ,����ΪNAME */

SELECT @var1= /* ��SELECT ��丳ֵ */
	(SELECT ����
	FROM XS
	WHERE ����֤��='10000001')
SELECT @var1 AS 'NAME' /* ��ӡvar1��ֵ,����ΪNAME */
