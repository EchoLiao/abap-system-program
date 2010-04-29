use SCR
-- create procedure ins_zhhz -- 账户组
execute ins_zhhz "001", "售达方"
execute ins_zhhz "002", "送达方"
execute ins_zhhz "003", "收票方"
execute ins_zhhz "004", "付款方"

-- create procedure ins_zhsy -- 账户声誉
execute ins_zhsy "001", -1
execute ins_zhsy "000", 0
execute ins_zhsy "002", 1

-- create procedure ins_zhtt -- 账户
execute ins_zhtt "001001001", "LiHong", "333322", "ShengLiJie", "001", "000"

-- create procedure ins_khtt -- 客户
execute ins_khtt "001001001", "001001001", "001001001", "001001001", "001001001"

-- create procedure ins_qxtt -- 权限
-- create procedure ins_zytt -- 职员
-- create procedure ins_prod -- 产品
-- create procedure ins_xsxz -- 销售小组
-- create procedure ins_xxzc -- 销售小组成员组成
-- create procedure ins_xsbg -- 销售办公室
-- create procedure ins_xbzc -- 销售办公室组成
-- create procedure ins_fxqd -- 分销渠道
-- create procedure ins_xsfw -- 销售范围
-- create procedure ins_htlx -- 合同类型
-- create procedure ins_dhdt -- 订货单
-- create procedure ins_qdht -- 签订合同
-- create procedure ins_dhxx -- 订单信息
-- create procedure ins_cktt -- 仓库
-- create procedure ins_kctt -- 库存
-- create procedure ins_phdt -- 配货单
-- create procedure ins_phtt -- 配货
-- create procedure ins_ysgj -- 运输工具
-- create procedure ins_ysbh -- 运输编号
-- create procedure ins_ship -- 发货
-- create procedure ins_fplx -- 发票类型
-- create procedure ins_hbbz -- 货币币种
-- create procedure ins_kptt -- 开票
