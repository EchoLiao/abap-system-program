
/* 用户zhang */
/*  用户zhang拥有对表xs的操作权限 */
grant select on xs to role with grant option

/* 用户li */
/* 用户li是role角色的成员,  用户huang不是role角色的成员 */
grant select on xs to huang as role

/* 用户li */
revoke select on xs to huang as role
/* 用户li是角色的成员, 通过用户li执行权限时, 必须用as指定其所属的角色 */
go