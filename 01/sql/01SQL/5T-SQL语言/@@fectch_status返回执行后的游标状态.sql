

use xsbook
declare @name char(20), @st_id char(2)

declare readers_cursor cursor --声明一个游标           --默认为只进游标
	for
	select 借书证号, 姓名
		from xs
	
open readers_cursor -- 打开游标
-- fetch next from readers_cursor into @name, @st_id
          -- fetch next  读取当前行的下一行, 并把它置为当前行. 如果是第一次读取,则读取的是第一行.
fetch  next from readers_cursor --into @name, @st_id  -- fetch 默认为 fetch next
--select @name, @st_id  

while @@fetch_status=0 -- 返回fetch语句执行的游标状态,所以要应用@@fetch_status,之前必须最少执行过一条fetch语句
	begin 	
		fetch from readers_cursor
		--select @name, @st_id
	end 
         -- 之前读取完了, 就不再有了, 也就不能再读取了.
while @@fetch_status=0  
	begin 	
		fetch from readers_cursor
		--select @name, @st_id
	end  
close readers_cursor  -- 关闭游标
deallocate readers_cursor  -- 删除游标
	