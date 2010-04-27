--E:\liaocaiyuan\Documents\01SQL\索引 默认值 数据完整性\综合应用训练
use xsbook
if exists(select name from sysobjects where name='view3' and type='v')
 	drop view view3
go
create view view3 with schemabinding  -- 定义一个由借书证号,2008年借书量构成的视图view2  
	as
	select  isbn, count(isbn) as 借阅次数 /* count() 用于统计总行数 */
		from [dbo].historytable  /* 必须写成这样, 如果改成" from historytable" 却不可以???为什么?????? */
		where datepart(yyyy, 借书时间)='2008'
		group by isbn
go
if exists(select name from sysobjects where name='temptable2' and type='u')
	drop table temptable2
go
select *   -- 根据视图view3创建表temptable, 以便创建索引
	into temptable2
	from view3
go

SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
go

alter table temptable2
	add constraint tem_pk2
	primary key clustered (isbn)
go 

create index ind2
	on dbo.temptable2(借阅次数 desc) 
go 

select  temptable2.isbn,书名,出版社,借阅次数
	from temptable2,book
	--where temptable2.isbn=xs.isbn
	where temptable2.isbn=book.isbn
	--group by temptable2.isbn, 借阅次数,书名, 出版社 --把这条语句换成下面那条也可以,为什么呢????
	order by 借阅次数 desc
go