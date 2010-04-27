
use xsbook /*  将select权限授予accounting角色, 并充许它把这权限授予别的对象(由with grant option 指定) */
grant select on xs to accounting with grant option 
go

/* accounting角色的用户将select权限授予不是accounting角色的用户dongdong */
grant select on xs to dongdong as accounting 
go