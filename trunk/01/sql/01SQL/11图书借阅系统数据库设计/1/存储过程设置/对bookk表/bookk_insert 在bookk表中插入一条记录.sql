
use xsbookk
go
create procedure bookk_insert
	@isbn char(16), @sm char(26), @zz char(8), @cbs char(20), @jg float, @fbl smallint, @kcl smallint
	as 
	insert into bookk(isbn, ����, ����, ������, �۸�, ������, �����)
		values(@isbn, @sm, @zz, @cbs, @jg, @fbl, @kcl)
go