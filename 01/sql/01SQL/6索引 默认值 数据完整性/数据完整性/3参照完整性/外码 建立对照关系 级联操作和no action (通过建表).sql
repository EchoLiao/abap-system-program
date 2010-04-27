
use xsbook
if exists(select name from sysobjects where name='JY1' and type='U')
	drop table JY1  -- 注意这条命令放在这里与放在((1))处的区别!!!!!!!!!!
if exists(select name from sysobjects where name='BOOK1' and type='U')
	drop table BOOK1
if exists(select name from sysobjects where name='XS1' and type='U')
	drop table XS1
/* --------------------------------------------------------------------------------------((1))
if exists(select name from sysobjects where name='JY1' and type='U')
	drop table JY1 */
create table xs1 /* 主表 */
(	 借书证号 char(8) NOT NULL
		constraint xh_pk primary key,
	 姓名 char(12) not null,
	 专业名 char(20) not null,
	 性别 bit not null,
	 出生日期 smalldatetime not null,
	 借书数 tinyint check(借书数>=0 and 借书数<=20),
	 照片 image null
)
go
create table book1 /* 主表 */
(	isbn char(16) not null constraint b_uk unique,
	书名  	char(26) not null,
	作者 char(8) not null,
	出版社 char(20) not null,
	价格 float(7) not null check (价格<=250),
	复本量 smallint not  null,
	库存量 smallint not null
)
go
create table jy1 /* 从表 */
( 	借书证号 char(8) not null foreign key  /* 外码 */
		references xs1(借书证号)
 			on delete cascade on update cascade, --采用级联操作
	isbn char(16) not null foreign key  /* 外码 */
		references book1(isbn)
			on delete no action on update no action,  --采用no action操作
	成绩 smallint,
	学分 smallint
)
go

