
/* 
case  expression
		when x1 then xx1
		when x2 then xx2
		[.....n]
		[else xx]
	end
*/
use xsbook
select 借书证号 , sex=
	case 性别
		when 0 then '男生'
		when 1 then '女生'
	end -- 该函数结束标志
	from xs
go