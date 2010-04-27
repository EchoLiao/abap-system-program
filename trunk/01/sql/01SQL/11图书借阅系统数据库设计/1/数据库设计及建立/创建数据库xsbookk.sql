
create database XSBOOKK
on 
(name='XSBOOKK_data',	
filename='f:\sql_data\xsbookk.mdf',
size=5mb,
maxsize=20mb,
filegrowth=10%)

log on
(name='XSBOOKK_log',
filename='f:\sql_data\xsbookk.ldf',
size=2mb,
maxsize=5mb,
filegrowth=1mb)
go