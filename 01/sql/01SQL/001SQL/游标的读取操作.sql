
use st

declare ageSecond cursor scroll 
	for
	select Sage
	from student
	order by Sage desc
go
--set  ageSecond = cursor dynamic

open ageSecond
fetch absolute 2 from ageSecond;
fetch absolute 2 from ageSecond;
fetch next from ageSecond;
fetch first from ageSecond; 
fetch last from ageSecond;
fetch relative -3 from ageSecond;
fetch absolute 3 from ageSecond;
/* fetch absolute {n|@nvar} n为正,读取从游标开始的第n行并将读取的行变成新的当前行; n若为负数,则读取游标尾之前的第n行并将读取的行变成当前行; 若n为0,则没有返回.
 * fetch relative {n|@nvar} n为正,读取从当前行后的第n行并将读取的行变成新的当前行; n若为负数,则读取当前行之前的第n行并将读取的行亦成当前行; 若n为0,则返回当前行;
		若n为0或负数且是对游标的第一次读取,则没有返回.
 * fetch next  读取当前行的下一行,并将读取的行变成新的当前行; 若是第一次对游标读取,则返回第一行. 此项游标默认的选项.
 * fetch prior 读取当前行的前一行,并将读取的行变成新的当前行; 若是第一次对游标读取,则没有返回,且游标置于第一行之前.
 * fetch first 读取游标中的第一行,并将其作为当前行.
 * fetch last  读取游标中的最后一行,并将其作为当前行.
 */
close ageSecond
deallocate ageSecond
go