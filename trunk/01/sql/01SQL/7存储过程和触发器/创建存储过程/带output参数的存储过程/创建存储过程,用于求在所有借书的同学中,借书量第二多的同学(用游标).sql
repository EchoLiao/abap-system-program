

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
	fetch absolute -1 from @cur
	close @cur
	deallocate @cur
go

declare @curr cursor 
exec SecondStuBo @curr output /*
fetch absolute 7 from @curr
fetch absolute -1 from @curr
while(@@fetch_status=0)
	begin
		fetch next from @cur
		--UNION 
	end 
close @curr
deallocate @curr
go */
