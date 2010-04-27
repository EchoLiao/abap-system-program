
/* left(string str, int n) 返回str最左边的n个字符 */
use xsbook
select left(书名,5) -- 返回最左边的5个字符
	from book
	order by isbn
go