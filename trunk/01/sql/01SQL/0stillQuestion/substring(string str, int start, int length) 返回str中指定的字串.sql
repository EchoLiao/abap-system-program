-- E:\liaocaiyuan\Documents\01SQL\5T-SQL语言\系统内置函数

-- substring(string str, int start, int length) 返回str中指定的字串.
use xsbook
select substring(姓名,1,1) as 姓, substring(姓名,2,len(姓名)-1)as 名字 
	from xs
	order by 姓名 -- order by 是什么意思????????????