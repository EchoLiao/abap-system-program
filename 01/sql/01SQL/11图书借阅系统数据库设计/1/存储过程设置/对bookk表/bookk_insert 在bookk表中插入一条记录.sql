
use xsbookk
go
create procedure bookk_insert
	@isbn char(16), @sm char(26), @zz char(8), @cbs char(20), @jg float, @fbl smallint, @kcl smallint
	as 
	insert into bookk(isbn, 书名, 作者, 出版社, 价格, 复本量, 库存量)
		values(@isbn, @sm, @zz, @cbs, @jg, @fbl, @kcl)
go