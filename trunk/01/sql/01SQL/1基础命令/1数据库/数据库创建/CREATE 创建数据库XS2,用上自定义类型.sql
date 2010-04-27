USE XSBOOK
CREATE TABLE XS2
(	借书证号 library_card_num, /* library_card_num 为自定义的数据类型 */
	姓名 char(8) NOT NULL,
	专业名 char(12) NULL,
	性别 bit NOT NULL,
	出生时间 datetime NOT NULL,
	借书量 tinyint NOT NULL,
	照片 image NULL  
)
GO
