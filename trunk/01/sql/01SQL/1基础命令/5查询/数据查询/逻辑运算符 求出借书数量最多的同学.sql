USE XSBOOK
IF EXISTS(SELECT name
	FROM sysobjects
	WHERE name='view_select' and type='V')
DROP VIEW view_select
GO
/* ������������Ϊ:�ж�view_select�Ƿ��Ѿ�����,���Ѵ��������ɾ�� */
/*
CREATE VIEW view_select
	AS
	SELECT JY.����֤��,����,BOOK.����,COUNT(�����) AS ��������
	FROM JY, BOOK,XS
	WHERE BOOK.ISBN=JY.ISBN AND JY.����֤��=XS.����֤��
	GROUP BY  JY.����֤��,����,����
GO */


CREATE VIEW view_select /* ������ͼ */
	AS 
	SELECT ����֤��,COUNT(�����) AS ��������
	FROM JY
	GROUP BY ����֤��
GO 

SELECT XS.����֤��,����,��������
	FROM XS,view_select
	WHERE XS.����֤��=view_select.����֤�� and ��������>=ALL  /* ������������� */
		(SELECT ��������
			FROM view_select 
		)


 