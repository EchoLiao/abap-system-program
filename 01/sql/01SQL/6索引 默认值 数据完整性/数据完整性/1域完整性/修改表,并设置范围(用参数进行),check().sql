use xsbook
alter table xs
	add constraint card_constraint check(借书证号 like    /* 新增约束, card_constraint是约束名 */
	'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' and 借书证号 <> '00000000')
go