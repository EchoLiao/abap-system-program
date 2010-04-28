use scr
if exists(select name from sysobjects where name='xplx' and type='U')
	drop table xplx -- 商品类型 
if exists(select name from sysobjects where name='xptt' and type='U')
	drop table xptt -- 商品 
if exists(select name from sysobjects where name='khsy' and type='U')
	drop table khsy -- 客户声誉
if exists(select name from sysobjects where name='khtt' and type='U')
	drop table khtt -- 客户 
if exists(select name from sysobjects where name='bjxx' and type='U')
	drop table bjxx -- 报价信息


create table xplx -- 商品类型 
(
 id char(3) not null,
 name char(20) not null,
 constraint xplx_pk primary key (id),
)

create table xptt -- 商品 
(
 id char(9) not null,
 name char(30) not null,
 class char(3) not null,
 constraint xptt_pk primary key (id),
 constraint xptt_class_fk key (class) references xplx(id),
)

create table khsy -- 客户声誉 
(
 id char(3) not null,
 levl int not null constraint shyu_levl_df default 2,
 constraint shyu_pk primary key (id),
)

create table khtt -- 客户 
(
 id char(9) not null,
 name char(20) not null,
 tel char(15) not null,
 addr char(60) not null,
 syid char(3) not null,
 constraint khtt_pk primary key (id),
 constraint khtt_sy_fk foreign key (syid) references khsy(id),
)

create table bjxx -- 报价信息 
(
 xpid char(9) not null,
 khid char(9) not null,
 constraint bjxx_pk primary key (xpid, khid),
)

create table ddtt -- 订单 
(
 id char(9) not null,
 note char(100),
 constraint ddtt_pk primary key (id),
)

create table htxs -- 合同事项 
(
 id char(9) not null,
 sx char(100) not null,
 constraint htxs_pk primary key (id),
)

create table qdht -- 签订合同
(
 khid char(9) not null,
 ddid char(9) not null,
 sx char(9) not null,
 rq char(10) not null,
 note char(100),
 constraint qdht_pk primary key (khid, ddid),
 constraint qdht_khid_fk foreign key (khid) references khtt(id),
 constraint qdht_ddid_fk foreign key (ddid) references ddtt(id),
 constraint qdht_sx_fk foreign key (sx) references htxs(id),
)

create table qddd


