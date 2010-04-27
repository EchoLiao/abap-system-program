

/* 创建存储过程,用于求在所有借书的同学中,借书量第二多的同学(用游标) */
use xsbook
if exists(select name from sysobjects where name='SecondStuBo' and type='p')
	drop procedure SecondStuBo

go
create procedure SecondStuBo
	@cur CURSOR VARYING OUTPUT -- 存储过程中的游标参数必须以 OUTPUT 和 VARYING 选项来声明，并且必须以下列顺序指定: CURSOR VARYING OUTPUT。
	as
	set @cur=cursor static  -- absolute 只能用于static类型游标
	for
	select *
	from xs
	order by 借书数 desc
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

