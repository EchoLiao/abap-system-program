
/* 在xsbook数据库的xs表中声明并打开一个游标 */
use xsbook
if exists(select name from sysobjects where name='reader_cursor' and type='p')
	drop procedure reader_cursor
go
create procedure reader_cursor 
	@reader_cur cursor varying output
	as
	set @reader_cur=cursor forward_only static /* 设置游标: 只能向前, 静态 */
	for -- 后接要(可以)执行的操作 如写成:for update of 姓名 , 意思则为: 可以对姓名作修改.
	select 借书证号, 姓名, 专业名, 出生时间
		from xs
	open @reader_cur
go

declare @mycursor cursor   -- 声明一个局部游标
exec reader_cursor @mycursor output /* 在创建表和使用output变量时, 都必须对output变量进行定义 */
fetch next from @mycursor -- 从游标中读取数据
while(@@fetch_status=0) -- 如果读取成功, 则返回0, 否则返回-1表示读取的行不在结果集中, -2表示要读取的行已不存在 .
  begin
	fetch next from @mycursor -- 从游标中读取数据
	--select @@cursor_rows
  end 
close @mycursor  /* 关闭游标 */
deallocate @mycursor /* 删除游标 */
go
select @@cursor_rows
go


