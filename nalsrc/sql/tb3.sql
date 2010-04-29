use SCR
if exists(select name from sysobjects where name='ykptt' and type='U')
	drop table ykptt -- ��Ʊ
if exists(select name from sysobjects where name='yhbbz' and type='U')
	drop table yhbbz -- ���ұ���
if exists(select name from sysobjects where name='yfplx' and type='U')
	drop table yfplx -- ��Ʊ����
if exists(select name from sysobjects where name='yship' and type='U')
	drop table yship -- ����
if exists(select name from sysobjects where name='ysbh' and type='U')
	drop table ysbh -- ������
if exists(select name from sysobjects where name='ysgj' and type='U')
	drop table ysgj -- ���乤��
if exists(select name from sysobjects where name='yphtt' and type='U')
	drop table yphtt -- ���
if exists(select name from sysobjects where name='yphdt' and type='U')
	drop table yphdt -- �����
if exists(select name from sysobjects where name='ykctt' and type='U')
	drop table ykctt -- ���
if exists(select name from sysobjects where name='ycktt' and type='U')
	drop table ycktt -- �ֿ�
if exists(select name from sysobjects where name='ydhxx' and type='U')
	drop table ydhxx -- ������Ϣ
if exists(select name from sysobjects where name='yqdht' and type='U')
	drop table yqdht -- ǩ����ͬ
if exists(select name from sysobjects where name='ydhdt' and type='U')
	drop table ydhdt -- ������
if exists(select name from sysobjects where name='yhtlx' and type='U')
	drop table yhtlx -- ��ͬ����
if exists(select name from sysobjects where name='yxsfw' and type='U')
	drop table yxsfw  -- ���۷�Χ
if exists(select name from sysobjects where name='yfxqd' and type='U')
	drop table yfxqd -- ��������
if exists(select name from sysobjects where name='yxbzc' and type='U')
	drop table yxbzc -- ���۰칫�����
if exists(select name from sysobjects where name='yxsbg' and type='U')
	drop table yxsbg -- ���۰칫��
if exists(select name from sysobjects where name='yxxzc' and type='U')
	drop table yxxzc -- ����С���Ա���
if exists(select name from sysobjects where name='yxsxz' and type='U')
	drop table yxsxz -- ����С��
if exists(select name from sysobjects where name='yprod' and type='U')
	drop table yprod -- ��Ʒ
if exists(select name from sysobjects where name='yzytt' and type='U')
	drop table yzytt -- ְԱ
if exists(select name from sysobjects where name='yqxtt' and type='U')
	drop table yqxtt -- Ȩ��
if exists(select name from sysobjects where name='ykhtt' and type='U')
	drop table ykhtt -- �ͻ�
if exists(select name from sysobjects where name='yzhtt' and type='U')
	drop table yzhtt -- �˻�
if exists(select name from sysobjects where name='yzhsy' and type='U')
	drop table yzhsy -- �˻�����
if exists(select name from sysobjects where name='yzhhz' and type='U')
	drop table yzhhz -- �˻���

create table yzhhz -- �˻���
(
 id char(3) not null,
 cha char(10) not null,
 note char(100),
 constraint yzhhz_pk primary key (id),
)

create table yzhsy -- �˻�����
(
 id char(3) not null,
 levl int not null constraint zhyu_levl_df default 0,
 constraint zhyu_pk primary key (id),
)

create table yzhtt -- �˻�
(
 id char(9) not null,
 name char(20) not null,
 tel char(15) not null,
 addr char(100) not null,
 yzhhzid char(3) not null,
 yzhsyid char(3) not null,
 constraint yzhtt_pk primary key (id),
 constraint yzhtt_yzhhzid_fk foreign key (yzhhzid) references yzhhz(id),
 constraint yzhtt_sy_fk foreign key (yzhsyid) references yzhsy(id),
)

create table ykhtt -- �ͻ�
(
 id char(9) not null,
 shdfid char(9) not null,
 sodfid char(9) not null,
 shpfid char(9) not null,
 fukfid char(9) not null,
 constraint ykhtt_pk primary key (id),
 constraint ykhtt_shdfid_fk foreign key (shdfid) references yzhtt(id),
 constraint ykhtt_sodfid_fk foreign key (sodfid) references yzhtt(id),
 constraint ykhtt_shpfid_fk foreign key (shpfid) references yzhtt(id),
 constraint ykhtt_fukfid_fk foreign key (fukfid) references yzhtt(id),
)

