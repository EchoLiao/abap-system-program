

/* �����洢����,�����������н����ͬѧ��,�������ڶ����ͬѧ(���α�) */
use xsbook
if exists(select name from sysobjects where name='SecondStuBo' and type='p')
	drop procedure SecondStuBo

go
create procedure SecondStuBo
	@cur CURSOR VARYING OUTPUT -- �洢�����е��α���������� OUTPUT �� VARYING ѡ�������������ұ���������˳��ָ��: CURSOR VARYING OUTPUT��
	as
	set @cur=cursor static  -- absolute ֻ������static�����α�
	for
	select *
	from xs
	order by ������ desc
	open @cur
go

declare @cur cursor 
exec SecondStuBo @cur output
fetch absolute 6 from @cur
fetch absolute 2 from @cur
while(@@fetch_status=0)
	begin
		fetch next from @cur
	end
close @cur
deallocate @cur
go

