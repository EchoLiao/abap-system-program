select xs.借书证号, 姓名,专业名,
	 book.isbn, 书名, 作者, 出版社,  借书时间
from xs,book,jy
where 姓名 = '王娟' and xs.借书证号 = jy.借书证号 and jy.isbn = book.isbn
