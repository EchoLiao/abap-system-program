
/* ԭ�ȴ���Ŀ��: �����洢����, ���ڸ���������ѯ�鼮������Ϣ */ 
/* �޸�BookInfoFromName: ���ڸ��ݳ�������в�ѯ */

alter procedure BookInfoFromName  
	@name varchar(23) with encryption -- ���ܴ洢���� 
	as
	select *
	from book
	where ������ like @name
go
exec BookinfoFromName '����%'
go
