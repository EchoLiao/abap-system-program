/* 列名   	  数据类型    	 描述     
    name    	 sysname     	对象名。     
    Id    	 int     	对象标识号。     
    xtype   	 char(2)     	对象类型。可以是下列对象类型中的一种： 
    
  			 C     =     CHECK     约束   
   			 D     =     默认值或     DEFAULT     约束   
   			 F     =     FOREIGN     KEY     约束   
   			 L     =     日志   
  			 FN     =     标量函数   
   			 IF     =     内嵌表函数   
   			 P     =     存储过程   
  			 PK     =     PRIMARY     KEY     约束（类型是     K）   
   			 RF     =     复制筛选存储过程   
   			 S     =     系统表   
   			 TF     =     表函数   
   			 TR     =     触发器   
   			 U     =     用户表   
   			 UQ     =     UNIQUE     约束（类型是     K）   
  			 V     =     视图   
    			 X     =     扩展存储过程  
*/
/*  创建视图,并为该视图创建索引 */

USE XSBOOK
GO
IF EXISTS (SELECT name FROM  sysobjects WHERE name='view1' and TYPE='V')
	DROP VIEW VIEW1 /* 删除视图VIEW1 */
GO
CREATE VIEW VIEW1 WITH SCHEMABINDING /* 如果指定了 SCHEMABINDING，则不能按照将影响视图定义的方式修改基表或表 */
	AS
	SELECT 索书号, 书名, 姓名
		FROM dbo.JY, dbo.BOOK, dbo.XS  /* dbo:  Database Owner(数据库拥有者)，指明数据库中对象的所属者 */
		WHERE JY.ISBN=BOOK.ISBN AND XS.借书证号=JY.借书证号
go
	
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
IF EXISTS(SELECT name FROM sysindexes WHERE NAME='IND1')
	DROP INDEX VIEW1.IND1
GO
CREATE UNIQUE CLUSTERED INDEX IND1
	ON dbo.view1(索书号 ASC) /* asc 按升序排列       desc 按降序排列 */
GO

/* 使用索引视图或计算列上的索引时, 下列6个SET选项必须设置为ON:
ANSI_NULLS ON
ANSI_PADDING ON
ANSI_WARNINGS ON
ARITHABORT ON
CONCAT_NULL_YIELDS_NULL ON
QUOTED_IDENTIFIER ON
*********************************************
NUMERIC_ROUNDABORT 必须设置为OFF.
*/










































