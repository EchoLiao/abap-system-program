USE XSBOOK
CREATE TABLE XS4
(	借书证号 char(8) NOT NULl,
	姓名 char(8) NOT NULL,
	专业名 char(12) NOT NULL,
	性别 bit NOT NULL,
	出生日期 smalldatetime NOT NULL,
	借书数 tinyint NOT NULL CONSTRAINT def_val DEFAULT 0, /* 设置默认值, 并指定约束名:def_val */
	照片 image NULL
)
go