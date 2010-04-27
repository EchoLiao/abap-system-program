/* 查找每本图书的ISBN,书名以及借读的人数 */
use xsbook
select   jy.isbn, 书名,count( jy.isbn)as 借书数 /* count函数 用于统计表中满足条件的行数或总行数 */
from jy,book
where book.isbn = jy.isbn       --group by  jy.isbn ,书名 /* group by的作用是: 把行分成更小的部分 */ 
group by  jy.isbn ,book.书名 --如果不执行该条语句,则会得不到所要的信息,得出的是笛卡尔乘积.
                              /* "book.书名也可以写成 "书名" , 因为书名只存在于数据库的其中一个表中 */
-- union

select 借书证号, count(索书号)as 借书量
	from book, jy
	where jy.isbn=book.isbn and datepart(yyyy, 借书时间)='2008'
	group by 借书证号
go
