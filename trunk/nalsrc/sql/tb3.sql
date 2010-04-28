use SCR
if exists(select name from sysobjects where name='kptt' and type='U')
	drop table kptt -- 开票
if exists(select name from sysobjects where name='hbbz' and type='U')
	drop table hbbz -- 货币币种
if exists(select name from sysobjects where name='fplx' and type='U')
	drop table fplx -- 发票类型
if exists(select name from sysobjects where name='ship' and type='U')
	drop table ship -- 发货
if exists(select name from sysobjects where name='ysbh' and type='U')
	drop table ysbh -- 运输编号
if exists(select name from sysobjects where name='ysgj' and type='U')
	drop table ysgj -- 运输工具
if exists(select name from sysobjects where name='phtt' and type='U')
	drop table phtt -- 配货
if exists(select name from sysobjects where name='phdt' and type='U')
	drop table phdt -- 配货单
if exists(select name from sysobjects where name='kctt' and type='U')
	drop table kctt -- 库存
if exists(select name from sysobjects where name='cktt' and type='U')
	drop table cktt -- 仓库
if exists(select name from sysobjects where name='dhxx' and type='U')
	drop table dhxx -- 订单信息
if exists(select name from sysobjects where name='qdht' and type='U')
	drop table qdht -- 签订合同
if exists(select name from sysobjects where name='dhdt' and type='U')
	drop table dhdt -- 订货单
if exists(select name from sysobjects where name='htlx' and type='U')
	drop table htlx -- 合同类型
if exists(select name from sysobjects where name='xsfw' and type='U')
	drop table xsfw  -- 销售范围
if exists(select name from sysobjects where name='fxqd' and type='U')
	drop table fxqd -- 分销渠道
if exists(select name from sysobjects where name='xbzc' and type='U')
	drop table xbzc -- 销售办公室组成
if exists(select name from sysobjects where name='xsbg' and type='U')
	drop table xsbg -- 销售办公室
if exists(select name from sysobjects where name='xxzc' and type='U')
	drop table xxzc -- 销售小组成员组成
if exists(select name from sysobjects where name='xsxz' and type='U')
	drop table xsxz -- 销售小组
if exists(select name from sysobjects where name='prod' and type='U')
	drop table prod -- 产品
if exists(select name from sysobjects where name='zytt' and type='U')
	drop table zytt -- 职员
if exists(select name from sysobjects where name='qxtt' and type='U')
	drop table qxtt -- 权限
if exists(select name from sysobjects where name='khtt' and type='U')
	drop table khtt -- 客户
if exists(select name from sysobjects where name='zhtt' and type='U')
	drop table zhtt -- 账户
if exists(select name from sysobjects where name='zhsy' and type='U')
	drop table zhsy -- 账户声誉
if exists(select name from sysobjects where name='zhhz' and type='U')
	drop table zhhz -- 账户组

create table zhhz -- 账户组
(
 id char(9) not null,
 cha char(10) not null,
 note char(100),
 constraint zhhz_pk primary key (id),
)

create table zhsy -- 账户声誉
(
 id char(3) not null,
 levl int not null constraint zhyu_levl_df default 0,
 constraint zhyu_pk primary key (id),
)

create table zhtt -- 账户
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

create table khtt -- 客户
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

create table qxtt -- 权限
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint qxtt_pk primary key (id),
)

create table zytt -- 职员
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

create table prod -- 产品
(
 id char(9) not null,
 name char(20) not null,
 note char(100),
 constraint prod_pk primary key (id),
)

create table xsxz -- 销售小组
(
 id char(3) not null,
 name char(20) not null,
 leader char(9) not null, -- 组长
 hotpro char(9) not null, -- 主销产品
 riqi char(10), -- 成立日期
 note char(100),
 constraint xsxz_pk primary key (id),
 constraint xsxz_leader_fk foreign key (leader) references zytt(id),
 constraint xsxz_hotpro_fk foreign key (hotpro) references prod(id),
)

create table xxzc -- 销售小组成员组成
(
 xsxzid char(3) not null, -- 销售小组
 zyttid char(9) not null, -- 成员
 riqi char(10), -- 加入日期
 constraint xxzc_pk primary key (xsxzid, zyttid),
 constraint xxzc_xsxzid_fk foreign key (xsxzid) references xsxz(id),
 constraint xxzc_zyttid_fk foreign key (zyttid) references zytt(id),
)

create table xsbg -- 销售办公室
(
 id char(3) not null,
 name char(20) not null,
 leader char(9) not null, -- 办公室主任
 addr char(100) not null,
 tel char(15) not null,
 riqi char(10), -- 成立日期
 note char(100),
 constraint xsbg_pk primary key (id),
 constraint xsbg_leader_fk foreign key (leader) references zytt(id),
)

create table xbzc -- 销售办公室组成
(
 xsbgid char(3) not null, -- 办公室
 xsxzid char(3) not null, -- 小组
 riqi char(10), -- 加入日期
 constraint xbzc_pk primary key (xsbgid, xsxzid),
 constraint xbzc_xsbgid_fk foreign key (xsbgid) references xsbg(id),
 constraint xbzc_xsxzid_fk foreign key (xsxzid) references xsxz(id),
)

create table fxqd -- 分销渠道
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint fxqd_pk primary key (id),
)

