
use master
exec sp_addmessage 50001, --  错误号, 大于5000的为用户自定义的.
		16,  -- 错误等级
		'Percentage expects a value between 20 and 100. Please reexecute with a more appropriate value.', -- 错误信息的文本
		us_english, -- 消息的语言
		true, --with_log, -- 是否将错误写入应用程序日志,true为写入,false为不写入.
		replace -- 是否替换原先的.
