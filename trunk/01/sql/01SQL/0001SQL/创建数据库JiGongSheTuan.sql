
create database JiGongSheTuan
on
(name='JGSTuan_data',
filename='F:\SQL_DATA\JGSTuan.mdf',
size=5mb,
maxsize=50mb,
filegrowth=10%)

log on
(name='JGSTuan_log',
filename='f:\sql_data\JGSTuan.ldf',
size=3mb,
maxsize=20mb,
filegrowth=10%)

