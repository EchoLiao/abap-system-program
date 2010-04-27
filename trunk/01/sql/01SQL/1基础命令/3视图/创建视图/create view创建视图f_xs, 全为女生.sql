/* 创建视图f_xs, 全为女生 */
create view f_xs
as
select *
from xs
where 性别=1
with check option
/*
select  * --借书证号,姓名,借书量
from f_xs
where 专业名='计算机'
*/