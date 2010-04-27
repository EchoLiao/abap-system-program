use xsbook
create table xs5
(
	借书证号 library_card_num  /* 此处不能有',' */-- library_card_num 为自定义的数据类型 
		constraint xs_pk primary key,
	姓名 char(8) NOT NULL,
	专业名 char(12) NULL,
	性别 bit NOT NULL,
	出生时间 datetime NOT NULL,
	电话 telphone /* */
		constraint tel_uk unique, /* UNIQUE 约束 */
	借书数 tinyint  check(借书数>=0 and 借书数<=20) NULL,
	照片 image NULL  
) 