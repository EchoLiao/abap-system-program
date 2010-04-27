
/* rand(seed) 产生随机数, seed为种子, 产生的随机数大于0小于1 */
declare @count int
set @count=5666662
select rand(@count)as Rand_num