create table xsfw -- 销售范围
(
 id char(9) not null,
 xsbgid char(3) not null, -- 销售办公室
 xsxzid char(3) not null, -- 销售小组
 xsdbid char(9) not null, -- 销售代表
 fxqdid char(3) not null, -- 分销渠道
 constraint xsfw_pk primary key (id),
 constraint xsfw_xsbgid_fk foreign key (xsbgid) references xsbg(id),
 constraint xsfw_xsxzid_fk foreign key (xsxzid) references xsxz(id),
 constraint xsfw_xsdbid_fk foreign key (xsdbid) references zytt(id),
 constraint xsfw_fxqdid_fk foreign key (fxqdid) references fxqd(id),
)

create table htlx -- 合同类型
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint htlx_pk primary key (id),
)

create table dhdt -- 订货单
(
 id char(9) not null,
 xsfwid char(9) not null, -- 销售范围
 shdfid char(9) not null, -- 售达方
 riqi char(10) not null,
 note char(100),
 constraint dhdt_pk primary key (id),
 constraint dhdt_xsfwid_fk foreign key (xsfwid) references xsfw(id),
 constraint dhdt_shdfid_fk foreign key (shdfid) references zhtt(id),
)

create table qdht -- 签订合同
(
 xsfwid char(9) not null, -- 销售范围
 dhdtid char(9) not null, -- 订货单
 shdfid char(9) not null, -- 售达方
 class char(3) not null,  -- 合同类型
 riqi char(10) not null,
 feild char(60),
 note char(100),
 constraint qdht_pk primary key (xsfwid, dhdtid, shdfid),
 constraint qdht_xsfwid_fk foreign key (xsfwid) references xsfw(id),
 constraint qdht_dhdtid_fk foreign key (dhdtid) references dhdt(id),
 constraint qdht_sdftid_fk foreign key (shdfid) references zhtt(id),
 constraint qdht_class_fk  foreign key (class)  references htlx(id),
)

create table dhxx -- 订单信息
(
 dhdtid char(9) not null, -- 订货单
 prodid char(9) not null, -- 产品
 count  int not null,
 note char(100),
 constraint dhxx_pk primary key (dhdtid, prodid),
 constraint dhxx_dhdtid_fk foreign key (dhdtid) references dhdt(id),
 constraint dhxx_prodid_fk foreign key (prodid) references prod(id),
)

create table cktt -- 仓库
(
 id char(3) not null,
 leader char(9) not null,
 name char(20) not null,
 addr char(100) not null,
 tel char(15) not null,
 constraint cktt_pk primary key (id),
 constraint chtt_leader_fk foreign key (leader) references zytt(id),
)

create table kctt -- 库存
(
 prodid char(9) not null, -- 产品
 ckttid char(3) not null, -- 仓库
 count int not null,
 note char(100),
 constraint kctt_pk primary key (prodid, ckttid),
 constraint kctt_prodid_fk foreign key (prodid) references prod(id),
 constraint kctt_ckttid_fk foreign key (ckttid) references cktt(id),
)

create table phdt -- 配货单
(
 id char(9) not null,
 riqi char(10) not null,
 note char(100),
 constraint phdt_pk primary key (id),
)

create table phtt -- 配货
(
 dhdtid char(9) not null,
 phdtid char(9) not null,
 count int not null,
 note char(100),
 constraint phtt_pk primary key (dhdtid, phdtid),
 constraint phtt_dhdtid_fk foreign key (dhdtid) references dhdt(id),
 constraint phtt_phdtid_fk foreign key (phdtid) references phdt(id),
)

create table ysgj -- 运输工具
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint ysgj_pk primary key (id),
)

create table ysbh -- 运输编号
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

create table ship -- 发货
(
 ysbhid char(9) not null, -- 运输编号
 phdtid char(9) not null, -- 配货单
 sodfid char(9) not null, -- 送达方
 note char(100),
 constraint ship_pk primary key (ysbhid, phdtid),
 constraint ship_ysbhid_fk foreign key (ysbhid) references ysbh(id),
 constraint ship_phdtid_fk foreign key (phdtid) references phdt(id),
 constraint ship_sodfid_fk foreign key (sodfid) references zhtt(id),
)

create table fplx -- 发票类型
(
 id char(3) not null,
 name char(20) not null,
 note char(100),
 constraint fplx_pk primary key (id),
)

create table hbbz -- 货币币种
(
 id char(3) not null,
 name char(20) not null,
 constraint hbbz_pk primary key (id),)

create table kptt -- 开票
(
 phdtid char(9) not null, -- 配货单
 sodfid char(9) not null, -- 送达方
 shpfid char(9) not null, -- 收票方
 fukfid char(9) not null, -- 付款方
 riqi  char(10) not null, -- 
 class  char(3) not null, -- 发票类型
 price float not null, -- 毛利
 taxlv float not null, -- 税率
 bz char(3) not null,   -- 币种
 note char(100),
 constraint kptt_pk primary key (phdtid, sodfid, shpfid, fukfid),
 constraint kptt_phdtid_fk foreign key (phdtid) references phdt(id),
 constraint kptt_sodfid_fk foreign key (sodfid) references zhtt(id),
 constraint kptt_shpfid_fk foreign key (shpfid) references zhtt(id),
 constraint kptt_fukfid_fk foreign key (fukfid) references zhtt(id),
 constraint kptt_class_fk  foreign key (class)  references fplx(id),
 constraint kptt_bz_fk	   foreign key (bz)     references hbbz(id),
)
