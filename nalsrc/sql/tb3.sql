use SCR
if exists(select name from sysobjects where name='kptt' and type='U')
	drop table kptt -- ��Ʊ
if exists(select name from sysobjects where name='hbbz' and type='U')
	drop table hbbz -- ���ұ���
if exists(select name from sysobjects where name='fplx' and type='U')
	drop table fplx -- ��Ʊ����
if exists(select name from sysobjects where name='ship' and type='U')
	drop table ship -- ����
if exists(select name from sysobjects where name='ysbh' and type='U')
	drop table ysbh -- ������
if exists(select name from sysobjects where name='ysgj' and type='U')
	drop table ysgj -- ���乤��
if exists(select name from sysobjects where name='phtt' and type='U')
	drop table phtt -- ���
if exists(select name from sysobjects where name='phdt' and type='U')
	drop table phdt -- �����
if exists(select name from sysobjects where name='kctt' and type='U')
	drop table kctt -- ���
if exists(select name from sysobjects where name='cktt' and type='U')
	drop table cktt -- �ֿ�
if exists(select name from sysobjects where name='dhxx' and type='U')
	drop table dhxx -- ������Ϣ
if exists(select name from sysobjects where name='qdht' and type='U')
	drop table qdht -- ǩ����ͬ
if exists(select name from sysobjects where name='dhdt' and type='U')
	drop table dhdt -- ������
if exists(select name from sysobjects where name='htlx' and type='U')
	drop table htlx -- ��ͬ����
if exists(select name from sysobjects where name='xsfw' and type='U')
	drop table xsfw  -- ���۷�Χ
if exists(select name from sysobjects where name='fxqd' and type='U')
	drop table fxqd -- ��������
if exists(select name from sysobjects where name='xbzc' and type='U')
	drop table xbzc -- ���۰칫�����
if exists(select name from sysobjects where name='xsbg' and type='U')
	drop table xsbg -- ���۰칫��
if exists(select name from sysobjects where name='xxzc' and type='U')
	drop table xxzc -- ����С���Ա���
if exists(select name from sysobjects where name='xsxz' and type='U')
	drop table xsxz -- ����С��
if exists(select name from sysobjects where name='prod' and type='U')
	drop table prod -- ��Ʒ
if exists(select name from sysobjects where name='zytt' and type='U')
	drop table zytt -- ְԱ
if exists(select name from sysobjects where name='qxtt' and type='U')
	drop table qxtt -- Ȩ��
if exists(select name from sysobjects where name='khtt' and type='U')
	drop table khtt -- �ͻ�
if exists(select name from sysobjects where name='zhtt' and type='U')
	drop table zhtt -- �˻�
if exists(select name from sysobjects where name='zhsy' and type='U')
	drop table zhsy -- �˻�����
if exists(select name from sysobjects where name='zhhz' and type='U')
	drop table zhhz -- �˻���

create table zhhz -- �˻���
(
 id char(9) not null,
 cha char(10) not null,
 note char(100),
 constraint zhhz_pk primary key (id),
)

create table zhsy -- �˻�����
(
 id char(3) not null,
 levl int not null constraint zhyu_levl_df default 0,
 constraint zhyu_pk primary key (id),
)

create table zhtt -- �˻�
(
 id char(9) not null,
 name char(20) not null,
 tel char(15) not null,
 addr char(100) not null,
 zhhzid char(9) not null,
 zhsyid char(3) not null,
 constraint zhtt_pk primary key (id),
 constraint zhtt_zhhzid_fk foreign key (zhhzid) references zhhz(id),
 constraint zhtt_sy_fk foreign key (zhsyid) references zhsy(id),
)

create table khtt -- �ͻ�
(
 shdfid char(9) not null,
 sodfid char(9) not null,
 shpfid char(9) not null,
 fukfid char(9) not null,
 constraint khtt_pk primary key (shdfid, sodfid, shpfid, fukfid),
 constraint khtt_shdfid_fk foreign key (shdfid) references zhtt(id),
 constraint khtt_sodfid_fk foreign key (sodfid) references zhtt(id),
 constraint khtt_shpfid_fk foreign key (shpfid) references zhtt(id),
 constraint khtt_fukfid_fk foreign key (fukfid) references zhtt(id),
)

