use xsbook
go 
if exists(select name from sysobjects where name='tel_rule' and type='r')
	begin
		exec sp_unbindrule 'telphone' -- 解除绑定
		drop rule tel_rule /* 写成'tel_rule' 是错的 *//* 删除规则对象 */
	end
go