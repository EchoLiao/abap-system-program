-- 从库中查找出借书量最大的同学的有关信息
select 借书证号, 姓名 ,借书数,专业名
from xs
where 借书数= 
	(select max(借书数)  from xs)

--union  /* 表示在同一视图中显示出来, 若没有此语句,则会新建别一视图 */

select 借书证号, 姓名, 借书数, 专业名
from xs
where 借书数= (select min(借书数) from xs)