create table qxtt -- Ȩ��
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint qxtt_pk primary key (id),
)

create table zytt -- ְԱ
(
 id char(9) not null,
 name char(20) not null,
 sex char(8) not null,
 addr char(100) not null,
 tel char(15) not null,
 email char(20),
 levl char(20),
 priv char(3) not null,
 constraint zytt_pk primary key (id),
 constraint zytt_priv_fk foreign key (priv) references qxtt(id),
)

create table prod -- ��Ʒ
(
 id char(9) not null,
 name char(20) not null,
 note char(100),
 constraint prod_pk primary key (id),
)

create table xsxz -- ����С��
(
 id char(3) not null,
 name char(20) not null,
 leader char(9) not null, -- �鳤
 hotpro char(9) not null, -- ������Ʒ
 riqi char(10), -- ��������
 note char(100),
 constraint xsxz_pk primary key (id),
 constraint xsxz_leader_fk foreign key (leader) references zytt(id),
 constraint xsxz_hotpro_fk foreign key (hotpro) references prod(id),
)

create table xxzc -- ����С���Ա���
(
 xsxzid char(3) not null, -- ����С��
 zyttid char(9) not null, -- ��Ա
 riqi char(10), -- ��������
 constraint xxzc_pk primary key (xsxzid, zyttid),
 constraint xxzc_xsxzid_fk foreign key (xsxzid) references xsxz(id),
 constraint xxzc_zyttid_fk foreign key (zyttid) references zytt(id),
)

create table xsbg -- ���۰칫��
(
 id char(3) not null,
 name char(20) not null,
 leader char(9) not null, -- �칫������
 addr char(100) not null,
 tel char(15) not null,
 riqi char(10), -- ��������
 note char(100),
 constraint xsbg_pk primary key (id),
 constraint xsbg_leader_fk foreign key (leader) references zytt(id),
)

create table xbzc -- ���۰칫�����
(
 xsbgid char(3) not null, -- �칫��
 xsxzid char(3) not null, -- С��
 riqi char(10), -- ��������
 constraint xbzc_pk primary key (xsbgid, xsxzid),
 constraint xbzc_xsbgid_fk foreign key (xsbgid) references xsbg(id),
 constraint xbzc_xsxzid_fk foreign key (xsxzid) references xsxz(id),
)

create table fxqd -- ��������
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint fxqd_pk primary key (id),
)

create table xsfw -- ���۷�Χ
(
 id char(9) not null,
 xsbgid char(3) not null, -- ���۰칫��
 xsxzid char(3) not null, -- ����С��
 xsdbid char(9) not null, -- ���۴���
 fxqdid char(3) not null, -- ��������
 constraint xsfw_pk primary key (id),
 constraint xsfw_xsbgid_fk foreign key (xsbgid) references xsbg(id),
 constraint xsfw_xsxzid_fk foreign key (xsxzid) references xsxz(id),
 constraint xsfw_xsdbid_fk foreign key (xsdbid) references zytt(id),
 constraint xsfw_fxqdid_fk foreign key (fxqdid) references fxqd(id),
)

create table htlx -- ��ͬ����
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint htlx_pk primary key (id),
)

create table dhdt -- ������
(
 id char(9) not null,
 xsfwid char(9) not null, -- ���۷�Χ
 shdfid char(9) not null, -- �۴﷽
 riqi char(10) not null,
 note char(100),
 constraint dhdt_pk primary key (id),
 constraint dhdt_xsfwid_fk foreign key (xsfwid) references xsfw(id),
 constraint dhdt_shdfid_fk foreign key (shdfid) references zhtt(id),
)

