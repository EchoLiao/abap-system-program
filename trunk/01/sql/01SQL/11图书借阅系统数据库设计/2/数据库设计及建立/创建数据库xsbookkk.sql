
create database XSBOOKKK
on 
(name='XSBOOKKK_data',	
filename='f:\sql_data\xsbookkk.mdf',
size=5mb,
maxsize=20mb,
filegrowth=10%)

log on
(name='XSBOOKKK_log',
filename='f:\sql_data\xsbookkk.ldf',
size=2mb,
maxsize=5mb,
filegrowth=1mb)
go