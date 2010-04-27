use xsbookkk
create table users 
(	username char(8) not null constraint users_pk primary key ,
	passwd char (10) not null,
	grade smallint not null
)
go