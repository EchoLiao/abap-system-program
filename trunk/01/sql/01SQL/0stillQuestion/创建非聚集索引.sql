USE XSBOOK
IF EXISTS(SELECT name FROM sysindexes WHERE name = 'num_ind')
	DROP INDEX xs.num_ind
go
CREATE NONCLUSTERED INDEX num_ind ON xs(������) /* �Ǿۼ����� */
	WITH FILLFACTOR = 60 /* ??????????//// */
