CREATE DATABASE xsbook1

ON
(NAME='xsbook1_Data',
FILENAME='F:\SQL_DATA\xsbook1.mdf',
SIZE=5MB,
MAXSIZE=20MB, /* ������СΪ������, ��ӦдΪ: MAXSIE=UNLIMITED */
FILEGROWTH=10%)

LOG ON
(NAME='xsbook1_Log',
FILENAME='F:\SQL_DATA\xsbook1.ldf',
SIZE=2MB,
MAXSIZE=5MB,
FILEGROWTH=1MB)

GO


