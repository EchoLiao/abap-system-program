
/* 创建存储过程, 用于查询已借书的同学的借书情况 */ 

use xsbook
if exists(select name from sysobjects where name='history_info' and type='p')
	drop procedure history_info
go
create procedure history_info
	as
	select a.借书证号, a.姓名,b.isbn, c.书名
	from xs a inner join historytable b on a.借书证号=b.借书证号 
		inner join book c on b.isbn=c.isbn /* inner join 运算: 组合两个表中的记录，只要在公共字段之中有相符的值 */
				/* 语法: FROM table1 INNER JOIN table2 ON table1.field1 compopr table2.field2 */


go
/*exec*/ history_info
go