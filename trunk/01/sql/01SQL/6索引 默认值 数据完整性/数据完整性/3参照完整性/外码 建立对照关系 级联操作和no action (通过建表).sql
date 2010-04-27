
use xsbook
if exists(select name from sysobjects where name='JY1' and type='U')
	drop table JY1  -- ע����������������������((1))��������!!!!!!!!!!
if exists(select name from sysobjects where name='BOOK1' and type='U')
	drop table BOOK1
if exists(select name from sysobjects where name='XS1' and type='U')
	drop table XS1
/* --------------------------------------------------------------------------------------((1))
if exists(select name from sysobjects where name='JY1' and type='U')
	drop table JY1 */
create table xs1 /* ���� */
(	 ����֤�� char(8) NOT NULL
		constraint xh_pk primary key,
	 ���� char(12) not null,
	 רҵ�� char(20) not null,
	 �Ա� bit not null,
	 �������� smalldatetime not null,
	 ������ tinyint check(������>=0 and ������<=20),
	 ��Ƭ image null
)
go
create table book1 /* ���� */
(	isbn char(16) not null constraint b_uk unique,
	����  	char(26) not null,
	���� char(8) not null,
	������ char(20) not null,
	�۸� float(7) not null check (�۸�<=250),
	������ smallint not  null,
	����� smallint not null
)
go
create table jy1 /* �ӱ� */
( 	����֤�� char(8) not null foreign key  /* ���� */
		references xs1(����֤��)
 			on delete cascade on update cascade, --���ü�������
	isbn char(16) not null foreign key  /* ���� */
		references book1(isbn)
			on delete no action on update no action,  --����no action����
	�ɼ� smallint,
	ѧ�� smallint
)
go

