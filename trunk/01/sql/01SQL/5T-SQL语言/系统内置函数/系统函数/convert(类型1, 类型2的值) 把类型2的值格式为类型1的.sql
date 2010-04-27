
/* convert(类型1, 类型2的值) 把类型2的值格式为类型1的 */
use xsbook
select isbn, 书名, 库存量
	from book
	where convert(char(20),库存量) like'_' and 库存量>2 and 库存量<50 -- like'_' 是什么意思???????????
go