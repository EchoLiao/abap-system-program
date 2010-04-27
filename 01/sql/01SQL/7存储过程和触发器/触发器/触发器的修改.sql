use xsbook
go
alter trigger reminder on xs
	for update
	as raiserror('执行的操林要要要要作是修改',16,10)
go