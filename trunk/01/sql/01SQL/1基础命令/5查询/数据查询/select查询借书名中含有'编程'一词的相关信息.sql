select xs.借书证号, jy.iSbn,  书名,出版社, 专业名, 出生时间 
from  XS,BOOK,JY
where 书名 like '%编程%'and xs.借书证号 = jy.借书证号  and jy.isbn = book.isbn