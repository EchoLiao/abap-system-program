
use xsbookk
create table XSS /* 主表 */ --------------------------------学生信息表
(	 借书证号 char(8) NOT NULL constraint xss_pk primary key,
	 姓名 char(8) not null,
	 专业名 char(12) not null,
	 性别 bit not null,
	 出生时间 smalldatetime not null,
	 借书量 tinyint not null check(借书量>=0 and 借书量<=20) CONSTRAINT def_jieshushu DEFAULT 0, -- 并设置借书值默认值为0.
	 照片 image null,
	 filelen bigint
)
go

create table BOOKK /* 主表 */ --------------------------------图书信息表
(	ISBN char(16) not null constraint bookk_pk primary key,  --constraint b_uk unique,
	书名  	char(26) not null,
	作者 char(8) not null,
	出版社 char(20) not null,
	价格 float(7) not null check (价格<=250),
	复本量 smallint not  null,
	库存量 smallint not null
)
go

create table JYY /* 从表 */ ---------------------------------借阅信息表
( 	借书证号 char(8) not null foreign key  /* 外码 */
		references xss(借书证号)
 			on delete cascade on update cascade, --采用级联操作
	ISBN char(16) not null foreign key  /* 外码 */
		references bookk(isbn)
			on delete no action       
			on update no action,  --采用no action操作
	
	索书号 char(10) not null,
	借书时间 datetime not null
)
go

create table JYLSS -------------------------------------------借阅历史表
(	借书证号 char(8) not null,
	ISBN char(16)not null,
	索书号 char(10) not null,
	借书时间 datetime not null,
	还书时间 datetime not null
)
go
alter table JYLSS
	add constraint jylss_pk
	primary key clustered(索书号,借书时间)  -- 建立主键约束    如果主键包含多列需这样创建.
go
