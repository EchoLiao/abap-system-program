
use xsbookk
go
create procedure bookk_update
	@isbn char(16), @sm char(26), @zz char(8), @cbs char(20), @jg float, @fbl smallint, @kcl smallint
	as 
	update bookk set
	 	书名=@sm, 作者=@zz, 出版社=@cbs, 价格=@jg, 复本量=@fbl, 库存量=@kcl
		where isbn=@isbn
go
