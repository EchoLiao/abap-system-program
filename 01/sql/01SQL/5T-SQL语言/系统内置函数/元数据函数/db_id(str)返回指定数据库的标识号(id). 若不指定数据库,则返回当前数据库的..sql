

-- db_id(str)返回指定数据库的标识号(id). 若不指定数据库,则返回当前数据库的.
select db_id(), db_id('xsbook2')