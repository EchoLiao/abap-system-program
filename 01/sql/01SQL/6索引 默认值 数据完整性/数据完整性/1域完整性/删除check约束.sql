USE XSBOOK
IF EXISTS (SELECT name FROM sysobjects WHERE name='card_constraint' and type='c')
	begin	
		alter table xs
			drop CONSTRAINT card_constraint /* 删除约束,此约束是用check()实现的. */
	end
go