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
