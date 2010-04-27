

use xsbookkk
go
create trigger tjyyy_insert on jyyy
	for insert -- 当向表插入数据时, insert触发器触发执行
	as
	begin
		update xsss
			set jsl=jsl+1
				where xsss.jszh in (select insertd.jszh from insertd)
		update bookkk
			set kcl=kcl-1
				where book.isbn in (select insertd.isbn from insertd)
	end
go