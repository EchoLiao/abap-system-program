
use xsbook /* 先给public角色授予对表的select权限 */
grant select on xs to public
go /* 拒绝特定用户的特定权限 */
deny select , update, delete on xs to dong, dongdong, wang
go