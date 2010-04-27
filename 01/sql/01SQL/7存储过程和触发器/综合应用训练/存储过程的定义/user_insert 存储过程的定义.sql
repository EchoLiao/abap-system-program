use xsbook
if exists(select name from sysobjects where name='user_insert' and type='p')
	drop procedure user_insert
go
create procedure user_insert
	@uname1 char(8), @uname2 char(8), @pass char(10), @grade integer
	as
	if exists(select * from users where username=@uname1 and @grade=1) /* �û��ȼ�: 1Ϊϵͳ����Ա, 2Ϊ��ͨ�û� */
		insert into users(username, pass, grade)
			values(@uname2, @pass, @grade)
go