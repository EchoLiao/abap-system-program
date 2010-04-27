use xsbook
if exists(select name from sysobjects where name='readers_info' and type='p')
	drop procedure readers_info