
/* �����洢����, ���ڸ���xxx��ѯ������Ϣ */
use xsbook
if exists(select name from sysobjects where name='sp_showtable' and type='p')
	drop procedure sp_showtable
go
create procedure  sp_showtable
	@table varchar(30)='B%' /* ��Ĭ��ֵ */
	as 
	select tab.name as table_name, inx.name as index_name, indid as index_id
	from sysindexes tab inner join sysobjects inx on tab.id=inx.id
	where tab.name like @table and indid>=0 and indid<=255
go
exec sp_showtable
exec sp_showtable 'Xs2%'
go