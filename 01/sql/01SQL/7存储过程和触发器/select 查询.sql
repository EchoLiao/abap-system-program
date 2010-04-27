use xsbook
select  书名,count(b.isbn) as 借阅次数
	from historytable a , book b
	where a.isbn=b.isbn and 书名 like 'WEB程序设计' and 借书时间>='2008-01-01' and 借书时间<='2008-12-12'
	group by 书名
go