create table qdht -- ǩ����ͬ
(
 xsfwid char(9) not null, -- ���۷�Χ
 dhdtid char(9) not null, -- ������
 shdfid char(9) not null, -- �۴﷽
 class char(3) not null,  -- ��ͬ����
 riqi char(10) not null,
 feild char(60),
 note char(100),
 constraint qdht_pk primary key (xsfwid, dhdtid, shdfid),
 constraint qdht_xsfwid_fk foreign key (xsfwid) references xsfw(id),
 constraint qdht_dhdtid_fk foreign key (dhdtid) references dhdt(id),
 constraint qdht_sdftid_fk foreign key (shdfid) references zhtt(id),
 constraint qdht_class_fk  foreign key (class)  references htlx(id),
)

create table dhxx -- ������Ϣ
(
 dhdtid char(9) not null, -- ������
 prodid char(9) not null, -- ��Ʒ
 count  int not null,
 note char(100),
 constraint dhxx_pk primary key (dhdtid, prodid),
 constraint dhxx_dhdtid_fk foreign key (dhdtid) references dhdt(id),
 constraint dhxx_prodid_fk foreign key (prodid) references prod(id),
)

create table cktt -- �ֿ�
(
 id char(3) not null,
 leader char(9) not null,
 name char(20) not null,
 addr char(100) not null,
 tel char(15) not null,
 constraint cktt_pk primary key (id),
 constraint chtt_leader_fk foreign key (leader) references zytt(id),
)

create table kctt -- ���
(
 prodid char(9) not null, -- ��Ʒ
 ckttid char(3) not null, -- �ֿ�
 count int not null,
 note char(100),
 constraint kctt_pk primary key (prodid, ckttid),
 constraint kctt_prodid_fk foreign key (prodid) references prod(id),
 constraint kctt_ckttid_fk foreign key (ckttid) references cktt(id),
)

create table phdt -- �����
(
 id char(9) not null,
 riqi char(10) not null,
 note char(100),
 constraint phdt_pk primary key (id),
)

create table phtt -- ���
(
 dhdtid char(9) not null,
 phdtid char(9) not null,
 count int not null,
 note char(100),
 constraint phtt_pk primary key (dhdtid, phdtid),
 constraint phtt_dhdtid_fk foreign key (dhdtid) references dhdt(id),
 constraint phtt_phdtid_fk foreign key (phdtid) references phdt(id),
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

create table ship -- ����
(
 ysbhid char(9) not null, -- ������
 phdtid char(9) not null, -- �����
 sodfid char(9) not null, -- �ʹ﷽
 note char(100),
 constraint ship_pk primary key (ysbhid, phdtid),
 constraint ship_ysbhid_fk foreign key (ysbhid) references ysbh(id),
 constraint ship_phdtid_fk foreign key (phdtid) references phdt(id),
 constraint ship_sodfid_fk foreign key (sodfid) references zhtt(id),
)

create table fplx -- ��Ʊ����
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint fplx_pk primary key (id),
)

create table hbbz -- ���ұ���
(
 id char(3) not null,
 name char(20) not null,
 constraint hbbz_pk primary key (id),)

create table kptt -- ��Ʊ
(
 phdtid char(9) not null, -- �����
 sodfid char(9) not null, -- �ʹ﷽
 shpfid char(9) not null, -- ��Ʊ��
 fukfid char(9) not null, -- ���
 riqi  char(10) not null, -- 
 class  char(3) not null, -- ��Ʊ����
 price float not null, -- ë��
 taxlv float not null, -- ˰��
 bz char(3) not null,   -- ����
 note char(100),
 constraint kptt_pk primary key (phdtid, sodfid, shpfid, fukfid),
 constraint kptt_phdtid_fk foreign key (phdtid) references phdt(id),
 constraint kptt_sodfid_fk foreign key (sodfid) references zhtt(id),
 constraint kptt_shpfid_fk foreign key (shpfid) references zhtt(id),
 constraint kptt_fukfid_fk foreign key (fukfid) references zhtt(id),
 constraint kptt_class_fk  foreign key (class)  references fplx(id),
 constraint kptt_bz_fk	   foreign key (bz)     references hbbz(id),
)
