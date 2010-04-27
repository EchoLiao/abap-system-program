use scr
if exists(select name from sysobjects where name='shyu' and type='U')
	drop table shyu
if exists(select name from sysobjects where name='khtt' and type='U')
	drop table khtt
if exists(select name from sysobjects where name='sdft' and type='U')
	drop table sdft

create table shyu -- ���� 
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
 constraint khtt_sy_fk foreign key (syid) references shyu(id),
)

create table sdft  -- �۴﷽ 
( 
 id char(9) not null,
 khid char(9) not null,
 constraint sdft_pk primary key (id),
 constraint sdft_kh_fk foreign key (khid) references khtt(id),
)

create table xsxz
(
Sno char(9) Not null ,
Sname char(8) not null,
Ssex char(2) not null constraint def_sex default '��',
Sage smallint Not null,
Sdept char(10) not null,
constraint student_pk primary key (Sno), -- С���Ų�����!!!!!!
-- [constraint student_pk] primary key (Sno) -- С���Ų�����!!!!!!
constraint sex_ck check(ssex in ('��','Ů')),
constraint Manname_ck check(ssex='Ů' or sname not like 'Ms.%'),
constraint Womenname_ck check(ssex='��' or sname not like 'Mr.%'),
)
go
create table Course
(Cno char(2) not null primary key,
Cname char(20) not null, 
Cpno char(2),-- foreign key references Course(Cno),
Ccredit smallint not null,
constraint course_fk1 foreign key (cpno) references course(cno),
)

