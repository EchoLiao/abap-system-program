use xsbook
select *
	from view4
go
insert into view4(bookkey,bookname,color,computedcol,pages)
	values(44,'��ѧ�뼼��','��','����',333) --44��'����'�ֶ��ǲ������õ�, ��Ϊ�������������������.
go
select *
	from view4
go 

select *
	from books
go