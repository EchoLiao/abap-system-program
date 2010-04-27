
use xsbookkk
go
create procedure bookkk_insert
	@isbn char(16), @sm char(26), @zz char(8), @cbs char(20), @jg float, @fbl smallint, @kcl smallint
	as 
	insert into bookkk(isbn, sm, zz, cbs, jg, fbl, kcl)
		values(@isbn, @sm, @zz, @cbs, @jg, @fbl, @kcl)
go