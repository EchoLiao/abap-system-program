-- E:\liaocaiyuan\Documents\01SQL\10其它功能\事务

declare @trans_name varchar(20)
set @trans_name='mytrans1' -- 用事务变量命名一个事务

begin transaction @trans_name  -- 事务开始
go
use xsbook
go
update  book
	set 复本量=复本量+4
	where 出版社='清华大学出版社'
go
--declare @trans_name varchar(20)
commit transaction @trans_name -- 事务提交 --为什么有错???????????????????????
go
