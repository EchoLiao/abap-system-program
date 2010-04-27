use xsbook
if exists(select name from sysobjects where name='view2' and type='v')
 	drop view view2
go
create view view2 with schemabinding  -- 定义一个由借书证号,2008年借书量构成的视图view2  
	as
	select  借书证号, count(isbn) as 借书量 /* count() 用于统计总行数 */
		from [dbo].historytable  /* 必须写成这样, 如果改成" from historytable" 却不可以???为什么?????? */
		where datepart(yyyy, 借书时间)='2008'
		group by 借书证号 
go
if exists(select name from sysobjects where name='temptable' and type='u')
	drop table temptable
go
select *   -- 根据视图view2创建表temptable, 以便创建索引
	into temptable
	from view2
go

SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
go

alter table temptable
	add constraint tem_pk
	primary key clustered (借书证号)
go 

create index ind1
	on dbo.temptable(借书量 desc) 
go 

select  temptable.借书证号,姓名, 专业名,借书量
	from temptable, xs
	where temptable.借书证号=xs.借书证号
	group by temptable.借书证号, 姓名, 借书量 ,专业名
	--order by 借书量 desc
go