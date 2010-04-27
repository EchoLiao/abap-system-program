
/*  插入一条选课记录 */
use st
insert into sc
	values('200215126', '2', 79)
go

insert into sc
	values('200215128', '7', NULL) --第三项不能少, 因为是"insert into sc", 而不是"insert into sc( sno,cno);  Grade为NULL, 
go

insert into sc(sno, cno)
	values('200215128','6') -- Grade为默认值0
go