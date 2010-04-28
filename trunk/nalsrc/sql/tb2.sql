use scr
if exists(select name from sysobjects where name='xplx' and type='U')
	drop table xplx -- ��Ʒ���� 
if exists(select name from sysobjects where name='xptt' and type='U')
	drop table xptt -- ��Ʒ 
if exists(select name from sysobjects where name='khsy' and type='U')
	drop table khsy -- �ͻ�����
if exists(select name from sysobjects where name='khtt' and type='U')
	drop table khtt -- �ͻ� 
if exists(select name from sysobjects where name='bjxx' and type='U')
	drop table bjxx -- ������Ϣ


create table xplx -- ��Ʒ���� 
(
 id char(3) not null,
 name char(20) not null,
 constraint xplx_pk primary key (id),
)

create table xptt -- ��Ʒ 
(
 id char(9) not null,
 name char(30) not null,
 class char(3) not null,
 constraint xptt_pk primary key (id),
 constraint xptt_class_fk key (class) references xplx(id),
)

create table khsy -- �ͻ����� 
(
 id char(3) not null,
 levl int not null constraint shyu_levl_df default 2,
 constraint shyu_pk primary key (id),
)

create table khtt -- �ͻ� 
(
 id char(9) not null,
 name char(20) not null,
 tel char(15) not null,
 addr char(60) not null,
 syid char(3) not null,
 constraint khtt_pk primary key (id),
 constraint khtt_sy_fk foreign key (syid) references khsy(id),
)

create table bjxx -- ������Ϣ 
(
 xpid char(9) not null,
 khid char(9) not null,
 constraint bjxx_pk primary key (xpid, khid),
)

create table ddtt -- ���� 
(
 id char(9) not null,
 note char(100),
 constraint ddtt_pk primary key (id),
)

create table htxs -- ��ͬ���� 
(
 id char(9) not null,
 sx char(100) not null,
 constraint htxs_pk primary key (id),
)

create table qdht -- ǩ����ͬ
(
 khid char(9) not null,
 ddid char(9) not null,
 sx char(9) not null,
 rq char(10) not null,
 note char(100),
 constraint qdht_pk primary key (khid, ddid),
 constraint qdht_khid_fk foreign key (khid) references khtt(id),
 constraint qdht_ddid_fk foreign key (ddid) references ddtt(id),
 constraint qdht_sx_fk foreign key (sx) references htxs(id),
)

create table qddd


