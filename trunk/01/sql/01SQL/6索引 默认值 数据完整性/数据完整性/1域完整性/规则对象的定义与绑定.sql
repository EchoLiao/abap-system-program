/* 规则对象的定义 */
USE XSBOOK 
GO
CREATE RULE num_rule
	AS @num like '[1-6][1-6][1-9][1-9][1-9][1-9][1-9][1-9]' /* @num 为任意输入的局部变量 */
go
exec sp_bindrule 'num_rule', 'xs.借书证号'
go