use xsbook
select *
	from view4
go
insert into view4(bookkey,bookname,color,computedcol,pages)
	values(44,'科学与技术','蓝','红蓝',333) --44和'红蓝'字段是不起作用的, 因为触发器不是这样定义的.
go
select *
	from view4
go 

select *
	from books
go