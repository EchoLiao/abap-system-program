create  database SCR
on
(name='scr',
filename='d:\sql_data\SCR_data.mdf',
size=10mb,
maxsize=unlimited,
filegrowth=5%)

log on
(name='scr_log',
filename='d:\sql_data\SCR_log.ldf',
size=3mb,
maxsize=10mb,
filegrowth=1mb)
go

