use xsbook
if exists(select name from sysobjects where name='reader_info' and type='p')
	drop procedure reader_info
go
create procedure reader_info
	@lib_num varchar(8)='10000001' /* 声明局部变量 */ -- 如要在查询中使用通配符, 则必须使用varchar类型
	as
	select a.借书证号,a.姓名, c.书名, b.借书时间
	from xs a, jy b, book c
	where a.借书证号=b.借书证号 and b.isbn=c.isbn
	 and a.借书证号 like @lib_num
go
exec reader_info @lib_num= '20000005'/* 或换成下面这条语句 */
exec reader_info '20000005'
exec reader_info /* 使用参数 */
exec reader_info '1%'
go