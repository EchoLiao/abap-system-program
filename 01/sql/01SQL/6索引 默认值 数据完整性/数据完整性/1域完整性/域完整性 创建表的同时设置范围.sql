/* 域完整性 */
/* check()约束 */
USE XSBOOK2
CREATE TABLE BOOK
( 	ISBN CHAR(16) NOT NULL,
	书名 char(26) NOT NULL,
	作者 char(8) NOT NULL,
	出版社  char(20) NOT NULL,
	价格 float Not null check(价格<=200), /* 域完整性, 用check()实现 */
	复本量 smallint NOT null,
	库存量 smallint not null 
)
go