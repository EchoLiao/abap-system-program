use xsbook
go 
create table users
(	username char(8) not null,
	pass char(10) not null,
	grade integer not null,
	constraint user_pk primary key (username) /* 定义主键约束 */
)
go
