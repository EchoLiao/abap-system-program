
/* ltrim(string str) 删除str字符串的起始空格 */
declare @string varchar(50)
set @string='    中国,  一个古老的而伟大的国家  ' 
select ltrim(@string) -- 删除字符串起始的空格 
go