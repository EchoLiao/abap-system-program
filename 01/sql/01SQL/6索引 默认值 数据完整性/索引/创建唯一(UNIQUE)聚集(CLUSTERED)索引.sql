USE XSBOOK
IF EXISTS(SELECT name FROM sysindexes WHERE name = 'book_id_ind')
	DROP INDEX book.book_id_ind
GO
CREATE UNIQUE CLUSTERED INDEX bookbook_id_ind ON book(ISBN)  -- /* ����Ψһ(UNIQUE)�ۼ�(CLUSTERED)���� */
GO   