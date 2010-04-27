
use xsbookkk
go
create procedure bookkk_update
	@isbn char(16), @sm char(26), @zz char(8), @cbs char(20), @jg float, @fbl smallint, @kcl smallint
	as 
	update bookkk set
	 	sm=@sm, zz=@zz, cbs=@cbs, jg=@jg, fbl=@fbl, kcl=@kcl
		where isbn=@isbn
go
