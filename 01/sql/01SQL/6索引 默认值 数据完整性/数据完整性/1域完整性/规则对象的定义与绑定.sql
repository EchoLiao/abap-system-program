/* �������Ķ��� */
USE XSBOOK 
GO
CREATE RULE num_rule
	AS @num like '[1-6][1-6][1-9][1-9][1-9][1-9][1-9][1-9]' /* @num Ϊ��������ľֲ����� */
go
exec sp_bindrule 'num_rule', 'xs.����֤��'
go