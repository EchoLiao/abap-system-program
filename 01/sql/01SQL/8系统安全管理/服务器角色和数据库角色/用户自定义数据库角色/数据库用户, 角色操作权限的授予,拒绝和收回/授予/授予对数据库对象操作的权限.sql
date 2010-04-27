
use xsbook
go
grant select on xs to public /* 给public角色授予对xs表的select权限 */
go
grant insert, update, delete on xs to  wang,dong /* 将特定权限授予用户, 这些用户必须已是该数据库的用户 */
go /* 注意: delete后不能有',' */