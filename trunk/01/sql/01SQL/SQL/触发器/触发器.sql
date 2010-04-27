use xsbook
if exists(select name from sysobjects where name='tjy_insert' and type='tr')
	drop trigger tjy_insert
go
create trigger tjy_insert on jy
	for insert 
	as -- 对插入数据时生效
	if exists(select *
		from inserted a  /* 从inserted表中检查 */
		where a.借书证号 not in(select b.借书证号 from xs b) or
		a.isbn not in(select c.isbn from book c))
		or exists(select * from book where 库存量<=0)
		begin
			raiserror('违反数据的一致性(自定义触发器)',16,1)
			rollback transaction
		end
	else
		begin
			update xs
			set 借书数=借书数+1
			where xs.借书证号 in(select inserted.借书证号 from inserted)
			update book
			set 库存量=库存量-1
			where book.isbn in(select inserted.isbn from inserted)
		end
go

if exists(select name from sysobjects where name ='JY_Insert' and type='p')
	drop procedure JY_Insert 
go
create procedure JY_Insert  -- 创建插入借书记录的存储过程 
	@jszh char(8), @isbn char(15), @ssh char(15), @jssj datetime
	as
	insert into jy
	values(@jszh, @isbn, @ssh, @jssj)
go

exec JY_Insert '10000001', '7-332-22200-3', '1000000011','2008-12-22'  -- 因库存量为0, 所以执行不成功 
go