
/* �����洢����, ���ڸ���������ѯ�鼮������Ϣ */
use xsbook
if exists(select name from sysobjects where name='BookInfoFromName' and type='p')
	drop procedure BookInfoFromName
go
create procedure BookInfoFromName 
	@name varchar(20)='C%'
	as
	select *
	from book
	where ���� like @name
go

exec BookInfoFromName  's%'
