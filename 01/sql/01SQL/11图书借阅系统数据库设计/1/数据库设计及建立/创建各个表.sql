
use xsbookk
create table XSS /* ���� */ --------------------------------ѧ����Ϣ��
(	 ����֤�� char(8) NOT NULL constraint xss_pk primary key,
	 ���� char(8) not null,
	 רҵ�� char(12) not null,
	 �Ա� bit not null,
	 ����ʱ�� smalldatetime not null,
	 ������ tinyint not null check(������>=0 and ������<=20) CONSTRAINT def_jieshushu DEFAULT 0, -- �����ý���ֵĬ��ֵΪ0.
	 ��Ƭ image null,
	 filelen bigint
)
go

create table BOOKK /* ���� */ --------------------------------ͼ����Ϣ��
(	ISBN char(16) not null constraint bookk_pk primary key,  --constraint b_uk unique,
	����  	char(26) not null,
	���� char(8) not null,
	������ char(20) not null,
	�۸� float(7) not null check (�۸�<=250),
	������ smallint not  null,
	����� smallint not null
)
go

create table JYY /* �ӱ� */ ---------------------------------������Ϣ��
( 	����֤�� char(8) not null foreign key  /* ���� */
		references xss(����֤��)
 			on delete cascade on update cascade, --���ü�������
	ISBN char(16) not null foreign key  /* ���� */
		references bookk(isbn)
			on delete no action       
			on update no action,  --����no action����
	
	����� char(10) not null,
	����ʱ�� datetime not null
)
go

create table JYLSS -------------------------------------------������ʷ��
(	����֤�� char(8) not null,
	ISBN char(16)not null,
	����� char(10) not null,
	����ʱ�� datetime not null,
	����ʱ�� datetime not null
)
go
alter table JYLSS
	add constraint jylss_pk
	primary key clustered(�����,����ʱ��)  -- ��������Լ��    �������������������������.
go
