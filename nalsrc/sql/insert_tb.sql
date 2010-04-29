use SCR
if exists(select name from sysobjects where name='ins_zhhz' and type='p')
	drop procedure ins_zhhz
if exists(select name from sysobjects where name='ins_zhsy' and type='p')
	drop procedure ins_zhsy
if exists(select name from sysobjects where name='ins_zhtt' and type='p')
	drop procedure ins_zhtt
if exists(select name from sysobjects where name='ins_khtt' and type='p')
	drop procedure ins_khtt
if exists(select name from sysobjects where name='ins_qxtt' and type='p')
	drop procedure ins_qxtt
if exists(select name from sysobjects where name='ins_zytt' and type='p')
	drop procedure ins_zytt
if exists(select name from sysobjects where name='ins_prod' and type='p')
	drop procedure ins_prod
if exists(select name from sysobjects where name='ins_xsxz' and type='p')
	drop procedure ins_xsxz
if exists(select name from sysobjects where name='ins_xxzc' and type='p')
	drop procedure ins_xxzc
if exists(select name from sysobjects where name='ins_xsbg' and type='p')
	drop procedure ins_xsbg
if exists(select name from sysobjects where name='ins_xbzc' and type='p')
	drop procedure ins_xbzc
if exists(select name from sysobjects where name='ins_fxqd' and type='p')
	drop procedure ins_fxqd
if exists(select name from sysobjects where name='ins_xsfw' and type='p')
	drop procedure ins_xsfw
if exists(select name from sysobjects where name='ins_htlx' and type='p')
	drop procedure ins_htlx
if exists(select name from sysobjects where name='ins_dhdt' and type='p')
	drop procedure ins_dhdt
if exists(select name from sysobjects where name='ins_qdht' and type='p')
	drop procedure ins_qdht
if exists(select name from sysobjects where name='ins_dhxx' and type='p')
	drop procedure ins_dhxx
if exists(select name from sysobjects where name='ins_cktt' and type='p')
	drop procedure ins_cktt
if exists(select name from sysobjects where name='ins_kctt' and type='p')
	drop procedure ins_kctt
if exists(select name from sysobjects where name='ins_phdt' and type='p')
	drop procedure ins_phdt
if exists(select name from sysobjects where name='ins_phtt' and type='p')
	drop procedure ins_phtt
if exists(select name from sysobjects where name='ins_ysgj' and type='p')
	drop procedure ins_ysgj
if exists(select name from sysobjects where name='ins_ysbh' and type='p')
	drop procedure ins_ysbh
if exists(select name from sysobjects where name='ins_ship' and type='p')
	drop procedure ins_ship
if exists(select name from sysobjects where name='ins_fplx' and type='p')
	drop procedure ins_fplx
if exists(select name from sysobjects where name='ins_hbbz' and type='p')
	drop procedure ins_hbbz
if exists(select name from sysobjects where name='ins_kptt' and type='p')
	drop procedure ins_kptt
go
go
create procedure ins_zhhz -- 账户组
    @id char(9), @cha char(10), @note char(100)=''
    as insert into zhhz(id, cha, note)
	values (@id, @cha, @note)

go
create procedure ins_zhsy -- 账户声誉
    @id char(3), @levl int
    as insert into zhsy(id, levl)
	values(@id, @levl)

go
create procedure ins_zhtt -- 账户
    @id char(9), @name char(20), @tel char(15), @addr char(100), @zhhzid char(9), @zhsyid char(3)
    as insert into zhtt(id, name, tel, addr, zhhzid, zhsyid)
	values(@id, @name, @tel, @addr, @zhhzid, @zhsyid)

go
create procedure ins_khtt -- 客户
    @id char(9), @shdfid char(9), @sodfid char(9), @shpfid char(9), @fukfid char(9)
    as insert into khtt(id, shdfid, sodfid, shpfid, fukfid)
	values (@id, @shdfid, @sodfid, @shpfid, @fukfid)

go
create procedure ins_qxtt -- 权限
    @id char(3), @name char(20), @note char(100)=''
    as insert into qxtt(id, name, note)
	values (@id, @name, @note)

go
create procedure ins_zytt -- 职员
    @id char(9), @name char(20), @sex char(8), @addr char(100), @tel char(15),
    @email char(20), @levl char(20), @priv char(3)
    as insert into zytt(id, name, sex, addr, tel, email, levl, priv)
	values(@id, @name, @sex, @addr, @tel, @email, @levl, @priv)

go
create procedure ins_prod -- 产品
    @id char(9), @name char(20), @note char(100)=''
    as insert into prod(id, name, note)
	values (@id, @name, @note)

go
create procedure ins_xsxz -- 销售小组
    @id char(3), @name char(20), @leader char(9), @hotpro char(9),
    @riqi char(10), @note char(100)=''
    as insert into xsxz(id, name, leader, hotpro, riqi, note)
	values (@id, @name, @leader, @hotpro, @riqi, @note)

go
create procedure ins_xxzc -- 销售小组成员组成
    @xsxzid char(3), @zyttid char(9), @riqi char(10)
    as insert into xxzc(xsxzid, zyttid, riqi)
	values (@xsxzid, @zyttid, @riqi)

