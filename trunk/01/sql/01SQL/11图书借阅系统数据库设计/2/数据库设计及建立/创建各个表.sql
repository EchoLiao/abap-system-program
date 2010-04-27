
use xsbookkk
create table XSSS /* 主表 */ --------------------------------学生信息表
(	 jszh char(8) NOT NULL constraint xsss_pk primary key,
	 xm char(8) not null,
	 zym char(12) not null,
	 xb bit not null,
	 cssj smalldatetime not null,
	 jsl tinyint not null check(jsl>=0 and jsl<=20) CONSTRAINT def_jieshuliang DEFAULT 0, -- 并设置借书值默认值为0.
	 zp image null,
	 filelen bigint
)
go

create table BOOKKK /* 主表 */ --------------------------------图书信息表
(	ISBN char(16) not null constraint bookkk_pk primary key,  --constraint b_uk unique,
	sm  	char(26) not null,
	zz char(8) not null,
	cbs char(20) not null,
	jg float(7) not null check (jg<=250),
	fbl smallint not  null,
	kcl smallint not null
)
go

create table JYYY /* 从表 */ ---------------------------------借阅信息表
( 	jszh char(8) not null foreign key  /* 外码 */
		references xsss(jszh)
 			on delete cascade on update cascade, --采用级联操作
	ISBN char(16) not null foreign key  /* 外码 */
		references bookkk(isbn)
			on delete no action       
			on update no action,  --采用no action操作
	
	ssh char(10) not null,
	jssj datetime not null
)
go

create table JYLSSS -------------------------------------------借阅历史表
(	jszh char(8) not null,
	ISBN char(16)not null,
	ssh char(10) not null,
	jssj datetime not null,
	hshj datetime not null
)
go
alter table JYLSSS
	add constraint jylsss_pk
	primary key clustered(ssh,jssj)  -- 建立主键约束    如果主键包含多列需这样创建.
go
