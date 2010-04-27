
declare cursor_name cursor
	[local | global]  				/* 游标的作用域 */
	[forward_only | scroll] 			/* 游标移动方向 */
	[static | keyset | dynamic | fast_forward ]	/* 游标类型 */
	[read_only | scroll_locks | optimistic]		/* 访问属性 */
	[type_warning]					/* 类型转换警告信息 */
	FOR　select_statement				/* select查询语句 */
	[FOR update OF [column_name [,...n]]] 		/* 可修改的列 */




open {{[globl]cursor_name} | cursor_varialbe_name}




fetch
	[[next | prior | first | last | absolute {n|@nvar} | relative{n|@nvar}]
	FROM ]
	{{[global] cursor_name} | @cursor_variable_name}
	[INTO @variable_name[,...n]]
/* fetch absolute {n|@nvar} n为正,读取从游标开始的第n行并将读取的行变成新的当前行; n若为负数,则读取游标尾之前的第n行并将读取的行变成当前行; 若n为0,则没有返回.
 * fetch relative {n|@nvar} n为正,读取从当前行后的第n行并将读取的行变成新的当前行; n若为负数,则读取当前行之前的第n行并将读取的行亦成当前行; 若n为0,则返回当前行;
		若n为0或负数且是对游标的第一次读取,则没有返回.
 * fetch next  读取当前行的下一行,并将读取的行变成新的当前行; 若是第一次对游标读取,则返回第一行. 此项游标默认的选项.
 * fetch prior 读取当前行的前一行,并将读取的行变成新的当前行; 若是第一次对游标读取,则没有返回,且游标置于第一行之前.
 * fetch first 读取游标中的第一行,并将其作为当前行.
 * fetch last  读取游标中的最后一行,并将其作为当前行.
 */




close {{[globl]cursor_name} | cursor_varialbe_name}





deallocate {{[globl]cursor_name} | cursor_varialbe_name}  /* 删除游标 */














