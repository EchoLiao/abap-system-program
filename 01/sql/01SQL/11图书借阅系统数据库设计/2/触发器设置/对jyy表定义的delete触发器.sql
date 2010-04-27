-- E:\liaocaiyuan\Documents\01SQL\11图书借阅系统数据库设计\触发器设置

use xsbookkk
go

use xsbookkk
if  exists(select name from sysobjects where name='tjyyy_delete' and type='tr')
	drop trigger tjyyy_delete
go
create trigger tjyyy_delete on jyyy
	for delete 
	as
	begin
		update xsss   
			set jsl=jsl-1
				where xsss.jszh in (select deleted.jszh from deleted)
		update bookkk
			set kcl=kcl+1
				where bookkk.isbn in (select deleted.isbn from deleted)
	end
go