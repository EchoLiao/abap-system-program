
/*  ����һ��ѡ�μ�¼ */
use st
insert into sc
	values('200215126', '2', 79)
go

insert into sc
	values('200215128', '7', NULL) --���������, ��Ϊ��"insert into sc", ������"insert into sc( sno,cno);  GradeΪNULL, 
go

insert into sc(sno, cno)
	values('200215128','6') -- GradeΪĬ��ֵ0
go