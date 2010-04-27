
/* 
CREATE DATABASE XSBOOK3
	ON 
		(NAME='XSBOOK3_Data',
		FILENAME='F:\SQL_DATA\XSBOOK3.MDF',
		SIZE=4MB,
		MAXSIZE=20MB,
		FILEGROWTH=10%)
	LOG ON
		(NAME='XSBOOK3_LoG',
		FILENAME='F:\SQL_DATA\XSBOOK3_LOG.LDF',
		SIZE=2MB,
		MAXSIZE=10MB,	
		FILEGROWTH=10%)
GO */
create database  dbase
	on
		(name='dbase1',
		filename='f:\sql_data\dbase1.mdf',
		size=4mb,
		maxsize=20mb,
		filegrowth=10%),
		(name='dbase2',
		filename='f:\sql_data\dbase2.mdf',
		size=5mb,
		maxsize=20mb,
		filegrowth=1mb)
	log on
		(name='dbaselog',
		filename='f:\sql_data\dbaselog.ldf',
		size=2mb,
		maxsize=10mb,
		filegrowth=10%)
go