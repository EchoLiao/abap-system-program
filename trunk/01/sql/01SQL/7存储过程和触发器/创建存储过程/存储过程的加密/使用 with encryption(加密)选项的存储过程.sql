

use xsbook
if exists(select name from sysobjects where name='encryption_this' and type='p')
	drop procedure encryption_this
go
create procedure encryption_this with encryption -- ����with encryption�ؼ���,Ŀ����Ϊ��, ���ñ���û��ܹ�����������.
	as
	select *
	from xs
go

exec sp_helptext encryption_this
go