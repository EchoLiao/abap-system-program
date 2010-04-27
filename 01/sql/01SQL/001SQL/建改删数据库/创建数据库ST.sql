create  database ST
on
(name='Student_T',
filename='f:\sql_data\ST_data.mdf',
size=5mb,
maxsize=unlimited,
filegrowth=1mb)

log on
(name='Student_T_log',
filename='f:\sql_data\ST_log.ldf',
size=3mb,
maxsize=10mb,
filegrowth=5%)
go