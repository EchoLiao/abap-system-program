USE XSBOOK
IF EXISTS(SELECT name FROM sysindexes WHERE name = 'num_ind')
	DROP INDEX xs.num_ind
go
CREATE NONCLUSTERED INDEX num_ind ON xs(借书数) /* 非聚集索引 */
	WITH FILLFACTOR = 60 /* ??????????//// */
