use xsbook
if exists(select name from sysobjects where name='insert_trigger' and type='tr')
	drop trigger insert_trigger
go