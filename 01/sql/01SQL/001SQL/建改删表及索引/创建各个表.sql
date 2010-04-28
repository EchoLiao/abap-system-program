use ST

if exists(select name from sysobjects where name='SC' and type='U')
	drop table SC

if exists(select name from sysobjects where name='Student' and type='U')
	drop table Student
go
create table Student
(Sno char(9) Not null ,
Sname char(8) not null,
Ssex char(2) not null constraint def_sex default '男',
Sage smallint Not null,
Sdept char(10) not null,
constraint student_pk primary key (Sno), -- 小括号不能少!!!!!!
-- [constraint student_pk] primary key (Sno) -- 小括号不能少!!!!!!
constraint sex_ck check(ssex in ('男','女')),
constraint Manname_ck check(ssex='女' or sname not like 'Ms.%'),
constraint Womenname_ck check(ssex='男' or sname not like 'Mr.%'),
)
go



if exists(select name from sysobjects where name='Course' and type='U')
	drop table Course
go
create table Course
(
Cno char(2) not null primary key,
Cname char(20) not null, 
Cpno char(2),-- foreign key references Course(Cno),
Ccredit smallint not null,
constraint course_fk1 foreign key (cpno) references course(cno),
)
go
alter table course
	add constraint def_credit default 0 for ccredit
go



if exists(select name from sysobjects where name='SC' and type='U')
	drop table SC
go
create table SC
(Sno char(9) not null foreign key references Student(Sno) on delete cascade on update cascade ,
Cno char(2) not null foreign key references Course(Cno),
Grade smallint check(Grade>=0)  default 0,
primary key (Sno,Cno),
constraint sc_fk2 foreign key (cno) references course(cno) on delete no action  on update cascade,
)

