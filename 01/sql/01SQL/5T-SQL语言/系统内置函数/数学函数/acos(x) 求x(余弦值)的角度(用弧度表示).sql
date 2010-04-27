

/* acos(x) 求x(余弦值)的角度(用弧度表示) */
declare @angle real
set @angle=0
select 'the acos='+convert(varchar, acos(@angle))
go