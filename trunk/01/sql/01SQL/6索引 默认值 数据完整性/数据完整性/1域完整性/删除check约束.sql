USE XSBOOK
IF EXISTS (SELECT name FROM sysobjects WHERE name='card_constraint' and type='c')
	begin	
		alter table xs
			drop CONSTRAINT card_constraint /* ɾ��Լ��,��Լ������check()ʵ�ֵ�. */
	end
go