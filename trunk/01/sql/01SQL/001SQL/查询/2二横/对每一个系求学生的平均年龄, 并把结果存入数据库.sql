
/* ��ÿһ��ϵ��ѧ����ƽ������, ���ѽ���������ݿ� */

/*
use st

if exists(select name from sysobjects where name='AvgAgeSdeptView' and type='v')
	drop view avgagesdeptview
go */ /*
create view AvgAgeSdeptView(Sdept, avgAge) /* �������Ǵ��, ��Ϊ�����û�������ش������ݿ� */
as
select Sdept, avg(sage)
from student 
group by sdept
go*/


use st
if exists(select name from sysobjects where name='avgSdeptAge' and type='u')
	drop table avgSdeptAge
go
create table avgSdeptAge
	(Sdept char(10) not null primary key, 
	avgAge smallint
	)
go

insert into avgSdeptAge(Sdept, avgAge)
select Sdept, avg(sage)
from student
group by sdept
