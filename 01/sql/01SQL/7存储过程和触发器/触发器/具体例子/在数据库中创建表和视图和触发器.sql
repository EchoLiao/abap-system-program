
use xsbook
if exists(select name from sysobjects where name='books' and type='u')
	drop table books
go
create table books
(	bookkey int identity(1,1),
	bookname nvarchar(10) not null,
	color nvarchar(10) not null,
	computedcol as (bookname+color),
	pages int
)
go

if exists(select name from sysobjects where name='view4' and type='v')
	drop view view4
go
create view view4 
	as
	select bookkey,bookname,color,computedcol,pages 
	from books
go

if exists(select name from sysobjects where name='insteadtrig' and type='tr')
	drop trigger insteadtrig
go
create trigger insteadtrig on view4
	instead of insert -- ȡ��insert�ؼ���
	as	
	begin
	insert into books  /* ��ͼ����������, ��Ӧ�ı�ҲҪ�ı� */
		select bookname,color,pages from inserted
	end
go

insert into books(bookname,color,pages)
	values('���������','��',222)
go
select *
	from books /*��view4 */

