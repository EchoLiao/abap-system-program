/* ����   	  ��������    	 ����     
    name    	 sysname     	��������     
    Id    	 int     	�����ʶ�š�     
    xtype   	 char(2)     	�������͡����������ж��������е�һ�֣� 
    
  			 C     =     CHECK     Լ��   
   			 D     =     Ĭ��ֵ��     DEFAULT     Լ��   
   			 F     =     FOREIGN     KEY     Լ��   
   			 L     =     ��־   
  			 FN     =     ��������   
   			 IF     =     ��Ƕ����   
   			 P     =     �洢����   
  			 PK     =     PRIMARY     KEY     Լ����������     K��   
   			 RF     =     ����ɸѡ�洢����   
   			 S     =     ϵͳ��   
   			 TF     =     ����   
   			 TR     =     ������   
   			 U     =     �û���   
   			 UQ     =     UNIQUE     Լ����������     K��   
  			 V     =     ��ͼ   
    			 X     =     ��չ�洢����  
*/
/*  ������ͼ,��Ϊ����ͼ�������� */

USE XSBOOK
GO
IF EXISTS (SELECT name FROM  sysobjects WHERE name='view1' and TYPE='V')
	DROP VIEW VIEW1 /* ɾ����ͼVIEW1 */
GO
CREATE VIEW VIEW1 WITH SCHEMABINDING /* ���ָ���� SCHEMABINDING�����ܰ��ս�Ӱ����ͼ����ķ�ʽ�޸Ļ����� */
	AS
	SELECT �����, ����, ����
		FROM dbo.JY, dbo.BOOK, dbo.XS  /* dbo:  Database Owner(���ݿ�ӵ����)��ָ�����ݿ��ж���������� */
		WHERE JY.ISBN=BOOK.ISBN AND XS.����֤��=JY.����֤��
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
	ON dbo.view1(����� ASC) /* asc ����������       desc ���������� */
GO

/* ʹ��������ͼ��������ϵ�����ʱ, ����6��SETѡ���������ΪON:
ANSI_NULLS ON
ANSI_PADDING ON
ANSI_WARNINGS ON
ARITHABORT ON
CONCAT_NULL_YIELDS_NULL ON
QUOTED_IDENTIFIER ON
*********************************************
NUMERIC_ROUNDABORT ��������ΪOFF.
*/










