create table yqxtt -- Ȩ��
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint yqxtt_pk primary key (id),
)

create table yzytt -- ְԱ
(
 id char(9) not null,
 name char(20) not null,
 sex char(8) not null,
 addr char(100) not null,
 tel char(15) not null,
 email char(20),
 levl char(20),
 priv char(3) not null,
 constraint yzytt_pk primary key (id),
 constraint yzytt_priv_fk foreign key (priv) references yqxtt(id),
)

create table yprod -- ��Ʒ
(
 id char(9) not null,
 name char(20) not null,
 note char(100),
 constraint yprod_pk primary key (id),
)

create table yxsxz -- ����С��
(
 id char(3) not null,
 name char(20) not null,
 leader char(9) not null, -- �鳤
 hotpro char(9) not null, -- ������Ʒ
 riqi char(10), -- ��������
 note char(100),
 constraint yxsxz_pk primary key (id),
 constraint yxsxz_leader_fk foreign key (leader) references yzytt(id),
 constraint yxsxz_hotpro_fk foreign key (hotpro) references yprod(id),
)

create table yxxzc -- ����С���Ա���
(
 yxsxzid char(3) not null, -- ����С��
 yzyttid char(9) not null, -- ��Ա
 riqi char(10), -- ��������
 constraint yxxzc_pk primary key (yxsxzid, yzyttid),
 constraint yxxzc_yxsxzid_fk foreign key (yxsxzid) references yxsxz(id),
 constraint yxxzc_yzyttid_fk foreign key (yzyttid) references yzytt(id),
)

create table yxsbg -- ���۰칫��
(
 id char(3) not null,
 name char(20) not null,
 leader char(9) not null, -- �칫������
 addr char(100) not null,
 tel char(15) not null,
 riqi char(10), -- ��������
 note char(100),
 constraint yxsbg_pk primary key (id),
 constraint yxsbg_leader_fk foreign key (leader) references yzytt(id),
)

create table yxbzc -- ���۰칫�����
(
 yxsbgid char(3) not null, -- �칫��
 yxsxzid char(3) not null, -- С��
 riqi char(10), -- ��������
 constraint yxbzc_pk primary key (yxsbgid, yxsxzid),
 constraint yxbzc_yxsbgid_fk foreign key (yxsbgid) references yxsbg(id),
 constraint yxbzc_yxsxzid_fk foreign key (yxsxzid) references yxsxz(id),
)

create table yfxqd -- ��������
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint yfxqd_pk primary key (id),
)

create table yxsfw -- ���۷�Χ
(
 id char(9) not null,
 yxsbgid char(3) not null, -- ���۰칫��
 yxsxzid char(3) not null, -- ����С��
 xsdbid char(9) not null, -- ���۴���
 yfxqdid char(3) not null, -- ��������
 constraint yxsfw_pk primary key (id),
 constraint yxsfw_yxsbgid_fk foreign key (yxsbgid) references yxsbg(id),
 constraint yxsfw_yxsxzid_fk foreign key (yxsxzid) references yxsxz(id),
 constraint yxsfw_xsdbid_fk foreign key (xsdbid) references yzytt(id),
 constraint yxsfw_yfxqdid_fk foreign key (yfxqdid) references yfxqd(id),
)

create table yhtlx -- ��ͬ����
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint yhtlx_pk primary key (id),
)

create table ydhdt -- ������
(
 id char(9) not null,
 yxsfwid char(9) not null, -- ���۷�Χ
 shdfid char(9) not null, -- �۴﷽
 riqi char(10) not null,
 note char(100),
 constraint ydhdt_pk primary key (id),
 constraint ydhdt_yxsfwid_fk foreign key (yxsfwid) references yxsfw(id),
 constraint ydhdt_shdfid_fk foreign key (shdfid) references yzhtt(id),
)

create table yqdht -- ǩ����ͬ
(
 yxsfwid char(9) not null, -- ���۷�Χ
 ydhdtid char(9) not null, -- ������
 shdfid char(9) not null, -- �۴﷽
 class char(3) not null,  -- ��ͬ����
 riqi char(10) not null,
 feild char(60),
 note char(100),
 constraint yqdht_pk primary key (yxsfwid, ydhdtid, shdfid),
 constraint yqdht_yxsfwid_fk foreign key (yxsfwid) references yxsfw(id),
 constraint yqdht_ydhdtid_fk foreign key (ydhdtid) references ydhdt(id),
 constraint yqdht_sdftid_fk foreign key (shdfid) references yzhtt(id),
 constraint yqdht_class_fk  foreign key (class)  references yhtlx(id),
)

