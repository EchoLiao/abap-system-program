/* 使用带有提示消息的触发器 */

use xsbook
if exists(select name from sysobjects where name='reminder' and type='tr')
	drop trigger reminder
go
create trigger reminder
	on xs
	for insert, update
	as raiserror(40008,16,10)
go