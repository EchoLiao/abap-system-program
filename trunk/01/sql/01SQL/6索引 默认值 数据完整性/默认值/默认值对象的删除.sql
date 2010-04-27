USE XSBOOK
IF EXISTS(SELECT name from sysobjects where name='birthdate' and type='d')
	begin
		exec sp_unbindefault 'birthday_date' /* 解除绑定关系 */
		drop default birthday /* 删除默认值对象 */
	end