create table ydhxx -- ������Ϣ
(
 ydhdtid char(9) not null, -- ������
 yprodid char(9) not null, -- ��Ʒ
 count  int not null,
 note char(100),
 constraint ydhxx_pk primary key (ydhdtid, yprodid),
 constraint ydhxx_ydhdtid_fk foreign key (ydhdtid) references ydhdt(id),
 constraint ydhxx_yprodid_fk foreign key (yprodid) references yprod(id),
)

create table ycktt -- �ֿ�
(
 id char(3) not null,
 leader char(9) not null,
 name char(20) not null,
 addr char(100) not null,
 tel char(15) not null,
 constraint ycktt_pk primary key (id),
 constraint chtt_leader_fk foreign key (leader) references yzytt(id),
)

create table ykctt -- ���
(
 yprodid char(9) not null, -- ��Ʒ
 yckttid char(3) not null, -- �ֿ�
 count int not null,
 note char(100),
 constraint ykctt_pk primary key (yprodid, yckttid),
 constraint ykctt_yprodid_fk foreign key (yprodid) references yprod(id),
 constraint ykctt_yckttid_fk foreign key (yckttid) references ycktt(id),
)

create table yphdt -- �����
(
 id char(9) not null,
 riqi char(10) not null,
 note char(100),
 constraint yphdt_pk primary key (id),
)

create table yphtt -- ���
(
 ydhdtid char(9) not null,
 yphdtid char(9) not null,
 count int not null,
 note char(100),
 constraint yphtt_pk primary key (ydhdtid, yphdtid),
 constraint yphtt_ydhdtid_fk foreign key (ydhdtid) references ydhdt(id),
 constraint yphtt_yphdtid_fk foreign key (yphdtid) references yphdt(id),
)

create table ysgj -- ���乤��
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint ysgj_pk primary key (id),
)

create table ysbh -- ������
(
 id char(9) not null,
 srcaddr char(20) not null,
 desaddr char(20) not null,
 srcriqi char(10) not null,
 desriqi char(10) not null,
 ysgjid char(3) not null,
 route char(100),
 note char(100),
 constraint ysbh_pk primary key (id),
 constraint ysbh_ysgj_fk foreign key (ysgjid) references ysgj(id),
)

create table yship -- ����
(
 ysbhid char(9) not null, -- ������
 yphdtid char(9) not null, -- �����
 sodfid char(9) not null, -- �ʹ﷽
 note char(100),
 constraint yship_pk primary key (ysbhid, yphdtid),
 constraint yship_ysbhid_fk foreign key (ysbhid) references ysbh(id),
 constraint yship_yphdtid_fk foreign key (yphdtid) references yphdt(id),
 constraint yship_sodfid_fk foreign key (sodfid) references yzhtt(id),
)

create table yfplx -- ��Ʊ����
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint yfplx_pk primary key (id),
)

create table yhbbz -- ���ұ���
(
 id char(3) not null,
 name char(20) not null,
 constraint yhbbz_pk primary key (id),)

create table ykptt -- ��Ʊ
(
 yphdtid char(9) not null, -- �����
 sodfid char(9) not null, -- �ʹ﷽
 shpfid char(9) not null, -- ��Ʊ��
 fukfid char(9) not null, -- ���
 riqi  char(10) not null, -- 
 class  char(3) not null, -- ��Ʊ����
 price float not null, -- ë��
 taxlv float not null, -- ˰��
 bz char(3) not null,   -- ����
 note char(100),
 constraint ykptt_pk primary key (yphdtid, sodfid, shpfid, fukfid),
 constraint ykptt_yphdtid_fk foreign key (yphdtid) references yphdt(id),
 constraint ykptt_sodfid_fk foreign key (sodfid) references yzhtt(id),
 constraint ykptt_shpfid_fk foreign key (shpfid) references yzhtt(id),
 constraint ykptt_fukfid_fk foreign key (fukfid) references yzhtt(id),
 constraint ykptt_class_fk  foreign key (class)  references yfplx(id),
 constraint ykptt_bz_fk	   foreign key (bz)     references yhbbz(id),
)
