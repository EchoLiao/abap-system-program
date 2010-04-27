/* 在jy表上创建一个触发器, 若对借书证号和isbn列修改, 则提示信息, 并取消修改 */
--方法1
use xsbook
go
create trigger update_trigger1
	on jy
	for update
	as
	if update(借书证号) or update(isbn)
	begin 
		raiserror('违反数据一致性',16,1)
		rollback transaction
	END
GO

--方法2
go
create trigger update_trigger2
	on jy
	for update
	as
	--if update(借书证号) or update(isbn)
	if(columns_updated() & 3)>0 -- 调用columns_updated函数, 检查是否已被修改, 若被修改则取消修改
	begin 
		raiserror('违反数据一致性',16,1)
		rollback transaction
	END
GO