go
create procedure ins_xsbg -- 销售办公室
    @id char(3), @name char(20), @leader char(9), @addr char(100),
    @tel char(15), @riqi char(10), @note char(100)=''
    as insert into xsbg(id, name, leader, addr, tel, riqi, note)
	values (@id, @name, @leader, @addr, @tel, @riqi, @note)

go
create procedure ins_xbzc -- 销售办公室组成
    @xsbgid char(3), @xsxzid char(3), @riqi char(10)
    as insert into xbzc(xsbgid, xsxzid, riqi)
	values (@xsbgid, @xsxzid, @riqi)

go
create procedure ins_fxqd -- 分销渠道
    @id char(3), @name char(20), @note char(100)=''
    as insert into fxqd(id, name, note)
	values (@id, @name, @note)

go
create procedure ins_xsfw -- 销售范围
    @id char(9), @xsbgid char(3), @xsxzid char(3), @xsdbid char(9), @fxqdid char(3)
    as insert into xsfw(id, xsbgid, xsxzid, xsdbid, fxqdid)
	values (@id, @xsbgid, @xsxzid, @xsdbid, @fxqdid)

go
create procedure ins_htlx -- 合同类型
    @id char(3), @name char(20), @note char(100)=''
    as insert into htlx(id, name, note)
	values (@id, @name, @note)

go
create procedure ins_dhdt -- 订货单
    @id char(9), @xsfwid char(9), @shdfid char(9), @riqi char(10), @note char(100)=''
    as insert into dhdt(id, xsfwid, shdfid, riqi, note)
	values (@id, @xsfwid, @shdfid, @riqi, @note)

go
create procedure ins_qdht -- 签订合同
    @xsfwid char(9), @dhdtid char(9), @shdfid char(9), @class char(3),
    @riqi char(10), @feild char(60), @note char(100)=''
    as insert into qdht(xsfwid, dhdtid, shdfid, class, riqi, feild, note)
	values (@xsfwid, @dhdtid, @shdfid, @class, @riqi, @feild, @note)

go
create procedure ins_dhxx -- 订单信息
    @dhdtid char(9), @prodid char(9), @count  int, @note char(100)=''
    as insert into dhxx(dhdtid, prodid, count, note)
	values (@dhdtid, @prodid, @count, @note)

go
create procedure ins_cktt -- 仓库
    @id char(3), @leader char(9), @name char(20), @addr char(100), @tel char(15)
    as insert into cktt(id, leader, name, addr, tel)
	values (@id, @leader, @name, @addr, @tel)

go
create procedure ins_kctt -- 库存
    @prodid char(9), @ckttid char(3), @count int, @note char(100)=''
    as insert into kctt(prodid, ckttid, count, note)
	values (@prodid, @ckttid, @count, @note)

go
create procedure ins_phdt -- 配货单
    @id char(9), @riqi char(10), @note char(100)=''
    as insert into phdt(id, riqi, note)
	values (@id, @riqi, @note)
go
create procedure ins_phtt -- 配货
    @dhdtid char(9), @phdtid char(9), @count int, @note char(100)=''
    as insert into phtt(dhdtid, phdtid, count, note)
	values (@dhdtid, @phdtid, @count, @note)

go
create procedure ins_ysgj -- 运输工具
    @id char(3), @name char(20), @note char(100)=''
    as insert into ysgj(id, name, note)
	values (@id, @name, @note)

go
create procedure ins_ysbh -- 运输编号
    @id char(9), @srcaddr char(20), @desaddr char(20), @srcriqi char(10),
    @desriqi char(10), @ysgjid char(3), @route char(100), @note char(100)=''
    as insert into ysbh(id, srcaddr, desaddr, srcriqi, desriqi, ysgjid, route, note)
	values (@id, @srcaddr, @desaddr, @srcriqi, @desriqi, @ysgjid, @route, @note)

go
create procedure ins_ship -- 发货
    @ysbhid char(9), @phdtid char(9), @sodfid char(9), @note char(100)=''
    as insert into ship(ysbhid, phdtid, sodfid, note)
	values (@ysbhid, @phdtid, @sodfid, @note)
go
create procedure ins_fplx -- 发票类型
    @id char(3), @name char(20), @note char(100)=''
    as insert into fplx(id, name, note)
	values (@id, @name, @note)

go
create procedure ins_hbbz -- 货币币种
    @id char(3), @name char(20)
    as insert into hbbz(id, name)
	values (@id, @name)

go
create procedure ins_kptt -- 开票
    @phdtid char(9), @sodfid char(9), @shpfid char(9), @fukfid char(9), @riqi  char(10),
    @class  char(3), @price float, @taxlv float, @bz char(3), @note char(100)=''
    as insert into kptt(phdtid, sodfid, shpfid, fukfid, riqi,
	    class, price, taxlv, bz, note)
	values (@phdtid, @sodfid, @shpfid, @fukfid, @riqi,
	    @class, @price, @taxlv, @bz, @note)
go
