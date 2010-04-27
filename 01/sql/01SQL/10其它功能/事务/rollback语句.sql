
begin transaction
use xsbook

insert into book
	values('3-02-222222-x', '数据结构概论', '李红', '清华大学出版社',23,20,20)
save tran my_save

delete from book
	where isbn='3-02-222222-x'
rollback tran my_save -- 滚回到删除前, 所以等于没有删除.
commit tran
go