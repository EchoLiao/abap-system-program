USE XSBOOK
IF EXISTS(SELECT name FROM sysindexes WHERE name = 'book_id_ind')
	DROP INDEX book.book_id_ind
GO
CREATE UNIQUE CLUSTERED INDEX bookbook_id_ind ON book(ISBN)  -- /* 创建唯一(UNIQUE)聚集(CLUSTERED)索引 */
GO   